//
//  ContentVM.swift
//  ExpandableContainerDemo
//
//  Created by Ling on 2021/8/9.
//

import Foundation

/* ViewModel */
class ContentVM: ObservableObject {
    @Published var articles: [Article] = [
        Article(title: "《艾爾登法環》Steam頁面開放，這次也能當個強大法師",
                content: "FromSoftware 與《冰與火之歌》作者喬治·R·R·馬丁聯合打造的《艾爾登法環》（Elden Ring）於今（6）日開放 Steam 頁面。依據 Steam 頁面的描述，透露了本作的背景世界與玩家的自訂可能性，本作為正統黑暗奇幻世界為舞台的動作 RPG 遊戲。 玩家可在無縫連接的遼闊世界探索狀況多變的開放場景，構造複雜、立體的巨大地下迷宮。 ...",
                from: "4gamers",
                date: "2021/08/06",
                isExpanding: false),
        Article(title: "微軟 xCloud 雲端遊戲串流展開公測 正式支援 iOS 與 PC",
                content: "微軟 xCloud 雲端遊戲服務先前已於 4 月進行一波邀請制 beta 測試，現在正式展開公測，Game Pass Ultimate 訂閱者可以直接從他們的設備遊玩 Game Pass 遊戲庫中的遊戲，從網頁瀏覽器登入 xCloud 的網站就可以開始，而更重要的是微軟現在也開放蘋果生態系的支援。 ...",
                from: "inside",
                date: "2021/06/29",
                isExpanding: false),
        Article(title: "好奇號火星新發現！蓋爾撞擊坑驚見神秘「石拱門」",
                content: "〔即時新聞／綜合報導〕美國太空總署（NASA）火星探測車好奇號（curiosity）持續傳回火星探測畫面，官網釋出的眾多畫面中，被發現火星「蓋爾撞擊坑」內，出現一道神祕的「石拱門」。 ...",
                from: "LTN",
                date: "2021/08/06",
                isExpanding: false)
    ]
    
    @Published var groupArticles: [Article] = [
        Article(title: "《艾爾登法環》Steam頁面開放，這次也能當個強大法師",
                content: "FromSoftware 與《冰與火之歌》作者喬治·R·R·馬丁聯合打造的《艾爾登法環》（Elden Ring）於今（6）日開放 Steam 頁面。依據 Steam 頁面的描述，透露了本作的背景世界與玩家的自訂可能性，本作為正統黑暗奇幻世界為舞台的動作 RPG 遊戲。 玩家可在無縫連接的遼闊世界探索狀況多變的開放場景，構造複雜、立體的巨大地下迷宮。 ...",
                from: "4gamers",
                date: "2021/08/06",
                isExpanding: true,
                tag: 0),
        Article(title: "微軟 xCloud 雲端遊戲串流展開公測 正式支援 iOS 與 PC",
                content: "微軟 xCloud 雲端遊戲服務先前已於 4 月進行一波邀請制 beta 測試，現在正式展開公測，Game Pass Ultimate 訂閱者可以直接從他們的設備遊玩 Game Pass 遊戲庫中的遊戲，從網頁瀏覽器登入 xCloud 的網站就可以開始，而更重要的是微軟現在也開放蘋果生態系的支援。 ...",
                from: "inside",
                date: "2021/06/29",
                isExpanding: false,
                tag: 1),
        Article(title: "好奇號火星新發現！蓋爾撞擊坑驚見神秘「石拱門」",
                content: "〔即時新聞／綜合報導〕美國太空總署（NASA）火星探測車好奇號（curiosity）持續傳回火星探測畫面，官網釋出的眾多畫面中，被發現火星「蓋爾撞擊坑」內，出現一道神祕的「石拱門」。 ...",
                from: "LTN",
                date: "2021/08/06",
                isExpanding: false,
                tag: 2)
    ]
    
    @Published var imageArticles: [Article] = [
        Article(title: "PS5銷量突破1千萬台 SONY史上銷售速度最快的主機",
                content: "Sony Interactive Entertainment（SIE）今（28）宣布，新一代遊戲主機PlayStation®5（PS5）自2020年11月12日首度問世以來，全球銷量已突破1,000萬台。PS5是SIE史上銷售最快的主機，並持續超越前代主機PlayStation®4（PS4）的銷量。",
                from: "UDN",
                date: "2021/07/28",
                isExpanding: false, tag: 0, image: "article01"),
        Article(title: "射影機準備好！《零 ～濡鴉之巫女～》發售日公開 新要素「拍照模式」及新服裝釋出",
                content: "臺灣光榮特庫摩今（28）日宣布，移植到全平台的和風恐怖遊戲《零 ～濡鴉之巫女～》將於今年 10 月 28 日全平台（Nintendo Switch / PS4 / PS5 / Xbox X|S / Xbox One / Steam）發售，並於 7 月 29 日起開放預購。",
                from: "NOW電玩",
                date: "2021/07/29",
                isExpanding: false, tag: 0, image: "article02"),
    ]
}


/* Model */
struct Article: Hashable {
    let title: String
    let content: String
    let from: String
    let date: String
    var isExpanding: Bool
    var tag: Int? = nil
    var image: String? = nil
}
