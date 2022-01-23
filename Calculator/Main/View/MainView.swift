//
//  MainView.swift
//  Calculator
//
//  Created by Harsh Yadav on 21/08/21.
//

//  --------------------------------------------------------------------------
//  ------------------------------ UPDATED VIEW ------------------------------
//  --------------------------------------------------------------------------
import SwiftUI
enum Buttons:String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case minus = "-"
    case addition = "+"
    case multiply = "x"
    case division = "/"
    case clear = "AC"
    case remainder = "%"
    case plusMinus = "+/-"
    case equal = "="
    case dot = "."
}

enum Operation{
    case addition,minus,multiply,division,none
}
class LogicClass :ObservableObject{
    
    
    @Published var CurrentOperation:Operation = .none
    @Published var Final_Output:String = ""
    //value = input
    @Published var value:String = "0"
    @Published var RunningNumber = 0
    //    button --> input when tapped by user
    func didTap(button:Buttons){
        switch button{
        case .addition,.minus,.multiply,.division, .equal:
            if(button == .addition){
                CurrentOperation = .addition
                RunningNumber = Int(value) ?? 0
            }
            if(button == .minus){
                CurrentOperation = .minus
                RunningNumber = Int(value) ?? 0
            }
            if(button == .multiply){
                CurrentOperation = .multiply
                RunningNumber = Int(value) ?? 0
            }
            if(button == .division){
                CurrentOperation = .division
                RunningNumber = Int(value) ?? 0
            }
            else if(button == .equal){
                
                let runningValue = RunningNumber
                let currentValue = Int(value) ?? 0
                switch self.CurrentOperation {
                    case .addition: value = "\(runningValue + currentValue)"
                    case .minus: value = "\(runningValue - currentValue)"
                    case .multiply: value = "\(runningValue * currentValue)"
                    case .division: value = "\(runningValue / currentValue)"
                    case .none:
                        break
                }
                Final_Output = value
            }
            if(button != .equal){
                value = "0"
            }
            
        case .clear:
            value = "0"
            
        case .remainder, .plusMinus:
            break
            
        //Numerical cases
        default:
            //pressed by User
            let number = button.rawValue
            
            //if input is zero then basically don't show
            if value == "0"{
                value = number
            }
            
            //for all other numbers
            else{
                value = "\(value)\(number)"
            }
        }
    }
}

struct UpdatedView:View {
    @StateObject var Logic:LogicClass = LogicClass()
    
    var body: some View{
        ZStack{
            //BG Color
            Rectangle()
                .foregroundColor(.pink)
                .opacity(0.4)
                .ignoresSafeArea()
            //BG Design Element
            RoundedRectangle(cornerRadius: 40)
                .frame(maxWidth: .infinity)
                .frame( height: 580)
                .offset(x: 0, y: 140)
                .shadow(color: .pink, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
            
            VStack(spacing:20){
                Spacer()
                InputOutputView()
                NumPadView().environmentObject(Logic)
                NumpadBottom()
            }
            .padding(.horizontal)
            
        }.environmentObject(Logic)
    }
    
}


//     ------------------------------ Suv-VIEW ------------------------------
struct NumPadView: View {
    @EnvironmentObject var Logic:LogicClass
    
    
    let buttonArray:[[Buttons]] = [
        [.clear,.remainder,.division,.plusMinus],
        [.seven,.eight,.nine, .multiply],
        [.four,.five,.six,.minus],
        [.one,.two,.three,.addition]
    ]
    
    
    var body: some View {
        ForEach(buttonArray , id: \.self) { i in
            HStack(spacing: 10){
                ForEach(i, id: \.self){ j in
                    
                    if(j.rawValue == "AC"){
                        Button(action: {
                            Logic.didTap(button: j)
                        }, label: {
                            OperatorButtonView(operatorName: j.rawValue, OuterRingColor: .pink, InnerRingColor: Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), FontColor: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 40)
                        })
                    }
                    else if(j.rawValue == "%"){
                        Button(action: {
                            Logic.didTap(button: j)
                        }, label: {
                            OperatorButtonView(operatorName: j.rawValue, OuterRingColor: .pink, InnerRingColor: Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), FontColor: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 40)
                        })
                    }
                    else if(j.rawValue == "/"){
                        Button(action: {
                            Logic.didTap(button: j)
                        }, label: {
                            OperatorButtonView(operatorName: j.rawValue, OuterRingColor: .pink, InnerRingColor: Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), FontColor: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 40)
                        })
                    }
                    
                    else if(j.rawValue == "+/-"){
                        Button(action: {
                            Logic.didTap(button: j)
                        }, label: {
                            OperatorButtonView(operatorName: j.rawValue, OuterRingColor: .pink, InnerRingColor: Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), FontColor: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 40)
                        })
                    }
                    else if(j.rawValue == "x"){
                        Button(action: {
                            Logic.didTap(button: j)
                        }, label: {
                            OperatorButtonView(operatorName: j.rawValue, OuterRingColor: .pink, InnerRingColor: Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), FontColor: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 40)
                        })
                    }
                    else if(j.rawValue == "-"){
                        Button(action: {
                            Logic.didTap(button: j)
                        }, label: {
                            OperatorButtonView(operatorName: j.rawValue, OuterRingColor: .pink, InnerRingColor: Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), FontColor: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 40)
                        })
                    }
                    else if(j.rawValue == "+"){
                        Button(action: {
                            Logic.didTap(button: j)
                        }, label: {
                            OperatorButtonView(operatorName: j.rawValue, OuterRingColor: .pink, InnerRingColor: Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)), FontColor: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 40)
                        })
                    }
                    else{
                        Button(action: {
                            self.Logic.didTap(button: j)
                        },label:{
                            NumButtonView(Num: j.rawValue, shadowcolor: .black, shadowRadius: 15, shadowX: 0, ShadowY: 0, NumFontColor: .black, BGcolor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        })
                    }
                }
            }
        }
    }
}
struct NumpadBottom: View {
    @EnvironmentObject var Logic:LogicClass
    var body: some View {
        HStack(spacing:15){
            Button(action: {
                Logic.didTap(button: .zero)
            }, label: {
                ZeroButtonView(FontColor: .white, OuterColor: Color(.systemPink), InnerColor: .black)
                    .padding(.leading , 19)
            })
            Button(action: {
                Logic.didTap(button: .dot)
            }, label: {
                OperatorButtonView(operatorName: ".", OuterRingColor: .pink, InnerRingColor: .white, FontColor: .black, shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 55)
            })
            Button(action: {
                Logic.didTap(button: .equal)
            }, label: {
                OperatorButtonView(operatorName: "=", OuterRingColor: .pink, InnerRingColor: .white, FontColor: .black, shadowcolor: .white, shadowRadius: 0, shadowX: 0, ShadowY: 0, FontSize: 55)
            })
            Spacer()
        }
    }
}
struct InputOutputView: View {
    @EnvironmentObject var Logic:LogicClass
    var body: some View {
        VStack{
            //OUTPUT View
            HStack{
                Spacer()
                Text(Logic.Final_Output)
                    .font(.system(size: 65, weight: .regular, design: .monospaced))
                    .foregroundColor(.blue)
            }
            Spacer()
            //INPUT View
            HStack{
                Spacer()
                
                Text(Logic.value)
                    .font(.system(size: 65, weight: .light, design: .monospaced))
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
}

//   ------------------------------ Preview ------------------------------

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatedView()
    }
}
//-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
//-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
