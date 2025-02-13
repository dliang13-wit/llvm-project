; RUN: llc -mtriple=hexagon < %s
; REQUIRES: asserts

target triple = "hexagon"

%s.0 = type { i8, i8, i8, i8 }
%s.1 = type { %s.2 }
%s.2 = type { %s.3 }
%s.3 = type { ptr }
%s.4 = type { i8, i8, i16, i8 }
%s.5 = type { i8, ptr }

@g0 = external hidden global [3 x %s.0], align 8
@g1 = external hidden global [3 x %s.0], align 8
@g2 = external hidden global [3 x %s.0], align 8
@g3 = external hidden global [3 x %s.0], align 8
@g4 = external hidden global [3 x %s.0], align 8
@g5 = external hidden global [3 x %s.0], align 8
@g6 = external hidden global [4 x %s.0], align 8
@g7 = external hidden global [3 x %s.0], align 8
@g8 = external hidden global [3 x %s.0], align 8
@g9 = external hidden global [3 x %s.0], align 8
@g10 = external hidden global [4 x %s.0], align 8
@g11 = external hidden global [3 x %s.0], align 8
@g12 = external hidden global [3 x %s.0], align 8
@g13 = external hidden global [4 x %s.0], align 8
@g14 = external hidden global [3 x %s.0], align 8
@g15 = external hidden global [3 x %s.0], align 8
@g16 = external hidden global [3 x %s.0], align 8
@g17 = external hidden global [4 x %s.0], align 8
@g18 = external hidden global [3 x %s.0], align 8

; Function Attrs: norecurse nounwind optsize ssp
define hidden zeroext i8 @f0(ptr nocapture readnone %a0, ptr readonly %a1, ptr %a2, i32 %a3) unnamed_addr #0 align 2 {
b0:
  br i1 undef, label %b4, label %b1

b1:                                               ; preds = %b0
  %v0 = icmp eq i32 %a3, 1
  %v1 = select i1 %v0, ptr @g18, ptr @g0
  %v2 = icmp eq i32 %a3, 2
  %v3 = select i1 %v2, ptr @g16, ptr %v1
  %v4 = icmp eq i32 %a3, 3
  %v5 = select i1 %v4, ptr @g15, ptr %v3
  %v6 = icmp eq i32 %a3, 4
  %v7 = select i1 %v6, ptr @g14, ptr %v5
  %v8 = icmp eq i32 %a3, 5
  %v9 = select i1 %v8, ptr @g12, ptr %v7
  %v10 = icmp eq i32 %a3, 6
  %v11 = select i1 %v10, ptr @g11, ptr %v9
  %v12 = icmp eq i32 %a3, 7
  %v13 = select i1 %v12, ptr @g9, ptr %v11
  %v14 = icmp eq i32 %a3, 8
  %v15 = select i1 %v14, ptr @g8, ptr %v13
  %v16 = icmp eq i32 %a3, 9
  %v17 = select i1 %v16, ptr @g7, ptr %v15
  %v18 = icmp eq i32 %a3, 10
  %v19 = select i1 %v18, ptr @g5, ptr %v17
  %v20 = icmp eq i32 %a3, 11
  %v21 = select i1 %v20, ptr @g4, ptr %v19
  %v22 = icmp eq i32 %a3, 12
  %v23 = select i1 %v22, ptr @g3, ptr %v21
  %v24 = icmp eq i32 %a3, 13
  %v25 = select i1 %v24, ptr @g2, ptr %v23
  %v26 = select i1 undef, ptr @g1, ptr %v25
  %v27 = select i1 undef, ptr @g17, ptr %v26
  %v28 = icmp eq i32 %a3, 16
  %v29 = select i1 %v28, ptr @g13, ptr %v27
  %v30 = icmp eq i32 %a3, 17
  %v31 = select i1 %v30, ptr null, ptr %v29
  %v32 = select i1 undef, ptr @g10, ptr %v31
  %v33 = select i1 undef, ptr @g6, ptr %v32
  %v34 = add i32 %a3, -15
  %v35 = icmp ult i32 %v34, 2
  %v36 = select i1 %v35, i8 4, i8 3
  %v37 = select i1 undef, i8 0, i8 %v36
  %v38 = select i1 undef, i8 4, i8 %v37
  br i1 undef, label %b2, label %b3

b2:                                               ; preds = %b3, %b1
  %v39 = phi ptr [ undef, %b3 ], [ %v33, %b1 ]
  %v40 = phi i8 [ undef, %b3 ], [ %v38, %b1 ]
  %v41 = getelementptr inbounds %s.5, ptr %a2, i32 0, i32 1
  store ptr %v39, ptr %v41, align 4
  store i8 %v40, ptr undef, align 4
  br label %b4

b3:                                               ; preds = %b1
  br label %b2

b4:                                               ; preds = %b2, %b0
  ret i8 undef
}

attributes #0 = { norecurse nounwind optsize ssp "target-cpu"="hexagonv55" }
