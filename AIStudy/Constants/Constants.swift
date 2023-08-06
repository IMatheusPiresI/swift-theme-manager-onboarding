//
//  Constants.swift
//  AIStudy
//
//  Created by Matheus Sousa on 03/08/23.
//

import Foundation

struct K {
    struct Keys {
        static let keyThemeSelected = "ThemeSelected"
    }
    
    struct App {
        struct Images {
            static let onboardingPrimary1 = "onboardingPrimary1"
            static let onboardingPrimary2 = "onboardingPrimary2"
            static let onboardingPrimary3 = "onboardingPrimary3"
            static let onboardingSecondary1 = "onboardingSecondary"
            static let onboardingSecondary2 = "onboardingSecondary2"
            static let onboardingSecondary3 = "onboardingSecondary3"
        }
        
        struct Texts {
            static let appName = "AIStudy"
            static let skip = "Pular"
            static let next = "Próximo"
            static let start = "Começar"
            static let changetheme = "Trocar tema"
            struct Onboarding {
                static let titleFirstPage = "Estudos"
                static let descriptionFirstPage = "Explore o mundo do conhecimento com nosso aplicativo de estudos! Encontre materiais abrangentes em todas as matérias e aprofunde seus conhecimentos com quizzes interativos. Aprenda de forma divertida e eficiente enquanto acompanha seu progresso. "
                static let titleSecondPage = "Professor"
                static let descriptionSecondPage = "Conheça nosso professor virtual especializado em criar quizzes sob medida para você. Personalize sua experiência de aprendizado selecionando a matéria e o nível desejado. Deixe que o professor virtual desafie sua mente com perguntas estimulantes e obtenha feedback imediato."
                static let titleThirdPage = "Segurança"
                static let descriptionThirdPage = "Sua segurança é nossa prioridade! Utilizamos armazenamento local em seu dispositivo para garantir a privacidade de suas atividades de estudo. Além disso, para manter seus dados pessoais seguros, contamos com a confiabilidade do Firebase para armazenar informações de conta e autenticação."
            }
        }
    }
    
    struct Theme {
        struct Fonts {
            static let robotoRegular = "Roboto-Regular"
            static let robotoMedium = "Roboto-Medium"
            static let robotoBold = "Roboto-Bold"
            static let russoOne = "RussoOne-Regular"
        }
    }
}
