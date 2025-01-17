; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=amdgcn -mcpu=gfx90a -verify-machineinstrs -misched-cluster=0 -amdgpu-igrouplp-exact-solver-max-branches=250000 < %s | FileCheck -check-prefix=EXACT %s
; RUN: llc -march=amdgcn -mcpu=gfx90a -verify-machineinstrs -misched-cluster=0 -amdgpu-igrouplp-exact-solver=1 -amdgpu-igrouplp-exact-solver-max-branches=200000 -amdgpu-igrouplp-exact-solver-cost-heur=1 < %s | FileCheck -check-prefix=LB %s

define amdgpu_kernel void @test_sched_group_barrier_pipeline_alternating_READ_VALU_WRITE(<32 x i32> addrspace(1)* noalias %in, <32 x i32> addrspace(1)* noalias %out) #0 {
; EXACT-LABEL: test_sched_group_barrier_pipeline_alternating_READ_VALU_WRITE:
; EXACT:       ; %bb.0:
; EXACT-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; EXACT-NEXT:    v_lshlrev_b32_e32 v16, 7, v0
; EXACT-NEXT:    ; kill: killed $sgpr0_sgpr1
; EXACT-NEXT:    s_waitcnt lgkmcnt(0)
; EXACT-NEXT:    global_load_dwordx4 v[12:15], v16, s[0:1] offset:32
; EXACT-NEXT:    global_load_dwordx4 v[4:7], v16, s[0:1] offset:48
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; EXACT-NEXT:    s_waitcnt vmcnt(1)
; EXACT-NEXT:    v_mul_lo_u32 v13, v13, v13
; EXACT-NEXT:    s_waitcnt vmcnt(0)
; EXACT-NEXT:    v_mul_lo_u32 v7, v7, v7
; EXACT-NEXT:    global_load_dwordx4 v[0:3], v16, s[0:1]
; EXACT-NEXT:    v_mul_lo_u32 v6, v6, v6
; EXACT-NEXT:    v_mul_lo_u32 v12, v12, v12
; EXACT-NEXT:    v_mul_lo_u32 v15, v15, v15
; EXACT-NEXT:    v_mul_lo_u32 v14, v14, v14
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; EXACT-NEXT:    s_waitcnt vmcnt(0)
; EXACT-NEXT:    v_mul_lo_u32 v3, v3, v3
; EXACT-NEXT:    v_mul_lo_u32 v2, v2, v2
; EXACT-NEXT:    v_mul_lo_u32 v1, v1, v1
; EXACT-NEXT:    v_mul_lo_u32 v0, v0, v0
; EXACT-NEXT:    global_store_dwordx4 v16, v[0:3], s[2:3]
; EXACT-NEXT:    global_load_dwordx4 v[0:3], v16, s[0:1] offset:112
; EXACT-NEXT:    s_waitcnt vmcnt(0)
; EXACT-NEXT:    v_mul_lo_u32 v3, v3, v3
; EXACT-NEXT:    v_mul_lo_u32 v2, v2, v2
; EXACT-NEXT:    v_mul_lo_u32 v1, v1, v1
; EXACT-NEXT:    v_mul_lo_u32 v0, v0, v0
; EXACT-NEXT:    global_store_dwordx4 v16, v[0:3], s[2:3] offset:112
; EXACT-NEXT:    global_load_dwordx4 v[0:3], v16, s[0:1] offset:96
; EXACT-NEXT:    s_waitcnt vmcnt(0)
; EXACT-NEXT:    v_mul_lo_u32 v3, v3, v3
; EXACT-NEXT:    v_mul_lo_u32 v2, v2, v2
; EXACT-NEXT:    v_mul_lo_u32 v1, v1, v1
; EXACT-NEXT:    v_mul_lo_u32 v0, v0, v0
; EXACT-NEXT:    global_store_dwordx4 v16, v[0:3], s[2:3] offset:96
; EXACT-NEXT:    v_mul_lo_u32 v5, v5, v5
; EXACT-NEXT:    v_mul_lo_u32 v4, v4, v4
; EXACT-NEXT:    global_store_dwordx4 v16, v[4:7], s[2:3] offset:48
; EXACT-NEXT:    global_load_dwordx4 v[4:7], v16, s[0:1] offset:64
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; EXACT-NEXT:    s_waitcnt vmcnt(0)
; EXACT-NEXT:    v_mul_lo_u32 v7, v7, v7
; EXACT-NEXT:    v_mul_lo_u32 v6, v6, v6
; EXACT-NEXT:    v_mul_lo_u32 v5, v5, v5
; EXACT-NEXT:    v_mul_lo_u32 v4, v4, v4
; EXACT-NEXT:    global_store_dwordx4 v16, v[4:7], s[2:3] offset:64
; EXACT-NEXT:    global_store_dwordx4 v16, v[12:15], s[2:3] offset:32
; EXACT-NEXT:    global_load_dwordx4 v[8:11], v16, s[0:1] offset:16
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; EXACT-NEXT:    s_waitcnt vmcnt(0)
; EXACT-NEXT:    v_mul_lo_u32 v9, v9, v9
; EXACT-NEXT:    v_mul_lo_u32 v8, v8, v8
; EXACT-NEXT:    v_mul_lo_u32 v11, v11, v11
; EXACT-NEXT:    v_mul_lo_u32 v10, v10, v10
; EXACT-NEXT:    global_store_dwordx4 v16, v[8:11], s[2:3] offset:16
; EXACT-NEXT:    global_load_dwordx4 v[8:11], v16, s[0:1] offset:80
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; EXACT-NEXT:    s_waitcnt vmcnt(0)
; EXACT-NEXT:    v_mul_lo_u32 v11, v11, v11
; EXACT-NEXT:    v_mul_lo_u32 v10, v10, v10
; EXACT-NEXT:    v_mul_lo_u32 v9, v9, v9
; EXACT-NEXT:    v_mul_lo_u32 v8, v8, v8
; EXACT-NEXT:    global_store_dwordx4 v16, v[8:11], s[2:3] offset:80
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; EXACT-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; EXACT-NEXT:    s_endpgm
;
; LB-LABEL: test_sched_group_barrier_pipeline_alternating_READ_VALU_WRITE:
; LB:       ; %bb.0:
; LB-NEXT:    s_load_dwordx4 s[0:3], s[0:1], 0x24
; LB-NEXT:    v_lshlrev_b32_e32 v12, 7, v0
; LB-NEXT:    s_waitcnt lgkmcnt(0)
; LB-NEXT:    global_load_dwordx4 v[8:11], v12, s[0:1] offset:64
; LB-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; LB-NEXT:    s_waitcnt vmcnt(0)
; LB-NEXT:    v_mul_lo_u32 v11, v11, v11
; LB-NEXT:    v_mul_lo_u32 v10, v10, v10
; LB-NEXT:    v_mul_lo_u32 v9, v9, v9
; LB-NEXT:    v_mul_lo_u32 v8, v8, v8
; LB-NEXT:    global_store_dwordx4 v12, v[8:11], s[2:3] offset:64
; LB-NEXT:    global_load_dwordx4 v[0:3], v12, s[0:1]
; LB-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; LB-NEXT:    s_waitcnt vmcnt(0)
; LB-NEXT:    v_mul_lo_u32 v3, v3, v3
; LB-NEXT:    v_mul_lo_u32 v2, v2, v2
; LB-NEXT:    global_load_dwordx4 v[8:11], v12, s[0:1] offset:32
; LB-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; LB-NEXT:    s_waitcnt vmcnt(0)
; LB-NEXT:    v_mul_lo_u32 v9, v9, v9
; LB-NEXT:    v_mul_lo_u32 v8, v8, v8
; LB-NEXT:    v_mul_lo_u32 v11, v11, v11
; LB-NEXT:    v_mul_lo_u32 v10, v10, v10
; LB-NEXT:    global_store_dwordx4 v12, v[8:11], s[2:3] offset:32
; LB-NEXT:    global_load_dwordx4 v[4:7], v12, s[0:1] offset:112
; LB-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; LB-NEXT:    s_waitcnt vmcnt(0)
; LB-NEXT:    v_mul_lo_u32 v7, v7, v7
; LB-NEXT:    v_mul_lo_u32 v6, v6, v6
; LB-NEXT:    v_mul_lo_u32 v1, v1, v1
; LB-NEXT:    v_mul_lo_u32 v0, v0, v0
; LB-NEXT:    global_store_dwordx4 v12, v[0:3], s[2:3]
; LB-NEXT:    global_load_dwordx4 v[0:3], v12, s[0:1] offset:96
; LB-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; LB-NEXT:    s_waitcnt vmcnt(0)
; LB-NEXT:    v_mul_lo_u32 v3, v3, v3
; LB-NEXT:    v_mul_lo_u32 v2, v2, v2
; LB-NEXT:    v_mul_lo_u32 v1, v1, v1
; LB-NEXT:    v_mul_lo_u32 v0, v0, v0
; LB-NEXT:    global_store_dwordx4 v12, v[0:3], s[2:3] offset:96
; LB-NEXT:    global_load_dwordx4 v[0:3], v12, s[0:1] offset:80
; LB-NEXT:    s_waitcnt vmcnt(0)
; LB-NEXT:    v_mul_lo_u32 v3, v3, v3
; LB-NEXT:    v_mul_lo_u32 v2, v2, v2
; LB-NEXT:    v_mul_lo_u32 v1, v1, v1
; LB-NEXT:    v_mul_lo_u32 v0, v0, v0
; LB-NEXT:    global_store_dwordx4 v12, v[0:3], s[2:3] offset:80
; LB-NEXT:    v_mul_lo_u32 v5, v5, v5
; LB-NEXT:    v_mul_lo_u32 v4, v4, v4
; LB-NEXT:    global_store_dwordx4 v12, v[4:7], s[2:3] offset:112
; LB-NEXT:    global_load_dwordx4 v[4:7], v12, s[0:1] offset:48
; LB-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; LB-NEXT:    s_waitcnt vmcnt(0)
; LB-NEXT:    v_mul_lo_u32 v5, v5, v5
; LB-NEXT:    global_load_dwordx4 v[0:3], v12, s[0:1] offset:16
; LB-NEXT:    v_mul_lo_u32 v4, v4, v4
; LB-NEXT:    s_waitcnt vmcnt(0)
; LB-NEXT:    v_mul_lo_u32 v1, v1, v1
; LB-NEXT:    v_mul_lo_u32 v0, v0, v0
; LB-NEXT:    v_mul_lo_u32 v3, v3, v3
; LB-NEXT:    v_mul_lo_u32 v2, v2, v2
; LB-NEXT:    global_store_dwordx4 v12, v[0:3], s[2:3] offset:16
; LB-NEXT:    v_mul_lo_u32 v7, v7, v7
; LB-NEXT:    v_mul_lo_u32 v6, v6, v6
; LB-NEXT:    global_store_dwordx4 v12, v[4:7], s[2:3] offset:48
; LB-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000020) size(1) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000002) size(2) SyncID(0)
; LB-NEXT:    ; sched_group_barrier mask(0x00000040) size(1) SyncID(0)
; LB-NEXT:    s_endpgm
  %tid = call i32 @llvm.amdgcn.workitem.id.x() #0
  %gep1 = getelementptr <32 x i32>, <32 x i32> addrspace(1)* %in, i32 %tid
  %load = load <32 x i32>, <32 x i32> addrspace(1)* %gep1
  %mul = mul <32 x i32> %load, %load
  %gep2 = getelementptr <32 x i32>, <32 x i32> addrspace(1)* %out, i32 %tid
  store <32 x i32> %mul, <32 x i32> addrspace(1)* %gep2
  ; 1 VMEM read
  call void @llvm.amdgcn.sched.group.barrier(i32 32, i32 1, i32 0)
  ; 2 VALU
  call void @llvm.amdgcn.sched.group.barrier(i32 2, i32 2, i32 0)
  ; 1 VMEM write
  call void @llvm.amdgcn.sched.group.barrier(i32 64, i32 1, i32 0)
  ; 1 VMEM read
  call void @llvm.amdgcn.sched.group.barrier(i32 32, i32 1, i32 0)
  ; 2 VALU
  call void @llvm.amdgcn.sched.group.barrier(i32 2, i32 2, i32 0)
  ; 1 VMEM write
  call void @llvm.amdgcn.sched.group.barrier(i32 64, i32 1, i32 0)
  ; 1 VMEM read
  call void @llvm.amdgcn.sched.group.barrier(i32 32, i32 1, i32 0)
  ; 2 VALU
  call void @llvm.amdgcn.sched.group.barrier(i32 2, i32 2, i32 0)
  ; 1 VMEM write
  call void @llvm.amdgcn.sched.group.barrier(i32 64, i32 1, i32 0)
  ; 1 VMEM read
  call void @llvm.amdgcn.sched.group.barrier(i32 32, i32 1, i32 0)
  ; 2 VALU
  call void @llvm.amdgcn.sched.group.barrier(i32 2, i32 2, i32 0)
  ; 1 VMEM write
  call void @llvm.amdgcn.sched.group.barrier(i32 64, i32 1, i32 0)
  ; 1 VMEM read
  call void @llvm.amdgcn.sched.group.barrier(i32 32, i32 1, i32 0)
  ; 2 VALU
  call void @llvm.amdgcn.sched.group.barrier(i32 2, i32 2, i32 0)
  ; 1 VMEM write
  call void @llvm.amdgcn.sched.group.barrier(i32 64, i32 1, i32 0)
  ; 1 VMEM read
  call void @llvm.amdgcn.sched.group.barrier(i32 32, i32 1, i32 0)
  ; 2 VALU
  call void @llvm.amdgcn.sched.group.barrier(i32 2, i32 2, i32 0)
  ; 1 VMEM write
  call void @llvm.amdgcn.sched.group.barrier(i32 64, i32 1, i32 0)
  ; 1 VMEM read
  call void @llvm.amdgcn.sched.group.barrier(i32 32, i32 1, i32 0)
  ; 2 VALU
  call void @llvm.amdgcn.sched.group.barrier(i32 2, i32 2, i32 0)
  ; 1 VMEM write
  call void @llvm.amdgcn.sched.group.barrier(i32 64, i32 1, i32 0)
  ; 1 VMEM read
  call void @llvm.amdgcn.sched.group.barrier(i32 32, i32 1, i32 0)
  ; 2 VALU
  call void @llvm.amdgcn.sched.group.barrier(i32 2, i32 2, i32 0)
  ; 1 VMEM write
  call void @llvm.amdgcn.sched.group.barrier(i32 64, i32 1, i32 0)
  ret void
}

declare i32 @llvm.amdgcn.workitem.id.x() #0
declare void @llvm.amdgcn.sched.group.barrier(i32, i32, i32) #0
declare <32 x float> @llvm.amdgcn.mfma.f32.32x32x1f32(float, float, <32 x float>, i32, i32, i32) #0

attributes #0 = { nounwind "amdgpu-flat-work-group-size"="1,256" readnone speculatable}
