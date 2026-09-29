Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83C03EAC76;
	Tue, 29 Sep 2026 05:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661179; cv=none; b=mcY3UYJn8/xjEANmG3qYxtk/099z5LsO8+3+vF1x41886Hd8GaDf5Sr+luzFI2WoWNuo/ibzqJBK2zd0CzUe0iq+SVdX1NM7g/hHhKmXR+w67kgo4eydfNU609DJ7sz7XD7RAM+VvsIpm1enNUXhlSf2vFzwab6ITy2K4ZAuelQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661179; c=relaxed/simple;
	bh=+hUByYwZKBuaXw7X2C4RmugA2WHcHyxP7hLRF+d0Sqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2umgxzzuVgG9UUxDVJ1l3PP4V6faWueTSw8myjsTLgaxWAfUEmNE9M98X2X0T4NAKBfxvnQw3Y9fCgQSTuqGQTq/bPMDgkwM0BrNq8JI8VcfcSS5nek7cSWXh+rfhMDjTPiyVkI6fcuaXfujeN7xWft7gV9XJb+T3yIrMvVeoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bNE+d3xk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bNE+d3xk"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T46IfB1805821;
	Tue, 29 Sep 2026 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=pb+JIngK/UfN+6yyS
	jQKbZohW5iQ53xpqMpcNUHm6Fs=; b=bNE+d3xkYLfz8tVTjcnzLt0svZWqzdSsp
	j55yBEkZKEdgW/mDbqwINLJV6eMhKvL3wag5/XAVmNwGlRVUtu1hqmhjI7g33283
	OqbbG84vFymfMn/CV4duWj8d/h9uBnDROmFqMXxiN+7Mk7OMyb7PPEPtvrIkiXqo
	tJhdI1ou3dfVXVx/1IPEQZdaI0o1W6gtg38P5gy6ZjQivxCY0DdoRJ7z4sUMzz83
	uDH0ek4mqJ+cTnVNLMmlunjBuBzGvnLhH1hxhq9vCl8HjnO+HK8z/60LUj+FuYwy
	rfnoGTrkMyWMwR6brInwFFLsHy+Iwtytrc1uIxlZ6xBdl2jMXaRoQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx4fe4ufy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 05:52:09 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68T4HWjV1134115;
	Tue, 29 Sep 2026 05:52:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxsck8d7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 05:52:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68T5q3Fm32309784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Sep 2026 05:52:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 710A62004B;
	Tue, 29 Sep 2026 05:52:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1F8620040;
	Tue, 29 Sep 2026 05:51:56 +0000 (GMT)
Received: from shivang.bl1-in.ibm.com (unknown [9.123.12.247])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Sep 2026 05:51:56 +0000 (GMT)
From: Shivang Upadhyay <shivangu@linux.ibm.com>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: sv@linux.ibm.com, alexandre.chartre@oracle.com, alexghiti@rivosinc.com,
        aliceryhl@google.com, ardb@kernel.org, bp@alien8.de,
        chleroy@kernel.org, elver@google.com, ihor.solodrai@linux.dev,
        jpoimboe@kernel.org, kees@kernel.org, legion@kernel.org,
        lossin@kernel.org, maddy@linux.ibm.com, masahiroy@kernel.org,
        mpe@ellerman.id.au, nathan@kernel.org, npiggin@gmail.com,
        nsc@kernel.org, ojeda@kernel.org, peterz@infradead.org,
        pmladek@suse.com, rostedt@goodmis.org, tamird@kernel.org,
        thomas.weissschuh@linutronix.de, thuth@redhat.com,
        yuxuan.zuo@outlook.com, sourabhjain@linux.ibm.com,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH v2 2/6] objtool: Set ELF_F_LAYOUT flag to preserve vmlinux segment layout
Date: Tue, 29 Sep 2026 11:21:33 +0530
Message-ID: <20260929055138.43489-3-shivangu@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929055138.43489-1-shivangu@linux.ibm.com>
References: <20260929055138.43489-1-shivangu@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=FYWiV5+6 c=1 sm=1 tr=0 ts=6abb520a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=_XHLp9VMqrTiD8beNOsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMiBTYWx0ZWRfXzj/dnwyJwd8O
 orUZ37g/1KQWPju9hRSuq3Pn1PjJSjooN9mKwNd+qpZYnaXSA+6Aa6AqkwdNBTKkCL0g3PdG4Py
 V3221cF3FUV6FbFvd9GVQyeIYKblyJw=
X-Proofpoint-ORIG-GUID: k7cNExsg6quj8Yt90jSOdYvE_k1acAxU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMiBTYWx0ZWRfX42tXKugD3i1l
 KteQ3Ao/f3aZyTnsCakZk+ln7z1v3802GEhU46aRHfz0usFMH50KXtaYeAbYarz5Uhl5L4VAYwZ
 q2A+QBejiO7gSR+909BQfO0wPw6qSX6CrYOhMqs/1joL6Obm7oLatSM+gcl6lGUVz5L9htpNhVj
 tJ2EBGg0iXWT29OLwDGa3nAV1ZjjNB+ocK6drEGWgy9QLrfzzr05+IZgtqnPrQZZ4mc5Wu1TmdA
 P+pjFpDOUiUazOKvcFO/hF6gyg2X4MlREIDKgX9zaG7/6awWMOr6IubT6/7zYLv6vJdeo0tSOC1
 jieD8RXyR8dQ1z1nuyaxDHoeV1mmejqi6AVdjMbRzNKUtOzGv/WxBYAodry2xMDPmzOpG7b1NTE
 P3RC93c5VWde/V3Z+AHjB2Xo0Y/b6xQtfDGruSRTq4YmyS50PUZMuQBHD4VP+E2iN3YO+h7w7om
 8v/AWhR+HBiK2oUwbvA==
X-Proofpoint-GUID: IuDIni1ttau7NYiGuqTWJT4xqml9HAgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290022

From: Sathvika Vasireddy <sv@linux.ibm.com>

When objtool writes changes back to vmlinux with --ftr-fixup --link,
libelf recalculates the file layout and inserts padding between
sections. This corrupts the ELF segment structure, causing kexec to
fail with:

    ELF Note corrupted !
    Cannot determine the file type of vmlinux

This happens because libelf's default behavior assumes it can freely
rearrange section offsets when writing, which breaks the carefully
constructed vmlinux layout produced by the linker.

Set ELF_F_LAYOUT after elf_begin() to instruct libelf that the
application is responsible for the file layout. This prevents libelf
from inserting padding or repositioning sections while still allowing
data modifications to be written back.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
Signed-off-by: Shivang Upadhyay <shivangu@linux.ibm.com>
---
 tools/objtool/elf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index a791f4ea6ec1..55c20a993f5d 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1239,6 +1239,9 @@ struct elf *elf_open_read(const char *name, int flags)
 		goto err;
 	}
 
+	if (opts.ftr_fixup)
+		elf_flagelf(elf->elf, ELF_C_SET, ELF_F_LAYOUT);
+
 	if (!gelf_getehdr(elf->elf, &elf->ehdr)) {
 		ERROR_ELF("gelf_getehdr");
 		goto err;
-- 
2.54.0

