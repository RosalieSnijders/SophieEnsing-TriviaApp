//
//  QuestionViewController.swift
//  TriviaApp
//
//  Created by Sophie Ensing on 13-12-17.
//  Copyright © 2017 Sophie Ensing. All rights reserved.
//

import UIKit

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBAction func truePressed(_ sender: Any) {
        answers.append("True")
        nextQuestion()
    }
    
    @IBAction func falsePressed(_ sender: Any) {
        answers.append("False")
        nextQuestion()
    }
    
    var questions: [Question] = []
    var questionAnswer = [String]()
    var answers = [String]()
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuizController.shared.fetchQuestions { (questions1) in
            if let questions1 = questions1 {
                for item in questions1.results {
                    self.questions.append(item)
                    self.questionAnswer.append(item.correct_answer)
                }
            }
            self.updateUI(with: self.questions)
        }
    }
    
    func updateUI(with Questions: [Question]) {
        let currentQuestion = questions[questionIndex]
        DispatchQueue.main.async {
            self.questionLabel.text = currentQuestion.question
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI(with: questions)
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    func correctAnswers() -> Int {
        var correct = 0
        
        for index in 0...(questionIndex - 1) {
            if answers[index] == questionAnswer[index] {
                correct += 1
            }
        }
        return correct
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let ResultsViewController = segue.destination
                as! ResultsViewController
            ResultsViewController.result = correctAnswers()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

