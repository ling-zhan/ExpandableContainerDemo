//
//  ContentView.swift
//  ExpandableContainerDemo
//
//  Created by Ling on 2021/8/9.
//

import SwiftUI
import ExpandableContainer

struct ContentView: View {
    @StateObject var vm = ContentVM.init()
    @State var selected: Int = 0
    var body: some View {
        NavigationView {
            TabView {
                expandImageView()
                    .tabItem {
                        Image(systemName: "line.horizontal.3.circle")
                        Text("範例 1")
                    }
                expandView()
                    .tabItem {
                        Image(systemName: "line.horizontal.3.circle")
                        Text("範例 2")
                    }
                expandOnlyOneItemView()
                    .tabItem {
                        Image(systemName: "line.horizontal.2.decrease.circle")
                        Text("範例 3")
                    }
            }.tabViewStyle(DefaultTabViewStyle())
            .navigationTitle("文章")
            
            
        }
    } // end body
    
    func expandOnlyOneItemView() -> some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<vm.groupArticles.count, id: \.self) { index in
                    ExpandableContainer(header: {
                        HStack(spacing:0) {
                            Text(vm.groupArticles[index].title)
                                .lineLimit(2)
                                .font(.body.bold())
                            Spacer()
                            Image(systemName: "chevron.down")
                                .rotationEffect(
                                    vm.groupArticles[index].isExpanding ? .degrees(180) : .zero)
                        }
                    }, content: {
                        VStack {
                            Text(vm.groupArticles[index].content)
                                .font(.body)
                            Text("\(vm.groupArticles[index].from)-\(vm.groupArticles[index].date)")
                                .foregroundColor(.gray)
                                .font(.footnote)
                                .frame(minWidth: 0,maxWidth: .infinity,alignment: .trailing)
                                .padding(.top)
                        }
                    },isExpanding: $vm.groupArticles[index].isExpanding,
                    tag: index,
                    selectedTag: { tag in self.selected = tag })
                    .onChange(of: selected, perform: { value in
                        withAnimation(.spring()) {
                            if value != index {
                                vm.groupArticles[index].isExpanding = false
                            }
                        }
                    })
                    .modifier(listModifier())
                }
            } // end LazyVStack
        } // end ScrollView
    } // end func expandOnlyOneItemView

    func expandView() -> some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                    ForEach(0..<vm.articles.count, id: \.self) { index in
                        ExpandableContainer(header: {
                            HStack(spacing:0) {
                                Text(vm.articles[index].title)
                                    .lineLimit(2)
                                    .font(.body.bold())
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .rotationEffect(
                                        vm.articles[index].isExpanding ? .degrees(180) : .zero)
                            }
                        }, content: {
                            VStack {
                                Text(vm.articles[index].content)
                                    .font(.body)
                                Text("\(vm.articles[index].from)-\(vm.articles[index].date)")
                                    .foregroundColor(.gray)
                                    .font(.footnote)
                                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .trailing)
                                    .padding(.top)
                            }
                        }, isExpanding: $vm.articles[index].isExpanding)
                        .modifier(listModifier())
                    } // end ForEach
            } // end LazyVStack
        } // end ScrollView
    } // end func expandView
    
    func expandImageView() -> some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<vm.imageArticles.count) { index in
                    ExpandableContainer(header: {
                        HStack {
                            if !vm.imageArticles[index].isExpanding {
                                Image(vm.imageArticles[index].image ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 45, height: 45)
                                    .cornerRadius(12)
                                    .clipped()
                                    .animation(.default)
                            }
                            Text(vm.imageArticles[index].title)
                                .lineLimit(vm.imageArticles[index].isExpanding ? nil : 2)
                                .font(.body.bold())
                                .animation(.default)
                        }
                        .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    }, content: {
                        VStack {
                            Image(vm.imageArticles[index].image ?? "")
                                .resizable()
                                .scaledToFill()
                                .padding()
                                .clipped()
                        Text(vm.imageArticles[index].content)
                            .font(.body)
                            Text("\(vm.imageArticles[index].from)-\(vm.imageArticles[index].date)")
                                .foregroundColor(.gray)
                                .font(.footnote)
                                .frame(minWidth: 0,maxWidth: .infinity,alignment: .trailing)
                                .padding(.top)
                        }
                    }, isExpanding: $vm.imageArticles[index].isExpanding)
                    .modifier(listModifier())
                }
            }
        }
    }
    
    /* Style */
    private struct listModifier: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 3)
                .padding(.horizontal)
        }
    } // end textModifier
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
