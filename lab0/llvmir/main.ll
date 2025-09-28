; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@N = dso_local constant i32 5, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @factorial(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sle i32 %4, 1
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %13

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = sub nsw i32 %9, 1
  %11 = call i32 @factorial(i32 noundef %10)
  %12 = mul nsw i32 %8, %11
  store i32 %12, ptr %2, align 4
  br label %13

13:                                               ; preds = %7, %6
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [5 x i32], align 16
  %9 = alloca [2 x [3 x i32]], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 3, ptr %3, align 4
  %16 = call i32 (...) @getint()
  store i32 %16, ptr %2, align 4
  %17 = load i32, ptr %2, align 4
  call void @putint(i32 noundef %17)
  call void @putch(i32 noundef 10)
  %18 = load i32, ptr %2, align 4
  %19 = load i32, ptr %3, align 4
  %20 = mul nsw i32 %19, 2
  %21 = add nsw i32 %18, %20
  %22 = load i32, ptr %2, align 4
  %23 = load i32, ptr %3, align 4
  %24 = sdiv i32 %22, %23
  %25 = srem i32 %24, 2
  %26 = sub nsw i32 %21, %25
  store i32 %26, ptr %4, align 4
  %27 = load i32, ptr %4, align 4
  call void @putint(i32 noundef %27)
  call void @putch(i32 noundef 10)
  %28 = load i32, ptr %4, align 4
  %29 = shl i32 %28, 1
  store i32 %29, ptr %4, align 4
  %30 = load i32, ptr %4, align 4
  call void @putint(i32 noundef %30)
  call void @putch(i32 noundef 10)
  %31 = load i32, ptr %4, align 4
  %32 = or i32 %31, 5
  store i32 %32, ptr %4, align 4
  %33 = load i32, ptr %4, align 4
  call void @putint(i32 noundef %33)
  call void @putch(i32 noundef 10)
  %34 = load i32, ptr %4, align 4
  %35 = and i32 %34, 7
  store i32 %35, ptr %4, align 4
  %36 = load i32, ptr %4, align 4
  call void @putint(i32 noundef %36)
  call void @putch(i32 noundef 10)
  %37 = load i32, ptr %4, align 4
  %38 = xor i32 %37, -1
  store i32 %38, ptr %4, align 4
  %39 = load i32, ptr %4, align 4
  call void @putint(i32 noundef %39)
  call void @putch(i32 noundef 10)
  %40 = load i32, ptr %2, align 4
  %41 = load i32, ptr %3, align 4
  %42 = icmp sgt i32 %40, %41
  br i1 %42, label %43, label %46

43:                                               ; preds = %0
  %44 = load i32, ptr %3, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %49, label %46

46:                                               ; preds = %43, %0
  %47 = load i32, ptr %2, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %50

49:                                               ; preds = %46, %43
  store i32 42, ptr %4, align 4
  br label %51

50:                                               ; preds = %46
  store i32 -1, ptr %4, align 4
  br label %51

51:                                               ; preds = %50, %49
  %52 = load i32, ptr %4, align 4
  call void @putint(i32 noundef %52)
  call void @putch(i32 noundef 10)
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %53

53:                                               ; preds = %68, %51
  %54 = load i32, ptr %6, align 4
  %55 = icmp slt i32 %54, 5
  br i1 %55, label %56, label %71

56:                                               ; preds = %53
  %57 = load i32, ptr %6, align 4
  %58 = icmp eq i32 %57, 2
  br i1 %58, label %59, label %60

59:                                               ; preds = %56
  br label %68

60:                                               ; preds = %56
  %61 = load i32, ptr %6, align 4
  %62 = icmp eq i32 %61, 4
  br i1 %62, label %63, label %64

63:                                               ; preds = %60
  br label %71

64:                                               ; preds = %60
  %65 = load i32, ptr %5, align 4
  %66 = load i32, ptr %6, align 4
  %67 = add nsw i32 %65, %66
  store i32 %67, ptr %5, align 4
  br label %68

68:                                               ; preds = %64, %59
  %69 = load i32, ptr %6, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %6, align 4
  br label %53, !llvm.loop !6

71:                                               ; preds = %63, %53
  %72 = load i32, ptr %5, align 4
  call void @putint(i32 noundef %72)
  call void @putch(i32 noundef 10)
  store i32 0, ptr %7, align 4
  br label %73

73:                                               ; preds = %76, %71
  %74 = load i32, ptr %7, align 4
  %75 = icmp slt i32 %74, 3
  br i1 %75, label %76, label %82

76:                                               ; preds = %73
  %77 = load i32, ptr %5, align 4
  %78 = load i32, ptr %7, align 4
  %79 = add nsw i32 %77, %78
  store i32 %79, ptr %5, align 4
  %80 = load i32, ptr %7, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %7, align 4
  br label %73, !llvm.loop !8

82:                                               ; preds = %73
  %83 = load i32, ptr %5, align 4
  call void @putint(i32 noundef %83)
  call void @putch(i32 noundef 10)
  store i32 0, ptr %10, align 4
  br label %84

84:                                               ; preds = %98, %82
  %85 = load i32, ptr %10, align 4
  %86 = icmp slt i32 %85, 5
  br i1 %86, label %87, label %101

87:                                               ; preds = %84
  %88 = load i32, ptr %10, align 4
  %89 = load i32, ptr %10, align 4
  %90 = mul nsw i32 %88, %89
  %91 = load i32, ptr %10, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [5 x i32], ptr %8, i64 0, i64 %92
  store i32 %90, ptr %93, align 4
  %94 = load i32, ptr %10, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [5 x i32], ptr %8, i64 0, i64 %95
  %97 = load i32, ptr %96, align 4
  call void @putint(i32 noundef %97)
  call void @putch(i32 noundef 10)
  br label %98

98:                                               ; preds = %87
  %99 = load i32, ptr %10, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, ptr %10, align 4
  br label %84, !llvm.loop !9

101:                                              ; preds = %84
  store i32 0, ptr %11, align 4
  br label %102

102:                                              ; preds = %130, %101
  %103 = load i32, ptr %11, align 4
  %104 = icmp slt i32 %103, 2
  br i1 %104, label %105, label %133

105:                                              ; preds = %102
  store i32 0, ptr %12, align 4
  br label %106

106:                                              ; preds = %126, %105
  %107 = load i32, ptr %12, align 4
  %108 = icmp slt i32 %107, 3
  br i1 %108, label %109, label %129

109:                                              ; preds = %106
  %110 = load i32, ptr %11, align 4
  %111 = load i32, ptr %12, align 4
  %112 = add nsw i32 %110, %111
  %113 = load i32, ptr %11, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [2 x [3 x i32]], ptr %9, i64 0, i64 %114
  %116 = load i32, ptr %12, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [3 x i32], ptr %115, i64 0, i64 %117
  store i32 %112, ptr %118, align 4
  %119 = load i32, ptr %11, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [2 x [3 x i32]], ptr %9, i64 0, i64 %120
  %122 = load i32, ptr %12, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [3 x i32], ptr %121, i64 0, i64 %123
  %125 = load i32, ptr %124, align 4
  call void @putint(i32 noundef %125)
  call void @putch(i32 noundef 10)
  br label %126

126:                                              ; preds = %109
  %127 = load i32, ptr %12, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, ptr %12, align 4
  br label %106, !llvm.loop !10

129:                                              ; preds = %106
  br label %130

130:                                              ; preds = %129
  %131 = load i32, ptr %11, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, ptr %11, align 4
  br label %102, !llvm.loop !11

133:                                              ; preds = %102
  %134 = call i32 @factorial(i32 noundef 5)
  store i32 %134, ptr %13, align 4
  %135 = load i32, ptr %13, align 4
  call void @putint(i32 noundef %135)
  call void @putch(i32 noundef 10)
  store i32 2, ptr %14, align 4
  %136 = getelementptr inbounds [5 x i32], ptr %8, i64 0, i64 2
  %137 = load i32, ptr %136, align 8
  %138 = getelementptr inbounds [2 x [3 x i32]], ptr %9, i64 0, i64 1
  %139 = getelementptr inbounds [3 x i32], ptr %138, i64 0, i64 2
  %140 = load i32, ptr %139, align 4
  %141 = add nsw i32 %137, %140
  %142 = load i32, ptr %5, align 4
  %143 = add nsw i32 %141, %142
  %144 = load i32, ptr %13, align 4
  %145 = add nsw i32 %143, %144
  store i32 %145, ptr %15, align 4
  %146 = load i32, ptr %15, align 4
  call void @putint(i32 noundef %146)
  call void @putch(i32 noundef 10)
  ret i32 0
}

declare i32 @getint(...) #1

declare void @putint(i32 noundef) #1

declare void @putch(i32 noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
