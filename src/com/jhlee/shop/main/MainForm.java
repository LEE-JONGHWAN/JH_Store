package com.jhlee.shop.main;

import javax.swing.*;//윈도우 기능
import java.awt.*;//레이아웃

public class MainForm extends JFrame{ //상속:변경해서 사용
    private CardLayout card=new CardLayout(); //포함클래스:있는 그대로
    //화면 UI: 생성자 → 시작하면 바로 보여준다
    //생성자: 1번만 호출이 가능하고, 시작과 동시에 호출되는 메소드
    //생성자는 모든 클래스에서 호출이 가능해야함 → public
    Login login=new Login();
    public MainForm() {
        //layout 설정
        setLayout(card);
        add("LOGIN",login);
        setLayout(card);
        /* JFrame,JWindow,JDialog →BorderLayout
         * JPanel →FlowLayout
         * 사용자정의: setLayout(null) 주고 시작해야함!!!!!
         */
        setBounds(1200, 60, 300, 300);
        setVisible(true);
    }
    public static void main(String[] args){
        new MainForm();
 
    }
}

