Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CEC47FB00
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 19:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933173; cv=none; b=QzlpETEmhK3U/fTMIauV7OiTINO5BluJhMb+1l7ob+I64QP9Lioup/umPOk3aK5zuImyY42nBfaMXRqto4F9CnaRVzYcBq4HqQNoUzz1skBcnRGhWuthFJALrI5SAqZUSpLQ8glIEzaDF+hnEw8zYMdq/fLTVZ4wp/skOb5fDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933173; c=relaxed/simple;
	bh=qRNHXWlci/rQvdt90FXyJyigyU178/f4pMIV0+EUJDM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHiRe11S+LNlLw+5GQ4uKPzZkfAYXkBf3jt5jFjiUgnhdQJz+HksiLFVRpWRvMH8HDeCATXCzJ07xG2tOS6tabsXOiNqftEdzpwYBKQoeCqm1zUkehR3brE42hV2lHjhblibRKznshC+O2MjgVEcaUkmFTd/U3aPN8i9EegKqFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=RjvtxU/e; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RjvtxU/e"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d440939f0so15992477b3.2
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933169; x=1790537969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k5EaTmFX7UEEJKbougudGcIFK6qUIRFfVy3dwTjeVQg=;
        b=RjvtxU/eNNlEerEdLBpqJVY5J9a5Nr0xw5KKzQrLx0KhnJuspD9wJu+17DYEtVJ1Ul
         e/7B9Ac4iZl1mza76u1M980ppPVbgK9+f8RVZt1bMtc2vWqzcserKO+7/jh04O9gpioR
         Rtxl561M5HKfgece8JQ2dk8K0S50YHZDCvz8VeWHMRMnSR44IqbEQvml2TDXIi769BVb
         P6NgY/fsWVHTXDadZ07caRN8Is2TSpx7QUHJSsU6lguqf4sxuMbN6qCfMYCkC/5JrVdN
         HSY9AYhgbnFAjfKCe0hxo74FfhIMIv+dqQngjisZDkTxNLndbh+fMVq8ZiGZuHhB5Egl
         Xj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933169; x=1790537969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k5EaTmFX7UEEJKbougudGcIFK6qUIRFfVy3dwTjeVQg=;
        b=EGebKx8bZf29UCEuB/W2rmB/22rSgJ5leTdyG6Rz3ndVDmfDV048qsQArdimxqvFOv
         Tx4F2ZsBE1hVRb6bvJwDlxCHKl+CgyYrFgsit0iSHfaQoPeuBfZcr6s1wTyY081R8K2Z
         NRQnhi9TqCQvQ4x/uGAY1X+miaXp/JSBtntp1EzGV1DkpTQ3HQVB++cmbA0JUmvcKybo
         SjiEiei2Y5RCh4og6qGEanHJ0OptPoxKaY+O7dAXY9PWbyFq8jhLnmBunZQ49/8LjZ5d
         DpXFmVHm9ksOmam8X4weaVHvPDjVJDFy1Ig6BGUQkjUenRp/uoSgN+zxoXMfxMcjjl9u
         kbPw==
X-Forwarded-Encrypted: i=1; AKwUvBygePmxSCEnA6hZGPtxbizumFCl0B/qLERdBQNvfEaEY2Giu0yFHhBlmNVOk0AqvR3Q+qNE7sPGA8VasDE=@vger.kernel.org
X-Gm-Message-State: AFuF++n/CiiZFDYipJOK+I1db6EMIRLz0xgucv128J2KAO3Xjl6q3eRr
	jLa8ptptR11TtaIxGkq0ou6AE9MF6XzU46WskcpayXmUfw5rgZDPOv6rVzK3qyfmiow=
X-Gm-Gg: AYBFou2y783oSwba+lUmMlloxisjAsSbmNxkuieYY/3fxUBG/KR0t7ujNJ8dFvfwq+3
	c0ykFUf5aKBwfxvxZixkyhMA3qd299Jw83a+cuenF/OgL5cETPEMM0lQ7yPN18N4pxfQdCrbRt1
	djhaVztdHMs1jahJ/43AzFBhq4dIxBwUUsZ6i0QZZ3hTEB17fgsLWx7mvRxFqw0xUtSSbcQ4mbY
	HwrASC4CuLi9y3ZtacbDwVjt+fvmf4yxYEZl/7WA33bJYAXaZwPxiCaMBqHu4VM8OPwktkQbdxL
	9y1o4P5yXR/5781YLi8+rfY63LRRaV1QoCCdyxGHxbQdB3704G4j+0UqOis6cvAB1DvQK4yiU9g
	2Qb3kEHtjofbCLTOUHr2kmiEdC7nxWuBSdx0BymS3UcTutw3FP+NtwFuBQsCz7lb+Db2ARVwmYW
	F9rAQrBBfGH9NUCYie77un6aYzlBt5jwORjKemapOijyYQOMp3EjCHYPUnZvaU11XJ+RbnEAkLP
	beHCelqQMz+Bbl3GHRLVmiFrQZCSo39L+Hh9AxUAeS+ibst4mPTFigb86EfRTm4bzq8ERRSLkBx
	SIl0x20g15f1e9GgISA=
X-Received: by 2002:a05:690c:6:b0:88c:b8ef:4fb9 with SMTP id 00721157ae682-89736848436mr28151587b3.66.1789933169160;
        Sun, 20 Sep 2026 12:39:29 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a46e4dd4fsm18636037b3.25.2026.09.20.12.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:39:28 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 26/46] oncore: Add on-core KHO ABI and public framework headers
Date: Sun, 20 Sep 2026 15:36:30 -0400
Message-ID: <20260920193650.3373435-27-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the On-Core KHO serialization ABI (include/linux/kho/abi/cpu.h)
and public session and job management APIs (include/linux/oncore.h).

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/arm64/include/asm/oncore.h |  24 ++++++
 arch/x86/include/asm/oncore.h   |  25 +++++++
 include/linux/kho/abi/cpu.h     |   1 +
 include/linux/oncore.h          | 129 ++++++++++++++++++++++++++++++++
 kernel/liveupdate/Kconfig       |  10 +++
 5 files changed, 189 insertions(+)
 create mode 100644 arch/arm64/include/asm/oncore.h
 create mode 100644 arch/x86/include/asm/oncore.h
 create mode 100644 include/linux/oncore.h

diff --git a/arch/arm64/include/asm/oncore.h b/arch/arm64/include/asm/oncore.h
new file mode 100644
index 000000000000..fbd0f218d867
--- /dev/null
+++ b/arch/arm64/include/asm/oncore.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * ARM64 architecture hooks for On-Core execution.
+ */
+#ifndef _ASM_ARM64_ONCORE_H
+#define _ASM_ARM64_ONCORE_H
+
+#include <linux/types.h>
+#include <asm/arch_timer.h>
+
+static inline u64 __cpu_preserved_text arch_oncore_read_counter(void)
+{
+	return __arch_counter_get_cntpct();
+}
+
+static inline u64 arch_oncore_counter_freq_hz(void)
+{
+	return arch_timer_get_cntfrq();
+}
+
+#endif /* _ASM_ARM64_ONCORE_H */
diff --git a/arch/x86/include/asm/oncore.h b/arch/x86/include/asm/oncore.h
new file mode 100644
index 000000000000..f64697a95d6a
--- /dev/null
+++ b/arch/x86/include/asm/oncore.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * x86 architecture hooks for On-Core execution.
+ */
+#ifndef _ASM_X86_ONCORE_H
+#define _ASM_X86_ONCORE_H
+
+#include <linux/types.h>
+#include <asm/msr.h>
+#include <asm/tsc.h>
+
+static inline u64 __cpu_preserved_text arch_oncore_read_counter(void)
+{
+	return rdtsc();
+}
+
+static inline u64 arch_oncore_counter_freq_hz(void)
+{
+	return (u64)tsc_khz * 1000ULL;
+}
+
+#endif /* _ASM_X86_ONCORE_H */
diff --git a/include/linux/kho/abi/cpu.h b/include/linux/kho/abi/cpu.h
index f75bfb4c6161..4d63e623f162 100644
--- a/include/linux/kho/abi/cpu.h
+++ b/include/linux/kho/abi/cpu.h
@@ -145,6 +145,7 @@ struct cpu_preserved_file_ser {
 	u32 cpu;
 	u32 reserved;
 	u64 stack_pa;
+	DECLARE_KHOSER_PTR(oncore, struct oncore_session_ser *);
 } __packed;
 
 #endif /* _LINUX_KHO_ABI_CPU_H */
diff --git a/include/linux/oncore.h b/include/linux/oncore.h
new file mode 100644
index 000000000000..2817b0282a32
--- /dev/null
+++ b/include/linux/oncore.h
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * On-Core Session and Scheduling Framework for Live Update
+ */
+#ifndef __LINUX_ONCORE_H
+#define __LINUX_ONCORE_H
+
+#include <linux/cpu_preserve.h>
+#include <linux/types.h>
+
+/*
+ * Only ever used as an opaque handle here, so do not include
+ * <linux/liveupdate.h>: this header is reached from <linux/kvm_host.h> via
+ * <linux/kvm_caretaker.h>, and including it would drag the entire LUO header
+ * stack into every KVM translation unit on every architecture.
+ */
+struct liveupdate_session;
+struct oncore_session;
+struct oncore_session_ser;
+struct oncore_job;
+
+#include <asm/oncore.h>
+
+/**
+ * enum oncore_exit_reason - Why an on-core job returned to the scheduler
+ * @ONCORE_EXIT_QUANTUM_EXPIRED: Time slice elapsed; the job is still runnable.
+ * @ONCORE_EXIT_ATTACH_SIGNALED: The incoming kernel asked for the CPU back.
+ * @ONCORE_EXIT_YIELD_IDLE: The job has no work right now (guest HLT/WFI).
+ * @ONCORE_EXIT_ERROR: The job hit an unrecoverable error and must be dropped.
+ * @ONCORE_EXIT_STALL: The job hit something it cannot handle on-core and
+ *                     cannot make forward progress until the incoming kernel
+ *                     reclaims it.  Unlike %ONCORE_EXIT_QUANTUM_EXPIRED, an
+ *                     immediate re-run is guaranteed to hit the same wall, so
+ *                     the scheduler backs off instead of spinning.
+ */
+enum oncore_exit_reason {
+	ONCORE_EXIT_QUANTUM_EXPIRED = 0,
+	ONCORE_EXIT_ATTACH_SIGNALED,
+	ONCORE_EXIT_YIELD_IDLE,
+	ONCORE_EXIT_ERROR,
+	ONCORE_EXIT_STALL,
+};
+
+typedef enum oncore_exit_reason (*oncore_job_fn)(void *data,
+						 u64 deadline_ticks);
+
+#ifdef CONFIG_LIVEUPDATE_ONCORE
+int oncore_session_add_cpu(struct liveupdate_session *s, int cpu);
+void oncore_session_remove_cpu(struct liveupdate_session *s, int cpu);
+struct oncore_session_ser *oncore_session_get_ser(struct liveupdate_session *s);
+void oncore_session_restore(struct liveupdate_session *s,
+			    struct oncore_session_ser *ser);
+phys_addr_t oncore_session_get_pgd_pa(struct oncore_session *sess);
+struct oncore_job *oncore_session_submit_job(struct liveupdate_session *s,
+					     oncore_job_fn run_fn,
+					     void *data);
+int oncore_session_activate_job(struct liveupdate_session *s,
+				struct oncore_job *job);
+void oncore_job_set_data(struct oncore_job *job, void *data);
+int oncore_job_cpu(const struct oncore_job *job);
+struct oncore_session *oncore_job_session(const struct oncore_job *job);
+int oncore_session_cancel_job(struct liveupdate_session *s,
+			      struct oncore_job *job);
+int oncore_session_map_range(struct oncore_session *sess, phys_addr_t pa,
+			     unsigned long va, size_t size, pgprot_t prot);
+int oncore_session_map_buffer(struct oncore_session *sess, void *va,
+			      size_t size);
+#else
+static inline int oncore_session_add_cpu(struct liveupdate_session *s, int cpu) { return 0; }
+
+static inline void oncore_session_remove_cpu(struct liveupdate_session *s, int cpu) {}
+
+static inline struct oncore_session_ser *
+oncore_session_get_ser(struct liveupdate_session *s)
+{
+	return NULL;
+}
+
+static inline void oncore_session_restore(struct liveupdate_session *s,
+					  struct oncore_session_ser *ser) {}
+
+static inline phys_addr_t oncore_session_get_pgd_pa(struct oncore_session *sess) { return 0; }
+
+static inline struct oncore_job *oncore_session_submit_job(struct liveupdate_session *s,
+							   oncore_job_fn run_fn,
+							   void *data)
+{
+	return NULL;
+}
+
+static inline int oncore_session_activate_job(struct liveupdate_session *s,
+					      struct oncore_job *job)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void oncore_job_set_data(struct oncore_job *job, void *data) {}
+
+static inline int oncore_job_cpu(const struct oncore_job *job) { return -1; }
+
+static inline struct oncore_session *
+oncore_job_session(const struct oncore_job *job)
+{
+	return NULL;
+}
+
+static inline int oncore_session_cancel_job(struct liveupdate_session *s,
+					    struct oncore_job *job)
+{
+	return 0;
+}
+
+static inline int oncore_session_map_range(struct oncore_session *sess, phys_addr_t pa,
+					   unsigned long va, size_t size, pgprot_t prot)
+{
+	return 0;
+}
+
+static inline int oncore_session_map_buffer(struct oncore_session *sess, void *va,
+					    size_t size)
+{
+	return 0;
+}
+#endif /* CONFIG_LIVEUPDATE_ONCORE */
+
+#endif /* __LINUX_ONCORE_H */
diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index 52c5fd7a620b..0e1f72de2a48 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -136,4 +136,14 @@ config LIVEUPDATE_CPU
 
 	  If unsure, say N.
 
+config LIVEUPDATE_ONCORE
+	bool "On-core execution framework"
+	depends on LIVEUPDATE_CPU
+	default LIVEUPDATE_CPU
+	help
+	  Provide the on-core execution session and job scheduling framework
+	  for workloads running on preserved physical CPUs across a host
+	  live update (kexec handover). This allows subsystems such as KVM
+	  Caretaker to bind jobs to isolated physical cores during kexec.
+
 endmenu
-- 
2.55.0.1082.g2b9226bbc0-goog

