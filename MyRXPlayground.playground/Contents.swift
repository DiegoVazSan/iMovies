import UIKit
import RxSwift
import RxCocoa
import RxRelay

/*
 PublishSubject -> starts emitting elements only AFTER an OBSERVER SUBSCRIBES
 BehaviorSubject -> Emits the last element to new subscribers
 ReplaySubject -> Emits a buffer size of elements to new suscribers
 AsyncSubject -> Emits Only the last event in the sequence, and only when the subject receives a completed event.
 */

//PublishRelay -> PublishSubject
//BehaivorRelay -> BehaviorSubject

//MARK: - PublishSubject
let pSub = PublishSubject<String>()

pSub.onNext(" PublishSubject TEST 1")

let observer = pSub.subscribe(onNext: {
    elem in
    print(elem)
})

pSub.onNext(" PublishSubject TEST 2")


//MARK: - BehaviorSubject
let behavior = BehaviorSubject<String>(value: "BehaviorSubject 1")

behavior.onNext(" BehaviorSubject 2")

let behaviorObserver = behavior.subscribe(onNext: {
    elem in
    print(elem)
})

behavior.onNext(" BehaviorSubject 3")


//MARK: - ReplaySubject
let replaySubject = ReplaySubject<Int>.create(bufferSize: 3)
replaySubject.onNext(1)
replaySubject.onNext(2)
replaySubject.onNext(3)

let replayObserver = replaySubject.subscribe(onNext: {
    elem in
    print(elem)
})

//MARK: - AsyncSubject
let asyncSubject = AsyncSubject<String>()
asyncSubject.onNext("AsyncSubject I")
asyncSubject.onNext("AsyncSubject II")
asyncSubject.onCompleted()

let asyncObserver = asyncSubject.subscribe(onNext: {
    elem in
    print(elem)
})


//MARK: - PublishRelay

let publishRelay = PublishRelay<String>()
publishRelay.accept(" PublishRelay I")


let publishRelayObserver = publishRelay.subscribe(onNext: {
    elem in
    print(elem)
})

publishRelay.accept("PublishRelay II")

//MARK: - BehaviorRelay

let behaiviorRelay = BehaviorRelay<String>(value: "Behavior relay A)")


let behaiviorRelayObserver = behaiviorRelay.subscribe(onNext: {
    elem in
    print(elem)
})

behaiviorRelay.accept("Behavior relay B)")

