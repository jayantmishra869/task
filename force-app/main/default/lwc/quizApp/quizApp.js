import { getDataflowJobs } from 'lightning/analyticsWaveApi';

import { LightningElement } from 'lwc';

export default class MyWorld extends LightningElement {

    questions = [

        {
            id: '1',

            ques: 'Who is the founder of Tesla ?',

            answers: {

                a: 'Elon Musk',

                b: 'Steve Jobs',

                c: 'Mark Zuckerberg'
            },

            correctAnswer: 'a'

        },

        {
            id: '2',

            ques: 'Which of the below startup is related to to food delivery ?',

            answers: {

                a: 'Ola',

                b: 'Swiggy',

                c: 'Oyo'
            },

            correctAnswer: 'b'

        },

        {
            id: '3',

            ques: 'Which is the highest valued cryptocurrency ?',

            answers: {

                a: 'Ethereum',

                b: 'Cardano',

                c: 'Bitcoin'
            },

            correctAnswer: 'a'

        }

    ]

}