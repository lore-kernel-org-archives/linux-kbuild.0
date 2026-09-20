Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B48477290
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933114; cv=none; b=qXP+Yv3ZZ0eDO//egZjlgo5qV3nKZV9e8OVk5xOICzrKrulRbAh4nTUZi00Z56cyP/9fhv8r5rYTM5SOF7ZdtL7Q+s+6AKXjCYBIG3DccuTyU/jeDg0Hkhn21I7QQPNQioOKcrirvGeughqbd7i6cpOJnrtgiXNn+I2BTmTrwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933114; c=relaxed/simple;
	bh=PcZIg6mUk+b75x/WMxTq7Jg9adSsEcLtx5KRB8LICEI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVZZisGQkjPNiWJcCZHeHfvbnReFtW4wogLZiMCZtO/8r/7GNWT5dxfGhn6DUEQl4TmmyQBfht4E+tK42nXZbd8RtdF0642WyTBpxr1+Gtv9Mol6WeTttjr8UNiaUDgOLsFWv5lwvCaIxkovSCU358S0tC3W3ytmjxKCctHr4sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=iuYsaamQ; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="iuYsaamQ"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-67109935888so2111808d50.3
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933110; x=1790537910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wVg6Gk8z5CmekkaH13r0qzA08Wiru8yJiEs8XX/Voco=;
        b=iuYsaamQFeh8sh2oM51c7GxGMn8WhLvAvEpn7BXxefRmmkKg01fUMgIfOz5t29Qf6L
         zhts+pjZaHMoDW6mWXlF88I56Z7A3xkIj6RAUw5Kj/o2KZ3vWPLeLITY96krBaF21p6t
         DGWoF4PUnhQTR1xdJ92rkoFp39+qgsd0/uTXZhw+2LNphzBe72gT3r7B4kXToN2VmUJs
         HBu8GBk+gQjk3PhKYx8+4L01/PRob8qFBNj1XeTQK/mx14oEk6zRmajq/0ca/ApZDbBs
         F09GiVcZFKUtwA4YVQ5Nk+GimT9T/HeYNigsNJAT3IbDjZbpLwD6/9Ov9ccRYb+AlMn+
         XlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933110; x=1790537910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wVg6Gk8z5CmekkaH13r0qzA08Wiru8yJiEs8XX/Voco=;
        b=AKr4K+vCQodSlhu2TB4dCdednIPVt9DMmdb7zG6/JMPVouY68gsWM5EqzvDDiuqELQ
         qUZPdx1QRsEJDUgoLKvVPURLOCqqwzTxqKwtBw+P7uyMeC7n+0SwLZB8esh54+MIZTEF
         AlLJoRbnjUYkiLT1KDCPfmYMXjf+f60yHF+U3sRPR7Squzrd1y+Ck5qU4+ctR9OvCjZD
         d9sv9AIfJvCqzQk/o456FfcHg/KTtV+XfqmYhccMzr2GcvjQTRFaNsgCzT6D3pNrgYX6
         j2OhK782auJiNG1Oo56RV/aQtdRl1dV1DX2VsSXvBP5XuDnkvSYnk4hjr66VeOxVohrR
         hr9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwf4cL/1idQ+9k+RVFU83raO2+80cT3+R8HIX4xfwLhLAivq5k8i18P+KOsu5ywdHIH7FRvuLp0lt2kLPo=@vger.kernel.org
X-Gm-Message-State: AFuF++lGOUvBo/K92N72jGdx2I8sIgOhuOy6uKQ/S5HhCe/djzxKUw/b
	RUGSrzZNQcoRrSlSEzdddU83GBTSfp02dkFcxyx1pImEXawMZqs2wmFBKnNxTwi06ok=
X-Gm-Gg: AYBFou26iRf1LsdILIXUcr3NVNmWMtjz6rHwk8wlMM/hohQRICUc7bNyTTzzX74lNLu
	YTZtGdZz7Xfve3rJESJ52zV0BImJJMTFKLrEynzH+CIVu7/ErfpY4UXTKx38Xf9vhBgSXEjW5d3
	SphhjiKRlldfUBgDzQJCvFrSZOxYp+7aIAxFWYSTVGpsPn+5gWTi4aVySQfNg+Cn1m3nZmP6i7d
	z3aJ0HDEFIZ5gYfUHjCN+s8WxPenXD8txwkhHNUXIkrca4w47GjG5wFcnMxDifVEIAbC4RJXPhs
	6w85TbE+ZJ++ufmuIiP+qK2K+NgX6iJ0SP+R9dKmFB/vry0QRhrKHtLeLAcvKCI0AQOxE7z6n5i
	GZSbtUhS9zXdU1GoJFoNhnrvOtFVAZv8gB1hzKyPJiIJaFR9ceDqbf19WK7xRar49V86aHiT+BR
	4BrCM/ZjiLWxVViWpnLTAO61ERzxsmz535bdejB3AYYvfHTDBS9Ho2ImW3otim+rlor9id4EbwN
	WTfEeICzh5QR31Qd1w9LRd3k+1rup7PtPfShsLA2xJ5d7OcWVvUIBvDEyRY5hIT7iMhDJgxeFI6
	3gNVq5Hyl4XuQz0VU0A=
X-Received: by 2002:a05:690e:144f:b0:671:70d2:527e with SMTP id 956f58d0204a3-6717fd6bc1bmr2723101d50.65.1789933110380;
        Sun, 20 Sep 2026 12:38:30 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67299104e3bsm2626871d50.15.2026.09.20.12.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:38:29 -0700 (PDT)
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
Subject: [RFC PATCH 16/46] liveupdate: cpu_preserve: Add sysfs interface
Date: Sun, 20 Sep 2026 15:36:20 -0400
Message-ID: <20260920193650.3373435-17-pasha.tatashin@soleen.com>
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

Expose /sys/devices/system/cpu/preserved (global cpumask of preserved
cores) and /sys/devices/system/cpu/cpuX/preserve (per-CPU preservation
attribute and file descriptor target for LUO sessions), and document
both attributes in Documentation/ABI/testing/sysfs-devices-system-cpu.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../ABI/testing/sysfs-devices-system-cpu      | 20 ++++++++
 kernel/liveupdate/cpu_preserve.c              | 49 +++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 82d10d556cc8..88ab03efd433 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -806,3 +806,23 @@ Date:		Nov 2022
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:
 		(RO) the list of CPUs that can be brought online.
+
+What:		/sys/devices/system/cpu/preserved
+Date:		March 2026
+Contact:	Pasha Tatashin <pasha.tatashin@soleen.com>
+Description:
+		(RO) cpumask list of physical CPUs currently isolated and
+		preserved across a host kernel live update. Note the naming
+		distinction from the per-CPU /sys/devices/system/cpu/cpuX/preserve
+		attribute.
+
+What:		/sys/devices/system/cpu/cpuX/preserve
+Date:		March 2026
+Contact:	Pasha Tatashin <pasha.tatashin@soleen.com>
+Description:
+		(RO) returns 1 if cpuX is currently preserved across a host
+		kernel live update, 0 otherwise. Although read-only, this sysfs
+		node exists to be opened and passed by file descriptor to a Live
+		Update Orchestrator (LUO) session via LIVEUPDATE_SESSION_PRESERVE_FD
+		to request preservation of cpuX across kexec.
+
diff --git a/kernel/liveupdate/cpu_preserve.c b/kernel/liveupdate/cpu_preserve.c
index c5fd3a07ccb5..cc27d1624d29 100644
--- a/kernel/liveupdate/cpu_preserve.c
+++ b/kernel/liveupdate/cpu_preserve.c
@@ -606,3 +606,52 @@ static int __init cpu_preserve_early_init(void)
 	return 0;
 }
 early_initcall(cpu_preserve_early_init);
+static ssize_t preserved_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%*pbl\n",
+			  cpumask_pr_args(cpu_get_preserved_mask()));
+}
+static DEVICE_ATTR_RO(preserved);
+
+static ssize_t preserve_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", cpu_is_preserved(dev->id));
+}
+static DEVICE_ATTR_RO(preserve);
+
+static int __init cpu_preserve_sysfs_init(void)
+{
+	struct device *dev_root = bus_get_dev_root(&cpu_subsys);
+	int cpu, ret;
+
+	if (dev_root) {
+		ret = sysfs_create_file(&dev_root->kobj, &dev_attr_preserved.attr);
+		put_device(dev_root);
+		if (ret)
+			pr_warn("Failed to create cpu preserved sysfs attribute: %d\n", ret);
+	}
+
+	for_each_possible_cpu(cpu) {
+		struct device *dev = get_cpu_device(cpu);
+
+		if (!dev && cpu_is_preserved(cpu)) {
+			set_cpu_present(cpu, true);
+			arch_register_cpu(cpu);
+			dev = get_cpu_device(cpu);
+		}
+
+		if (dev) {
+			ret = sysfs_create_file(&dev->kobj, &dev_attr_preserve.attr);
+			if (ret)
+				pr_warn("Failed to create cpu%d preserve sysfs attribute: %d\n",
+					cpu, ret);
+		}
+
+		if (cpu_is_preserved(cpu))
+			set_cpu_present(cpu, false);
+	}
+	return 0;
+}
+late_initcall(cpu_preserve_sysfs_init);
-- 
2.55.0.1082.g2b9226bbc0-goog

