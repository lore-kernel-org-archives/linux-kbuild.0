Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA47472F8A
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933047; cv=none; b=bT+2VTVW9UmAfX8r7g3YElX10uDVwMSVBtk4+749qP4jqiHlRylcXBlbdMgEpDGStNhogq7G5Nq8DDcUmqGtkp5jKPc7YhUXeTZaamqvJJfz8oExqcVREy5kdSV0VAR7F6ccdp55MWhk7huuvFkqZQIaQxATDN42MYJfzAwyKeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933047; c=relaxed/simple;
	bh=tNdsG5SbEQaMh+AeZRyqzF7Pg2wKp2d/X/KDLhjUmzI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5/ttl3Rp7qQzothaitUv1DajVsmcfJ4v50p8yAOcyojitp1yTAOfub+fUIv90LL5M6EH9yw9AWFBCm0SEeoYUxkEjhiK/E4SH1Q315b2WNO5TrNdMNXw2D5429F8aIexKYhuMqkPSGsTXc21uEP2Upv737EawUY7pHQzK1GFIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=j+rHEc4A; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="j+rHEc4A"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895eaf306cfso17214967b3.1
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 12:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933045; x=1790537845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i5nAPiFxyuCO/MgJOwL1aiw4E3m2Ng0EpjBlpOl2sok=;
        b=j+rHEc4A845kUWAKEHXpfU0mapZtHJj5JkKQ0/8gLscv/LRIH4K2Y2VUSbGNSrdI9i
         AhYYIFCzxS8L6NqFAN7sqE/8mE6qrz9XuesCWfVqgOm/7IQXfJx23kDVLMRb3IJ7HsOB
         w0AwMWZiRusHDl0dZZuiKN2NTk/LqBhXgS69oa46vbatF6yIEl0cyjSV3R/yooFx1rvi
         qhsp8DxqBmhRPEulA/w95VfFnGxDj+vtnwuD7t0Epr28s30ZwxcQaT0+i9x4bL7rc+jH
         Ail+w9R1O72EWO/y6joYUSd1g4TlT4TaJDxOuqAZb/fMsKF58IpL2cIFtwavFsl4aQ7X
         /9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933045; x=1790537845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i5nAPiFxyuCO/MgJOwL1aiw4E3m2Ng0EpjBlpOl2sok=;
        b=E7gvwO0ACd776AvhunR4dyHfcbm4m5521JYoInBfy+mxGLON5wNKd49SjNK72ddXth
         tvW21xJc4q3dInfREs0mxjpgXpuHwXeixp8iai0E028C0h6edlhY8UocnGntr63c0n4S
         g4p/sBsRmpVd65TjsdbQXBDcdWlFmBuOQvjyG1Al/lHsGumouQnzGWMK2KlEzCs2URkc
         o04Hx4UDKMRiYy1stANhHfJwspNjzXTHEZJIUjQkog9kdOMGqfTOb7MedgZLhS4JuZ8o
         eAcRSBTzT22f+GvSzUu1IBwl4ZOsh8aG4QMP1jx/hZFDIpERuUBV9oShmGnnUQT6QCEL
         h1Lg==
X-Forwarded-Encrypted: i=1; AKwUvBwnZOGeVl0J1KVOv1o0h0QsW1HV7n3Xs9ZGDom1Qfa96WV+smVNDSELgU8O6obiqOptTW+tEFPc76Q4BO0=@vger.kernel.org
X-Gm-Message-State: AFuF++mI+SNqJpmHBPJEiibe1J1fHGQnY6yUhW3ZReRxkz2rlLy02mMy
	DunXp4mLY/SIkoBORp+drxFDZLQ+qztj0jhsME6zon1K0aVJoBYI/82o3eI7bvwYHes=
X-Gm-Gg: AYBFou1qUU9mKFOw+PQcKu/8wxRFHfuybvuZeQg7Bkdh9K52fzJf3dshvnoActH5ovJ
	4fT9p2w2xHaKwCoK8bYEPHhDQVdznx5S9aWq10EScqGIM9GyE8Z5ZijojZGMVPIjzwzr5GcXzim
	Nyuql/175rfckKjryuzCyUwI8SqXdKWL1HC01c/updLW4yk0f3GL6xNLSEs4TBRfVVc71KESxPE
	BrtbVXyS0eE8cwB+P+FDZOOqSqvMsCox1/k+7nUsII9eAW7GPzt+6nOyEack9VkA2YnkjEpGJCA
	LFeZiYl8dFcI6IlRApMDgmtyhDNKOjrUmy/ac6nDDtrlc1NAp3ml+CTbUIGFBoRZNmvtt8CrYJ2
	6Vd1yoeiNCEqN4wPIHDCqwhSA8OHrTIq1W6g3CYTwz1RIsJXDdJSAvaw7rTHANSsj230joc716x
	IyezWuARIEL4zV6q7SUsE1QOiPqLisn3pbFV3Xl6IDDBBis0PQSBbKeuzQUMwoybA4Ln/2lgFwx
	Lndj718ZkqmdI2hQSEBmZwZSweH4Ar1ve5/MB4tjegb9h5ZBl2SoHoKwDemu8wBYkYwxzjcZYGZ
	ZwtHluM83hImZWVs1ak=
X-Received: by 2002:a05:690c:e297:20b0:870:f53:4edd with SMTP id 00721157ae682-897305168b0mr18683667b3.7.1789933044691;
        Sun, 20 Sep 2026 12:37:24 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a48aab042sm18597427b3.47.2026.09.20.12.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:37:24 -0700 (PDT)
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
Subject: [RFC PATCH 05/46] arm64: mm: Add trans_pgd_map_range() support
Date: Sun, 20 Sep 2026 15:36:09 -0400
Message-ID: <20260920193650.3373435-6-pasha.tatashin@soleen.com>
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

Introduce trans_pgd_map_range() to allow mapping arbitrary physical
memory ranges into transitional page tables.

This helper allocates intermediate translation levels (P4D, PUD, PMD,
and PTE) on demand using the trans_pgd allocator, enabling precise
virtual-to-physical address mappings in transitional contexts such as
isolated execution environments.

Add comprehensive kernel documentation detailing the isolated page
table mappings: Caretaker text/rodata (ROX), writable data (RW),
stacks (RW), and preserved buffers without cloning the direct map.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/arm64/include/asm/trans_pgd.h |  4 ++
 arch/arm64/mm/trans_pgd.c          | 70 ++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/arch/arm64/include/asm/trans_pgd.h b/arch/arm64/include/asm/trans_pgd.h
index 033d400a4ea4..1e17ae145b0c 100644
--- a/arch/arm64/include/asm/trans_pgd.h
+++ b/arch/arm64/include/asm/trans_pgd.h
@@ -30,6 +30,10 @@ struct trans_pgd_info {
 int trans_pgd_create_copy(struct trans_pgd_info *info, pgd_t **trans_pgd,
 			  unsigned long start, unsigned long end);
 
+int trans_pgd_map_range(struct trans_pgd_info *info, pgd_t *trans_pgd,
+			phys_addr_t pa, unsigned long va, size_t size,
+			pgprot_t prot);
+
 int trans_pgd_idmap_page(struct trans_pgd_info *info, phys_addr_t *trans_ttbr0,
 			 unsigned long *t0sz, void *page);
 
diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index cca9706a875c..f0a55d4270cc 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -200,6 +200,76 @@ int trans_pgd_create_copy(struct trans_pgd_info *info, pgd_t **dst_pgdp,
 	return rc;
 }
 
+/**
+ * trans_pgd_map_range - Map a physical address range into a transition page table
+ * @info: Transition page table allocation info containing the page allocator
+ * @trans_pgd: Root transition page table pointer
+ * @pa: Physical address to map
+ * @va: Virtual address to map to
+ * @size: Size of the range to map in bytes (page-aligned)
+ * @prot: Page protection attributes (e.g. PAGE_KERNEL, PAGE_KERNEL_ROX)
+ *
+ * Populates the page table hierarchy (P4D, PUD, PMD, PTE) allocating new
+ * intermediate tables using info->trans_alloc_page() as needed. Used by
+ * liveupdate Caretaker to construct isolated page tables.
+ *
+ * Return: 0 on success, -ENOMEM on allocation failure.
+ */
+int trans_pgd_map_range(struct trans_pgd_info *info, pgd_t *trans_pgd,
+			phys_addr_t pa, unsigned long va, size_t size,
+			pgprot_t prot)
+{
+	unsigned long end = va + size;
+	unsigned long addr = va;
+
+	while (addr < end) {
+		pgd_t *pgdp = pgd_offset_pgd(trans_pgd, addr);
+		p4d_t *p4dp;
+		pud_t *pudp;
+		pmd_t *pmdp;
+		pte_t *ptep;
+
+		if (pgd_none(READ_ONCE(*pgdp))) {
+			p4dp = trans_alloc(info);
+			if (!p4dp)
+				return -ENOMEM;
+			pgd_populate(&init_mm, pgdp, p4dp);
+		}
+		p4dp = p4d_offset(pgdp, addr);
+
+		if (p4d_none(READ_ONCE(*p4dp))) {
+			pudp = trans_alloc(info);
+			if (!pudp)
+				return -ENOMEM;
+			p4d_populate(&init_mm, p4dp, pudp);
+		}
+		pudp = pud_offset(p4dp, addr);
+
+		if (pud_none(READ_ONCE(*pudp))) {
+			pmdp = trans_alloc(info);
+			if (!pmdp)
+				return -ENOMEM;
+			pud_populate(&init_mm, pudp, pmdp);
+		}
+		pmdp = pmd_offset(pudp, addr);
+
+		if (pmd_none(READ_ONCE(*pmdp))) {
+			ptep = trans_alloc(info);
+			if (!ptep)
+				return -ENOMEM;
+			pmd_populate_kernel(&init_mm, pmdp, ptep);
+		}
+		ptep = pte_offset_kernel(pmdp, addr);
+
+		set_pte(ptep, pfn_pte(PHYS_PFN(pa), prot));
+
+		addr += PAGE_SIZE;
+		pa += PAGE_SIZE;
+	}
+
+	return 0;
+}
+
 /*
  * The page we want to idmap may be outside the range covered by VA_BITS that
  * can be built using the kernel's p?d_populate() helpers. As a one off, for a
-- 
2.55.0.1082.g2b9226bbc0-goog

