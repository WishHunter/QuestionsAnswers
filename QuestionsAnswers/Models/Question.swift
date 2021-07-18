//
//  Question.swift
//  QuestionsAnswers
//
//  Created by d.molkov on 13.07.2021.
//

import Foundation


struct Question: Codable {
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    static var createQuestions: [Question] {
        var questions: [Question] = []
        
        questions.append(Question(question: "Кто из этих философов в 1864 году написал музыку на стихи А.С. Пушкина «Заклинание» и «Зимний вечер»?",
                                  answers: ["Юнг", "Гегель", "Ницше", "Шопенгауэр"],
                                  correctAnswer: "Ницше"))
        questions.append(Question(question: "Сколько раз в сутки подзаводят куранты Спасской башни Кремля?",
                                  answers: ["Один", "Два", "Три", "Четыре"],
                                  correctAnswer: "Два"))
        questions.append(Question(question: "Кто 1-м получил Нобелевскую премию по литературе?",
                                  answers: ["Романист", "Драматург", "Поэт", "Эссеист"],
                                  correctAnswer: "Поэт"))
        questions.append(Question(question: "С какой буквы начинаются слова, опубликованные в 16-м томе последнего издания Большой советской энциклопедии?",
                                  answers: ["М", "Н", "О", "П"],
                                  correctAnswer: "М"))
        questions.append(Question(question: "Кто из перечисленных был пажом во времена Екатерины II?",
                                  answers: ["Д.И. Фонвизин", "Г.Р. Державин", "А.Н. Радищев", "Н.М. Карамзин"],
                                  correctAnswer: "А.Н. Радищев"))
        questions.append(Question(question: "Какой химический элемент назван в честь злого подземного гнома?",
                                  answers: ["Гафний", "Кобальт", "Бериллий", "Теллур"],
                                  correctAnswer: "Кобальд"))
        questions.append(Question(question: "В какой из этих столиц бывших союзных республик раньше появилось метро?",
                                  answers: ["Тбилиси", "Ереван", "Баку", "Минск"],
                                  correctAnswer: "Тбилиси"))
        questions.append(Question(question: "Сколько морей омывают Балканский полуостров?",
                                  answers: ["3", "4", "5", "6"],
                                  correctAnswer: "6"))
        questions.append(Question(question: "Реки с каким названием нет на территории России?",
                                  answers: ["Шея", "Уста", "Спина", "Палец"],
                                  correctAnswer: "Спина"))
        questions.append(Question(question: "Что такое лобогрейка?",
                                  answers: ["Жнейка", "Шапка", "Болезнь", "Печка"],
                                  correctAnswer: "Жнейка"))
        questions.append(Question(question: "Какой роман Фенимор Купер написал на спор с женой?",
                                  answers: ["«Предосторожность»", "«Пионеры»", "«Последний из могикан»", "«Зверобой»"],
                                  correctAnswer: "«Предосторожность»"))
        questions.append(Question(question: "Какой вид кавалерии предназначался для боевых действий как в конном, так и в пешем строю?",
                                  answers: ["Кирасиры", "Уланы", "Драгуны", "Гусары"],
                                  correctAnswer: "Драгуны"))
        questions.append(Question(question: "Какое имя не принимал ни один папа римский?",
                                  answers: ["Валентин", "Валентин", "Георгий", "Виктор"],
                                  correctAnswer: "Георгий"))
        questions.append(Question(question: "В каком немецком городе родилась будущая императрица России Екатерина II?",
                                  answers: ["Висбаден", "Цербст", "Штеттин", "Дармштадт"],
                                  correctAnswer: "Штеттин"))
        questions.append(Question(question: "Что запрещал указ, который в 1726 году подписала Екатерина I?",
                                  answers: ["Точить лясы", "Бить баклуши", "Пускать пыль в глаза", "Переливать из пустого в порожнее"],
                                  correctAnswer: "Пускать пыль в глаза"))
        return questions
    }
}
