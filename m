Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0423DDB15
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 19:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933030; cv=none; b=sdfFM6HN5ugpgyKPCoGZ3xiRHH1J0izZx3UbHMtrN7OQhJtDwt6gjLj8FMacl4YDOOVpPvWENzMNUmtjyobuKqW9pgMOi6ILx+ayvGpnfPR/Je7h62wY5rtpUAmXTyu3k623SfIcLylMgJdFYjtjRWAFKisx5dHAls/UlAi2lAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933030; c=relaxed/simple;
	bh=wQ3ou0OMG8Kvrev6k20Um/PDy/0+0e9DtH56kTKSrbo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKJE8KK6IZp6gTi07jnKms5WiTwNOuQtZArUfIC5KuYMcN8xShIs/YUg2NftYh8W+z3E/6W0iu5q91BTsZqusgNZBjZ6i4e3hU/1C5ZskpCId5WF42sud0BFcIJ3AOLxFdcYJdJTwi8ubZkXSper1kW8ZpEPRaJa/LfOF2adGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=QAtDUqnm; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="QAtDUqnm"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d4ddd179eso17249527b3.3
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 12:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933027; x=1790537827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wVwJQFyVies0sN36ZwALD03xlxJgg7HjR5Oz9PMtlp0=;
        b=QAtDUqnm1pdUpy0LvuTn7ixIxtXtoZSUO9RJdHF/Wu2wm+XYY+PwunsSpuz2RFWMlk
         ZWA1l46JZBsV2Hy4a+iYd+Mb1yFmwOjYR5dMmzjDk0QjH+eoMYL4ZSpAOXjoYqKCnKTo
         oHB+hpxwVtBu4J3oXU7JLd9Rw8Xl9x7TW9+fEyHCfBCiXLQrOAAXWposAEJF5fdE3sXS
         GmkNx/yp1GJefQbF1vBDrNCd8IE/+L47FkiRL1nYjWE71OErHUbpet8Bs1OBuTTxdzHn
         1o1HiShtVlApI9bUFovfd5GKK1oLBpw3h8AD07SY9q2VFzUJYOf4Sp5e+p3RFBBko2L4
         zSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933027; x=1790537827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wVwJQFyVies0sN36ZwALD03xlxJgg7HjR5Oz9PMtlp0=;
        b=s0/tqDR5/0JkRms80tfwpLfVN5nz+wxOHruzuqXdyENXlsTE+XEAjSwtlA19BbNjvi
         3Puq7nGQNW6md1mKcds7rlM79YHJQSfOCltxHi9U4Q6H5WAK4O644Babw9dUYMQJov7W
         fQwDr6QLXRJlRPBpYFzkeaOxYk6P+n/p7mpDfVrGkBcd7uO8ZHcgAXEZNLkBPrM8xws7
         o3bGIIKW0w/N3Ci0BIBXSa8mNf6tiu1YW6wts7XPGPznkfADRADfGOMJaQgm8j3Hdy6l
         bWtjwkxgeEI3LJzIU7NwyQv82hHbd0cLZ0nQI8u97wqL54ZZqPKXtw9EzKzaaPh5ovfn
         CK1A==
X-Forwarded-Encrypted: i=1; AKwUvBxWJZuVxc0qztPBMgT8l1io6JCKayMdVp+uwsm2Ifaw4AyZu+TLrjubnXv7A7mDYwkLUS0Ce/6vSJJljSM=@vger.kernel.org
X-Gm-Message-State: AFuF++ly0zRKA2CXPIG9HmpJo0VSiiFdeyjDS2WMFpxlgAcaW/IVYdMW
	UNnMsNH9c0WKQHpW2pDzTy+s+D/XR4+g2kY2Lie6nqGtyGuBhpTiQVvVnnl+NFL377g=
X-Gm-Gg: AYBFou0HJkPeFnKEAM5z4hh4A+/u7Us6ENbbCeTPwphKswEwHoidaEuyPLqZMCHedNK
	ZEO8uDGdmC1cY8QDAaf5CZ7yA4lFtIzzH9ZnSfslDXkBjcKAoJXC8rBsyqsb7hPjPXQOcIEo4Yg
	SOr23Y/aeDecbiMlh0ni44hxVdF7PXXjmO+Xh8f7Cl6w4GMtbrZ3lhZgzUAKRIDFePtnpldPESC
	CKVjtsW61FvcU0QTJirp8ilBQI1bUDFpjDjBhOiDjsmEPsr1D8dBRSV6dnUPPpJ3qnnKHcHT/OL
	CjKloMEzXyPT9JNDjoXHJEfD/40mNJM7AUXTx/dXF4FhXKfeyOlGCbfYSJw+D5WsbS0NtiOE5OT
	t1AnXEQA5rfBS2kFakIZwoJOcR1A6Ym2VOD1yTA1w4G57lswEjawPkffhyIubEdc+bxynsg0jhj
	2h9A4c9NvD4FreguvZ8wymB3OgKa1PpQQ0STaawyRIYTcq7rTW5vCAgxk/FLd9OA2/vIIsn9UyV
	rCgd6bxG1Lv9D7i7t+LeYpzISdO2MHLCXDQM+qQGF/w9hCI/u1kabJKbGvzm4GezfkJhMo/g1fI
	4Za1WXYDj045mxoGHD4=
X-Received: by 2002:a05:690c:89:b0:89a:63da:cbe1 with SMTP id 00721157ae682-89a63dacc8fmr20430637b3.39.1789933027324;
        Sun, 20 Sep 2026 12:37:07 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a47139db2sm18450487b3.26.2026.09.20.12.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:37:06 -0700 (PDT)
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
Subject: [RFC PATCH 02/46] KVM: arm64: Split demux_c15_{get,set}_val from userspace accessors
Date: Sun, 20 Sep 2026 15:36:06 -0400
Message-ID: <20260920193650.3373435-3-pasha.tatashin@soleen.com>
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

Factor demux_c15_get_val() and demux_c15_set_val() out of demux_c15_get()
and demux_c15_set() so kernel callers can read and write demultiplexed
coprocessor registers without going through userspace pointers.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/arm64/kvm/sys_regs.c | 48 +++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d..b873ccf1ab14 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5496,10 +5496,9 @@ id_to_sys_reg_desc(struct kvm_vcpu *vcpu, u64 id,
 	return r;
 }
 
-static int demux_c15_get(struct kvm_vcpu *vcpu, u64 id, void __user *uaddr)
+static int demux_c15_get_val(struct kvm_vcpu *vcpu, u64 id, u32 *val)
 {
-	u32 val;
-	u32 __user *uval = uaddr;
+	u32 idx;
 
 	/* Fail if we have unknown bits set. */
 	if (id & ~(KVM_REG_ARCH_MASK|KVM_REG_SIZE_MASK|KVM_REG_ARM_COPROC_MASK
@@ -5510,21 +5509,34 @@ static int demux_c15_get(struct kvm_vcpu *vcpu, u64 id, void __user *uaddr)
 	case KVM_REG_ARM_DEMUX_ID_CCSIDR:
 		if (KVM_REG_SIZE(id) != 4)
 			return -ENOENT;
-		val = (id & KVM_REG_ARM_DEMUX_VAL_MASK)
+		idx = (id & KVM_REG_ARM_DEMUX_VAL_MASK)
 			>> KVM_REG_ARM_DEMUX_VAL_SHIFT;
-		if (val >= CSSELR_MAX)
+		if (idx >= CSSELR_MAX)
 			return -ENOENT;
 
-		return put_user(get_ccsidr(vcpu, val), uval);
+		*val = get_ccsidr(vcpu, idx);
+		return 0;
 	default:
 		return -ENOENT;
 	}
 }
 
-static int demux_c15_set(struct kvm_vcpu *vcpu, u64 id, void __user *uaddr)
+static int demux_c15_get(struct kvm_vcpu *vcpu, u64 id, void __user *uaddr)
 {
-	u32 val, newval;
 	u32 __user *uval = uaddr;
+	u32 val;
+	int ret;
+
+	ret = demux_c15_get_val(vcpu, id, &val);
+	if (!ret)
+		ret = put_user(val, uval);
+
+	return ret;
+}
+
+static int demux_c15_set_val(struct kvm_vcpu *vcpu, u64 id, u32 newval)
+{
+	u32 idx;
 
 	/* Fail if we have unknown bits set. */
 	if (id & ~(KVM_REG_ARCH_MASK|KVM_REG_SIZE_MASK|KVM_REG_ARM_COPROC_MASK
@@ -5535,20 +5547,28 @@ static int demux_c15_set(struct kvm_vcpu *vcpu, u64 id, void __user *uaddr)
 	case KVM_REG_ARM_DEMUX_ID_CCSIDR:
 		if (KVM_REG_SIZE(id) != 4)
 			return -ENOENT;
-		val = (id & KVM_REG_ARM_DEMUX_VAL_MASK)
+		idx = (id & KVM_REG_ARM_DEMUX_VAL_MASK)
 			>> KVM_REG_ARM_DEMUX_VAL_SHIFT;
-		if (val >= CSSELR_MAX)
+		if (idx >= CSSELR_MAX)
 			return -ENOENT;
 
-		if (get_user(newval, uval))
-			return -EFAULT;
-
-		return set_ccsidr(vcpu, val, newval);
+		return set_ccsidr(vcpu, idx, newval);
 	default:
 		return -ENOENT;
 	}
 }
 
+static int demux_c15_set(struct kvm_vcpu *vcpu, u64 id, void __user *uaddr)
+{
+	u32 __user *uval = uaddr;
+	u32 newval;
+
+	if (get_user(newval, uval))
+		return -EFAULT;
+
+	return demux_c15_set_val(vcpu, id, newval);
+}
+
 static u64 kvm_one_reg_to_id(const struct kvm_one_reg *reg)
 {
 	switch(reg->id) {
-- 
2.55.0.1082.g2b9226bbc0-goog

