Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42F2374A0C;
	Tue,  6 Oct 2026 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275104; cv=none; b=KntS79UgpYJ0ZsmtZDzR7rtYtW2SgNWDJ1yNyfVGo8gako4bNLJIZQ44AZIznSQie9MhvFVgM1DoME84Or2E9xZeIZwdRxrQ7PMJQ31c5Ps/feSFDTzAapljOeDXasjgrISkKeC1lH8FligcheFrHy9nzfG5sItS+fx/BFSqvdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275104; c=relaxed/simple;
	bh=uYflY0zTm4HHZEDfbPhb/Td3FHDbqL8HyVV2T8gizGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnXEnz8nCGIFa9HV0LGpiPhz58rsfqsU+x0TgiiiqWsu9tz+dloO1V+8dmzKP1tHkJIhlqz0AOjlUG4hhhB6a0KuEFWx6DGFi5NecEKQr3ugIKXLnLkIaXhCMiPAZEtniypE89YDGaBLQ3EEhCwyxANw/R3+te72615kpsRuSdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iWLhMMJX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iWLhMMJX"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966bOt62992197;
	Tue, 6 Oct 2026 08:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZWD/WR
	vhpCPJ/98ouav+E3pNAVjar6vP/Z7l6ZC3FV4=; b=iWLhMMJXV/+bPkyM6TWvfE
	Vj95aiePodXchzA3caduOGBVtZLfPxAZeQfbIe3+fWN4RHRoxbYyONRDQjAhWhd0
	gbkgLD8qlugs1raacWR8kLS8FxqdeA9FvQC1sPgZ1Jtsd2cy+GEmE10RxSEYQDFf
	J67ueUFo/jlzFN2S0iaHYj+mzxUGrPI3Hx/pg1Fjxmn0aH753iHsBs/T20eyMT3N
	Q7FWxO2Qr6T3XBSIbNzoPc1uDcycNPDORb+zP+IdcM117XVvPWvWTMdnEkL4DUn0
	jm1s8TqVosyFvWcqZmMJVtCXpcfstjBAOuXEcfE+7evZwrxv4i41KSjY2brYLUcA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h2s74pxr8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 08:24:56 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6966lYRR4106906;
	Tue, 6 Oct 2026 08:24:55 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h3c1ps9c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 08:24:55 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6968OtPQ26739440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Oct 2026 08:24:55 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0419658060;
	Tue,  6 Oct 2026 08:24:55 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B01858054;
	Tue,  6 Oct 2026 08:24:53 +0000 (GMT)
Received: from [9.224.94.162] (unknown [9.224.94.162])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Oct 2026 08:24:53 +0000 (GMT)
Message-ID: <a5937a0d-7951-46ff-87cc-aa47c9478169@linux.ibm.com>
Date: Tue, 6 Oct 2026 10:24:21 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] kbuild: GCOV cleanups following the prefer-atomic fix
To: Konstantin Khorenko <khorenko@virtuozzo.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Mikhail Zaslonko <zaslonko@linux.ibm.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261001-b4-prep-gcov-v1-0-794792e06f24@virtuozzo.com>
From: Peter Oberparleiter <oberpar@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20261001-b4-prep-gcov-v1-0-794792e06f24@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MBub8jOiPsl6_0RAkHolSTrdRE6GZlmT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfX7rHiK/Lp5EiA
 iaiQDxyjDURWe+kb/K2wk2zmdcszIhu7AblsRLCKqlHhlAO8bz9l/g/k/l3Xq5Me665EQfABut2
 XZmzKlWCaZOI2KIF2Bva6Njype8XF60=
X-Proofpoint-GUID: MBub8jOiPsl6_0RAkHolSTrdRE6GZlmT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfX6ahQB7e7W3Oz
 xTuKeLJxbMXT6qt/UqcArcy/7idWjw8LE0dvFhVNNAI18lDgIuycnumpFSRn+w1KyYoPZyQ4S0b
 pU5Hk9LLdvlOtMvLKrBMmTjS6v6LKEKSeaaagOTOnEIq+6UQ03kwYyQg5pfnsCE2qwha6lDVvIm
 sLVuqAzE1jAz2Ilc40/gYDymXYSQDmp14Ee2lQC0+R/LNPrHrMyLX+MLTg47L5QP/Oh9+h8QFm9
 Pq7KV04FYhntqJ1Y7sqa5qmkhPpZVT0rt8FPYqre6VSHJzyHC3ijvFSt4yj2KhliBGdO/XjGCXb
 rfqSPh00RnOjtVl833s29ZTmtO54cDX6cItO1txRT93saTfmsU4sH4GneYaetHAwES2y+zvYieK
 G503kmHvVXZnh1L9E6UQaYiM9RCWFgL407KpAn8XdJoN+vXlQfBi5nFPhvHCfJdvb+TxM17RfOc
 jC907F6Y+m1lAsTRGZQ==
X-Authority-Analysis: v=2.4 cv=fM2sTpae c=1 sm=1 tr=0 ts=6ac4b058 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=TYBLyS7eAAAA:8 a=7PMU586lhponhzwrbjQA:9 a=QEXdDO2ut3YA:10
 a=zvYvwCWiE4KgVXXeO06c:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060032

On 01.10.2026 18:57, Konstantin Khorenko wrote:
> Two cleanups Peter Oberparleiter suggested while reviewing
> commit 56cb9b7d96b2 ("gcov: use atomic counter updates to fix
> concurrent access crashes"):
> 
> https://lore.kernel.org/e1b6e768-51af-468b-a729-0ed3fceef2f1@linux.ibm.com
> 
> Patch 1 makes the prefer-atomic try-run test reuse $(CFLAGS_GCOV)
> instead of spelling the flags out again, so the test compiles with the
> exact GCOV flags, -fno-tree-loop-im included.
> 
> Patch 2 moves the CFLAGS_GCOV block into scripts/Makefile.gcov,
> included via include-$(CONFIG_GCOV_KERNEL) like the other
> instrumentation makefiles. The try-run also stops running on builds
> without GCOV.
> 
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

Looks great, thanks for following up on this!

For both patches:

Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>
Tested-by: Peter Oberparleiter <oberpar@linux.ibm.com>

-- 
Peter Oberparleiter
Linux on IBM Z Development - IBM Germany R&D
