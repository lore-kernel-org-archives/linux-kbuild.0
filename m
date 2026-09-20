Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2301947D929
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 19:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933153; cv=none; b=AcFKHlONI6giXgPwC1ij5MPdyXPzV7O+WCuyRhlndkLmlR9RyMvNtrsMSUd8ntn9gBAKoKbDeKmMJkm6eaZq/ItuOXkLUihcWEPmFE1PPi4e220dcUHhnuFRQKS/T+qlp76u6dDTYJKJrvlkLCblhHdVOF9Mb549zgYUHGF1Cec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933153; c=relaxed/simple;
	bh=Y1uk7z81ukhofe/vSmwFM2Y0N/XlaFoNJ7JURZkhshM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIwTALdqZJy0FOhegyMFNjfbw2JH502SB4hUbQoV+Mqy5wam5AC/xjL1oQyOMi/eYfFwhzlty695/Tl/uP0PUY19PbxqU8WRdpCbmAXPGqH1fY+Im9Tna9WoCC+O1L8BBx0Usx07CEbeU+yjfLmaeoyk78Hb5pX0K+yz+sTtC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aVOeOsCo; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aVOeOsCo"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895353e9051so18822067b3.0
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933150; x=1790537950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8DswF+PpHLQLFXIsTsYB07zyWStQD5M14yzCJNkAmPg=;
        b=aVOeOsCopIIqdi4yQt/etLZ4BcuH7f5M+OwW3kE3buEUPCunK71i6cYnubYSkU1G5N
         1wj/vTZ2Uqaz2UiIGKrWmFhuTuwnkMzgzneibPSjSmYP1d4AUVyFjYQ4Odw8oAn4R/aU
         ewv/DDlVxieiiQnelh8G67XpfMZ2VDHllPuchUr00o4RObsfInDy8fEtUy35ss3F+Eg4
         hu78SkHhWQWf7UU/1N7fsX3vd8cYvArSEYcLl9yIEGEQQzYGosTWYKZ/0EWjtCMncMNn
         QKEJIbP7YuY/ezChgBgghwUsWWpfHG3f/p8QYQhaEmPZyUjedjdphtnIxPwAS2C9iTxE
         zwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933150; x=1790537950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8DswF+PpHLQLFXIsTsYB07zyWStQD5M14yzCJNkAmPg=;
        b=qUuEWdxVNz3eZSAdxJvxzBkF/8gez/WmoBFqMIlejdbAictcJXnzkJRoOlu1q1ger1
         k9qJjqomCuvvT0RUEMaaVuyf9nP4EQTlEf725VBhvdoGWzIUTHIzLDlN2sfdrnY4tgq6
         NxH159TmN8GxS092mzdZwgMcBsWUGeFGlo+aq0Gi9hEO1UCz/vpkjvu8fqsM90Dpo9dg
         Sob/x9M6YCBqNFR6URKMtSXKaW0DpsZcZ5LC0ttqM2tlyvNqVq5xlslYrPZnADp8VFr6
         AxOqU7kRyryIbn5Cnjju3ILZi9tSFmaoc6voqqZ8Pz4lCF+h3mHIledg7u/tGNOOZyns
         l4/g==
X-Forwarded-Encrypted: i=1; AKwUvBxs8Q8LHuzUXEGkC28ubP2yyiO6d+6mQSKyrPSwu6jn0REQvWKUyTopLlRgNw+n52UFuf8W98yjXTHnkkI=@vger.kernel.org
X-Gm-Message-State: AFuF++k+yqy7ULWix4kpg4cTgkrba47blrUB+TS0Lz30IlHWeeL/b59x
	Wi70EB7EqIJN+EOMbvkyJPYL3vk31+I1kZLZeGgPWY+K+ghcAQ0oLCeq7mjalz9S6Yw=
X-Gm-Gg: AYBFou04wSrAwMAMNZk0icRmn25oc9nazQMHD9sfAB3JSe8SObc6WaXP29cp5oDgh5J
	jk5BgtbE6YJ8OM+uY3K8sk1cvdXYRmqyW+eSufUIMBdkrdCDoK+TpISllcLKh1z5DBA5z2jdKQ1
	vhzPzOx8PmrUR3hnRJ3b9GrFF4eOFoHt8+C1xykA6g748hYjDaogZLfGzKDvdch22HHj9a8ADbY
	kQNc9J4xaPkbdtH/vajRy+tMwkQ6Gufkm4F/bBCBaBWoQyKC8OxiwhFQKXVZcT9ilcgjSA+2RjX
	WlhDHBFbHvlXlnMyjlmKiI1vBQY2MVIhExgq3t0mvqrWVqMqSqvT4T1xf8yhSIg14hR/MCNibpj
	d29kngLBhUES9OnPJNz+Qi3he18pmfzjGWqA6DbT1DTS4xeplQJttD+l4TWAOM0p25wgtJP2fFT
	tmFJK7Epb05VvfBXhGe3mlrI5eHY8tqh/6PNCG4BhT5LLzgDAuDbVmSsotMxVDns4sUyTXyuqza
	VgxNE0FF0FJFLPsRxbvf5KSOf306XUkxOggqLEVoVVf/yv/8CiBzrqCwPyEW1r1iSBCPtIkEvJj
	nZirikpkSP4Jf2fcaXk=
X-Received: by 2002:a05:690c:39d:b0:89b:6b8c:8edf with SMTP id 00721157ae682-89b6b8c9360mr12390877b3.50.1789933150155;
        Sun, 20 Sep 2026 12:39:10 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a41521471sm19169577b3.6.2026.09.20.12.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:39:09 -0700 (PDT)
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
Subject: [RFC PATCH 23/46] Documentation: liveupdate: Add physical CPU preservation documentation
Date: Sun, 20 Sep 2026 15:36:27 -0400
Message-ID: <20260920193650.3373435-24-pasha.tatashin@soleen.com>
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

Add documentation for physical CPU preservation subsystem, workload
attachment API, architecture backend hooks, and KHO serialization ABI.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/liveupdate/cpu_preservation.rst | 34 +++++++++++++++++++
 Documentation/liveupdate/index.rst            | 11 ++++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/liveupdate/cpu_preservation.rst
 create mode 100644 Documentation/liveupdate/index.rst

diff --git a/Documentation/liveupdate/cpu_preservation.rst b/Documentation/liveupdate/cpu_preservation.rst
new file mode 100644
index 000000000000..a7a534188685
--- /dev/null
+++ b/Documentation/liveupdate/cpu_preservation.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+=========================
+Physical CPU Preservation
+=========================
+
+.. kernel-doc:: kernel/liveupdate/cpu_preserve.c
+   :doc: Preserved CPU Subsystem
+
+CPU Preservation Workload API
+=============================
+
+.. kernel-doc:: kernel/liveupdate/cpu_preserve.c
+   :export:
+
+Architecture Backend Interface
+==============================
+
+.. kernel-doc:: include/linux/cpu_preserve.h
+
+CPU Preservation ABI
+====================
+
+.. kernel-doc:: include/linux/kho/abi/cpu.h
+   :doc: CPU Preservation Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/cpu.h
+
+See Also
+========
+
+- :doc:`/core-api/liveupdate`
+- :doc:`/liveupdate/vmm`
+- :doc:`/mm/memfd_preservation`
diff --git a/Documentation/liveupdate/index.rst b/Documentation/liveupdate/index.rst
new file mode 100644
index 000000000000..415ac748c9f7
--- /dev/null
+++ b/Documentation/liveupdate/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========
+Live Update
+===========
+
+.. toctree::
+   :maxdepth: 1
+
+   vmm
+   cpu_preservation
-- 
2.55.0.1082.g2b9226bbc0-goog

