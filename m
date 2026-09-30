Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C2632470F;
	Wed, 30 Sep 2026 06:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748773; cv=none; b=pMkboHcF7BZ8ozGz1lnNDRJcuBUPtIWew++rXpUn/Sgc5xtWkmkuBKaL4ZZZXSnHWFixyPROw9QYdLwFuK4Wpxvv8nHOgNOAdOTkOhzrYToG1vh5uSaKPyHq+G2OK8+3w5Tcwerj7xrzq5Crbdu4or2mf7MXwcS3JyOb3nq5LiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748773; c=relaxed/simple;
	bh=+If0nIlPyySrzlrFn+uHA22ZwWFmHcpE93kLW6r5e0U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i1n0zhcNlhIaxyuHFNQut130tZ1rYusYpx+S/0bJOd5XpGcvcJt3AGwu1vhn0Eoeo6Caz9qsdQNLZX4Wif5l0ykkydiamtMD762m1V1XxROwgp7xNEGOVgClI4m2Yd4cALriCDEjm/vypJZN+QEZ+flZYjBmfu3ZN0uRj8GgfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Xn51P/uB; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Xn51P/uB"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNZclF1351517;
	Wed, 30 Sep 2026 06:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+If0nI
	lPyySrzlrFn+uHA22ZwWFmHcpE93kLW6r5e0U=; b=Xn51P/uBGwAAfnTLePffNx
	RaP/BNsGopc30nnlw+W13rFO/TrOqROzDDOpWKI9r/Q/qa6oeRCtmOnmso+EjOGl
	YcKuFhBJX0ODkr1erqbmAhx/yNobBhMUARfsyvP4sMteoL83aBXm0b4ltNVq64vP
	5TRY/az3kCiWmtkHeWqki5zj5021NkxXqhsnsjNUqvIFqjQJ30qnBOLwBoHCA6QX
	QZ8/Ww8q+eFPi0zvKz8lHhK12YXCfCcNjZdoUgmabAW2LFR3LgChEM+dlEtOFDYR
	3bQYmWdld2ahcQAHZqpHRl3Fiu+vxHdUGVHceGkFDgRHKvJCbvYwhQOSjrBp8G4Q
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5ptaamm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 06:11:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68U4lbOw1288920;
	Wed, 30 Sep 2026 06:11:51 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0q4p9527-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 06:11:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68U6BkLg51118506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 06:11:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6437120043;
	Wed, 30 Sep 2026 06:11:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2295F20040;
	Wed, 30 Sep 2026 06:11:39 +0000 (GMT)
Received: from shivang.upadyay (unknown [9.39.21.68])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 06:11:38 +0000 (GMT)
Message-ID: <05e06ab0d9fc8810fc50e888e9e0f55b2ec9b77f.camel@linux.ibm.com>
Subject: Re: [PATCH v2 4/6] objtool/powerpc: Skip jump destination analysis
 and unnanotated intra-function call warnings for --ftr-fixup
From: Shivang Upadhyay <shivangu@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sv@linux.ibm.com,
        alexandre.chartre@oracle.com, alexghiti@rivosinc.com,
        aliceryhl@google.com, ardb@kernel.org, bp@alien8.de,
        chleroy@kernel.org, elver@google.com, ihor.solodrai@linux.dev,
        jpoimboe@kernel.org, kees@kernel.org, legion@kernel.org,
        lossin@kernel.org, maddy@linux.ibm.com, masahiroy@kernel.org,
        mpe@ellerman.id.au, nathan@kernel.org, npiggin@gmail.com,
        nsc@kernel.org, ojeda@kernel.org, pmladek@suse.com,
        rostedt@goodmis.org, tamird@kernel.org,
        thomas.weissschuh@linutronix.de, thuth@redhat.com,
        yuxuan.zuo@outlook.com, sourabhjain@linux.ibm.com
Date: Wed, 30 Sep 2026 11:43:10 +0530
In-Reply-To: <20260929142559.GC88198@noisy.programming.kicks-ass.net>
References: <20260929055138.43489-1-shivangu@linux.ibm.com>
	 <20260929055138.43489-5-shivangu@linux.ibm.com>
	 <20260929142559.GC88198@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 8Y8Wk_W9ddsIk4r6ICX7J2I9CkrSSf_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNCBTYWx0ZWRfX35r69EC1RbUH
 KcPORXwRofG6FyOvrxoYsw+PyQ6jQ0ZgU75df4QnWNHirKbOrxXcDZ3yL2ZrKDxjbStn/IlwEhW
 k7KEBvYIkcnB6zoQsDPPBjOOd1JPeXdmYxAakGUqg8YrPPJF/wQGwTRh8DuKbanIn9B3JJ2sVOK
 LRiPoqKy7zoD9Vgu4kol8duS2MXhjxixlgHWmOH/2GHFUSxyWxtVFhk8mZpM8x+/ijW6i2upXHl
 C9AAS4GOdu+R7k98VKTo1rpKVpJUhaLUdXN+2bT2yxbNhK7PNY1kVutQ/Lq59hD3wJGFFaaWlNm
 Gst8kRz33ewdX1XO2MK6apMK4tQoO44nSVpzDEi0DNbz8mCCXqZJmlj99Cej8/d0ddxqBNMK6sj
 A9APtDFIO+MOu7DqDzbDviiYRcXy4iMNqSCTSpbi3mfZmUjCfhOeE+EjEtK+VovcnzKBpnYzUqJ
 kCIvhVTwb0hNJ0RujWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNCBTYWx0ZWRfXyU9Ta9BASGki
 ZSD/8Aiq/WsLHg+qmcsEWZOXlTNR/IHAMqOI7HykdkI9EEGkXRypkU12PRTnyQCcKuAJC1rcrsE
 eazU90T6RY4Qmw5GSsd3dq8VA/DB7iU=
X-Authority-Analysis: v=2.4 cv=EY5d0/mC c=1 sm=1 tr=0 ts=6abca829 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=NnPss80ZZBoIzee3gBYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: IfwPR3SNelx7Qu7gVq5JNgj3luLw3KWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300024

T24gVHVlLCAyMDI2LTA5LTI5IGF0IDE2OjI1ICswMjAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToK
PiA+IGMwMDAwMDAwMDAwMmE2MTAgPHN5c3RlbV9yZXNldF9leGNlcHRpb24+Ogo+ID4gYzAwMDAw
MDAwMDAyYTYxMDrCoMKgwqDCoMKgwqAgMGUgMDEgNGMgM2PCoMKgwqDCoCBhZGRpc8KgwqAgcjIs
cjEyLDI3MAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGMwMDAwMDAwMDAwMmE2MTA6IFJfUFBDNjRfUkVMMTZfSEHCoMKgwqAKPiA+IC5UT0MuCj4g
PiBjMDAwMDAwMDAwMDJhNjE0OsKgwqDCoMKgwqDCoCBmMCA2YyA0MiAzOMKgwqDCoMKgIGFkZGnC
oMKgwqAgcjIscjIsMjc4ODgKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjMDAwMDAwMDAwMDJhNjE0OiBSX1BQQzY0X1JFTDE2X0xPwqDCoMKgCj4g
PiAuVE9DLisweDQKPiA+IGMwMDAwMDAwMDAwMmE2MTg6wqDCoMKgwqDCoMKgIGE2IDAyIDA4IDdj
wqDCoMKgwqAgbWZscsKgwqDCoCByMAo+ID4gCj4gPiBUaGlzIGlzIGhhcHBlbmluZyBiZWNhdXNl
IHdlIHNob3VsZCBiZSBsb29raW5nIGZvciBkZXN0aW5hdGlvbgo+ID4gc3ltYm9scyB0aGF0IGFy
ZSBhdCBhYnNvbHV0ZSBvZmZzZXRzIGluc3RlYWQgb2YgcmVsYXRpdmUgb2Zmc2V0cy4KPiAKPiBB
Z2FpbiwgY29uZnVzZWQuIFdlIHJ1biBvYmp0b29sIG9uIG9iamVjdHMsIHRoaXMgaXMgcHJlLWxp
bmtpbmcsCj4gdGhlcmUKPiBhcmUgbm8gYWJzb2x1dGUgb2Zmc2V0cy4KSGkgUGV0ZXIsCgpUaGlz
IGlzIHRoZSBzcGVjaWFsIHJlcXVpcmVtZW50IG9mIHBhdGNoaW5nIGp1bXAgYXNzZW1ibHkgaW5z
dHJ1Y3Rpb25zCnRoYXQgd2UgbmVlZCB0byBrbm93IHdoZXJlIHRoZSBqdW1wIGlzIHBlcmZvcm1l
ZCBmcm9tL3RvLiBBcyBwZXIgNS82Cm9ianRvb2wgaXMgcnVuIHBvc3QgbGluayBvbiB2bWxpbnV4
LiBJZiBoYW5kbGluZyBwb3N0LWxpbmsgaW5mb3JtYXRpb24KaXMgb3V0c2lkZSB0aGUgc2NvcGUg
b2Ygb2JqdG9vbCwgcGxlYXNlIGxldCBtZSBrbm93LgoKUmVnYXJkcywKflNoaXZhbmcuCg==

