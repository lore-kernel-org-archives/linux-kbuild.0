Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394117;
	b=yceKBkDaUikV4vTS7NF11lMSRN/esd35lQZpmVYimW/33Jk71qd+BlbrpVXQLrOybaee
	 QfD9vBwUbr4ZkuQqRI/XChsKhEM/Gs2tHQ8d7+cqIT7+yVE7b9gB8Ip+LEvFxeW/EGqLo
	 +WKvqfueF7CJoy8n2H2sHJbw1iOL5Mf47I1xHp5RF/CvduGSPpzeXl08iEaYNaiTpDQiR
	 suoonXu19BK+mnkg3EKdMAAA72fMjKySFzFk2HNTI0uGXYXMhQoIbilagPBd7zJJl5TWn
	 KQsbyqRf4Ewl1x27QM1oJtlB/vfuyxD2/WAjuhoxztPQxpQKdRw1UrYTOjfpO+NOg0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:Date:Subject:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:CC:
	 X-Mailer:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ay6VvN0gBxo6IhFeyr2zqh013d58SiWmnisacS1KluU=;
	b=igdGnmyIB1i5vMYbzIcoPW6skRz7hNdXz1Zp6vFNNPLlcbNMUXsROP9Ki9uXmNoTjNBd
	 NW+raBOWdk179uQaChAzGBn+PzELZbs9wxAj1lfn4pagk4HgO2J615QFzwfa5aajemwH4
	 eUJeKBfRHeRR9BsJWSM9yeV5pd5fHfiZ5uRLTZkw/Bgw7n+N6szq7/aZinUOtGWpENiKP
	 J30pU4DxpeSDIpf8KFETgoIZs4kpRxQHc7f5bFFT0FCqgG7+uohy74fQQEIlSW4V5OU3t
	 pglDNwAcFBzH0XL8dzq8TYFndYmwA1WRCzx1N9ZSjIQxdk/TzZ3XM+b05l4xTo+iv0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=UJpPpKVd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8800560A5BEA;
	Fri, 30 Oct 2026 21:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8800560A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=UJpPpKVd
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UK56h51079012;
	Fri, 30 Oct 2026 21:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Ay
	6VvN0gBxo6IhFeyr2zqh013d58SiWmnisacS1KluU=; b=UJpPpKVdl82+0MdAEa
	X3piFkapp36vt9GsJ72q+lXEB4Y1Yz/ZZt0ALdJAz6QUuZFk5B0InJB1YjEDC2Lw
	gLC+1ZI3cUOCj3oMljO3C9KhxM4QTVvSoSUXch1KILan9HXQOJyoLHgk8laRJdYR
	kN1drvFTYFSbrelGQIAdywS93eODl3BBPxtApZHhAY8c8Cux3CFk9dvj7GzLh1vG
	OdW+PbkNwozM57kixrmf+uyMTXdQR0KtjUiRK0F7oZvwH+f127kjQ0NRxQULrkve
	9MSUt9vSyQKOTzdKQczFT+Vm2/Y7/HmT+Ep4qWFQnrvAIjRuwQrjpbcTod8G7ofc
	WtMg==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmvmy4y5a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:26 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id A56E81479D;
	Fri, 30 Oct 2026 21:01:25 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:01:24 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:01:24 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:01:24 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB66y1hUoJLvLjqx/ToLCjUaKrySwewsUZgXUlXZUKYSdRgQSNDI2aw+8YR/o8v0/Q12ebDpyole+nY5R1C9U6Ry/Ck2wtwH0E/J1CBQ6lbgi9SHSbm7RHGWHqvNTHh+giqb6VjKTTYsB31+go9Ae+OKiEVS5rDa58nyTStlQXM3gbMjdmc+FVG0znqKcQWBXTjv6EzfUji9/zzWc2GV0WzhOlUv8848gjaaJD2OCTbP9WIvGyvWWRoKC4giCSnCbyFKz7pdAlY9mpsur2QMiav9TmBuKNWSl9TsdO9pCo5o5/FTOK/WYXnpA6xp5xNJwUQG1GKC07RtYTo4/Bogig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ay6VvN0gBxo6IhFeyr2zqh013d58SiWmnisacS1KluU=;
 b=Te2k8f7ihS17+dOw91UCbKUB6Y6DjZVPX0uzbGactaowHM0kt53qpw9ksFVYGLhcEpxlH+KjrxnW6beme/FhXog8S/S+405rNe5XDw/O/9yrkZVff9FRQx+VloESBArPJcLfhzpE5mNrPUp6zv6HMH9V0o2GfLTu1MxjdnazDeihYN1J7epwhXIQifVNLwSi3w1GeVv66PVwU2nlUFqaak81SC7gkQtFhi1lGaBY97oWw88Bi1B4g7LXW+rfyo2Xcl/ZuMM1L9tSrVNf7NmggvKpCREoD+v0iZDvwNZniwNcwiTp2/8gRhl7/B+WI84Bu2pR7dW3dPZNe6UXBORkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:01:15 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:01:15 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:17 -0700
Subject: [PATCH 21/23] net: hpe: ss1: add resource groups, QoS and services
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-cxi-netdev-submission-v1-21-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
To: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
        "Nathan
 Chancellor" <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Sumit
 Semwal" <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>, Doug Ledford <doug.ledford@hpe.com>,
        "Sandeep
 Bhoot" <sandeep.bhoot@hpe.com>,
        Mamila Santosh <santosh-kumar.mamila@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SA0PR12CA0024.namprd12.prod.outlook.com
 (2603:10b6:806:6f::29) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 (2603:10b6:8:225::20)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|IA4PR84MB951192:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5e9c0d-3010-4e48-ef0e-08df36c8edf3
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|10063799003|6133799003|18002099003|22082099003|3023799007|921020|56012099006|5023799004|261021121427099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261026140227099003|261021133027099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223327099003|261009223027099003|261009220027099003|261009221727099003|261009221227099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: 6hSKL225dTyErRcOJeSrvTR8api8CEttz4YP/qkVStdEgoqgQZloGqGYoJFvKmDArT6Ina2e7S0FHRVkFwC5Nop3nlNOOCgDznrZ4wpay08+64ndBsw4M1i0G3hB4s5wGU2AQpNrVPe9abLO5CflWMJnsMrj/bZFsxfWQ6tSP4jd9EmfmoCqysAWEbT//P4AFxkkq16KB60DhlMZ1FB3PIlFsKRn93Nwsdt23hLI5thbveSX32x35KpelhExAbuNynd6/72pggi5JInQSyc+xzQBS+2ZIiVLqUxTW6rInIzhGR7gGtqqGT1OnPLwhex7l99fioDycpC+c0Su0AZWGJY1HRKMnXkOCvnqB+e10G38lHmB00aWEfotjrK5pA1wiumY/wh53peHhRo09xjhq5mNrK6nPn5ZeO6BmYFEICw1noPZhqHeRvsIrbTkuwM1C7Bf+1Jid2jjZg4ve5W2JsXzGNhE+FilxRWxj+mWBmYUojIv1JsUWmYd5K9+yrH6WX+X2IDazInYKKRjNLqpUCe7/8gOrHWF17Unz9yAoB8w5m327HlAqXQFok0MiqKkvWkZp7zYJIW9RHJ1Ms4vNfHH+yuWh9b0DoLeKeFPn9UwriYfUr2gwHZI4KAKPOeKi+Kcmobn7xgCxK0KKQMPEt4GlUTTMD483dt39n1O8XW9P8rFaf9ZMacs3auZny7QkIWKVfmkPAMkjsLHsqfHOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(10063799003)(6133799003)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004)(261021121427099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261026140227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223327099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009221227099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEdoakgzRjFLRERZMlh0cTZsdkpLQWY1SWJPNE9iMWx6RWpHdWoyRmh0MVpq?=
 =?utf-8?B?MllvNzQ5NEtkWEJwajBUUU4rbS9XRzNVQTRlVlBFOVZRR003aW4xNzFZSkJn?=
 =?utf-8?B?UTQrRnk0YktEVlFyMUU0NERON0dUdmFtNVRQeHBFbXNEbmtNK1NoRmh4RFlY?=
 =?utf-8?B?UVdZK01teENnS2JqSTgvdDhSVDNyTjNmcktSNkxmdGZOTmR6ZnZkOTBzVXVI?=
 =?utf-8?B?clErV0pQV2w3ZEpxaUJ5TU9TRnlyRHpyRGN4N1d2ZHdaa3ZOSDJXNGxHVVl6?=
 =?utf-8?B?T3JkQmJwOTNYY2dqUGExbWtHcmNsem16TlBVVFJCWEtCZUk1T1pOL3RUSmFZ?=
 =?utf-8?B?aVRvMlJrcDFGbFhVcFU2MlNFUWt4cTFFRnE0MFRNNEFoYTNxbGIrV3NvcVcr?=
 =?utf-8?B?V3ZlK0FQay9RY1FyYVBwV1Rld3VDcjMvQU15YXNFUk51MTZIWjlKcEV1blhO?=
 =?utf-8?B?S3dlWkVpWTFSNGhoZzh3K3FFdko3c3pFQWZFd1lPZEczVjl0R2plL2tnUzNq?=
 =?utf-8?B?N200Uk5VZU5NU3VvTmtLaXk2TStjeFA0MjlueG5sNno4bEhPUk5JQTV2RWYr?=
 =?utf-8?B?dVR5eUE3QnVCVlZRYzZTUnFacm1HcEN1dy94V1ZoTkVHSTIzNG9iUXg0MDRh?=
 =?utf-8?B?V0ZDOXpxL3hJakkxdHI5czZTUHRnQWVZNUw1dThiSXdXcXdKNm5jRC9ZRkhn?=
 =?utf-8?B?WjdYck1NYmFYZm5kZ0NSQ3c0d1ZGRUJGUmhvb1R0Zm9vMS9ad2xHYkdaRm9r?=
 =?utf-8?B?NDJvYnNVNkNQdHFDREhxMlNRTUd4NXlvdk8zTUpGbXl0NDhHTGdtTS80MGpN?=
 =?utf-8?B?ZUtpSXRTWlpkdjVmRDVncWZtVzhXMWg2OXdVOW93dU0yNHcyOWIyZExORUEy?=
 =?utf-8?B?a3Jad3FZSFJWRUVMb0hpWXlzR3BCNEFTRW9nVk0xZm90aXBDQjVnMTRtTFl3?=
 =?utf-8?B?QW9jVjQ4eDRvczkyMnR1dFJUUk9mcXRsMnVNOW9ScHVYcVlXTk5HN0Mzc3Zz?=
 =?utf-8?B?eUxrRTMrSm9xMWd2NmxpakRFOVg4VHZmMjBUUCsrSVgyQkhvQ25zT1dxNG5z?=
 =?utf-8?B?czIvRzhBQVZNRlIrVXY2MkJXMGhIR0RzbzV6SVAwVEUrckp6aHdGbzlFOXBk?=
 =?utf-8?B?czExb3JqOGp1UVpLcVdKN205VFdHdE1TcTdKNm42ZW96TCtSZm9jRUE2cHI3?=
 =?utf-8?B?K3FiMmhsQXUxUVJKUVhGZmVLMFFlSEpiL05mWnl0Z0FJMFIyOFg5Q0E3b3BS?=
 =?utf-8?B?RHZpd1psU1M4c1VFYXVsWTQ3aDNaMmxkT2pTbFdGU2tGdnJBOWRBU1ZhWThC?=
 =?utf-8?B?ODFxZ0Uvem90K2E3NWM1VjhPdFBXK3V6YlBSWWkvSTFMMXJUZFN5VlJBMVZC?=
 =?utf-8?B?Zi9wSEZBZVpVRGt5NzFyRjF1OHg1bmxCU1c0cG9CYnNkN3BhMEQ2bzFFbVRp?=
 =?utf-8?B?WGVuaUFpQ1FTdzZFM012RGlSRFYwUTBhaEErSVRvREw2VGVpNTZRVTRmNkZN?=
 =?utf-8?B?cEYySE8xTHFRZ1czU095N1lQTzY2SHZjVlpDWUV3eW5vdnJhNVB5VzZ6Ymxp?=
 =?utf-8?B?ZndybTJ5TGQzeU42V2p5ZGNRdHltVnBRaHNHbEF3eDNZc2ZDTUZ3RGNabUJG?=
 =?utf-8?B?akhlRWhheEdmeTR3SEh2Rmd4cnNwZisva1ZGQVp4eS9yVXh0RFRZeHhSL2JY?=
 =?utf-8?B?aDFjZStzTjRTMnY1SitDNnliN3Zyb1JoZzRFR0hrL01CT2Y3Qm1lWkdvZGE5?=
 =?utf-8?B?TlpNSUdSaUhRNGNUQlZTdllXcU5HTlJrTGRwZTRkTUZ1ZjI0QTIzZGRPeGdU?=
 =?utf-8?B?dVFxa1NaSi9mV0N5T1AyU0l4cGtvU0N5NlN3S2QvUVQxam1WcSs4eFF1RWF2?=
 =?utf-8?B?T1I4TGErL01qaWtUM0hGM3VjOWl5WEpnS0FrRFZUNmsvN1YvMTRNRlc0V3Yr?=
 =?utf-8?B?bXMvME05U25oZzBpQ1J4aUZUSUpzeVA1dVZGb0tFcHBRUlA4UkRVSUxpQXB3?=
 =?utf-8?B?ZVJ6N1loQ0s4Q1JJTi80Y0pURDh1TmhnLzZNQmhNT0tvelE3ZTNCb2xSUVpC?=
 =?utf-8?B?dEVIdkN3aGx6R2tGZ3Q3MklLd1hVV0N5eVU3MDRvbXBNNm1STWVIMVNDNTZk?=
 =?utf-8?B?aGd5TVJiWkRYWndueS9obFBvTW9SZmp0MjcvQk1aTGRialV3eGNEbFZqSnV5?=
 =?utf-8?B?eDF6QU1ubDVaRzd3NG1jS2Z5Tzh1VzRsb2RoSWZRYjg5YVdFUzI4QzEyWHpz?=
 =?utf-8?B?cWUyV2VoSXlkMGRmNUdhcmE5SXRZR2RFR1VUL01qL09uUG9Ybkh2M0JWcVJz?=
 =?utf-8?B?YS9iVXBDYUpoNWxNc1ZOWjFyUHpublpKZ1FiQmlnYzUrcC9xcW9TUT09?=
X-Exchange-RoutingPolicyChecked: Xqq4KBVltuTLaigI/XS/P+/8LiCTqeZ9p1G+az6RbxXt0z1osyoEaJlMK4i6zpfQLI0ws1Q2UYoglhj3Nvpg1VCOp3gT/wWW/imLjgoUO+cWE8/97h3/PsvTiFq5anNZIDUo1xuXDFd7HndCQYuETujLGZOZrpL1QED4A+Xc55qN+KANcm6P1sRcSK5HedKj3+UQQzl7C9g/MvRiG0AI0MZmARnxQd4pXFmtYSsCU+nq9UL5THBOMp8gC2a/5xpQAC+jLA/2LmXG3iw0dS33wAscP3qE8snFfwJOQ2cwNNNDNMrCBvhLInhzhRT9O4mP4YvqwOwpU9mecUwW3qvdlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5e9c0d-3010-4e48-ef0e-08df36c8edf3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:01:15.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4JVCpSoVmuFhPp6sbst7D7lbZmpLu0xh+aL0LG68w2TAOqhmIojgI4t7/HU8HIh7gNyzJCHZPem41MKosfGwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: xc3N0llcJgKHExCi8iEBXl54FsQknWK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXw534mQfdfjYB
 qApqXwkt18ySV6gsVpotSGOyElRLPchY6KDtOhmRZcvhF2Lypz3er7jhBkReM9fh+COow+VrWWh
 8Fk5liSjwadT80wHSnkiY/gsfg9ScVygaFvARf5pNcZsx/psk6rKP/YrZ/DzdzLUa3OrGbrYreR
 6hpGrNOyYrIDJOL2t5Fz0AHuXOomdetg6ygU64TUbdUyKqNZNBI+4i39E/k1x0Dl4nptUdfiPn3
 B2VD0bGgthenAbqxY1o02M2tE2XdRxRJNbr9nEpo2Xo9jwe7+GQ6Q/yoK7W7Dg6OvfGxjpCp8iZ
 msyFPjwR9lbG9CqWS2vUUPr59cv9BYVldiycN3FjyveuaWo8CTjnh5pgBLdmMX9sB1uHBRmAVXu
 iDvsF9xs/psQUeoc8UWFeUdKIHzYSp7xCakocUDLk7eg3QTkFyx990jwg4tjzvF7JHzgUoHRJk7
 81cr5rlHtBjUU5jd2ZA==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6ae505a6 cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ModqzXLkJJ0tFyq98apW:22 a=MvuuwTCpAAAA:8 a=Bjj88vbCAAAA:8 a=5AeG2vkrAAAA:8
 a=SGk8zkMOAAAA:8 a=vex_B8S-AAAA:8 a=ZX29Jv-7sSjywT2kLj8A:9
 a=8bAJwudRHtDf8TIw:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9_NVs0-GnZ_HNO7Gzq-c:22 a=bCmCfq6TmEQDAAHIxstC:22 a=TntpZVxXrJrkeWYdTZYi:22
 a=piZ7GnUMHaBkGeu-p2yy:22
X-Proofpoint-GUID: xc3N0llcJgKHExCi8iEBXl54FsQknWK7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXxrQ4VlGCehYc
 iFqxEkVuqBeToeNez3+LfJKuIgNISysXcSPIErXOxKATveSz7xRNApJONkdPKEW+3ihzscNw8fO
 T/ndANOslFAGaVICJFPFmwuG2FBaXIE=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the remaining core resources: resource groups and IDs, QoS
profiles, traffic classes, services and their access control lists,
local network interfaces (LNI), portals, communication profiles, error
handling, ODP/HMM, telemetry and the PCIe, link and ASIC monitors.

Known limitation, deferred to V2: this patch carries SR-IOV
virtual-function code (VF-to-PF mailbox requests, mailbox opcodes or VF
resource handling) from an older, incomplete version of the Cassini
SR-IOV support. V2 of this series will include the updated SR-IOV
implementation, so issues in the VF paths should be ignored for now.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (20), ALLOC_WITH_SIZEOF (13), CONST_STRUCT (9),
  ENOTSUPP (5), DEPRECATED_API (3), SPLIT_STRING (1), STRCPY (1)
- CHECK: BRACES (16), UNNECESSARY_PARENTHESES (11), OPEN_ENDED_LINE (9),
  COMPARISON_TO_NULL (6), MACRO_ARG_REUSE (5), ALLOC_SIZEOF_STRUCT (3),
  ASSIGNMENT_CONTINUATIONS (1), BIT_MACRO (1), MACRO_ARG_PRECEDENCE (1),
  MULTIPLE_ASSIGNMENTS (1)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/ss1/cass_cpt.c          |  585 +++++
 drivers/net/ethernet/hpe/ss1/cass_dma_buf.c      |  256 ++
 drivers/net/ethernet/hpe/ss1/cass_errors.c       | 1155 +++++++++
 drivers/net/ethernet/hpe/ss1/cass_eth.c          |  702 ++++++
 drivers/net/ethernet/hpe/ss1/cass_hmm.c          |  320 +++
 drivers/net/ethernet/hpe/ss1/cass_hni.c          |  370 +++
 drivers/net/ethernet/hpe/ss1/cass_ixe.c          |  348 +++
 drivers/net/ethernet/hpe/ss1/cass_lmon.c         |  573 +++++
 drivers/net/ethernet/hpe/ss1/cass_lni.c          |  404 ++++
 drivers/net/ethernet/hpe/ss1/cass_odp_decouple.c |  599 +++++
 drivers/net/ethernet/hpe/ss1/cass_pcie_mon.c     |  288 +++
 drivers/net/ethernet/hpe/ss1/cass_pt.c           | 1255 ++++++++++
 drivers/net/ethernet/hpe/ss1/cass_ptp.c          |  304 +++
 drivers/net/ethernet/hpe/ss1/cass_rgid.c         |  293 +++
 drivers/net/ethernet/hpe/ss1/cass_rgroup.c       |  281 +++
 drivers/net/ethernet/hpe/ss1/cass_sbus.c         |  172 ++
 drivers/net/ethernet/hpe/ss1/cass_svc.c          | 2011 ++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_sysfs.c        |  849 +++++++
 drivers/net/ethernet/hpe/ss1/cass_tc.c           | 2780 ++++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/cass_telem.c        |  309 +++
 drivers/net/ethernet/hpe/ss1/cass_uc.c           | 1933 +++++++++++++++
 drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.c |  499 ++++
 drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.c  |  722 ++++++
 drivers/net/ethernet/hpe/ss1/cxi_rgroup.c        | 1791 ++++++++++++++
 drivers/net/ethernet/hpe/ss1/cxi_rx_profile.c    |  833 +++++++
 drivers/net/ethernet/hpe/ss1/cxi_tx_profile.c    |  819 +++++++
 26 files changed, 20451 insertions(+)

diff --git a/drivers/net/ethernet/hpe/ss1/cass_cpt.c b/drivers/net/ethernet/hpe/ss1/cass_cpt.c
new file mode 100644
index 000000000000..b63143dd8a62
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_cpt.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Communication Profile Table (CPT) management */
+
+#include <linux/iopoll.h>
+#include "cass_core.h"
+
+#define ENABLED_PFQ 0
+
+static int cass_cp_clear_table(int id, void *ptr, void *data)
+{
+	struct cass_cp *cp = ptr;
+	struct cass_dev *hw = data;
+	const union c_cq_cfg_cp_table cp_cfg = {};
+
+	cass_set_cp_table(hw, cp->id, &cp_cfg);
+
+	return 0;
+}
+
+/**
+ * cass_clear_cps() - Walk list of Communication profiles and clear
+ *                    the entries.
+ *
+ * @tx_profile: TX profile to clean
+ */
+void cass_clear_cps(struct cxi_tx_profile *tx_profile)
+	__must_hold(&hw->cp_lock)
+{
+	struct cass_dev *hw = tx_profile->config.hw;
+
+	idr_for_each(&tx_profile->config.cass_cp_table, &cass_cp_clear_table,
+		     hw);
+}
+
+struct vni_tc_data {
+	unsigned int vni_pcp;
+	unsigned int tc;
+	enum cxi_traffic_class_type tc_type;
+};
+
+/**
+ * cass_cp_free() - Free a communication profile.
+ *
+ * @cp: Communication profile to be freed.
+ */
+static void cass_cp_free(struct cass_cp *cp)
+{
+	struct cass_dev *hw = cp->hw;
+	const union c_cq_cfg_cp_table cp_cfg = {};
+
+	cxidev_dbg(&hw->cdev, "%s cp freed: cp=%u vni_pcp=%u label=%u\n",
+		   hw->cdev.name, cp->id, cp->vni_pcp, cp->tc);
+
+	cass_set_cp_table(hw, cp->id, &cp_cfg);
+
+	if (!cp->tx_profile->config.exclusive_cp)
+		idr_remove(&cp->tx_profile->config.cass_cp_table, cp->list_id);
+
+	ida_free(&hw->cp_table, cp->id);
+
+	kfree(cp);
+}
+
+/**
+ * cass_cp_alloc() - Allocate a new communication profile.
+ *
+ * @tx_profile: TX profile object
+ * @vni_pcp: VNI for communication profile. If using an ethernet tc,
+ * this argument is treated as PCP.
+ * @tc: Traffic class for communication profile.
+ * @tc_type: Traffic class type for communication profile.
+ *
+ * @return: Valid pointer on success. Else, negative errno value.
+ */
+static struct cass_cp *cass_cp_alloc(struct cxi_tx_profile *tx_profile,
+				     unsigned int vni_pcp,
+				     unsigned int tc,
+				     enum cxi_traffic_class_type tc_type)
+	__must_hold(&hw->cp_lock)
+{
+	struct cass_cp *cp;
+	unsigned int cp_id;
+	int rc;
+	struct cass_dev *hw = tx_profile->config.hw;
+	union c_cq_cfg_cp_table cp_cfg = {
+		.valid = 1,
+		.hrp_vld = tc_type == CXI_TC_TYPE_HRP,
+	};
+	union c_cq_cfg_cp_fl_table flow_cfg = {};
+	struct cass_tc_cfg tc_cfg;
+
+	rc = cass_tc_find(hw, tc, tc_type, vni_pcp, &tc_cfg);
+	if (rc) {
+		cxidev_dbg(&hw->cdev, "%s TC mapping does not exist, TC: %s TYPE: %s",
+			   hw->cdev.name, cxi_tc_to_str(tc),
+			   cxi_tc_type_to_str(tc_type));
+		return ERR_PTR(-EINVAL);
+	}
+
+	cp = kzalloc(sizeof(*cp), GFP_KERNEL);
+	if (!cp)
+		return ERR_PTR(-ENOMEM);
+
+	rc = ida_alloc_range(&hw->cp_table, 1, C_CQ_CFG_CP_TABLE_ENTRIES - 1,
+			     GFP_KERNEL);
+	if (rc < 0) {
+		cxidev_dbg(&hw->cdev,
+			   "%s hardware communication profiles exhausted\n",
+			   hw->cdev.name);
+		goto error_free_cp;
+	}
+
+	cp_id = rc;
+
+	if (!tx_profile->config.exclusive_cp) {
+		rc = idr_alloc(&tx_profile->config.cass_cp_table, cp, 1, 0, GFP_KERNEL);
+		if (rc < 0)
+			goto error_remove_ida;
+	}
+
+	refcount_set(&cp->ref, 1);
+
+	cp->list_id = rc;
+	cp->id = cp_id;
+	cp->vni_pcp = vni_pcp;
+	cp->tc = tc;
+	cp->tc_type = tc_type;
+	cp->hw = hw;
+	cp->tx_profile = tx_profile;
+
+	cp_cfg.vni = vni_pcp;
+	cp_cfg.dscp_unrsto = tc_cfg.unres_req_dscp;
+	cp_cfg.dscp_rstuno = tc_cfg.res_req_dscp;
+
+	if (is_eth_tc(tc)) {
+		cp_cfg.srb_disabled = 1;
+		cp_cfg.sct_disabled = 1;
+		cp_cfg.smt_disabled = 1;
+	}
+
+	cass_set_cp_table(hw, cp_id, &cp_cfg);
+
+	flow_cfg.pfq = tc_cfg.ocuset;
+	flow_cfg.tc = tc_cfg.cq_tc;
+
+	cass_set_cp_fl_table(hw, cp_id, &flow_cfg);
+
+	cxidev_dbg(&hw->cdev,
+		   "%s cp allocated: tc=%s tc_type=%s cp=%u vni_pcp=%u label=%u tc=%u pfq=%u exclusive=%u\n",
+		   hw->cdev.name, cxi_tc_to_str(tc),
+		   cxi_tc_type_to_str(tc_type), cp->id, cp->vni_pcp, cp->tc,
+		   flow_cfg.tc, flow_cfg.pfq, cp->tx_profile->config.exclusive_cp);
+
+	return cp;
+
+error_remove_ida:
+	ida_free(&hw->cp_table, cp_id);
+error_free_cp:
+	kfree(cp);
+
+	return ERR_PTR(rc);
+}
+
+/**
+ * cass_cp_put() - Put a communication profile.
+ *
+ * @cp: Communication profile where reference should be put.
+ */
+static void cass_cp_put(struct cass_cp *cp)
+	__must_hold(&hw->cp_lock)
+{
+	if (refcount_dec_and_test(&cp->ref))
+		cass_cp_free(cp);
+}
+
+static int cp_match(int id, void *ptr, void *data)
+{
+	struct cass_cp *cp = ptr;
+	struct vni_tc_data *vni_tc = data;
+
+	if (vni_tc->vni_pcp == cp->vni_pcp &&
+	    vni_tc->tc == cp->tc &&
+	    vni_tc->tc_type == cp->tc_type)
+		return cp->list_id;
+
+	return 0;
+}
+
+/**
+ * cass_cp_get() - Get a communication profile.
+ *
+ * @tx_profile: TX profile
+ * @vni_pcp: VNI for communication profile. If using an ethernet tc,
+ *           this argument is treated as PCP.
+ * @tc: Traffic class for communication profile.
+ * @tc_type: Traffic class type for communication profile.
+ *
+ * Reusing communication profiles is preferred over allocating a new one.
+ *
+ * @return: Valid pointer on success. Else, negative errno value.
+ */
+static struct cass_cp *cass_cp_get(struct cxi_tx_profile *tx_profile,
+				   unsigned int vni_pcp,
+				   unsigned int tc,
+				   enum cxi_traffic_class_type tc_type)
+	__must_hold(&hw->cp_lock)
+{
+	int id;
+	struct cass_cp *cp;
+	struct vni_tc_data data = {
+		.vni_pcp = vni_pcp,
+		.tc = tc,
+		.tc_type = tc_type
+	};
+
+	if (tx_profile->config.exclusive_cp)
+		return cass_cp_alloc(tx_profile, vni_pcp, tc, tc_type);
+
+	id = idr_for_each(&tx_profile->config.cass_cp_table, &cp_match, &data);
+	if (id) {
+		cp = idr_find(&tx_profile->config.cass_cp_table, id);
+		if (!cp) {
+			pr_err("Could not find id %d\n", id);
+			return ERR_PTR(-ENOENT);
+		}
+
+		refcount_inc(&cp->ref);
+
+		return cp;
+	}
+
+	return cass_cp_alloc(tx_profile, vni_pcp, tc, tc_type);
+}
+
+/**
+ * cxi_trig_cp_alloc_vf() - Allocate a communication profile with type of
+ *                          LCID parameter for VF
+ *
+ * @lni: LNI the communication profile should be mapped into
+ * @vni_pcp: VNI of communication profile. If using an ethernet tc
+ * this argument is treated as PCP.
+ * @tc: Traffic class of the communication profile
+ * @tc_type: Traffic class type of the communication profile
+ * @cp_type: NON_TRIG_LCID and any LCID for ANY_LCID.
+ *
+ * Note: Allocating communication profiles with the same LNI, VNI, TC, and TC
+ * type will result in a redundant communication profile being mapped into the
+ * LNI.
+ *
+ * @return: Valid pointer on success. Else, negative errno value.
+ */
+static struct cxi_cp *cxi_trig_cp_alloc_vf(struct cxi_lni *lni, unsigned int vni_pcp,
+					   unsigned int tc,
+					   enum cxi_traffic_class_type tc_type,
+					   enum cxi_trig_cp cp_type)
+{
+	struct cxi_lni_priv_vf *lni_priv_vf =
+		container_of(lni, struct cxi_lni_priv_vf, lni);
+	struct cxi_dev *dev = lni_priv_vf->dev;
+	struct cxi_cp_priv_vf *cp_priv_vf;
+	const struct cxi_trig_cp_alloc_cmd cmd = {
+		.op = CXI_OP_TRIG_CP_ALLOC,
+		.lni = lni_priv_vf->lni.id,
+		.vni = vni_pcp,
+		.tc = tc,
+		.tc_type = tc_type,
+		.cp_type = cp_type
+	};
+	struct cxi_cp_alloc_resp resp;
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	cp_priv_vf = kzalloc(sizeof(*cp_priv_vf), GFP_KERNEL);
+	if (!cp_priv_vf)
+		return ERR_PTR(-ENOMEM);
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		goto error_out;
+
+	cp_priv_vf->dev = dev;
+	cp_priv_vf->cp_hndl = resp.cp_hndl;
+	cp_priv_vf->cp.vni_pcp = vni_pcp;
+	cp_priv_vf->cp.tc = tc;
+	cp_priv_vf->cp.tc_type = tc_type;
+	cp_priv_vf->cp.lcid = resp.lcid;
+
+	return &cp_priv_vf->cp;
+
+error_out:
+	kfree(cp_priv_vf);
+
+	return ERR_PTR(rc);
+}
+
+/**
+ * cxi_trig_cp_alloc() - Allocate a communication profile with type of
+ *                       LCID parameter
+ *
+ * @lni: LNI the communication profile should be mapped into
+ * @vni_pcp: VNI of communication profile. If using an ethernet tc
+ * this argument is treated as PCP.
+ * @tc: Traffic class of the communication profile
+ * @tc_type: Traffic class type of the communication profile
+ * @cp_type: Return CP with LCID 0 for TRIG_LCID, a non-0 LCID for
+ *           NON_TRIG_LCID and any LCID for ANY_LCID.
+ *
+ * Note: Allocating communication profiles with the same LNI, VNI, TC, and TC
+ * type will result in a redundant communication profile being mapped into the
+ * LNI.
+ *
+ * @return: Valid pointer on success. Else, negative errno value.
+ */
+struct cxi_cp *cxi_trig_cp_alloc(struct cxi_lni *lni, unsigned int vni_pcp,
+				 unsigned int tc,
+				 enum cxi_traffic_class_type tc_type,
+				 enum cxi_trig_cp cp_type)
+{
+	struct cxi_lni_priv *lni_priv = container_of(lni, struct cxi_lni_priv,
+						     lni);
+	struct cxi_dev *dev = lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cass_cp *cass_cp;
+	struct cxi_cp_priv *cp_priv;
+	struct cxi_tx_profile *tx_profile = NULL;
+	int rc;
+	int lcid;
+
+	if (!dev->is_physfn)
+		return cxi_trig_cp_alloc_vf(lni, vni_pcp, tc, tc_type, cp_type);
+
+	if (tc < 0 || tc >= CXI_ETH_TC_MAX || tc_type < 0 ||
+	    tc_type >= CXI_TC_TYPE_MAX)
+		return ERR_PTR(-EINVAL);
+
+	/* Specific traffic class checks. */
+	if (is_eth_tc(tc)) {
+		/* Only 8 PCPs (0-7) are supported. */
+		if (vni_pcp > 7)
+			return ERR_PTR(-EINVAL);
+		else if (!capable(CAP_NET_RAW))
+			return ERR_PTR(-EPERM);
+
+		tx_profile = cxi_dev_get_eth_tx_profile(&hw->cdev);
+	} else {
+		if (!is_vni_valid(vni_pcp)) {
+			pr_debug("Invalid vni:%d\n", vni_pcp);
+			return ERR_PTR(-EINVAL);
+		}
+
+		tx_profile = cxi_dev_get_tx_profile(&hw->cdev, vni_pcp);
+		if (IS_ERR(tx_profile)) {
+			rc = PTR_ERR(tx_profile);
+			pr_debug("tx_profile not found for vni:%d rc:%d\n",
+				 vni_pcp, rc);
+			return ERR_PTR(rc);
+		}
+
+		if (!cxi_tx_profile_valid_tc(tx_profile, tc)) {
+			pr_debug("Invalid tc:%d for tx_profile ID:%d\n", tc,
+				 tx_profile->profile_common.id);
+			rc = -EINVAL;
+			goto free_tx_profile;
+		}
+	}
+
+	mutex_lock(&hw->cp_lock);
+	cp_priv = cass_cp_rgid_find(hw, lni_priv, vni_pcp, tc, tc_type,
+				    cp_type);
+	if (cp_priv) {
+		mutex_unlock(&hw->cp_lock);
+		pr_debug("Reuse cp:%u cp_type:%d rgid:%u lcid:%u refcount:%d\n",
+			 cp_priv->cass_cp->id, cp_type, cp_priv->rgid,
+			 cp_priv->cp.lcid, refcount_read(&cp_priv->refcount));
+		return &cp_priv->cp;
+	}
+
+	cp_priv = kzalloc(sizeof(*cp_priv), GFP_KERNEL);
+	if (!cp_priv) {
+		mutex_unlock(&hw->cp_lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	cp_priv->dev = dev;
+	cp_priv->rgid = lni_priv->lni.rgid;
+	cp_priv->lni_id = lni_priv->lni.id;
+	cp_priv->cp.vni_pcp = vni_pcp;
+	cp_priv->cp.tc = tc;
+	cp_priv->cp.tc_type = tc_type;
+	refcount_set(&cp_priv->refcount, 1);
+
+	/* Allocate the communication profile. */
+	cass_cp = cass_cp_get(tx_profile, vni_pcp, tc, tc_type);
+	if (IS_ERR(cass_cp)) {
+		rc = PTR_ERR(cass_cp);
+		goto free_cp_priv;
+	}
+
+	cp_priv->cass_cp = cass_cp;
+
+	/* Map the communication profile to LCID. */
+	lcid = cass_lcid_get(hw, cp_priv, lni_priv->lni.rgid, cp_type);
+	if (lcid < 0) {
+		cxidev_dbg(dev, "%s rgid=%u lcids exhausted\n", dev->name,
+			   lni_priv->lni.rgid);
+		rc = lcid;
+		goto free_cp;
+	}
+	cp_priv->cp.lcid = lcid;
+
+	mutex_unlock(&hw->cp_lock);
+
+	cass_set_cid(hw, lni_priv->lni.rgid, lcid, cass_cp->id);
+
+	cxidev_dbg(dev, "lcid allocated: lni:%d rgid=%u lcid=%u cp=%u cp_type:%d\n",
+		   lni_priv->lni.id, lni_priv->lni.rgid, cp_priv->cp.lcid, cass_cp->id,
+		   cp_type);
+
+	cass_flush_pci(hw);
+
+	return &cp_priv->cp;
+
+free_cp:
+	cass_cp_put(cass_cp);
+free_cp_priv:
+	mutex_unlock(&hw->cp_lock);
+	kfree(cp_priv);
+free_tx_profile:
+	cxi_tx_profile_dec_refcount(dev, tx_profile, true);
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL(cxi_trig_cp_alloc);
+
+/**
+ * cxi_cp_alloc() - Allocate a communication profile
+ *
+ * @lni: LNI the communication profile should be mapped into
+ * @vni_pcp: VNI of communication profile. If using an ethernet tc
+ * this argument is treated as PCP.
+ * @tc: Traffic class of the communication profile
+ * @tc_type: Traffic class type of the communication profile
+ *
+ * Note: Allocating communication profiles with the same LNI, VNI, TC, and TC
+ * type will result in a redundant communication profile being mapped into the
+ * LNI.
+ *
+ * @return: Valid pointer on success. Else, negative errno value.
+ */
+struct cxi_cp *cxi_cp_alloc(struct cxi_lni *lni, unsigned int vni_pcp,
+			    unsigned int tc,
+			    enum cxi_traffic_class_type tc_type)
+{
+	return cxi_trig_cp_alloc(lni, vni_pcp, tc, tc_type, ANY_LCID);
+}
+EXPORT_SYMBOL(cxi_cp_alloc);
+
+/**
+ * cxi_cp_free_vf() - Free the communication profile for VF
+ *
+ * @cp: Communication profile to be freed
+ */
+static void cxi_cp_free_vf(struct cxi_cp *cp)
+{
+	struct cxi_cp_priv_vf *cp_priv_vf =
+		container_of(cp, struct cxi_cp_priv_vf, cp);
+	struct cxi_dev *dev = cp_priv_vf->dev;
+	const struct cxi_cp_free_cmd cmd = {
+		.op = CXI_OP_CP_FREE,
+		.cp_hndl = cp_priv_vf->cp_hndl,
+	};
+	size_t resp_len = 0;
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		return;
+
+	kfree(cp_priv_vf);
+}
+
+/**
+ * cxi_cp_free() - Free the communication profile
+ *
+ * @cp: Communication profile to be freed
+ */
+void cxi_cp_free(struct cxi_cp *cp)
+{
+	struct cxi_cp_priv *cp_priv = container_of(cp, struct cxi_cp_priv, cp);
+	struct cass_dev *hw;
+	struct cxi_tx_profile *tx_profile;
+
+	if (!cp_priv->dev->is_physfn) {
+		cxi_cp_free_vf(cp);
+		return;
+	}
+
+	hw = cp_priv->cass_cp->hw;
+	tx_profile = cp_priv->cass_cp->tx_profile;
+
+	cxi_tx_profile_dec_refcount(&hw->cdev, tx_profile, true);
+
+	mutex_lock(&hw->cp_lock);
+
+	if (!refcount_dec_and_test(&cp_priv->refcount)) {
+		mutex_unlock(&hw->cp_lock);
+		pr_debug("Return cp:%u rgid:%u lcid:%u refcount:%d\n",
+			 cp_priv->cass_cp->id, cp_priv->rgid,
+			 cp_priv->cp.lcid, refcount_read(&cp_priv->refcount));
+		return;
+	}
+
+	cxidev_dbg(&hw->cdev, "%s lcid freed: rgid=%u lcid=%u cp=%u\n",
+		   hw->cdev.name, cp_priv->rgid, cp_priv->cp.lcid,
+		   cp_priv->cass_cp->id);
+
+	cass_set_cid(hw, cp_priv->rgid, cp_priv->cp.lcid, 0);
+
+	cass_lcid_put(hw, cp_priv->rgid, cp_priv->cp.lcid);
+	cass_cp_put(cp_priv->cass_cp);
+
+	mutex_unlock(&hw->cp_lock);
+
+	kfree(cp_priv);
+
+	cass_flush_pci(hw);
+}
+EXPORT_SYMBOL(cxi_cp_free);
+
+int cxi_cp_modify(struct cxi_cp *cp, unsigned int vni_pcp)
+{
+	struct cxi_cp_priv *cp_priv = container_of(cp, struct cxi_cp_priv, cp);
+	struct cass_cp *cass_cp = cp_priv->cass_cp;
+	struct cass_dev *hw = cp_priv->cass_cp->hw;
+	int rc = 0;
+	struct cass_tc_cfg tc_cfg;
+	union c_cq_cfg_cp_table cp_cfg = {
+	      .valid = 1,
+	      .hrp_vld = cp->tc_type == CXI_TC_TYPE_HRP,
+	};
+
+	if (!cass_cp->tx_profile->config.exclusive_cp)
+		return -EINVAL;
+
+	if (is_eth_tc(cp->tc)) {
+		pr_debug("eth tc:%s for cp:%u is invalid for cp modify\n",
+			 cxi_tc_to_str(cp->tc), cass_cp->id);
+		return -EINVAL;
+	}
+
+	if (!cxi_valid_vni(&hw->cdev, CXI_PROF_TX, vni_pcp)) {
+		pr_debug("cp modify received invalid vni: %d for cp:%u\n",
+			 vni_pcp, cass_cp->id);
+		return -EINVAL;
+	}
+
+	rc = cass_tc_find(hw, cp->tc, cp->tc_type, vni_pcp, &tc_cfg);
+	if (rc) {
+		cxidev_dbg(&hw->cdev,
+			   "%s tc mapping does not exist for cp:%u vni_pcp:%u tc:%s tc_type:%s",
+			   hw->cdev.name, cass_cp->id, vni_pcp,
+			   cxi_tc_to_str(cp->tc),
+			   cxi_tc_type_to_str(cp->tc_type));
+		return -EINVAL;
+	}
+
+	cp->vni_pcp = vni_pcp;
+	cp_cfg.vni = vni_pcp;
+	cp_cfg.dscp_unrsto = tc_cfg.unres_req_dscp;
+	cp_cfg.dscp_rstuno = tc_cfg.res_req_dscp;
+
+	cass_set_cp_table(hw, cass_cp->id, &cp_cfg);
+
+	cxidev_dbg(&hw->cdev,
+		   "%s cp modified: tc=%s tc_type=%s cp=%u vni_pcp=%u\n",
+		   hw->cdev.name, cxi_tc_to_str(cp->tc),
+		   cxi_tc_type_to_str(cp->tc_type), cass_cp->id, cp->vni_pcp);
+
+	cass_flush_pci(hw);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_cp_modify);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_dma_buf.c b/drivers/net/ethernet/hpe/ss1/cass_dma_buf.c
new file mode 100644
index 000000000000..8051df1111da
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_dma_buf.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021-2023 Hewlett Packard Enterprise Development LP */
+
+#include "cass_core.h"
+
+MODULE_IMPORT_NS("DMA_BUF");
+
+/* This macro is needed for dma-buf.h but is defined is such a way that it is
+ * not easy to include. Thus, redefine it.
+ */
+#define LINUX_DMABUF_BACKPORT(__sym) dmabufbkpt_ ##__sym
+
+/* Need to use quotes to avoid conflict with system default DMA buf headers. */
+#include "linux/dma-buf.h"
+#include "linux/dma-resv.h"
+
+#define DMABUF_DMA_ADDR_TO_MD_PFN(dma_addr) ((dma_addr) >> PAGE_SHIFT)
+#define DMABUF_MD_DEBUG(md_priv, fmt, ...) \
+	pr_debug("DMA buf MD va=%#llx iova=%#llx len=%lu fd=%d fd_offset=%#lx fd_len=%lu: " fmt "", \
+		 (md_priv)->md.va, (md_priv)->md.iova, (md_priv)->md.len, \
+		 (md_priv)->dmabuf_fd, (md_priv)->dmabuf_offset, \
+		 (md_priv)->dmabuf_length, ##__VA_ARGS__)
+#define DMABUF_MD_MDEBUG(md_priv, fmt, ...) \
+do {						\
+	if (more_debug)				\
+		DMABUF_MD_DEBUG(md_priv, fmt, ##__VA_ARGS__);	\
+} while (0)
+#define DMABUF_MD_ERROR(md_priv, fmt, ...) \
+	pr_err("DMA buf MD va=%#llx iova=%#llx len=%lu fd=%d fd_offset=%#lx fd_len=%lu: " fmt "", \
+	       (md_priv)->md.va, (md_priv)->md.iova, (md_priv)->md.len, \
+	       (md_priv)->dmabuf_fd, (md_priv)->dmabuf_offset, \
+	       (md_priv)->dmabuf_length, ##__VA_ARGS__)
+
+static void cxi_dma_buf_invalidate_mappings(struct dma_buf_attachment *attach)
+{
+	struct cxi_md_priv *md_priv = attach->importer_priv;
+	struct cass_ac *cac = md_priv->cac;
+
+	DMABUF_MD_ERROR(md_priv, "DMA buf invalidate mappings not supported\n");
+
+	/* TODO: Properly support invalidation by taking DMA resv lock and
+	 * unmapping SG table. This requires ODP.
+	 */
+	mutex_lock(&cac->ac_mutex);
+	cass_clear_range(md_priv, md_priv->md.iova, md_priv->md.len);
+	mutex_unlock(&cac->ac_mutex);
+	cass_invalidate_range(cac, md_priv->md.iova, md_priv->md.len);
+}
+
+static const struct dma_buf_attach_ops cxi_dma_buf_attach_ops = {
+	.allow_peer2peer = 1,
+	.invalidate_mappings = cxi_dma_buf_invalidate_mappings,
+};
+
+void cxi_dmabuf_put_pages(struct cxi_md_priv *md_priv)
+{
+	DMABUF_MD_DEBUG(md_priv, "DMA buf unmapped\n");
+
+	refcount_dec(&md_priv->refcount);
+
+	dma_resv_lock(md_priv->dmabuf->resv, NULL);
+	dma_buf_unmap_attachment(md_priv->dmabuf_attach, md_priv->dmabuf_sgt,
+				 DMA_BIDIRECTIONAL);
+	dma_resv_unlock(md_priv->dmabuf->resv);
+
+	dma_buf_detach(md_priv->dmabuf, md_priv->dmabuf_attach);
+	dma_buf_put(md_priv->dmabuf);
+	md_priv->dmabuf_sgt = NULL;
+
+	/* cass_dma_unmap_pages does a dma_unmap but this sgt
+	 * has not been dma mapped free the table here.
+	 */
+	sg_free_table(md_priv->sgt);
+	kfree(md_priv->sgt);
+	md_priv->sgt = NULL;
+}
+
+/* cp_md_sgtable - Copy dmabuf sgt entries bounded by dmabuf offset and
+ *                 length to a new sg table for use by the mirroring
+ *                 subsystem.
+ */
+static int cp_md_sgtable(struct cxi_md_priv *md_priv)
+{
+	int i;
+	int rc;
+	ulong end;
+	ulong start;
+	ulong cur = 0;
+	int nents = 0;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	struct scatterlist *nsg;
+
+	sgt = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
+	if (!sgt)
+		return -ENOMEM;
+
+	rc = sg_alloc_table(sgt, md_priv->dmabuf_sgt->nents, GFP_KERNEL);
+	if (rc)
+		goto sg_alloc_error;
+
+	start = ALIGN_DOWN(md_priv->dmabuf_offset, PAGE_SIZE);
+	end = PAGE_ALIGN(md_priv->dmabuf_offset + md_priv->dmabuf_length);
+
+	nsg = sgt->sgl;
+	for_each_sgtable_dma_sg(md_priv->dmabuf_sgt, sg, i) {
+		ulong len = sg_dma_len(sg);
+
+		if (start >= cur + len) {
+			cur += len;
+			continue;
+		}
+
+		sg_dma_address(nsg) = sg_dma_address(sg);
+		sg_dma_len(nsg) = len;
+		nents++;
+
+		if (cur <= start) {
+			ulong offset = start - cur;
+
+			sg_dma_address(nsg) += offset;
+			sg_dma_len(nsg) -= offset;
+		}
+
+		if (cur < end && end <= cur + len) {
+			ulong trim = cur + len - end;
+
+			sg_dma_len(nsg) -= trim;
+			break;
+		}
+
+		cur += len;
+		nsg = sg_next(nsg);
+	}
+
+	sgt->nents = nents;
+	md_priv->sgt = sgt;
+
+	return 0;
+
+sg_alloc_error:
+	kfree(sgt);
+
+	return rc;
+}
+
+int cxi_dmabuf_get_pages(struct ac_map_opts *m_opts)
+{
+	struct dma_fence *fence = NULL;
+	unsigned long end;
+	struct cxi_md_priv *md_priv = m_opts->md_priv;
+	struct cxi_dev *dev = md_priv->lni_priv->dev;
+	int rc;
+
+	if (check_add_overflow(md_priv->dmabuf_length, md_priv->dmabuf_offset,
+			       &end)) {
+		rc = -EINVAL;
+		DMABUF_MD_DEBUG(md_priv, "Invalid DMA buf len and offset\n");
+		goto err;
+	}
+
+	md_priv->dmabuf = dma_buf_get(md_priv->dmabuf_fd);
+	if (IS_ERR(md_priv->dmabuf)) {
+		rc = PTR_ERR(md_priv->dmabuf);
+		DMABUF_MD_DEBUG(md_priv, "dma_buf_get failed: rc=%d\n", rc);
+		goto err;
+	}
+
+	if (md_priv->dmabuf->size < end) {
+		rc = -EFAULT;
+		DMABUF_MD_DEBUG(md_priv,
+				"MD size to large for DMA buf size: md_size=%lu dma_buf_size=%lu\n",
+				end, md_priv->dmabuf->size);
+		goto err_release_dma_buf;
+	}
+
+	md_priv->dmabuf_attach = dma_buf_dynamic_attach(md_priv->dmabuf,
+							&dev->pdev->dev,
+							&cxi_dma_buf_attach_ops,
+							md_priv);
+	if (IS_ERR(md_priv->dmabuf_attach)) {
+		rc = PTR_ERR(md_priv->dmabuf_attach);
+		DMABUF_MD_DEBUG(md_priv,
+				"dma_buf_dynamic_attach failed: rc=%d\n", rc);
+		goto err_release_dma_buf;
+	}
+
+	dma_resv_lock(md_priv->dmabuf->resv, NULL);
+
+	md_priv->dmabuf_sgt = dma_buf_map_attachment(md_priv->dmabuf_attach,
+						     DMA_BIDIRECTIONAL);
+	if (IS_ERR(md_priv->dmabuf_sgt)) {
+		rc = PTR_ERR(md_priv->dmabuf_sgt);
+		DMABUF_MD_DEBUG(md_priv,
+				"dma_buf_map_attachment failed: rc=%d\n", rc);
+		goto err_release_unlock_attach;
+	}
+
+	DMABUF_MD_DEBUG(md_priv, "DMA buf SGT nents=%u\n",
+			md_priv->dmabuf_sgt->nents);
+
+	rc = cp_md_sgtable(md_priv);
+	if (rc)
+		goto err_unmap_attach;
+
+	/*
+	 * Although the sg list is valid now, the content of the pages
+	 * may be not up-to-date. Wait for the exporter to finish
+	 * the migration.
+	 */
+#if defined(HAVE_GET_SINGLETON)
+	rc = dma_resv_get_singleton(md_priv->dmabuf->resv, DMA_RESV_USAGE_WRITE,
+				    &fence);
+	if (rc) {
+		rc = dma_resv_wait_timeout(md_priv->dmabuf->resv, DMA_RESV_USAGE_WRITE,
+					   false, MAX_SCHEDULE_TIMEOUT);
+		if (rc) {
+			DMABUF_MD_DEBUG(md_priv,
+					"dma_resv_wait_timeout failed: rc = %d\n", rc);
+			goto err_free_sgt;
+		}
+	}
+#else
+	fence = dma_resv_excl_fence(md_priv->dmabuf->resv);
+	if (fence) {
+		rc = dma_fence_wait(fence, false);
+		if (rc) {
+			DMABUF_MD_DEBUG(md_priv,
+					"dma_fence_wait failed: rc = %d\n", rc);
+			goto err_free_sgt;
+		}
+	}
+#endif  /* defined(HAVE_GET_SINGLETON) */
+
+	dma_resv_unlock(md_priv->dmabuf->resv);
+
+	/* TODO: Is this refcount needed? */
+	refcount_inc(&md_priv->refcount);
+
+	return 0;
+
+err_free_sgt:
+	sg_free_table(md_priv->sgt);
+	kfree(md_priv->sgt);
+	md_priv->sgt = NULL;
+err_unmap_attach:
+	dma_buf_unmap_attachment(md_priv->dmabuf_attach, md_priv->dmabuf_sgt,
+				 DMA_BIDIRECTIONAL);
+err_release_unlock_attach:
+	dma_resv_unlock(md_priv->dmabuf->resv);
+	dma_buf_detach(md_priv->dmabuf, md_priv->dmabuf_attach);
+err_release_dma_buf:
+	dma_buf_put(md_priv->dmabuf);
+err:
+	return rc;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_errors.c b/drivers/net/ethernet/hpe/ss1/cass_errors.c
new file mode 100644
index 000000000000..3d59bbf75643
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_errors.c
@@ -0,0 +1,1155 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019 Hewlett Packard Enterprise Development LP */
+
+/* Cassini CSR error handlers */
+
+#include <linux/interrupt.h>
+#include <linux/types.h>
+#include <linux/version.h>
+
+#define CREATE_TRACE_POINTS
+
+#include "cass_core.h"
+#include <linux/hpe/cxi/cassini_error_defs.h>
+
+#include "cass_trace.h"
+
+/* Prepare a netlink message, queue it, and trigger the tasklet to
+ * send it. The message cannot be sent from this function directly
+ * because it is called from the interrupt handler.
+ */
+static void send_nl_msg(const struct cxi_dev *cdev, const struct csr_info *info,
+			const struct flg_err_info *flg_info, unsigned int bitn)
+{
+	struct sk_buff *msg;
+	size_t msg_size;
+	void *hdr;
+	int rc;
+
+	msg_size = nla_total_size(2 * nla_attr_size(sizeof(u32)) +
+				  nla_attr_size(sizeof(u8)));
+	msg = genlmsg_new(msg_size, GFP_ATOMIC);
+	if (!msg) {
+		cxidev_err(cdev, "Can't allocate GENL skb\n");
+		return;
+	}
+
+	hdr = genlmsg_put(msg, 0, 0, &cxierr_genl_family,
+			  0, CXIERR_ERR_MSG);
+	if (!hdr) {
+		cxidev_err(cdev, "genl put error");
+		goto fail;
+	}
+
+	rc = nla_put_u32(msg, CXIERR_GENL_ATTR_CSR_FLG, info->flg);
+	if (rc) {
+		cxidev_err(cdev, "nla put str error %d\n", rc);
+		goto fail;
+	}
+
+	rc = nla_put_u8(msg, CXIERR_GENL_ATTR_BIT, bitn);
+	if (rc) {
+		cxidev_err(cdev, "nla put str error %d\n", rc);
+		goto fail;
+	}
+
+	rc = nla_put_u32(msg, CXIERR_GENL_ATTR_DEV_NUM, cdev->cxi_num);
+	if (rc) {
+		cxidev_err(cdev, "nla put str error %d\n", rc);
+		goto fail;
+	}
+
+	genlmsg_end(msg, hdr);
+
+	genlmsg_multicast(&cxierr_genl_family, msg, 0, 0, GFP_ATOMIC);
+
+	return;
+
+fail:
+	genlmsg_cancel(msg, hdr);
+	nlmsg_free(msg);
+}
+
+/* Collect the information needed to analyze an error flag.
+ *
+ * Some fields in error CSRs are arrays (PFC_FIFO_OFLW in
+ * C_HNI_ERR_FLG for instance). bit_index is their index.
+ */
+static void collect_flg_info(struct cass_dev *hw,
+			     const struct flg_err_info *flg_info,
+			     unsigned int bit_index)
+{
+	int i;
+	int idx = 0;
+
+	hw->err_info_count = 0;
+
+	for (idx = 0;
+	     idx < C_MAX_CSR_ERR_INFO && flg_info->err_info[idx].offset != 0;
+	     idx++) {
+		struct err_info *info = &hw->err_info[idx];
+		void __iomem *base =
+				cass_csr(hw, flg_info->err_info[idx].offset);
+		int count = flg_info->err_info[idx].size / 8;
+
+		/* The ERR_INFO CSRs are up to 5 64-bits values, but
+		 * that may change.
+		 */
+		if (cxidev_WARN_ONCE(&hw->cdev, count > 5,
+				     "err_info CSR %x is too big: %d\n",
+				     flg_info->err_info[idx].offset, count)) {
+			count = 5;
+		}
+
+		for (i = 0; i < count; i++, base += sizeof(u64))
+			info->data[i] = readq(base);
+
+		info->count = count;
+
+		hw->err_info_count++;
+	}
+
+	hw->err_cntrs_count = 0;
+
+	for (idx = 0;
+	     idx < C_MAX_CSR_CNTRS && flg_info->cntr[idx].offset != 0;
+	     idx++) {
+		void __iomem *base;
+
+		if (flg_info->cntr[idx].index == C_ERR_INDEX_NONE)
+			base = cass_csr(hw, flg_info->cntr[idx].offset);
+		else
+			base = cass_csr(hw, flg_info->cntr[idx].offset +
+					bit_index * sizeof(u64));
+
+		hw->cntrs_val[idx] = readq(base);
+		hw->err_cntrs_count++;
+	}
+}
+
+/*
+ * eventually move this logging macro  as an addition or a replacement
+ * for	_cxi_log() in cass_core.h.
+ */
+#define _dump_flg_info_logger(loglevel, hw, fmt, ...)			\
+	do {								\
+		switch (loglevel) {					\
+		case LOGLEVEL_EMERG:					\
+			dev_emerg(&(hw)->cdev.pdev->dev,		\
+				"%s[%s]: " fmt,				\
+				(hw)->cdev.name, (hw)->cdev.eth_name,	\
+				##__VA_ARGS__);				\
+			break;						\
+		case LOGLEVEL_ALERT:					\
+			dev_alert(&(hw)->cdev.pdev->dev,		\
+				"%s[%s]: " fmt,				\
+				(hw)->cdev.name, (hw)->cdev.eth_name,	\
+				##__VA_ARGS__);				\
+			break;						\
+		case LOGLEVEL_CRIT:					\
+			dev_crit(&(hw)->cdev.pdev->dev,			\
+				"%s[%s]: " fmt,				\
+				(hw)->cdev.name, (hw)->cdev.eth_name,	\
+				##__VA_ARGS__);				\
+			break;						\
+		case LOGLEVEL_ERR:					\
+			dev_err(&(hw)->cdev.pdev->dev,			\
+				"%s[%s]: " fmt,				\
+				(hw)->cdev.name, (hw)->cdev.eth_name,	\
+				##__VA_ARGS__);				\
+			break;						\
+		case LOGLEVEL_WARNING:					\
+			dev_warn(&(hw)->cdev.pdev->dev,			\
+				"%s[%s]: " fmt,				\
+				(hw)->cdev.name, (hw)->cdev.eth_name,	\
+				##__VA_ARGS__);				\
+			break;						\
+		case LOGLEVEL_NOTICE:					\
+			dev_notice(&(hw)->cdev.pdev->dev,		\
+				"%s[%s]: " fmt,				\
+				(hw)->cdev.name, (hw)->cdev.eth_name,	\
+				##__VA_ARGS__);				\
+			break;						\
+		case LOGLEVEL_INFO:					\
+			dev_info(&(hw)->cdev.pdev->dev,			\
+				"%s[%s]: " fmt,				\
+				(hw)->cdev.name, (hw)->cdev.eth_name,	\
+				##__VA_ARGS__);				\
+			break;						\
+		case LOGLEVEL_DEBUG:					\
+			dev_dbg(&(hw)->cdev.pdev->dev,			\
+				"%s[%s]: " fmt,				\
+				(hw)->cdev.name, (hw)->cdev.eth_name,	\
+				##__VA_ARGS__);				\
+			break;						\
+		}							\
+	} while (0)
+
+/* Emit the collected information for a given error flag to the kernel
+ * log.
+ */
+static void dump_flg_info(struct cass_dev *hw,
+			  unsigned int irq, bool is_ext,
+			  const struct csr_info *info,
+			  const struct flg_err_info *flg_info,
+			  unsigned int bitn)
+{
+	int i;
+	char *first_err;
+	int log_level = 0;
+	static const char * const error_event_names[] = {
+		"C_EC_SFTWR",
+		"C_EC_INFO",
+		"C_EC_TRS_NS",
+		"C_EC_TRS_S",
+		"C_EC_TRNSNT_NS",
+		"C_EC_TRNSNT_S",
+		"C_EC_BADCON_NS",
+		"C_EC_BADCON_S",
+		"C_EC_DEGRD_NS",
+		"C_EC_COR",
+		"C_EC_UNCOR_NS",
+		"C_EC_UNCOR_S",
+		"C_EC_CRIT",
+	};
+	const char *errname;
+
+	if (test_bit(bitn, hw->first_flg)) {
+		first_err = hw->err_info_str;
+		sprintf(hw->err_info_str, "(was first error at %lu:%09lu)",
+			(unsigned long)hw->first_flg_ts.seconds,
+			(unsigned long)hw->first_flg_ts.nanoseconds);
+	} else {
+		first_err = "";
+	}
+
+	if (test_bit(bitn,
+		     hw->sfs_err_flg[irq][is_ext ? 1 : 0].no_print_mask.mask))
+		return;
+
+	/* Find the log level for that error. Not all errors reported
+	 * by the device are bad.
+	 */
+	switch (flg_info->ec) {
+	case C_EC_SFTWR:
+	case C_EC_INFO:
+	case C_EC_TRS_NS:
+	case C_EC_TRS_S:
+	case C_EC_TRNSNT_NS:
+	case C_EC_TRNSNT_S:
+		errname = error_event_names[flg_info->ec];
+		log_level = LOGLEVEL_INFO;
+		break;
+
+	case C_EC_BADCON_NS:
+	case C_EC_BADCON_S:
+	case C_EC_COR:
+		errname = error_event_names[flg_info->ec];
+		log_level = LOGLEVEL_WARNING;
+		break;
+
+	case C_EC_DEGRD_NS:
+		errname = error_event_names[flg_info->ec];
+		log_level = LOGLEVEL_ERR;
+		break;
+
+	case C_EC_UNCOR_NS:
+	case C_EC_UNCOR_S:
+		errname = error_event_names[flg_info->ec];
+		if (strcmp("llr_eopb", flg_info->bit_name) == 0)
+			log_level = LOGLEVEL_INFO;
+		else
+			log_level = LOGLEVEL_CRIT;
+		break;
+
+	case C_EC_CRIT:
+		errname = error_event_names[flg_info->ec];
+		log_level = LOGLEVEL_CRIT;
+		break;
+
+	default:
+		errname = "unrecognized c_error_class value";
+		log_level = LOGLEVEL_CRIT;
+		break;
+	}
+
+	_dump_flg_info_logger(log_level, hw, "%s: %s error: %s (%d) %s\n",
+			      errname, info->csr_name, flg_info->bit_name,
+			      bitn, first_err);
+
+	if (hw->err_info_count) {
+		int idx;
+
+		for (idx = 0; idx < hw->err_info_count; idx++) {
+			struct err_info *info = &hw->err_info[idx];
+			char *p = hw->err_info_str;
+
+			*p = '\0';
+
+			for (i = 0; i < info->count; i++)
+				p += sprintf(p, " %016llx", info->data[i]);
+
+			_dump_flg_info_logger(log_level, hw, "%s: %s%s\n",
+					      errname,
+					      flg_info->err_info[idx].name,
+					      hw->err_info_str);
+		}
+	}
+
+	if (hw->err_cntrs_count) {
+		int idx;
+
+		for (idx = 0; idx < hw->err_cntrs_count; idx++)
+			_dump_flg_info_logger(log_level, hw, "%s: %s: %llu\n",
+					      errname,
+					      flg_info->cntr[idx].name,
+					      hw->cntrs_val[idx]);
+	}
+}
+
+static void trace_err_info(struct cass_dev *hw,
+			   const struct csr_info *info,
+			   const struct flg_err_info *flg_info,
+			   unsigned int bitn)
+{
+	unsigned long seconds;
+	unsigned long nanoseconds;
+
+	if (test_bit(bitn, hw->first_flg)) {
+		seconds = hw->first_flg_ts.seconds;
+		nanoseconds = hw->first_flg_ts.nanoseconds;
+	} else {
+		seconds = 0;
+		nanoseconds = 0;
+	}
+
+	trace_cass_err(info->flg, bitn, seconds, nanoseconds,
+		       flg_info, hw->err_info, hw->cntrs_val);
+}
+
+/* Check whether some registered handlers are interested in that bit. */
+static void
+process_registered_handlers(struct cass_dev *hw, unsigned int irq, bool is_ext,
+			    unsigned int bitn)
+{
+	struct cxi_reg_err_flg *err_flg;
+
+	if (list_empty(&hw->err_flg_list))
+		return;
+
+	mutex_lock(&hw->err_flg_mutex);
+	list_for_each_entry(err_flg, &hw->err_flg_list, list) {
+		if ((irq == err_flg->irq) &&
+		    (is_ext == err_flg->is_ext) &&
+		    test_bit(bitn, err_flg->err_flags.mask))
+			err_flg->cb(hw, irq, is_ext, bitn);
+	}
+	mutex_unlock(&hw->err_flg_mutex);
+}
+
+/* Called for each bit in an ERR_FLG (or EXT_ERR_FLG) CSR.
+ *
+ * irq is which interrupt was triggered (C_PI_IPD_IRQA_MSIX_INT to
+ *   C_OXE_IRQB_MSIX_INT.)
+ * is_ext indicates whether this is the normal CSR or its EXT part.
+ * bitn is the bit number (0 to 63) that has been set in that CSR.
+ */
+static void process_err_flg(struct cass_dev *hw, unsigned int irq, bool is_ext,
+			    const struct csr_info *info, unsigned int bitn)
+{
+	const struct flg_err_info *flg_info = info->flg_info;
+
+	/* Both for_each_set_bit and flg_info->bit go
+	 * up. Match the range.
+	 */
+	while (flg_info->bit + flg_info->num_bits <= bitn)
+		flg_info++;
+
+	if (flg_info->bit <= bitn) {
+		collect_flg_info(hw, flg_info, bitn - flg_info->bit);
+
+		/* TODO?: once the API stabilizes, it might be
+		 * possible to have these 3 handlers as clients of
+		 * process_registered_handlers().
+		 */
+
+		dump_flg_info(hw, irq, is_ext, info, flg_info, bitn);
+		send_nl_msg(&hw->cdev, info, flg_info, bitn);
+		trace_err_info(hw, info, flg_info, bitn);
+
+		process_registered_handlers(hw, irq, is_ext, bitn);
+	} else {
+		cxidev_info(&hw->cdev, "%s error: unhandled bit %u\n",
+			    info->csr_name, bitn);
+		flg_info = NULL;
+	}
+
+	if (!__ratelimit(&hw->err_rl[irq][bitn])) {
+		struct sfs_err_flg *sfs = &hw->sfs_err_flg[irq][is_ext ? 1 : 0];
+
+		if (!test_bit(bitn, sfs->no_auto_mask.mask)) {
+			union err_flags bitmask = {};
+
+			cxidev_info(&hw->cdev,
+				    "Too many interrupts for %s.%s. Masking.\n",
+				    info->csr_name,
+				    flg_info ? flg_info->bit_name : "unknown");
+
+			set_bit(bitn, bitmask.mask);
+			cxi_disable_hw_errors(hw, irq, is_ext, bitmask.mask);
+		}
+	}
+}
+
+static ssize_t mask_show(struct kobject *kobj,
+			 struct kobj_attribute *attr, char *buf)
+{
+	struct sfs_err_flg *sfs = container_of(kobj, struct sfs_err_flg, kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%*pb\n",
+			 sfs->bitlen, sfs->err_irq_mask);
+}
+
+static ssize_t no_print_mask_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct sfs_err_flg *sfs = container_of(kobj, struct sfs_err_flg, kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%*pb\n",
+			 sfs->bitlen, sfs->no_print_mask.mask);
+}
+
+static ssize_t no_print_mask_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t len)
+{
+	struct sfs_err_flg *sfs = container_of(kobj, struct sfs_err_flg, kobj);
+	DECLARE_BITMAP(new, MAX_ERR_FLAG_BITLEN);
+	int ret;
+
+	ret = bitmap_parse(buf, len, new, sfs->bitlen);
+	if (ret)
+		return ret;
+
+	bitmap_copy(sfs->no_print_mask.mask, new, sfs->bitlen);
+
+	return len;
+}
+
+static ssize_t no_auto_mask_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	struct sfs_err_flg *sfs = container_of(kobj, struct sfs_err_flg, kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%*pb\n",
+			 sfs->bitlen, sfs->no_auto_mask.mask);
+}
+
+static ssize_t no_auto_mask_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t len)
+{
+	struct sfs_err_flg *sfs = container_of(kobj, struct sfs_err_flg, kobj);
+	DECLARE_BITMAP(new, MAX_ERR_FLAG_BITLEN);
+	int ret;
+
+	ret = bitmap_parse(buf, len, new, sfs->bitlen);
+	if (ret)
+		return ret;
+
+	bitmap_copy(sfs->no_auto_mask.mask, new, sfs->bitlen);
+
+	return len;
+}
+
+#define CSR_ERROR_ATTR_RO(_name) \
+	static struct kobj_attribute _name##_attr = __ATTR_RO(_name)
+
+#define CSR_ERROR_ATTR_RW(_name)					\
+	static struct kobj_attribute _name##_attr = __ATTR_RW(_name)
+
+CSR_ERROR_ATTR_RO(mask);
+CSR_ERROR_ATTR_RW(no_print_mask);
+CSR_ERROR_ATTR_RW(no_auto_mask);
+
+static struct attribute *irq_attrs[] = {
+	&mask_attr.attr,
+	&no_print_mask_attr.attr,
+	&no_auto_mask_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(irq);
+
+static struct kobj_type irq_kobj_type = {
+	.sysfs_ops  = &kobj_sysfs_ops,
+	.default_groups = irq_groups,
+};
+
+/* Define which error CSRs are connected to which IRQs.
+ * pf1 = prefix for the main CSR (ie. C1_IXE_ERR_FLG)
+ * pf2 = prefix for the sub-CSRs (ie. C_IXE_ERR_FIRST_FLG)
+ * The main can be different between C1/C2, but the other don't have
+ * the named fields in them, so they are identical. This is messy.
+ */
+#define CSRERR1(pf1, pf2, name, irq, namelo) {				\
+	.csr_name = #pf1 "_" #name, .flg = pf1##_##name##_ERR_FLG,	\
+	.mask = pf2##_##name##_ERR_IRQ##irq##_MSK,			\
+	.clr = pf2##_##name##_ERR_CLR, .flg_info = namelo##_err_info,	\
+	.first_flg = pf2##_##name##_ERR_FIRST_FLG,			\
+	.first_flg_ts = pf2##_##name##_ERR_FIRST_FLG_TS,		\
+	.csr_name_lo = #namelo,						\
+	.bitlen = (pf1##_##name##_ERR_FLG_SIZE * BITS_PER_BYTE)		\
+}
+
+#define CSRERR2(pf1, pf2, name, irq, namelo) {				\
+	.csr_name = #pf1 "_" #name, .flg = pf1##_##name##_ERR_FLG,	\
+	.mask = pf2##_##name##_ERR_IRQ##irq##_MSK,			\
+	.clr = pf2##_##name##_ERR_CLR, .flg_info = c2_##namelo##_err_info, \
+	.first_flg = pf2##_##name##_ERR_FIRST_FLG,			\
+	.first_flg_ts = pf2##_##name##_ERR_FIRST_FLG_TS,		\
+	.csr_name_lo = #namelo,						\
+	.bitlen = (pf1##_##name##_ERR_FLG_SIZE * BITS_PER_BYTE)		\
+}
+
+#define CSRERRSS2(pf1, pf2, name, irq, namelo) {				\
+	.csr_name = #pf1 "_" #name, .flg = pf1##_##name##_ERR_FLG,	\
+	.mask = pf2##_##name##_ERR_IRQ##irq##_MSK,			\
+	.clr = pf2##_##name##_ERR_CLR, .flg_info = ss2_##namelo##_err_info, \
+	.first_flg = pf2##_##name##_ERR_FIRST_FLG,			\
+	.first_flg_ts = pf2##_##name##_ERR_FIRST_FLG_TS,		\
+	.csr_name_lo = #namelo,						\
+	.bitlen = (pf1##_##name##_ERR_FLG_SIZE * BITS_PER_BYTE)		\
+}
+
+static const struct csr_info c1_handlers[NUM_ERR_INTS][2] = {
+	{ CSRERR1(C, C, PI_IPD, A, pi_ipd),
+	  CSRERR1(C, C, PI_IPD_EXT, A, pi_ipd_ext) },
+	{ CSRERR1(C, C, PI, A, pi), CSRERR1(C, C, PI_EXT, A, pi_ext) },
+	{ CSRERR1(C, C, MB, A, mb), CSRERR1(C, C, MB_EXT, A, mb_ext) },
+	{ CSRERR1(C, C, CQ, A, cq), CSRERR1(C, C, CQ_EXT, A, cq_ext) },
+	{ CSRERR1(C1, C, PCT, A, pct), CSRERR1(C, C, PCT_EXT, A, pct_ext) },
+	{ CSRERR1(C1, C, HNI, A, hni), },
+	{ CSRERR1(C1, C1, HNI_PML, A, hni_pml) },
+	{ CSRERR1(C, C, RMU, A, rmu) },
+	{ CSRERR1(C, C, IXE, A, ixe), CSRERR1(C, C, IXE_EXT, A, ixe_ext) },
+	{ CSRERR1(C, C, ATU, A, atu), CSRERR1(C, C, ATU_EXT, A, atu_ext) },
+	{ CSRERR1(C, C, EE, A, ee), CSRERR1(C, C, EE_EXT, A, ee_ext) },
+	{ CSRERR1(C, C, PARBS, A, parbs),
+	  CSRERR1(C, C, PARBS_EXT, A, parbs_ext) },
+	{ CSRERR1(C, C, LPE, A, lpe) },
+	{ CSRERR1(C, C, MST, A, mst) },
+	{ CSRERR1(C, C, OXE, A, oxe) },
+	{ CSRERR1(C, C, PI_IPD, B, pi_ipd),
+	  CSRERR1(C, C, PI_IPD_EXT, B, pi_ipd_ext) },
+	{ CSRERR1(C, C, PI, B, pi), CSRERR1(C, C, PI_EXT, B, pi_ext) },
+	{ CSRERR1(C, C, MB, B, mb), CSRERR1(C, C, MB_EXT, B, mb_ext) },
+	{ CSRERR1(C, C, CQ, B, cq), CSRERR1(C, C, CQ_EXT, B, cq_ext) },
+	{ CSRERR1(C1, C, PCT, B, pct), CSRERR1(C, C, PCT_EXT, B, pct_ext) },
+	{ CSRERR1(C1, C, HNI, B, hni) },
+	{ CSRERR1(C1, C1, HNI_PML, B, hni_pml) },
+	{ CSRERR1(C, C, RMU, B, rmu) },
+	{ CSRERR1(C, C, IXE, B, ixe), CSRERR1(C, C, IXE_EXT, B, ixe_ext) },
+	{ CSRERR1(C, C, ATU, B, atu), CSRERR1(C, C, ATU_EXT, B, atu_ext) },
+	{ CSRERR1(C, C, EE, B, ee), CSRERR1(C, C, EE_EXT, B, ee_ext) },
+	{ CSRERR1(C, C, PARBS, B, parbs),
+	  CSRERR1(C, C, PARBS_EXT, B, parbs_ext) },
+	{ CSRERR1(C, C, LPE, B, lpe) },
+	{ CSRERR1(C, C, MST, B, mst) },
+	{ CSRERR1(C, C, OXE, B, oxe) },
+};
+
+static const struct csr_info c2_handlers[NUM_ERR_INTS][2] = {
+	{ CSRERR2(C, C, PI_IPD, A, pi_ipd),
+	  CSRERR2(C, C, PI_IPD_EXT, A, pi_ipd_ext) },
+	{ CSRERR2(C, C, PI, A, pi), CSRERR2(C, C, PI_EXT, A, pi_ext) },
+	{ CSRERR2(C, C, MB, A, mb), CSRERR2(C, C, MB_EXT, A, mb_ext) },
+	{ CSRERR2(C, C, CQ, A, cq), CSRERR2(C, C, CQ_EXT, A, cq_ext) },
+	{ CSRERR2(C2, C, PCT, A, pct), CSRERR2(C, C, PCT_EXT, A, pct_ext) },
+	{ CSRERR2(C2, C, HNI, A, hni), CSRERR2(C2, C2, HNI_EXT, A, hni_ext) },
+	{ CSRERRSS2(SS2, SS2, PORT_PML, A, port_pml) },
+	{ CSRERR2(C, C, RMU, A, rmu) },
+	{ CSRERR2(C, C, IXE, A, ixe), CSRERR2(C, C, IXE_EXT, A, ixe_ext) },
+	{ CSRERR2(C, C, ATU, A, atu), CSRERR2(C, C, ATU_EXT, A, atu_ext) },
+	{ CSRERR2(C, C, EE, A, ee), CSRERR2(C, C, EE_EXT, A, ee_ext) },
+	{ CSRERR2(C, C, PARBS, A, parbs),
+	  CSRERR2(C, C, PARBS_EXT, A, parbs_ext) },
+	{ CSRERR2(C, C, LPE, A, lpe) },
+	{ CSRERR2(C, C, MST, A, mst) },
+	{ CSRERR2(C, C, OXE, A, oxe) },
+	{ CSRERR2(C, C, PI_IPD, B, pi_ipd),
+	  CSRERR2(C, C, PI_IPD_EXT, B, pi_ipd_ext) },
+	{ CSRERR2(C, C, PI, B, pi), CSRERR2(C, C, PI_EXT, B, pi_ext) },
+	{ CSRERR2(C, C, MB, B, mb), CSRERR2(C, C, MB_EXT, B, mb_ext) },
+	{ CSRERR2(C, C, CQ, B, cq), CSRERR2(C, C, CQ_EXT, B, cq_ext) },
+	{ CSRERR2(C2, C, PCT, B, pct), CSRERR2(C, C, PCT_EXT, B, pct_ext) },
+	{ CSRERR2(C2, C, HNI, B, hni), CSRERR2(C2, C2, HNI_EXT, B, hni_ext) },
+	{ CSRERRSS2(SS2, SS2, PORT_PML, B, port_pml) },
+	{ CSRERR2(C, C, RMU, B, rmu) },
+	{ CSRERR2(C, C, IXE, B, ixe), CSRERR2(C, C, IXE_EXT, B, ixe_ext) },
+	{ CSRERR2(C, C, ATU, B, atu), CSRERR2(C, C, ATU_EXT, B, atu_ext) },
+	{ CSRERR2(C, C, EE, B, ee), CSRERR2(C, C, EE_EXT, B, ee_ext) },
+	{ CSRERR2(C, C, PARBS, B, parbs),
+	  CSRERR2(C, C, PARBS_EXT, B, parbs_ext) },
+	{ CSRERR2(C, C, LPE, B, lpe) },
+	{ CSRERR2(C, C, MST, B, mst) },
+	{ CSRERR2(C, C, OXE, B, oxe) },
+};
+
+/* Whether the extended error flag exists */
+#define INFO(irq, idx) ((*hw->err_handlers)[irq][idx])
+#define HAS_EXT(irq) (INFO(irq, 1).csr_name)
+
+static void process_err_irq(struct cass_dev *hw, int irq)
+{
+	union err_flags err_flag[2];
+	DECLARE_BITMAP(mask, MAX_ERR_FLAG_BITLEN);
+	int i;
+	unsigned int bitn;
+
+	while (true) {
+		bool empty[2] = { true, true };
+
+		/* Read the normal CSR and the extended CSR if it
+		 * exists. Bits that are not valid must be ignored.
+		 */
+		for (i = 0; i < 2; i++) {
+			const struct csr_info *info = &INFO(irq, i);
+
+			if (i == 0 || HAS_EXT(irq)) {
+				cass_read(hw, info->flg,
+					  &err_flag[i].mask, info->bitlen / BITS_PER_BYTE);
+
+				cass_read(hw, info->mask, mask, info->bitlen / BITS_PER_BYTE);
+				bitmap_andnot(err_flag[i].mask, err_flag[i].mask, mask,
+					      info->bitlen);
+
+				if (!bitmap_empty(err_flag[i].mask, info->bitlen))
+					empty[i] = false;
+			} else {
+				bitmap_zero(err_flag[i].mask, info->bitlen);
+			}
+		}
+
+		/* A new error might have been raised since being
+		 * cleared in the previous loop. We must ensure the
+		 * error flags are 0 before leaving.
+		 */
+		if (empty[0] && empty[1])
+			return;
+
+		for (i = 0; i < 2; i++) {
+			const struct csr_info *info = &INFO(irq, i);
+
+			if (empty[i])
+				continue;
+
+			cass_read(hw, info->first_flg,
+				  hw->first_flg, info->bitlen / BITS_PER_BYTE);
+
+			cass_read(hw, info->first_flg_ts,
+				  &hw->first_flg_ts, sizeof(hw->first_flg_ts));
+
+			for_each_set_bit(bitn, err_flag[i].mask, info->bitlen)
+				process_err_flg(hw, irq, i == 1, info, bitn);
+
+			/* Clear the error bits after processing the flagged
+			 * error(s), otherwise the associated error CSRs might
+			 * be reset for the next error, but before the driver
+			 * has time to read them.
+			 */
+			cass_write(hw, info->clr, &err_flag[i],
+				   info->bitlen / BITS_PER_BYTE);
+		}
+	}
+}
+
+/* Worker to process all raised interrupts */
+static void error_irq_worker(struct work_struct *work)
+{
+	struct cass_dev *hw = container_of(work, struct cass_dev, err_irq_work);
+	int irq;
+	unsigned long irqs_raised;
+
+	irqs_raised = xchg(&hw->err_irq_raised, 0);
+
+	for_each_set_bit(irq, &irqs_raised, NUM_ERR_INTS)
+		process_err_irq(hw, irq);
+}
+
+/* Main interrupt handler for error registers */
+static irqreturn_t error_irq_cb(int vec, void *context)
+{
+	struct cass_dev *hw = context;
+	int irq;
+
+	/* Find the irq from the vector. This could be more efficient,
+	 * but these interrupts should be fairly rare.
+	 */
+	for (irq = 0; irq < NUM_ERR_INTS; irq++) {
+		if (hw->err_irq_vecs[irq] == vec)
+			break;
+	}
+
+	if (irq == NUM_ERR_INTS) {
+		cxidev_warn_once(&hw->cdev, "Error IRQ not found for vector %u\n",
+				 vec);
+		return IRQ_HANDLED;
+	}
+
+	set_bit(irq, &hw->err_irq_raised);
+	queue_work(hw->err_irq_wq, &hw->err_irq_work);
+
+	return IRQ_HANDLED;
+}
+
+static int cxierr_msg(struct sk_buff *skb, struct genl_info *info)
+{
+	return 0;
+}
+
+static const struct nla_policy cxierr_genl_policy[CXIERR_GENL_ATTR_MAX] = {
+	[CXIERR_GENL_ATTR_DEV_NUM] = { .type = NLA_U32 },
+	[CXIERR_GENL_ATTR_CSR_FLG] = { .type = NLA_U32 },
+	[CXIERR_GENL_ATTR_BIT] = { .type = NLA_U8 },
+};
+
+static const struct genl_ops cxierr_genl_ops[] = {
+	{
+		.cmd = CXIERR_ERR_MSG,
+		.doit = cxierr_msg,
+		.flags = GENL_ADMIN_PERM,
+	},
+};
+
+static const struct genl_multicast_group cxierr_mcast_grps[] = {
+	{ .name = CXIERR_GENL_MCAST_GROUP_NAME, },
+};
+
+struct genl_family cxierr_genl_family __ro_after_init = {
+	.module = THIS_MODULE,
+	.name = CXIERR_GENL_FAMILY_NAME,
+	.version = CXIERR_GENL_VERSION,
+	.maxattr = CXIERR_GENL_ATTR_MAX - 1,
+	.policy = cxierr_genl_policy,
+	.ops = cxierr_genl_ops,
+	.n_ops = ARRAY_SIZE(cxierr_genl_ops),
+	.mcgrps = cxierr_mcast_grps,
+	.n_mcgrps = ARRAY_SIZE(cxierr_mcast_grps),
+};
+
+static void free_err_irqs(struct cass_dev *hw)
+{
+	static const u64 mask;
+	int irq;
+
+	for (irq = 0; irq < NUM_ERR_INTS; irq++) {
+		int vec = hw->err_irq_vecs[irq];
+
+		if (vec < 0)
+			continue;
+
+		/* Reset their masks */
+		cass_write(hw, INFO(irq, 0).mask, &mask, sizeof(mask));
+		if (HAS_EXT(irq))
+			cass_write(hw, INFO(irq, 1).mask, &mask, sizeof(mask));
+
+		free_irq(vec, hw);
+
+		hw->err_irq_vecs[irq] = -1;
+	}
+}
+
+/**
+ * cxi_register_hw_errors() - register a callback for error bits
+ *
+ * When an error interrupt is generated, one or two CSR (ERR_FLG) have
+ * information. This allows a caller to be informed, through a
+ * callback, when some of these bits are set.
+ *
+ * @hw: the device
+ * @reg_err_flg: caller-initialized parameters (bitmask, callback, ...)
+ */
+void cxi_register_hw_errors(struct cass_dev *hw,
+			    struct cxi_reg_err_flg *reg_err_flg)
+{
+	mutex_lock(&hw->err_flg_mutex);
+	list_add_tail(&reg_err_flg->list, &hw->err_flg_list);
+	mutex_unlock(&hw->err_flg_mutex);
+}
+
+/**
+ * cxi_unregister_hw_errors() - un-register a callback for error bits
+ *
+ * @hw: the device
+ * @reg_err_flg: same structure used to register
+ */
+void cxi_unregister_hw_errors(struct cass_dev *hw,
+			      struct cxi_reg_err_flg *reg_err_flg)
+{
+	mutex_lock(&hw->err_flg_mutex);
+	list_del(&reg_err_flg->list);
+	mutex_unlock(&hw->err_flg_mutex);
+}
+
+/**
+ * cxi_enable_hw_errors() - enable interrupts for some error bits
+ *
+ * @hw: the device
+ * @irq: the IRQ/BLOCK (eg. C_HNI_PML_IRQA_MSIX_INT)
+ * @is_ext: whether or not the error flag is in the EXT_FLG CSR
+ * @bitmask: bitmask of interrupts to enable
+ */
+void cxi_enable_hw_errors(struct cass_dev *hw, unsigned int irq, bool is_ext,
+			  const unsigned long *bitmask)
+{
+	unsigned int idx = is_ext ? 1 : 0;
+	const struct csr_info *info = &INFO(irq, idx);
+	struct sfs_err_flg *sfs = &hw->sfs_err_flg[irq][idx];
+
+	spin_lock_bh(&hw->sfs_err_flg_lock);
+	bitmap_andnot(sfs->err_irq_mask, sfs->err_irq_mask,
+		      bitmask, sfs->bitlen);
+	cass_write(hw, info->mask, &sfs->err_irq_mask,
+		   sfs->bitlen / BITS_PER_BYTE);
+	spin_unlock_bh(&hw->sfs_err_flg_lock);
+}
+
+/**
+ * cxi_disable_hw_errors() - disable interrupts for some error bits
+ *
+ * @hw: the device
+ * @irq: the IRQ/BLOCK (eg. C_HNI_PML_IRQA_MSIX_INT)
+ * @is_ext: whether or not the error flag is in the EXT_FLG CSR
+ * @bitmask: bitmask of interrupts to disable
+ */
+void cxi_disable_hw_errors(struct cass_dev *hw, unsigned int irq, bool is_ext,
+			   const unsigned long *bitmask)
+{
+	unsigned int idx = is_ext ? 1 : 0;
+	const struct csr_info *info = &INFO(irq, idx);
+	struct sfs_err_flg *sfs = &hw->sfs_err_flg[irq][idx];
+
+	spin_lock_bh(&hw->sfs_err_flg_lock);
+	bitmap_or(sfs->err_irq_mask, sfs->err_irq_mask, bitmask, sfs->bitlen);
+	cass_write(hw, info->mask, &sfs->err_irq_mask,
+		   sfs->bitlen / BITS_PER_BYTE);
+	spin_unlock_bh(&hw->sfs_err_flg_lock);
+}
+
+static void alloc_kobjs_and_hw_errors(struct cass_dev *hw)
+{
+	struct sfs_err_flg *sfs;
+	DECLARE_BITMAP(bitmask, MAX_ERR_FLAG_BITLEN);
+	int irq = 0;
+	int rc;
+	int i;
+
+	bitmap_fill(bitmask, MAX_ERR_FLAG_BITLEN);
+
+	/* Only register with IrqA. Unmask all IrqA and mask all IrqB
+	 * interrupts.
+	 */
+	for (irq = 0; irq < NUM_ERR_INTS; irq++) {
+		for (i = 0; i < 2; i++) {
+			struct kobject *dkobj = hw->err_flgs_dir_kobj[0];
+			const struct csr_info *info = &INFO(irq, i);
+
+			if (info->csr_name == NULL)
+				continue;
+
+			sfs = &hw->sfs_err_flg[irq][i];
+
+			/* Clear all existing error conditions */
+			cass_write(hw, info->clr, &bitmask,
+				   sfs->bitlen / BITS_PER_BYTE);
+
+			if (irq < NUM_ERR_INTS / 2) {
+				/* IrqA */
+				rc = kobject_init_and_add(&sfs->kobj,
+							  &irq_kobj_type,
+							  dkobj,
+							  "%s",
+							  info->csr_name_lo);
+				if (rc)
+					cxidev_warn(&hw->cdev,
+						    "Can't add kobject for error CSR %s\n",
+						    info->csr_name);
+
+				cxi_enable_hw_errors(hw, irq, i, bitmask);
+			} else {
+				/* IrqB */
+				cxi_disable_hw_errors(hw, irq, i, bitmask);
+			}
+		}
+	}
+}
+
+static void free_kobjs_and_hw_errors(struct cass_dev *hw)
+{
+	struct sfs_err_flg *sfs;
+	DECLARE_BITMAP(bitmask, MAX_ERR_FLAG_BITLEN);
+	int irq = 0;
+	int i;
+
+	bitmap_fill(bitmask, MAX_ERR_FLAG_BITLEN);
+
+	for (irq = 0; irq < NUM_ERR_INTS; irq++) {
+		for (i = 0; i < 2; i++) {
+			const struct csr_info *info = &INFO(irq, i);
+
+			if (info->csr_name == NULL)
+				continue;
+
+			sfs = &hw->sfs_err_flg[irq][i];
+
+			if (irq < NUM_ERR_INTS / 2) {
+				/* IrqA */
+				kobject_put(&sfs->kobj);
+			}
+
+			cxi_disable_hw_errors(hw, irq, i, bitmask);
+		}
+	}
+}
+
+int register_error_handlers(struct cass_dev *hw)
+{
+	struct sfs_err_flg *sfs;
+	union err_flags bitmask;
+	int irq = 0;
+	int rc;
+	int i;
+	int j;
+
+	if (cass_version(hw, CASSINI_1))
+		hw->err_handlers = &c1_handlers;
+	else
+		hw->err_handlers = &c2_handlers;
+
+	for (irq = 0; irq < NUM_ERR_INTS; irq++)
+		hw->err_irq_vecs[irq] = -1;
+
+	for (i = 0; i < NUM_ERR_INTS; i++) {
+		for (j = 0; j < MAX_ERR_FLAG_BITLEN; j++) {
+			ratelimit_default_init(&hw->err_rl[i][j]);
+			ratelimit_set_flags(&hw->err_rl[i][j],
+					    RATELIMIT_MSG_ON_RELEASE);
+		}
+	}
+
+	for (irq = 0; irq < NUM_ERR_INTS; irq++) {
+		for (i = 0; i < 2; i++) {
+			const struct csr_info *info = &INFO(irq, i);
+			struct sfs_err_flg *sfs = &hw->sfs_err_flg[irq][i];
+
+			if (info->csr_name == NULL)
+				continue;
+
+			sfs->bitlen = info->bitlen;
+		}
+	}
+
+	hw->err_flgs_dir_kobj[0] =
+		kobject_create_and_add("err_flgs_irqa",
+				       &hw->cdev.pdev->dev.kobj);
+	if (hw->err_flgs_dir_kobj[0] == NULL)
+		return -ENOMEM;
+
+	alloc_kobjs_and_hw_errors(hw);
+
+	/* Hardcode some options. */
+
+	/* PI.UC_ATTENTION[] should not be printed, and never masked. */
+	sfs = &hw->sfs_err_flg[C_PI_IRQA_MSIX_INT][0];
+	sfs->no_print_mask.pi.uc_attention = 0b11;
+	sfs->no_auto_mask.pi.uc_attention = 0b11;
+
+	/* Mask some PCIe errors that are monitored by the driver's
+	 * PCIe monitor, and other errors we don't want to see.
+	 */
+	sfs = &hw->sfs_err_flg[C_PI_IPD_IRQA_MSIX_INT][1];
+	bitmap_zero(bitmask.mask, sfs->bitlen);
+	bitmask.pi_ipd_ext.ip_cfg_bad_tlp_err_sts = 1;
+	bitmask.pi_ipd_ext.ip_cfg_bad_dllp_err_sts = 1;
+	bitmask.pi_ipd_ext.ip_cfg_replay_timer_timeout_err_sts = 1;
+	bitmask.pi_ipd_ext.ip_cfg_replay_number_rollover_err_sts = 1;
+	bitmask.pi_ipd_ext.pri_rbyp_abort = 1;
+	bitmap_copy(sfs->no_print_mask.mask, bitmask.mask, sfs->bitlen);
+	cxi_disable_hw_errors(hw, C_PI_IPD_IRQA_MSIX_INT, true, bitmask.mask);
+
+	sfs = &hw->sfs_err_flg[C_PI_IRQA_MSIX_INT][1];
+	sfs->no_print_mask.pi_ext.pri_rarb_xlat_rbyp_abort_error = 1;
+
+	/* ATU.PRB_EXPIRED should not be printed, and never
+	 * masked. Ignore some other.
+	 */
+	sfs = &hw->sfs_err_flg[C_ATU_IRQA_MSIX_INT][0];
+	sfs->no_print_mask.atu.prb_expired = 1;
+	sfs->no_auto_mask.atu.prb_expired = 1;
+	sfs->no_print_mask.atu.invalid_ac = 1;
+	sfs->no_print_mask.atu.no_translation = 1;
+
+	bitmap_zero(bitmask.mask, sfs->bitlen);
+	bitmask.atu.invalid_ac = 1;
+	bitmask.atu.no_translation = 1;
+	cxi_disable_hw_errors(hw, C_ATU_IRQA_MSIX_INT, false, bitmask.mask);
+
+	/* Ignore some RMU errors. */
+	sfs = &hw->sfs_err_flg[C_RMU_IRQA_MSIX_INT][0];
+	sfs->no_print_mask.rmu.enet_frame_rejected = 1;
+	sfs->no_print_mask.rmu.ptl_no_ptlte = 1;
+
+	bitmap_copy(bitmask.mask, sfs->no_print_mask.mask, sfs->bitlen);
+	cxi_disable_hw_errors(hw, C_RMU_IRQA_MSIX_INT, false, bitmask.mask);
+
+	/* Ignore some LPE errors. */
+	sfs = &hw->sfs_err_flg[C_LPE_IRQA_MSIX_INT][0];
+	sfs->no_print_mask.lpe.entry_not_found = 1;
+	sfs->no_print_mask.lpe.pt_disabled_dis = 1;
+	sfs->no_print_mask.lpe.pt_disabled_fc = 1;
+	sfs->no_print_mask.lpe.src_error = 1;
+
+	bitmap_copy(bitmask.mask, sfs->no_print_mask.mask, sfs->bitlen);
+	cxi_disable_hw_errors(hw, C_LPE_IRQA_MSIX_INT, false, bitmask.mask);
+
+	/* Some PCT EXT errors can be ignored in C1*/
+	if (cass_version(hw, CASSINI_1)) {
+		sfs = &hw->sfs_err_flg[C_PCT_IRQA_MSIX_INT][1];
+		bitmap_zero(bitmask.mask, sfs->bitlen);
+		bitmask.pct_ext.sct_tbl_rd_misc_unused = 1;
+		bitmask.pct_ext.sct_tbl_rd_ram_unused = 1;
+		cxi_disable_hw_errors(hw, C_PCT_IRQA_MSIX_INT, true, bitmask.mask);
+	}
+
+	/* Mask some EE errors and don't print them */
+	sfs = &hw->sfs_err_flg[C_EE_IRQA_MSIX_INT][0];
+	sfs->no_print_mask.ee.eq_dsabld_event = 1;
+
+	bitmap_zero(bitmask.mask, sfs->bitlen);
+	bitmask.ee.eq_dsabld_event = 1;
+	cxi_disable_hw_errors(hw, C_EE_IRQA_MSIX_INT, false, bitmask.mask);
+
+	/* Disable some link management error flags in HNI_PML. These
+	 * bits are controlled by the link driver.
+	 */
+	if (cass_version(hw, CASSINI_2)) {
+		sfs = &hw->sfs_err_flg[C_HNI_IRQA_MSIX_INT][0];
+		bitmap_zero(bitmask.mask, sfs->bitlen);
+		bitmask.c2_hni.llr_eopb = 1;
+		bitmap_copy(sfs->no_auto_mask.mask, bitmask.mask, sfs->bitlen);
+		cxi_disable_hw_errors(hw, C_HNI_IRQA_MSIX_INT, false, bitmask.mask);
+
+		sfs = &hw->sfs_err_flg[C_HNI_IRQA_MSIX_INT][1];
+		bitmap_zero(bitmask.mask, sfs->bitlen);
+		bitmask.c2_hni_ext.pmi_ack = 1;
+		bitmap_copy(sfs->no_auto_mask.mask, bitmask.mask, sfs->bitlen);
+		cxi_disable_hw_errors(hw, C_HNI_IRQA_MSIX_INT, true, bitmask.mask);
+	}
+
+	sfs = &hw->sfs_err_flg[C_HNI_PML_IRQA_MSIX_INT][0];
+	bitmap_zero(bitmask.mask, sfs->bitlen);
+	if (cass_version(hw, CASSINI_1)) {
+		sfs->no_print_mask.c1_hni_pml.autoneg_page_received = 1;
+		sfs->no_print_mask.c1_hni_pml.autoneg_complete = 1;
+		sfs->no_print_mask.c1_hni_pml.pcs_lanes_locked = 1;
+		sfs->no_print_mask.c1_hni_pml.pcs_aligned = 1;
+		sfs->no_print_mask.c1_hni_pml.pcs_ready = 1;
+		sfs->no_print_mask.c1_hni_pml.pcs_link_down = 1;
+
+		bitmask.c1_hni_pml.autoneg_page_received = 1;
+		bitmask.c1_hni_pml.autoneg_complete = 1;
+		bitmask.c1_hni_pml.pcs_hi_ser = 1;
+		bitmask.c1_hni_pml.pcs_link_down = 1;
+		bitmask.c1_hni_pml.llr_replay_at_max = 1;
+		bitmask.c1_hni_pml.pcs_lanes_locked = 1;
+		bitmask.c1_hni_pml.pcs_aligned = 1;
+		bitmask.c1_hni_pml.pcs_ready = 1;
+	} else {
+		bitmask.ss2_port_pml.autoneg_page_received_0 = 1;
+		bitmask.ss2_port_pml.autoneg_failed_0 = 1;
+
+		bitmask.ss2_port_pml.llr_init_complete_0 = 1;
+		bitmask.ss2_port_pml.llr_init_fail_0 = 1;
+		bitmask.ss2_port_pml.llr_loop_time_0 = 1;
+		bitmask.ss2_port_pml.llr_loop_time_fail_0 = 1;
+		bitmask.ss2_port_pml.llr_replay_at_max_0 = 1;
+		bitmask.ss2_port_pml.llr_tx_dp_err = 1;
+		bitmask.ss2_port_pml.llr_rx_dp_err = 1;
+
+		bitmask.ss2_port_pml.pcs_aligned_0 = 1;
+		bitmask.ss2_port_pml.pcs_hi_ser_0 = 1;
+		bitmask.ss2_port_pml.pcs_lanes_locked_0 = 1;
+		bitmask.ss2_port_pml.pcs_link_down_0 = 1;
+		bitmask.ss2_port_pml.pcs_link_down_lf_0 = 1;
+		bitmask.ss2_port_pml.pcs_link_down_rf_0 = 1;
+		bitmask.ss2_port_pml.pcs_link_up_0 = 1;
+		bitmask.ss2_port_pml.pcs_tx_dp_err = 1;
+		bitmask.ss2_port_pml.pcs_rx_dp_err = 1;
+
+		bitmask.ss2_port_pml.mac_tx_dp_err = 1;
+		bitmask.ss2_port_pml.mac_rx_dp_err = 1;
+		bitmask.ss2_port_pml.mac_rx_fcs32_err_0 = 1;
+		bitmask.ss2_port_pml.mac_rx_framing_err_0 = 1;
+		bitmask.ss2_port_pml.mac_rx_preamble_err_0 = 1;
+	}
+
+	bitmap_copy(sfs->no_auto_mask.mask, bitmask.mask, sfs->bitlen);
+	cxi_disable_hw_errors(hw, C_HNI_PML_IRQA_MSIX_INT, false, bitmask.mask);
+
+	/* Allocate the work queue with a single worker. */
+	hw->err_irq_wq = alloc_workqueue("error_wq", WQ_UNBOUND, 1);
+	if (!hw->err_irq_wq) {
+		rc = -ENOMEM;
+		goto free_err_flg_kobjs;
+	}
+
+	INIT_WORK(&hw->err_irq_work, error_irq_worker);
+
+	/* Register all 15 IRQA interrupts. */
+	hw->err_irq_mask = 0x7fff;
+
+	/* Register and activate all the error reporting
+	 * interrupts.
+	 */
+	for_each_set_bit(irq, &hw->err_irq_mask, NUM_ERR_INTS) {
+		int vec;
+		char irq_name[CASS_MAX_IRQ_NAME];
+
+		vec = pci_irq_vector(hw->cdev.pdev, irq);
+		hw->err_irq_vecs[irq] = vec;
+
+		scnprintf(irq_name, CASS_MAX_IRQ_NAME,  "%s_err_%s",
+			  hw->cdev.name, INFO(irq, 0).csr_name_lo);
+		strcpy(hw->err_int_names[irq], irq_name);
+		rc = request_irq(vec, error_irq_cb, 0,
+				 hw->err_int_names[irq], hw);
+		if (rc) {
+			cxidev_err(&hw->cdev, "Failed to request IRQ for events.\n");
+			hw->err_irq_vecs[irq] = -1;
+			goto remove;
+		}
+	}
+
+	return 0;
+
+remove:
+	free_err_irqs(hw);
+	destroy_workqueue(hw->err_irq_wq);
+	hw->err_irq_wq = NULL;
+
+free_err_flg_kobjs:
+	free_kobjs_and_hw_errors(hw);
+
+	kobject_put(hw->err_flgs_dir_kobj[0]);
+
+	return rc;
+}
+
+void deregister_error_handlers(struct cass_dev *hw)
+{
+	free_err_irqs(hw);
+	destroy_workqueue(hw->err_irq_wq);
+	hw->err_irq_wq = NULL;
+	free_kobjs_and_hw_errors(hw);
+	kobject_put(hw->err_flgs_dir_kobj[0]);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_eth.c b/drivers/net/ethernet/hpe/ss1/cass_eth.c
new file mode 100644
index 000000000000..726e22da1d6a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_eth.c
@@ -0,0 +1,702 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019, 2022, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Core driver support for Ethernet devices */
+
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/hpe/cxi/driver.h>
+#include <linux/etherdevice.h>
+
+#include "cass_core.h"
+
+/* TODO: documentation format is incorrect. Use kernel documentation
+ * format for functions
+ */
+/**
+ * cxi_eth_set_list() - Program the RMU address filter
+ *
+ * @cdev: CXI device
+ * @res: Ethernet resource with catch-all portal in C_PTLTE_ETHERNET state
+ * @set_list: how to program the set list
+ * @set_list_mask: valid bits for @set_list
+ * @is_ptp: whether the MAC address is for PTP timestamping
+ *
+ * @return: 0 on success or a negative errno
+ */
+static int cxi_eth_set_list(struct cxi_dev *cdev,
+			    struct cxi_eth_res *res,
+			    const union c_rmu_cfg_ptlte_set_list *set_list,
+			    const union c_rmu_cfg_ptlte_set_list *set_list_mask,
+			    bool is_ptp)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int set_list_idx;
+
+	set_list_idx = ida_alloc_max(&hw->set_list_table,
+				     C_RMU_CFG_PTLTE_SET_LIST_ENTRIES - 1,
+				     GFP_KERNEL);
+	if (set_list_idx < 0)
+		return -EINVAL;
+
+	set_bit(set_list_idx, res->sl);
+
+	spin_lock(&hw->rmu_lock);
+
+	cass_config_set_list(hw, set_list_idx,
+			     is_ptp ? res->ptn_ptp : res->ptn_def,
+			     set_list, set_list_mask);
+
+	spin_unlock(&hw->rmu_lock);
+
+	return 0;
+}
+
+/**
+ * cxi_eth_add_mac() - Add a MAC address match for an Ethernet PTE
+ *
+ * Program the RMU filter to accept the given MAC address.
+ *
+ * @cdev: CXI device
+ * @res: Ethernet resource with catch-all portal in C_PTLTE_ETHERNET state
+ * @mac_addr: A MAC address
+ * @is_ptp: whether the MAC address is for PTP timestamping
+ *
+ * @return: 0 on success or a negative errno
+ */
+int cxi_eth_add_mac(struct cxi_dev *cdev, struct cxi_eth_res *res,
+		    u64 mac_addr, bool is_ptp)
+{
+	const union c_rmu_cfg_ptlte_set_list set_list = {
+		.frame_type = C_RMU_ENET_802_3,
+		.dmac = mac_addr,
+	};
+	/* Accept only that MAC */
+	union c_rmu_cfg_ptlte_set_list set_list_mask = {
+		.qw = {
+			[0] = ~set_list.qw[0],
+			[1] = ~set_list.qw[1],
+			[2] = ~set_list.qw[2],
+			[3] = ~set_list.qw[3],
+		}
+	};
+
+	/* Ignore any bits which could prevent an Ethernet packet from landing
+	 * against the configured MAC address.
+	 */
+	set_list_mask.vlan_present = 0;
+	set_list_mask.pcp = 0;
+	set_list_mask.dei = 0;
+	set_list_mask.vid = 0;
+	set_list_mask.lossless = 0;
+
+	return cxi_eth_set_list(cdev, res, &set_list, &set_list_mask, is_ptp);
+}
+EXPORT_SYMBOL(cxi_eth_add_mac);
+
+/**
+ * cxi_eth_set_promiscuous() - Set the Ethernet promiscuous mode
+ *
+ * Program the RMU filter to accept any MAC address. This essentially
+ * moves the Ethernet adapter into promiscuous mode.
+ *
+ * @cdev: CXI device
+ * @res: Ethernet resource with catch-all portal in C_PTLTE_ETHERNET state
+ *
+ * @return: 0 on success or a negative errno
+ */
+int cxi_eth_set_promiscuous(struct cxi_dev *cdev, struct cxi_eth_res *res)
+{
+	const union c_rmu_cfg_ptlte_set_list set_list = {
+		.frame_type = C_RMU_ENET_802_3,
+	};
+	const union c_rmu_cfg_ptlte_set_list set_list_mask = {
+		.qw = {
+			[2] = ~set_list.qw[2],
+			[3] = ~set_list.qw[3],
+		}
+	};
+
+	return cxi_eth_set_list(cdev, res, &set_list, &set_list_mask, false);
+}
+EXPORT_SYMBOL(cxi_eth_set_promiscuous);
+
+/**
+ * cxi_eth_set_all_multi() - Receive all multicast Ethernet packets
+ *
+ * Program the RMU filter to accept any multicast Ethernet traffic.
+ *
+ * @cdev: CXI device
+ * @res: Ethernet resource with catch-all portal in C_PTLTE_ETHERNET state
+ *
+ * @return: 0 on success or a negative errno
+ */
+int cxi_eth_set_all_multi(struct cxi_dev *cdev, struct cxi_eth_res *res)
+{
+	const union c_rmu_cfg_ptlte_set_list set_list = {
+		.frame_type = C_RMU_ENET_802_3,
+		.dmac = 0x010000000000ULL, /* MAC multicast bit */
+	};
+	const union c_rmu_cfg_ptlte_set_list set_list_mask = {
+		.qw = {
+			[2] = ~set_list.qw[2],
+			[3] = ~set_list.qw[3],
+		}
+	};
+
+	return cxi_eth_set_list(cdev, res, &set_list, &set_list_mask, false);
+}
+EXPORT_SYMBOL(cxi_eth_set_all_multi);
+
+/**
+ * cxi_eth_set_list_invalidate_all() - Invalidate all entries in set list
+ *
+ * @cdev: CXI device
+ * @res: Ethernet resource with catch-all portal in C_PTLTE_ETHERNET state
+ */
+void cxi_eth_set_list_invalidate_all(struct cxi_dev *cdev,
+				     struct cxi_eth_res *res)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	int set_list_idx;
+
+	for_each_set_bit(set_list_idx, res->sl,
+			 C_RMU_CFG_PTLTE_SET_LIST_ENTRIES) {
+		cass_invalidate_set_list(hw, set_list_idx);
+
+		ida_free(&hw->set_list_table, set_list_idx);
+	}
+
+	bitmap_zero(res->sl, C_RMU_CFG_PTLTE_SET_LIST_ENTRIES);
+}
+EXPORT_SYMBOL(cxi_eth_set_list_invalidate_all);
+
+/**
+ * cass_eth_set_hash_types() - Set the hashing types
+ *
+ * @cdev: CXI device
+ * @res: Ethernet resource with catch-all portal in C_PTLTE_ETHERNET state
+ * @entry: content to program, include the hash types to enable
+ */
+static void cass_eth_set_hash_types(struct cxi_dev *cdev,
+				    const struct cxi_eth_res *res,
+				    const struct c_rmu_cfg_ptlte_set_ctrl_table_entry *entry)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	unsigned int sl_idx;
+
+	/* Set the hashing type on each used Set Ctrl entries */
+	for_each_set_bit(sl_idx, res->sl, C_RMU_CFG_PTLTE_SET_LIST_ENTRIES)
+		cass_config_set_ctrl(hw, sl_idx, entry);
+}
+
+/**
+ * cxi_eth_set_indir_table() - Set the indirection tables
+ *
+ * Program the indirection table, and reset the corresponding Set Ctrl
+ * entries.
+ *
+ * @cdev: CXI device
+ * @res: Ethernet resource with catch-all portal in C_PTLTE_ETHERNET state
+ *
+ * @return: 0 on success or a negative errno
+ */
+void cxi_eth_set_indir_table(struct cxi_dev *cdev, struct cxi_eth_res *res)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct c_rmu_cfg_ptlte_set_ctrl_table_entry entry = {
+		.portal_index_indir_base = res->portal_index_indir_base,
+		.hash_bits = ilog2(res->rss_queues),
+		.hash_types_enabled = res->hash_types_enabled,
+	};
+	int i;
+
+	/* Disable hashing */
+	cxi_eth_clear_indir_table(cdev, res);
+
+	/* Exit now if there is no hash requested, or nothing to hash to. */
+	if (res->hash_types_enabled == 0 || res->rss_queues == 0 ||
+	    res->rss_indir_size == 0)
+		return;
+
+	/* Program the table */
+	for (i = 0; i < res->rss_indir_size; i++)
+		cass_config_indir_entry(hw, res->portal_index_indir_base + i,
+					res->ptn_rss[res->indir_table[i]]);
+
+	/* Re-enable hashing */
+	cass_eth_set_hash_types(cdev, res, &entry);
+}
+EXPORT_SYMBOL(cxi_eth_set_indir_table);
+
+/**
+ * cxi_eth_clear_indir_table() - Clear the indirection tables
+ *
+ * Reset the indirection table, which disables RSS hashing.
+ *
+ * @cdev: CXI device
+ * @res: Ethernet resource with catch-all portal in C_PTLTE_ETHERNET state
+ *
+ * @return: 0 on success or a negative errno
+ */
+void cxi_eth_clear_indir_table(struct cxi_dev *cdev, struct cxi_eth_res *res)
+{
+	static const struct c_rmu_cfg_ptlte_set_ctrl_table_entry entry = {};
+
+	cass_eth_set_hash_types(cdev, res, &entry);
+}
+EXPORT_SYMBOL(cxi_eth_clear_indir_table);
+
+/**
+ * cxi_eth_get_hash_key() - Retrieve the RSS hash key
+ *
+ * @cdev: CXI device
+ * @key: A sufficiently large (CXI_ETH_HASH_KEY_SIZE) array to store the key.
+ */
+void cxi_eth_get_hash_key(struct cxi_dev *cdev, u8 *key)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_rmu_cfg_hash_key hash_key;
+
+	spin_lock(&hw->rmu_lock);
+	cass_read(hw, C_RMU_CFG_HASH_KEY, &hash_key, sizeof(hash_key));
+	spin_unlock(&hw->rmu_lock);
+
+	memcpy(key, hash_key.qw, CXI_ETH_HASH_KEY_SIZE);
+}
+EXPORT_SYMBOL(cxi_eth_get_hash_key);
+
+/**
+ * cxi_set_ethernet_threshold() - Configure the Ethernet buffer threshold
+ * @cdev: CXI device
+ * @threshold: Threshold to set
+ *
+ * See C_LPE_CFG_ETHERNET_THRESHOLD documentation
+ */
+void cxi_set_ethernet_threshold(struct cxi_dev *cdev, unsigned int threshold)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_lpe_cfg_ethernet_threshold eth_thr = {
+		.threshold = threshold,
+	};
+
+	if (!cdev->is_physfn)
+		return;
+
+	cass_write(hw, C_LPE_CFG_ETHERNET_THRESHOLD, &eth_thr, sizeof(eth_thr));
+}
+EXPORT_SYMBOL(cxi_set_ethernet_threshold);
+
+/**
+ * cxi_set_roce_rcv_seg() - Control RoCE receive segmentation
+ *
+ * Whether to enable or disable the RoCE receive segmentation. When
+ * enabled, the HW will put the RoCE payload in a separate SKB
+ * fragment, and the driver will add the RoCE CRC in a third fragment.
+ *
+ * @cdev: CXI device
+ * @enable: true to enable, false to disable
+ */
+void cxi_set_roce_rcv_seg(struct cxi_dev *cdev, bool enable)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_ixe_cfg_roce cfg_roce;
+
+	if (!cdev->is_physfn)
+		return;
+
+	cass_read(hw, C_IXE_CFG_ROCE, &cfg_roce, sizeof(cfg_roce));
+	cfg_roce.enable_1k = enable;
+	cfg_roce.enable_2k = enable;
+	cfg_roce.enable_4k = enable;
+	cass_write(hw, C_IXE_CFG_ROCE, &cfg_roce, sizeof(cfg_roce));
+}
+EXPORT_SYMBOL(cxi_set_roce_rcv_seg);
+
+static void cxi_eth_devinfo_vf(struct cxi_dev *cdev, struct cxi_eth_info *eth_info)
+{
+	const struct cxi_eth_dev_info_get_cmd cmd = {
+		.op = CXI_OP_ETH_DEV_INFO_GET,
+		.buf_size = sizeof(*eth_info),
+	};
+	size_t resp_len = sizeof(*eth_info);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), eth_info, &resp_len);
+	if (rc)
+		goto err;
+
+	if (resp_len != sizeof(*eth_info)) {
+		cxidev_err(cdev, "Invalid response length: %zu (expected %zu)\n",
+			   resp_len, sizeof(*eth_info));
+		goto err;
+	}
+
+	return;
+
+err:
+	memset(eth_info, 0, sizeof(*eth_info));
+}
+
+/**
+ * cxi_eth_devinfo() - Get some current Ethernet related device information
+ *
+ * @cdev: CXI device
+ * @eth_info: structure to return the information
+ */
+void cxi_eth_devinfo(struct cxi_dev *cdev, struct cxi_eth_info *eth_info)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_ixe_cfg_parser cfg_parser;
+
+	if (!cdev->is_physfn) {
+		cxi_eth_devinfo_vf(cdev, eth_info);
+		return;
+	}
+
+	cass_read(hw, C_IXE_CFG_PARSER, &cfg_parser, sizeof(cfg_parser));
+	eth_info->max_segment_size = (cfg_parser.eth_segment + 1) * 128;
+	ether_addr_copy(eth_info->default_mac_addr, hw->default_mac_addr);
+
+	mutex_lock(&hw->qsfp_eeprom_lock);
+	eth_info->qsfp_eeprom_len = hw->qsfp_eeprom_page_len;
+	memcpy(eth_info->qsfp_eeprom, hw->qsfp_eeprom_page0, hw->qsfp_eeprom_page_len);
+	mutex_unlock(&hw->qsfp_eeprom_lock);
+
+	if (hw->fw_versions[FW_QSPI_BLOB])
+		strscpy(eth_info->fw_version, hw->fw_versions[FW_QSPI_BLOB],
+			sizeof(eth_info->fw_version));
+
+	if (hw->fw_versions[FW_OPROM])
+		strscpy(eth_info->erom_version, hw->fw_versions[FW_OPROM],
+			sizeof(eth_info->erom_version));
+
+	eth_info->ptp_clock_index = ptp_clock_index(hw->ptp_clock);
+	eth_info->min_free_shift = cdev->prop.min_free_shift;
+}
+EXPORT_SYMBOL(cxi_eth_devinfo);
+
+/**
+ * cxi_set_led_beacon() - Activate or deactivate LED beacon
+ *
+ * @cdev: CXI device
+ * @state: true to activate, false to deactivate
+ */
+void cxi_set_led_beacon(struct cxi_dev *cdev, bool state)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!cdev->is_physfn)
+		return;
+
+	hw->qsfp_beacon_active = state;
+	cass_link_set_led(hw);
+}
+EXPORT_SYMBOL(cxi_set_led_beacon);
+
+/**
+ * cxi_set_eth_name() - Set an Ethernet device name to a CXI interface
+ *
+ * When an Ethernet interface is added, call this function to match
+ * both interfaces. This is to be used primarily for logging, as it's
+ * not always clear which CXI device an Ethernet interface belongs to.
+ *
+ * @cdev: CXI device
+ * @name: Ethernet name assigned to the device, such as "hsn0" or "eth0".
+ */
+void cxi_set_eth_name(struct cxi_dev *cdev, const char *name)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	strscpy(cdev->eth_name, name, sizeof(cdev->eth_name));
+
+	/* Update name in sbl/sl (only in PF) */
+	if (cdev->is_physfn)
+		hw->link_ops->eth_name_set(hw, cdev->eth_name);
+}
+EXPORT_SYMBOL(cxi_set_eth_name);
+
+/**
+ * cxi_eth_cfg_timestamp() - timestamping of packets
+ *
+ * @cdev: CXI device
+ * @config: timestamp configuration. TX filter must be
+ *          HWTSTAMP_TX_ON/OFF, and RX filter must be
+ *          HWTSTAMP_FILTER_NONE or HWTSTAMP_FILTER_PTP_V2_L2_EVENT.
+ *
+ * TODO: locking ? from caller?
+ */
+int cxi_eth_cfg_timestamp(struct cxi_dev *cdev,
+			  struct hwtstamp_config *config)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_hni_cfg_gen cfg_gen;
+
+	if (!cdev->is_physfn)
+		return -EOPNOTSUPP;
+
+	if (config->flags != 0)
+		return -EINVAL;
+
+	if (config->tx_type != HWTSTAMP_TX_OFF &&
+	    config->tx_type != HWTSTAMP_TX_ON)
+		return -EINVAL;
+
+	if (config->rx_filter != HWTSTAMP_FILTER_NONE &&
+	    config->rx_filter != HWTSTAMP_FILTER_PTP_V2_L2_EVENT)
+		return -EINVAL;
+
+	/* Turn everything on if any timestamping is requested. */
+	if (config->tx_type != HWTSTAMP_TX_OFF)
+		config->tx_type = HWTSTAMP_TX_ON;
+
+	cass_read(hw, C_HNI_CFG_GEN, &cfg_gen, sizeof(cfg_gen));
+
+	cfg_gen.tx_timestamp_en = config->tx_type == HWTSTAMP_TX_ON;
+	cfg_gen.rx_timestamp_en =
+		config->rx_filter == HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+
+	if (cfg_gen.tx_timestamp_en) {
+		/* Only program IEEE-1588 packets. */
+		static const union c_hni_cfg_txts_l2_mask l2_mask = {
+			.dmac = ~0,
+			.ethertype = 0,
+		};
+		static const union c_hni_cfg_txts_l2_match l2_match = {
+			.dmac = 0,
+			.ethertype = PTP_L2_ETHERTYPE,
+		};
+		static const union c_hni_cfg_txts_l3_mask l3_mask = {
+			.hdr = ~0,
+		};
+		static const union c_hni_cfg_txts_l3_match l3_match = {
+			.hdr = 0,
+		};
+		union c_hni_pml_sts_tx_pcs tx_ts;
+
+		cass_write(hw, C_HNI_CFG_TXTS_L2_MASK,
+			   &l2_mask, sizeof(l2_mask));
+		cass_write(hw, C_HNI_CFG_TXTS_L2_MATCH,
+			   &l2_match, sizeof(l2_match));
+		cass_write(hw, C_HNI_CFG_TXTS_L3_MASK,
+			   &l3_mask, sizeof(l3_mask));
+		cass_write(hw, C_HNI_CFG_TXTS_L3_MATCH,
+			   &l3_match, sizeof(l3_match));
+
+		/* Set the timestamp format/shift in 2 CSRs */
+		cfg_gen.timestamp_fmt = hw->tx_timestamp_shift;
+
+		if (cass_version(hw, CASSINI_1)) {
+			union c1_hni_pml_cfg_pcs cfg_pcs;
+
+			cass_read(hw, C1_HNI_PML_CFG_PCS, &cfg_pcs, sizeof(cfg_pcs));
+			cfg_pcs.timestamp_shift = hw->tx_timestamp_shift;
+			cass_write(hw, C1_HNI_PML_CFG_PCS, &cfg_pcs, sizeof(cfg_pcs));
+
+			/* Clear the timestamp_valid bit just in case */
+			cass_read(hw, C1_HNI_PML_STS_TX_PCS, &tx_ts, sizeof(tx_ts));
+			tx_ts.timestamp_valid = 0;
+			cass_write(hw, C1_HNI_PML_STS_TX_PCS, &tx_ts, sizeof(tx_ts));
+		} else {
+			union ss2_port_pml_cfg_pcs cfg_pcs;
+
+			cass_read(hw, SS2_PORT_PML_CFG_PCS, &cfg_pcs, sizeof(cfg_pcs));
+			cfg_pcs.timestamp_shift = hw->tx_timestamp_shift;
+			cass_write(hw, SS2_PORT_PML_CFG_PCS, &cfg_pcs, sizeof(cfg_pcs));
+
+			/* Clear the timestamp_valid bit just in case */
+			cass_read(hw, SS2_PORT_PML_STS_TX_PCS(0), &tx_ts, sizeof(tx_ts));
+			tx_ts.timestamp_valid = 0;
+			cass_write(hw, SS2_PORT_PML_STS_TX_PCS(0), &tx_ts, sizeof(tx_ts));
+		}
+	}
+
+	if (cfg_gen.rx_timestamp_en) {
+		/* WORKAROUND: Cassini ERRATA-3258, only program IEEE-1588 packets. */
+		static const union c_hni_cfg_rxts_l2_mask l2_mask = {
+			.dmac = 0,
+			.ethertype = 0,
+		};
+		static const union c_hni_cfg_rxts_l2_match l2_match = {
+			.dmac = PTP_L2_MAC,
+			.ethertype = PTP_L2_ETHERTYPE,
+		};
+		static const union c_hni_cfg_rxts_l3_mask l3_mask = {
+			.hdr = ~0,
+		};
+		static const union c_hni_cfg_rxts_l3_match l3_match = {
+			.hdr = 0,
+		};
+
+		cass_write(hw, C_HNI_CFG_RXTS_L2_MASK,
+			   &l2_mask, sizeof(l2_mask));
+		cass_write(hw, C_HNI_CFG_RXTS_L2_MATCH,
+			   &l2_match, sizeof(l2_match));
+		cass_write(hw, C_HNI_CFG_RXTS_L3_MASK,
+			   &l3_mask, sizeof(l3_mask));
+		cass_write(hw, C_HNI_CFG_RXTS_L3_MATCH,
+			   &l3_match, sizeof(l3_match));
+	}
+
+	cass_write(hw, C_HNI_CFG_GEN, &cfg_gen, sizeof(cfg_gen));
+	cass_flush_pci(hw);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_eth_cfg_timestamp);
+
+/**
+ * cxi_eth_get_tx_timestamp() - Retrieve current Ethernet TX timestamp
+ *
+ * After the driver requested timestamping of Ethernet TX packets, the
+ * Ethernet driver can retrieve the current timestamp upon the send
+ * completion.
+ *
+ * @cdev: CXI device
+ * @tstamps: storage to return the timestamp
+ **/
+int cxi_eth_get_tx_timestamp(struct cxi_dev *cdev,
+			     struct skb_shared_hwtstamps *tstamps)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_hni_err_elapsed_time err_elapsed_time;
+	union c_hni_cfg_rt_offset rt_offset;
+	union c_hni_pml_sts_tx_pcs tx_ts;
+	struct timespec64 ts;
+	u64 ts_sec;
+	u64 curr_sec;
+	u64 diff_sec;
+
+	if (!cdev->is_physfn)
+		return -EOPNOTSUPP;
+
+	/* Note: union c_hni_pml_sts_tx_pcs and union
+	 * ss2_port_pml_sts_tx_pcs are identical structures.
+	 */
+	if (cass_version(hw, CASSINI_1))
+		cass_read(hw, C1_HNI_PML_STS_TX_PCS, &tx_ts, sizeof(tx_ts));
+	else
+		cass_read(hw, SS2_PORT_PML_STS_TX_PCS(0), &tx_ts, sizeof(tx_ts));
+
+	cass_read(hw, C_HNI_ERR_ELAPSED_TIME,
+		  &err_elapsed_time, sizeof(err_elapsed_time));
+	cass_read(hw, C_HNI_CFG_RT_OFFSET, &rt_offset, sizeof(rt_offset));
+
+	if (WARN_ON_ONCE(!tx_ts.timestamp_valid))
+		return -ENODATA;
+
+	switch (hw->tx_timestamp_shift) {
+	case 0:
+		ts.tv_nsec = tx_ts.timestamp & (BIT(30) - 1) * 1;
+		ts_sec = tx_ts.timestamp >> 30;
+		curr_sec = err_elapsed_time.seconds & ((BIT(2) - 1));
+		diff_sec = BIT(2);
+		break;
+	case 1:
+		ts.tv_nsec = (tx_ts.timestamp & (BIT(28) - 1)) * 4;
+		ts_sec = tx_ts.timestamp >> 28;
+		curr_sec = err_elapsed_time.seconds & ((BIT(4) - 1));
+		diff_sec = BIT(4);
+		break;
+	case 2:
+		ts.tv_nsec = (tx_ts.timestamp & (BIT(26) - 1)) * 16;
+		ts_sec = tx_ts.timestamp >> 26;
+		curr_sec = err_elapsed_time.seconds & ((BIT(6) - 1));
+		diff_sec = BIT(6);
+		break;
+	case 3:
+		ts.tv_nsec = (tx_ts.timestamp & (BIT(24) - 1)) * 64;
+		ts_sec = tx_ts.timestamp >> 24;
+		curr_sec = err_elapsed_time.seconds & ((BIT(8) - 1));
+		diff_sec = BIT(8);
+		break;
+	default:
+		/* Normally unreachable */
+		cxidev_WARN_ONCE(cdev, true, "bad tx_timestamp_shift");
+		return -EINVAL;
+	}
+
+	if (curr_sec < ts_sec)
+		diff_sec += curr_sec - ts_sec;
+	else
+		diff_sec = curr_sec - ts_sec;
+
+	ts.tv_sec = rt_offset.seconds + err_elapsed_time.seconds - diff_sec;
+
+	tstamps->hwtstamp = timespec64_to_ktime(ts);
+
+	/* Clear valid bit for next packet. */
+	tx_ts.timestamp_valid = 0;
+	if (cass_version(hw, CASSINI_1))
+		cass_write(hw, C1_HNI_PML_STS_TX_PCS, &tx_ts, sizeof(tx_ts));
+	else
+		cass_write(hw, SS2_PORT_PML_STS_TX_PCS(0), &tx_ts, sizeof(tx_ts));
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_eth_get_tx_timestamp);
+
+static void cxi_eth_get_pause_vf(struct cxi_dev *cdev, struct ethtool_pauseparam *pause)
+{
+	struct cxi_eth_pause_get_cmd cmd = {
+		.op = CXI_OP_ETH_PAUSE_GET,
+	};
+	struct cxi_eth_get_pause_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc) {
+		/* On error, set pause to disabled */
+		pause->tx_pause = false;
+		pause->rx_pause = false;
+		return;
+	}
+
+	pause->tx_pause = resp.tx_pause;
+	pause->rx_pause = resp.rx_pause;
+}
+
+/**
+ * cxi_eth_get_pause() - Enable of disable the RX and TX pause packets
+ *
+ * @cdev: CXI device
+ * @pause: ethtool parameters
+ */
+void cxi_eth_get_pause(struct cxi_dev *cdev, struct ethtool_pauseparam *pause)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_hni_cfg_pause_tx_ctrl tx_ctrl_cfg;
+	union c_hni_cfg_pause_rx_ctrl rx_ctrl_cfg;
+
+	if (!cdev->is_physfn) {
+		cxi_eth_get_pause_vf(cdev, pause);
+		return;
+	}
+
+	cass_read(hw, C_HNI_CFG_PAUSE_TX_CTRL, &tx_ctrl_cfg,
+		  sizeof(tx_ctrl_cfg));
+	pause->tx_pause = tx_ctrl_cfg.enable_send_pause != 0;
+
+	cass_read(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl_cfg,
+		  sizeof(rx_ctrl_cfg));
+	pause->rx_pause = rx_ctrl_cfg.enable_rec_pause != 0;
+}
+EXPORT_SYMBOL(cxi_eth_get_pause);
+
+/**
+ * cxi_eth_set_pause() - Enable of disable the RX and TX pause packets
+ *
+ * @cdev: CXI device
+ * @pause: ethtool parameters
+ */
+void cxi_eth_set_pause(struct cxi_dev *cdev, const struct ethtool_pauseparam *pause)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!cdev->is_physfn)
+		return;
+
+	cass_tc_set_tx_pause_all(hw, pause->tx_pause);
+	cass_tc_set_rx_pause_all(hw, pause->rx_pause);
+}
+EXPORT_SYMBOL(cxi_eth_set_pause);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_hmm.c b/drivers/net/ethernet/hpe/ss1/cass_hmm.c
new file mode 100644
index 000000000000..47fd47ea0ae7
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_hmm.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019 Hewlett Packard Enterprise Development LP */
+
+/* Handle differences in the HMM interface for different kernel versions. */
+
+#include "cass_core.h"
+#include "linux/sched/mm.h"
+
+int cass_vma_write_flag(struct mm_struct *mm, ulong start, ulong end, u32 flags)
+{
+	int write;
+	struct vm_area_struct *vma;
+
+	vma = find_vma_intersection(mm, start, end);
+
+	/* When prefetching, indicate to caller there is no VMA */
+	if (!vma && (flags & CXI_MAP_PREFETCH))
+		return -ENOENT;
+
+	if (!vma || start < vma->vm_start) {
+		pr_warn("No VMA covering 0x%016lx)\n", start);
+		return -EINVAL;
+	}
+
+	write = vma->vm_flags & VM_WRITE;
+	if (!write && (flags & CXI_MAP_WRITE)) {
+		pr_warn("VMA does not have write permissions\n");
+		return -EINVAL;
+	}
+
+	return write;
+}
+
+void cass_notifier_cleanup(struct cxi_md_priv *md_priv)
+{
+	if (!md_priv->mn_sub.mm)
+		return;
+
+	mmu_interval_notifier_remove(&md_priv->mn_sub);
+	md_priv->mn_sub.mm = NULL;
+}
+
+/* Fault in pages from all VMAs in the address range.
+ * When prefetching, ignore failures of VMAs that may have errors.
+ * If -EBUSY is returned, continue at the address where we left off on
+ * the next invocation.
+ *
+ * When faulting pages, the full range must be backed by contiguous VMAs.
+ * Return a failure if all pages cannot be faulted.
+ *
+ * When prefetching, if no VMAs are found, return 0.
+ */
+static int cass_range_fault(struct hmm_range *range, struct mm_struct *mm,
+			    const struct ac_map_opts *m_opts, ulong end)
+{
+	int ret = 0;
+	bool success = false;
+	ulong start = range->start;
+	ulong *pfns = range->hmm_pfns;
+	int flags = m_opts->flags;
+	int page_shift = m_opts->page_shift;
+	struct vm_area_struct *vma;
+#ifdef VMA_ITERATOR
+	VMA_ITERATOR(vmi, mm, start);
+#endif
+
+	vma = find_vma_intersection(mm, range->start, range->end);
+	if (!vma) {
+		if (flags & CXI_MAP_FAULT) {
+			pr_debug("Faulting region not backed by VMA\n");
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	/* When faulting, we expect the full range to be covered by VMA(s) */
+	if (range->default_flags & HMM_PFN_REQ_FAULT)
+		return hmm_range_fault(range);
+
+	for_each_vma(vmi, vma) {
+		if (vma->vm_start >= end)
+			break;
+
+		/* When prefetching, skip over VMAs that don't match
+		 * the requested permissions.
+		 */
+		if ((flags & CXI_MAP_WRITE && !(vma->vm_flags & VM_WRITE)) ||
+		    (flags & CXI_MAP_READ && !(vma->vm_flags & VM_READ))) {
+			continue;
+		}
+
+		if (vma->vm_end < end)
+			range->end = vma->vm_end;
+		else
+			range->end = end;
+
+		if (range->start < vma->vm_start)
+			range->start = vma->vm_start;
+
+		range->hmm_pfns = pfns + ((range->start - start) >> page_shift);
+
+		ret = hmm_range_fault(range);
+		if (ret == -EBUSY || ret == -ENOMEM)
+			return ret;
+
+		if (!ret || success)
+			success = true;
+
+		atu_debug("start:%lx end:%lx len:%lx vm_start:%lx vm_end:%lx vm_flags:%lx ret:%d\n",
+			  range->start, range->end, range->end - range->start,
+			  vma->vm_start, vma->vm_end, vma->vm_flags, ret);
+	}
+
+	return success ? 0 : ret;
+}
+
+/**
+ * cass_mirror_fault() - Fault and mirror an address range
+ *
+ * @m_opts: map options
+ * @pfns: pfns to mirror
+ * @count: number of pages to mirror
+ * @addr: start virtual address to fault
+ * @len: length of address range to fault
+ *
+ * @return: 0 on success or negative error value
+ */
+int cass_mirror_fault(const struct ac_map_opts *m_opts, u64 *pfns, int count,
+		      uintptr_t addr, size_t len)
+{
+	long ret;
+	bool is_huge_page = false;
+	unsigned long timeout;
+	struct hmm_range range = {};
+	u64 end = addr + len;
+	struct cxi_md_priv *md_priv = m_opts->md_priv;
+	struct cass_ac *cac = md_priv->cac;
+	ulong addr_mask = MASK(m_opts->huge_shift);
+	struct mmu_interval_notifier *mn_sub = &m_opts->md_priv->mn_sub;
+	struct mm_struct *mm = mn_sub->mm;
+
+	range.start = addr;
+	range.end = end;
+	range.hmm_pfns = (unsigned long *)pfns;
+	range.pfn_flags_mask = 0;
+	range.notifier = mn_sub;
+
+	if (!(m_opts->flags & CXI_MAP_PREFETCH))
+		range.default_flags = HMM_PFN_REQ_FAULT;
+
+	if (!mn_sub->mm) {
+		pr_debug("Invalid md addr:%lx\n", addr);
+		return -ENOENT;
+	}
+
+	if (!mmget_not_zero(mm)) {
+		pr_debug("mm_user is 0 addr:%lx\n", addr);
+		return -ESRCH;
+	}
+
+	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+again:
+	range.notifier_seq = mmu_interval_read_begin(mn_sub);
+	mmap_read_lock(mm);
+
+	ret = cass_vma_write_flag(mm, addr, end, m_opts->flags);
+	if (ret < 0) {
+		/* An -ENOENT indicates there is no VMA when prefetching. */
+		if (ret == -ENOENT)
+			ret = 0;
+
+		goto out_unlock;
+	}
+
+	range.default_flags |= ret ? HMM_PFN_REQ_WRITE : 0;
+
+	ret = cass_range_fault(&range, mm, m_opts, end);
+	mmap_read_unlock(mm);
+	if (ret) {
+		if (ret == -EBUSY && !time_after(jiffies, timeout))
+			goto again;
+
+		goto out;
+	}
+
+	/* ATS mode just needs to fault the pages. */
+	if (cac->flags & CXI_MAP_ATS) {
+		if (mmu_interval_read_retry(mn_sub, range.notifier_seq))
+			goto again;
+
+		ret = count;
+		goto out;
+	}
+
+	mutex_lock(&cac->ac_mutex);
+
+	if (mmu_interval_read_retry(mn_sub, range.notifier_seq)) {
+		mutex_unlock(&cac->ac_mutex);
+		goto again;
+	}
+
+	if (m_opts->is_huge_page && !(addr & addr_mask) &&
+	    (len >= BIT(m_opts->huge_shift)))
+		is_huge_page = true;
+
+	ret = cass_pfns_mirror(md_priv, m_opts, pfns, count, is_huge_page);
+
+	mutex_unlock(&cac->ac_mutex);
+
+	mmput(mm);
+
+	return ret;
+
+out_unlock:
+	mmap_read_unlock(mm);
+out:
+	mmput(mm);
+
+	return ret;
+}
+
+/**
+ * cass_sync_pagetables - Called by the hmm notifier to clear page table
+ *                        entries and invalidate cache entries.
+ *                        mmap_sem is held during this call.
+ *
+ * @mn_sub: MMU interval notifier
+ * @update: update information for callback
+ * @cur_seq:
+ */
+static bool cass_sync_pagetables(struct mmu_interval_notifier *mn_sub,
+				 const struct mmu_notifier_range *update,
+				 unsigned long cur_seq)
+{
+	struct cxi_md_priv *md_priv = container_of(mn_sub, struct cxi_md_priv,
+						   mn_sub);
+	struct cass_dev *hw = container_of(md_priv->cac->lni_priv->dev,
+					   struct cass_dev, cdev);
+	struct cxi_md md = md_priv->md;
+	unsigned long start = update->start;
+	unsigned long end = update->end;
+	u64 va_end = md.va + md.len;
+	u64 s = max_t(u64, md.va, start);
+	u64 e = min_t(u64, va_end, end);
+	u64 offset = s - md.va;
+
+	if (md_priv->flags & CXI_MAP_ATS)
+		return true;
+
+	if (!mmu_notifier_range_blockable(update))
+		return false;
+
+	pr_debug("md:%d va:%llx s:%llx e:%llx update start:%lx end:%lx\n",
+		 md.id, md.va, s, e, start, end);
+
+	mutex_lock(&md_priv->cac->ac_mutex);
+	mmu_interval_set_seq(mn_sub, cur_seq);
+
+	cass_clear_range(md_priv, md.iova + offset, e - s);
+	mutex_unlock(&md_priv->cac->ac_mutex);
+	cass_invalidate_range(md_priv->cac, md.iova + offset, e - s);
+	atomic_inc(&hw->dcpl_nta_mn_inval);
+
+	return true;
+}
+
+static const struct mmu_interval_notifier_ops cass_notifier_ops = {
+	.invalidate = cass_sync_pagetables,
+};
+
+/**
+ * cass_mmu_notifier_insert() - Set up notifier for this descriptor
+ *
+ * @md_priv: Private memory descriptor
+ * @m_opts:  User options
+ *
+ * @return: 0 on success or negative value on error
+ */
+int cass_mmu_notifier_insert(struct cxi_md_priv *md_priv,
+			     const struct ac_map_opts *m_opts)
+{
+	int ret;
+
+	ret = mmu_interval_notifier_insert(&md_priv->mn_sub,
+					   current->mm,
+					   m_opts->va_start,
+					   m_opts->va_len,
+					   &cass_notifier_ops);
+	if (ret)
+		return ret;
+
+	if (m_opts->flags & (CXI_MAP_FAULT | CXI_MAP_PREFETCH)) {
+		ret = cass_mirror_odp(m_opts, md_priv->cac,
+				      m_opts->va_len >> m_opts->page_shift,
+				      m_opts->va_start);
+		if (ret)
+			cass_notifier_cleanup(md_priv);
+	}
+
+	return ret;
+}
+
+int cass_odp_supported(struct cass_dev *hw, u32 flags)
+{
+	if (cass_version(hw, CASSINI_1_0) && !(flags & CXI_MAP_PIN) &&
+	    (flags & CXI_MAP_USER_ADDR)) {
+		cxidev_info(&hw->cdev, "Cassini 1.0 does not support ODP\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (cass_version(hw, CASSINI_1) && (flags & CXI_MAP_ATS) &&
+	    !hw->ats_c1_odp_enable && !ats_c1_override) {
+		cxidev_dbg(&hw->cdev,
+			   "ATS support requires invalidate interface for Cassini 1.x\n");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_hni.c b/drivers/net/ethernet/hpe/ss1/cass_hni.c
new file mode 100644
index 000000000000..212bd226a338
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_hni.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019-2022, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Cassini device handler */
+
+#include <linux/iopoll.h>
+
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/hpe/sbl/sbl.h>
+#include "cass_core.h"
+#include "cass_cable.h"
+
+static unsigned int pause_too_long_timeout = 1000;
+module_param(pause_too_long_timeout, uint, 0444);
+MODULE_PARM_DESC(pause_too_long_timeout,
+		 "Pause too long error timeout in ms, up to 17 min (rounded up to pow 2)");
+
+/* 1ms at a 1GHz clock is 1000000 cycles, so we would need to monitor
+ * bit 20 for a 1ms to 2ms timer.
+ */
+#define PAUSE_MSEC_BIT_OFFSET 20U
+#define RX_CTRL_TIMER_BIT_OFFSET 9U
+#define RX_CTRL_TIMER_BIT_MAX 31
+
+/* Increase pause repeat period to repeat every 156 quantas. With the default
+ * pause quanta configuration, repeat period is ~400 nsecs.
+ */
+#define PAUSE_REPEAT_PERIOD 156U
+
+/* Try to clear a pause. */
+static void pause_timeout_worker(struct work_struct *work)
+{
+	struct cass_dev *hw =
+		container_of(work, struct cass_dev, pause_timeout_work);
+	union c_hni_cfg_pause_rx_ctrl rx_ctrl_cfg;
+	union c_hni_cfg_pause_rx_ctrl old_rx_ctrl_cfg;
+	union c_hni_sts_pause_timeout pause_timeout;
+	void __iomem *csr;
+	unsigned int rc;
+
+	/* Clear pfc_rec_enable to prevent an RX_PAUSE_ERR. */
+	cass_read(hw, C_HNI_CFG_PAUSE_RX_CTRL, &old_rx_ctrl_cfg,
+		  sizeof(old_rx_ctrl_cfg));
+	rx_ctrl_cfg = old_rx_ctrl_cfg;
+	rx_ctrl_cfg.pfc_rec_enable = 0;
+	cass_write(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl_cfg, sizeof(rx_ctrl_cfg));
+
+	/* Wait until pause clears for every PCP, ie bit 3 of each PCP
+	 * is 0.
+	 */
+	csr = cass_csr(hw, C_HNI_STS_PAUSE_TIMEOUT);
+	rc = readq_poll_timeout(csr, pause_timeout.qw,
+				(pause_timeout.qw & 0x88888888ULL) == 0,
+				1, 5000);
+	if (rc)
+		cxidev_warn(&hw->cdev,
+			    "Pause too long not cleared after timeout: %llx\n",
+			    pause_timeout.qw);
+
+	/* Restore pfc_rec_enable */
+	cass_write(hw, C_HNI_CFG_PAUSE_RX_CTRL, &old_rx_ctrl_cfg,
+		   sizeof(old_rx_ctrl_cfg));
+}
+
+static void pause_timeout_cb(struct cass_dev *hw, unsigned int irq,
+			     bool is_ext, unsigned int bitn)
+{
+	queue_work(system_long_wq, &hw->pause_timeout_work);
+}
+
+/* Re-program the HNI and OXE pause quanta when the link is going up,
+ * as they are dependent on the link speed, which may have changed.
+ */
+static const struct quantas {
+	unsigned int speed;
+	union c_hni_cfg_pause_quanta q;
+} c1_quantas[] = {
+	{ .speed = SPEED_50000, .q = { .sub_period = 80, .sub_value = 0x7d000 }},
+	{ .speed = SPEED_100000, .q = { .sub_period = 40, .sub_value = 0x7d000 }},
+	{ .speed = SPEED_200000, .q = { .sub_period = 20, .sub_value = 0x7d000 }},
+	{ .speed = SPEED_400000, .q = { .sub_period = 10, .sub_value = 0x7d000 }},
+	{ }
+}, c2_quantas[] = {
+	{ .speed = SPEED_25000, .q = { .sub_period = 176, .sub_value = 0x7d000 }},
+	{ .speed = SPEED_50000,  .q = { .sub_period = 88, .sub_value = 0x7d000 }},
+	{ .speed = SPEED_100000, .q = { .sub_period = 44, .sub_value = 0x7d000 }},
+	{ .speed = SPEED_200000, .q = { .sub_period = 22, .sub_value = 0x7d000 }},
+	{ .speed = SPEED_400000, .q = { .sub_period = 11, .sub_value = 0x7d000 }},
+	{ }
+};
+
+void update_hni_link_up(struct cass_dev *hw)
+{
+	union c_cq_cfg_fq_thresh_table fq_thresh = {};
+	struct cxi_link_info link_info;
+	const struct quantas *quanta;
+	int i;
+
+	cxi_link_mode_get(&hw->cdev, &link_info);
+
+	/* Update the Pause Quanta. */
+	if (cass_version(hw, CASSINI_1))
+		quanta = c1_quantas;
+	else
+		quanta = c2_quantas;
+
+	while (quanta->speed && quanta->speed != link_info.speed)
+		quanta++;
+
+	if (quanta->speed == 0) {
+		cxidev_warn(&hw->cdev, "Missing pause quanta values for speed %u\n",
+			    link_info.speed);
+	} else {
+		cass_write(hw, C_OXE_CFG_PAUSE_QUANTA, &quanta->q, sizeof(quanta->q));
+		cass_write(hw, C_HNI_CFG_PAUSE_QUANTA, &quanta->q, sizeof(quanta->q));
+	}
+
+	/* and the FQ threshold */
+	if (link_info.speed == SPEED_400000)
+		fq_thresh.thresh = 8 * 1024 * 1024;
+	else
+		fq_thresh.thresh = 4 * 1024 * 1024;
+
+	for (i = 0; i < C_CQ_CFG_FQ_THRESH_TABLE_ENTRIES; i++)
+		cass_write(hw, C_CQ_CFG_FQ_THRESH_TABLE(i),
+			   &fq_thresh, sizeof(fq_thresh));
+}
+
+void cass_hni_init(struct cass_dev *hw)
+{
+	int pause_timeout_bit;
+	union c_hni_cfg_pause_rx_ctrl rx_ctrl;
+	union c_hni_cfg_pause_timing timing;
+
+	/* Clear all default reserved packet buffer space. */
+	cass_clear(hw, C_HNI_CFG_PBUF(0), C_HNI_CFG_PBUF_SIZE);
+
+	if (pause_too_long_timeout) {
+		/* Up align pause too long timeout to a power of 2
+		 * since hardware timeout operates on a specific bit.
+		 */
+		pause_too_long_timeout =
+			roundup_pow_of_two(pause_too_long_timeout);
+
+		/* By HW design, the pause_timeout interrupt is only
+		 * generated after 8 timeouts. Account for that.
+		 */
+		pause_too_long_timeout = max_t(unsigned int,
+					       pause_too_long_timeout / 8, 1);
+
+		pause_timeout_bit = ffs(pause_too_long_timeout) - 1 +
+			PAUSE_MSEC_BIT_OFFSET - RX_CTRL_TIMER_BIT_OFFSET;
+
+		if (pause_timeout_bit > RX_CTRL_TIMER_BIT_MAX) {
+			cxidev_info(&hw->cdev,
+				    "pause_too_long_timeout is too big. Setting to max.\n");
+			pause_timeout_bit = RX_CTRL_TIMER_BIT_MAX;
+		}
+	} else {
+		pause_timeout_bit = 0;
+	}
+
+	cass_read(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl, sizeof(rx_ctrl));
+	rx_ctrl.timer_bit = pause_timeout_bit;
+	cass_write(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl, sizeof(rx_ctrl));
+
+	cass_read(hw, C_HNI_CFG_PAUSE_TIMING, &timing, sizeof(timing));
+	timing.pause_repeat_period = PAUSE_REPEAT_PERIOD;
+	cass_write(hw, C_HNI_CFG_PAUSE_TIMING, &timing, sizeof(timing));
+
+	INIT_WORK(&hw->pause_timeout_work, pause_timeout_worker);
+
+	/* Register pause timeout callback */
+	hw->hni_pause_err.irq = C_HNI_IRQA_MSIX_INT;
+	hw->hni_pause_err.is_ext = false;
+	if (cass_version(hw, CASSINI_1))
+		hw->hni_pause_err.err_flags.c1_hni.pause_timeout = 1;
+	else
+		hw->hni_pause_err.err_flags.c2_hni.pause_timeout = 1;
+
+	hw->hni_pause_err.cb = pause_timeout_cb;
+	cxi_register_hw_errors(hw, &hw->hni_pause_err);
+
+	/* Register uncor callback */
+	hw->hni_pml_uncor_err.irq = C_HNI_PML_IRQA_MSIX_INT;
+	hw->hni_pml_uncor_err.is_ext = false;
+	hw->hni_uncor_err.irq = C_HNI_IRQA_MSIX_INT;
+	hw->hni_uncor_err.is_ext = false;
+	if (cass_version(hw, CASSINI_1)) {
+		hw->hni_pml_uncor_err.err_flags.c1_hni_pml.llr_tx_dp_mbe = 1;
+		hw->hni_uncor_err.err_flags.c1_hni.tx_flit_ucor = 1;
+		hw->hni_uncor_err.err_flags.c1_hni.credit_uflw = 1;
+	} else {
+		hw->hni_pml_uncor_err.err_flags.ss2_port_pml.llr_tx_dp_mbe = 1;
+		hw->hni_uncor_err.err_flags.c2_hni.tx_flit_ucor = 1;
+		hw->hni_uncor_err.err_flags.c2_hni.credit_uflw = 1;
+	}
+
+	hw->hni_pml_uncor_err.cb = uncor_cb;
+	hw->hni_uncor_err.cb = uncor_cb;
+	cxi_register_hw_errors(hw, &hw->hni_pml_uncor_err);
+	cxi_register_hw_errors(hw, &hw->hni_uncor_err);
+}
+
+void cass_hni_fini(struct cass_dev *hw)
+{
+	cxi_unregister_hw_errors(hw, &hw->hni_pause_err);
+	cxi_unregister_hw_errors(hw, &hw->hni_pml_uncor_err);
+	cxi_unregister_hw_errors(hw, &hw->hni_uncor_err);
+	cancel_work_sync(&hw->pause_timeout_work);
+}
+
+/**
+ * cass_cable_scan() - Read cable info from microcontroller
+ *
+ * Read data of the cable headshell and pass it down to the phy
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_cable_scan(struct cass_dev *hw)
+{
+	struct sbl_media_attr attr = SBL_MEDIA_ATTR_INITIALIZER;
+
+	cxidev_dbg(&hw->cdev, "cable scan\n");
+
+	/* This cable scan may be called before hw->port
+	 * is initialized, so check for that first. In this case, a cable scan
+	 * will be run as part of probe, so we can just return for now.
+	 */
+	if (!hw->port)
+		return 0;
+
+	/* Check if a cable is present */
+	switch (hw->uc_platform) {
+	case CUC_BOARD_TYPE_BRAZOS:
+		cxidev_dbg(&hw->cdev, "Platform: BRAZOS\n");
+		if (!cass_is_cable_present(hw)) {
+			cxidev_warn(&hw->cdev, "HSN cable is not plugged\n");
+			cass_link_headshell_remove(hw);
+			return 0;
+		}
+
+		if (cass_parse_heashell_data(hw, &attr, &hw->qsfp_format))
+			return cass_link_headshell_error(hw);
+
+		/* AOCs need to be put into high-power mode */
+		if (attr.media != SBL_LINK_MEDIA_ELECTRICAL)
+			if (cass_headshell_power_up(hw, hw->qsfp_format))
+				return cass_link_headshell_error(hw);
+
+		/* Squirrel away the media info in device struct -
+		 * we will make decisions based off it later
+		 */
+		hw->port->lattr.mattr = attr;
+		return cass_link_headshell_insert(hw, &attr);
+
+	case CUC_BOARD_TYPE_SAWTOOTH:
+		cxidev_dbg(&hw->cdev, "Platform: SAWTOOTH\n");
+		attr.media = SBL_LINK_MEDIA_ELECTRICAL;
+		attr.len = SBL_LINK_LEN_BACKPLANE;
+		attr.info = SBL_MEDIA_INFO_SUPPORTS_BS_200G |
+			SBL_MEDIA_INFO_SUPPORTS_BJ_100G |
+			SBL_MEDIA_INFO_SUPPORTS_CD_100G |
+			SBL_MEDIA_INFO_SUPPORTS_CD_50G;
+
+		/* Squirrel away the media info in device struct -
+		 * we will make decisions based off it later
+		 */
+		hw->port->lattr.mattr = attr;
+
+		return cass_link_media_config(hw, &attr);
+
+	case CUC_BOARD_TYPE_KENNEBEC:
+	case CUC_BOARD_TYPE_SOUHEGAN:
+		cxidev_dbg(&hw->cdev, "Platform: KENNEBEC | SOUHEGAN\n");
+		if (!cass_is_cable_present(hw)) {
+			cxidev_warn(&hw->cdev, "HSN cable is not plugged\n");
+			cass_link_headshell_remove(hw);
+			return 0;
+		}
+		if (cass_parse_heashell_data(hw, &attr, &hw->qsfp_format))
+			return cass_link_headshell_error(hw);
+		return cass_link_headshell_insert(hw, &attr);
+
+	case CUC_BOARD_TYPE_WASHINGTON:
+		cxidev_dbg(&hw->cdev, "Platform: WASHINGTON\n");
+		attr.media = SBL_LINK_MEDIA_ELECTRICAL;
+		attr.len   = SBL_LINK_LEN_BACKPLANE;
+		attr.info  = SBL_MEDIA_INFO_SUPPORTS_BS_200G;
+		return cass_link_media_config(hw, &attr);
+
+	default:
+		cxidev_err(&hw->cdev, "Platform %d is not supported\n",
+			   hw->uc_platform);
+		return -EINVAL;
+	}
+}
+
+/**
+ * cxi_set_max_eth_rxsize() - Configure maximum frame size on the receive side
+ *
+ * @cdev: CXI device
+ * @max_std_size: requested size, up to 9022.
+ */
+int cxi_set_max_eth_rxsize(struct cxi_dev *cdev, unsigned int max_std_size)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_hni_cfg_max_sizes new_rx;
+
+	if (max_std_size > ETHERNET_MAX_FRAME_SIZE)
+		return -EINVAL;
+
+	/* This is only called by the Ethernet driver, so locking is
+	 * not needed around the CSR.
+	 */
+	cass_read(hw, C_HNI_CFG_MAX_SIZES, &new_rx, sizeof(new_rx));
+	new_rx.max_std_size = max_std_size;
+	cass_write(hw, C_HNI_CFG_MAX_SIZES, &new_rx, sizeof(new_rx));
+
+	/* Store max Ethernet frame size for port configuration. */
+	hw->max_eth_rxsize = max_std_size;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_set_max_eth_rxsize);
+/**
+ * cxi_get_max_eth_rxsize_vf() - Fetch the current maximum Ethernet frame size from the PF
+ *
+ * @cdev: VF CXI device
+ *
+ * Returns the maximum Ethernet frame size as reported by the PF, or a negative
+ * errno on failure.
+ */
+static int cxi_get_max_eth_rxsize_vf(struct cxi_dev *cdev)
+{
+	const struct cxi_eth_max_rxsize_get_cmd cmd = {
+		.op = CXI_OP_ETH_MAX_RXSIZE_GET,
+	};
+	struct cxi_eth_get_max_rxsize_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	return resp.max_rxsize;
+}
+
+/**
+ * cxi_get_max_eth_rxsize() - Return the current maximum Ethernet frame size
+ *
+ * @cdev: CXI device
+ *
+ * Returns the maximum Ethernet frame size (including layer-2 headers)
+ * currently configured on the device, matching the units used by
+ * cxi_set_max_eth_rxsize().
+ */
+int cxi_get_max_eth_rxsize(struct cxi_dev *cdev)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!cdev->is_physfn)
+		return cxi_get_max_eth_rxsize_vf(cdev);
+
+	return hw->max_eth_rxsize;
+}
+EXPORT_SYMBOL(cxi_get_max_eth_rxsize);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_ixe.c b/drivers/net/ethernet/hpe/ss1/cass_ixe.c
new file mode 100644
index 000000000000..c52fa70e60a7
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_ixe.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021 Hewlett Packard Enterprise Development LP */
+
+/* IXE block */
+
+#include <linux/hpe/cxi/cxi.h>
+#include <rdma/ib_pack.h>
+
+#include "cass_core.h"
+
+/* AMO remap to PCIe fetching add is used to remap a single operand NIC AMO
+ * as a PCIe fetch add AMO.
+ */
+static int amo_remap_to_pcie_fadd = C_AMO_OP_SWAP;
+module_param(amo_remap_to_pcie_fadd, int, 0444);
+MODULE_PARM_DESC(amo_remap_to_pcie_fadd,
+		 "Remap NIC AMO operation as a PCIe fetch add operation. "
+		 "The following are the value values.\n"
+		 "AMO_OP_MIN == 0\n"
+		 "AMO_OP_MAX == 1\n"
+		 "AMO_OP_SUM == 2\n"
+		 "AMO_OP_LOR == 4\n"
+		 "AMO_OP_LAND == 5\n"
+		 "AMO_OP_BOR == 6\n"
+		 "AMO_OP_BAND == 7\n"
+		 "AMO_OP_LXOR == 8\n"
+		 "AMO_OP_BXOR == 9\n"
+		 "AMO_OP_SWAP == 10\n"
+		 "-1 disables remapping");
+
+enum {
+	RXE_BTH_BYTES       = 12,
+	RXE_DETH_BYTES      = 8,
+	RXE_IMMDT_BYTES     = 4,
+	RXE_RETH_BYTES      = 16,
+	RXE_AETH_BYTES      = 4,
+	RXE_ATMACK_BYTES    = 8,
+	RXE_ATMETH_BYTES    = 28,
+	RXE_IETH_BYTES      = 4,
+	RXE_RDETH_BYTES     = 4,
+};
+
+/* Length of a whole BTH depending on its opcode, not including the
+ * base BTH itself. Extracted from the rdma_rxe driver's rxe_opcode
+ * array.
+ */
+static const int rxe_op_length[256] = {
+	/* RC */
+	[IB_OPCODE_RC_SEND_LAST_WITH_IMMEDIATE] = RXE_IMMDT_BYTES,
+	[IB_OPCODE_RC_SEND_ONLY_WITH_IMMEDIATE] = RXE_IMMDT_BYTES,
+	[IB_OPCODE_RC_RDMA_WRITE_FIRST] = RXE_RETH_BYTES,
+	[IB_OPCODE_RC_RDMA_WRITE_LAST_WITH_IMMEDIATE] = RXE_IMMDT_BYTES,
+	[IB_OPCODE_RC_RDMA_WRITE_ONLY] = RXE_RETH_BYTES,
+	[IB_OPCODE_RC_RDMA_WRITE_ONLY_WITH_IMMEDIATE] = RXE_IMMDT_BYTES +
+		RXE_RETH_BYTES,
+	[IB_OPCODE_RC_RDMA_READ_REQUEST] = RXE_RETH_BYTES,
+	[IB_OPCODE_RC_RDMA_READ_RESPONSE_FIRST] = RXE_AETH_BYTES,
+	[IB_OPCODE_RC_RDMA_READ_RESPONSE_LAST] = RXE_AETH_BYTES,
+	[IB_OPCODE_RC_RDMA_READ_RESPONSE_ONLY] = RXE_AETH_BYTES,
+	[IB_OPCODE_RC_ACKNOWLEDGE] = RXE_AETH_BYTES,
+	[IB_OPCODE_RC_ATOMIC_ACKNOWLEDGE] = RXE_ATMACK_BYTES + RXE_AETH_BYTES,
+	[IB_OPCODE_RC_COMPARE_SWAP] = RXE_ATMETH_BYTES,
+	[IB_OPCODE_RC_FETCH_ADD] = RXE_ATMETH_BYTES,
+	[IB_OPCODE_RC_SEND_LAST_WITH_INVALIDATE] = RXE_IETH_BYTES,
+	[IB_OPCODE_RC_SEND_ONLY_WITH_INVALIDATE] = RXE_IETH_BYTES,
+
+	/* UC */
+	[IB_OPCODE_UC_SEND_LAST_WITH_IMMEDIATE] = RXE_IMMDT_BYTES,
+	[IB_OPCODE_UC_SEND_ONLY_WITH_IMMEDIATE] = RXE_IMMDT_BYTES,
+	[IB_OPCODE_UC_RDMA_WRITE_FIRST] = RXE_RETH_BYTES,
+	[IB_OPCODE_UC_RDMA_WRITE_LAST_WITH_IMMEDIATE] = RXE_IMMDT_BYTES,
+	[IB_OPCODE_UC_RDMA_WRITE_ONLY] = RXE_RETH_BYTES,
+	[IB_OPCODE_UC_RDMA_WRITE_ONLY_WITH_IMMEDIATE] = RXE_IMMDT_BYTES +
+		RXE_RETH_BYTES,
+
+	/* RD */
+	[IB_OPCODE_RD_SEND_FIRST] = RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_SEND_MIDDLE] = RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_SEND_LAST] = RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_SEND_LAST_WITH_IMMEDIATE] = RXE_IMMDT_BYTES +
+		RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_SEND_ONLY] = RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_SEND_ONLY_WITH_IMMEDIATE] = RXE_IMMDT_BYTES +
+		RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_WRITE_FIRST] = RXE_RETH_BYTES + RXE_DETH_BYTES +
+		RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_WRITE_MIDDLE] = RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_WRITE_LAST] = RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_WRITE_LAST_WITH_IMMEDIATE] = RXE_IMMDT_BYTES +
+		RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_WRITE_ONLY] = RXE_RETH_BYTES + RXE_DETH_BYTES +
+		RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_WRITE_ONLY_WITH_IMMEDIATE] = RXE_IMMDT_BYTES +
+		RXE_RETH_BYTES + RXE_DETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_READ_REQUEST] = RXE_RETH_BYTES + RXE_DETH_BYTES +
+		RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_READ_RESPONSE_FIRST] = RXE_AETH_BYTES +
+		RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_READ_RESPONSE_MIDDLE] = RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_READ_RESPONSE_LAST] = RXE_AETH_BYTES +
+		RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_RDMA_READ_RESPONSE_ONLY] = RXE_AETH_BYTES +
+		RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_ACKNOWLEDGE] = RXE_AETH_BYTES + RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_ATOMIC_ACKNOWLEDGE] = RXE_ATMACK_BYTES + RXE_AETH_BYTES +
+		RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_COMPARE_SWAP] = RXE_ATMETH_BYTES + RXE_DETH_BYTES	+
+		RXE_RDETH_BYTES,
+	[IB_OPCODE_RD_FETCH_ADD] = RXE_ATMETH_BYTES + RXE_DETH_BYTES +
+		RXE_RDETH_BYTES,
+
+	/* UD */
+	[IB_OPCODE_UD_SEND_ONLY] = RXE_DETH_BYTES,
+	[IB_OPCODE_UD_SEND_ONLY_WITH_IMMEDIATE] = RXE_IMMDT_BYTES +
+		RXE_DETH_BYTES,
+};
+
+/* Program BTH opcodes for RXE, using definitions from the rxe driver */
+static void set_bth_opcode(struct cass_dev *hw)
+{
+	unsigned int index;
+	unsigned int offset;
+
+	for (index = 0; index < C_IXE_CFG_BTH_OPCODE_ENTRIES; index++) {
+		union c_ixe_cfg_bth_opcode bth_opcode = {};
+
+		for (offset = 0; offset < 16; offset++) {
+			u64 length;
+
+			length = RXE_BTH_BYTES;
+			length += rxe_op_length[index * 16 + offset];
+			length /= 4;
+
+			bth_opcode.qw |= length << (offset * 4);
+		}
+
+		cass_write(hw, C_IXE_CFG_BTH_OPCODE(index),
+			   &bth_opcode, sizeof(bth_opcode));
+	}
+}
+
+static bool cass_ixe_valid_amo_remap_to_pcie_fadd(int amo_remap)
+{
+	switch (amo_remap) {
+	case -1:
+	case C_AMO_OP_MIN:
+	case C_AMO_OP_MAX:
+	case C_AMO_OP_SUM:
+	case C_AMO_OP_LOR:
+	case C_AMO_OP_LAND:
+	case C_AMO_OP_BOR:
+	case C_AMO_OP_BAND:
+	case C_AMO_OP_LXOR:
+	case C_AMO_OP_BXOR:
+	case C_AMO_OP_SWAP:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+#define OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP 0xf
+#define OFFLOAD_INT32_INT64_UINT32_UINT64_FETCH_NON_FETCH_1OP 0xf
+
+int cass_ixe_set_amo_remap_to_pcie_fadd(struct cass_dev *hw, int amo_remap)
+{
+	union c_ixe_cfg_amo_offload amo_offload;
+	union c_ixe_cfg_amo_offload_code_1op amo_offload_code_1op = {};
+	union c_ixe_cfg_amo_offload_en amo_offload_en = {};
+
+	if (!cass_ixe_valid_amo_remap_to_pcie_fadd(amo_remap))
+		return -EINVAL;
+
+	/* Clear current AMO offload configuration. */
+	cass_read(hw, C_IXE_CFG_AMO_OFFLOAD, &amo_offload,
+		  sizeof(amo_offload));
+	amo_offload.base_amo_req = 0;
+	cass_write(hw, C_IXE_CFG_AMO_OFFLOAD, &amo_offload,
+		   sizeof(amo_offload));
+
+	cass_write(hw, C_IXE_CFG_AMO_OFFLOAD_CODE_1OP, &amo_offload_code_1op,
+		   sizeof(amo_offload_code_1op));
+	cass_write(hw, C_IXE_CFG_AMO_OFFLOAD_EN, &amo_offload_en,
+		   sizeof(amo_offload_en));
+
+	switch (amo_remap) {
+	case -1:
+		goto out;
+
+	case C_AMO_OP_MIN:
+		amo_offload_en.op_min =
+			OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+
+	case C_AMO_OP_MAX:
+		amo_offload_en.op_max =
+			OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+
+	case C_AMO_OP_SUM:
+		amo_offload_en.op_sum =
+			OFFLOAD_INT32_INT64_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+
+	case C_AMO_OP_LOR:
+		amo_offload_en.op_lor =
+			OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+
+	case C_AMO_OP_LAND:
+		amo_offload_en.op_land =
+			OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+
+	case C_AMO_OP_BOR:
+		amo_offload_en.op_bor =
+			OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+
+	case C_AMO_OP_BAND:
+		amo_offload_en.op_band =
+			OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+
+	case C_AMO_OP_LXOR:
+		amo_offload_en.op_lxor =
+			OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+
+	case C_AMO_OP_BXOR:
+		amo_offload_en.op_bxor =
+			OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+
+	case C_AMO_OP_SWAP:
+		amo_offload_en.op_swap =
+			OFFLOAD_UINT32_UINT64_FETCH_NON_FETCH_1OP;
+		break;
+	}
+
+	cass_write(hw, C_IXE_CFG_AMO_OFFLOAD_EN, &amo_offload_en,
+		   sizeof(amo_offload_en));
+
+out:
+	hw->cdev.prop.amo_remap_to_pcie_fadd = amo_remap;
+
+	return 0;
+}
+
+#define ABORT_MASK_BITS (sizeof(union c_ixe_cfg_ipv6_opt_abort) * 8)
+int cass_ixe_init(struct cass_dev *hw)
+{
+	int i;
+	unsigned int next_header;
+	unsigned int index;
+	unsigned int bit;
+	union c_ixe_cfg_ipv6_opt_abort masks[C_IXE_CFG_IPV6_OPT_ABORT_ENTRIES];
+	static const unsigned int ipv6_extension_headers[] = {
+		IPV6_EH_HOPOPTS,
+		IPV6_EH_ROUTE,
+		IPV6_EH_FRAG,
+		IPV6_EH_ESP,
+		IPV6_EH_AH,
+		IPV6_EH_OPTS,
+		IPV6_EH_MOBILITY,
+		IPV6_EH_HIP,
+		IPV6_EH_SHIM6,
+		IPV6_EH_RSVD1,
+		IPV6_EH_RSVD2,
+	};
+	union c_ixe_cfg_disp_cdt_lim cdt_limits;
+	int ret;
+
+	/* Initially mark all IPv6 next header values as ULP. */
+	for (i = 0; i < ARRAY_SIZE(masks); i++)
+		masks[i].qw = -1;
+
+	/* Mask off IPv6 extension headers next header values. */
+	for (i = 0; i < ARRAY_SIZE(ipv6_extension_headers); i++) {
+		next_header = ipv6_extension_headers[i];
+		index = next_header / ABORT_MASK_BITS;
+		bit = next_header % ABORT_MASK_BITS;
+
+		masks[index].qw &= ~BIT(bit);
+	}
+
+	/* Write the IPv6 next header configuration. */
+	for (i = 0; i < ARRAY_SIZE(masks); i++)
+		cass_write(hw, C_IXE_CFG_IPV6_OPT_ABORT(i), &masks[i],
+			   sizeof(masks[i]));
+
+	if (cass_version(hw, CASSINI_1_0)) {
+		/* Errata 2973 */
+		union c1_pct_cfg_ixe_req_fifo_limits req_limits;
+
+		cass_read(hw, C1_PCT_CFG_IXE_REQ_FIFO_LIMITS, &req_limits,
+			  sizeof(req_limits));
+
+		req_limits.ixe_req_clr2_limit = 1;
+
+		cass_write(hw, C1_PCT_CFG_IXE_REQ_FIFO_LIMITS, &req_limits,
+			   sizeof(req_limits));
+
+		cass_read(hw, C_IXE_CFG_DISP_CDT_LIM, &cdt_limits,
+			  sizeof(cdt_limits));
+		cdt_limits.atu_req_cdts = 3;
+		cass_write(hw, C_IXE_CFG_DISP_CDT_LIM, &cdt_limits,
+			   sizeof(cdt_limits));
+	}
+
+	if (cass_version(hw, CASSINI_2)) {
+		union c2_ixe_cfg_disp_ord ord;
+
+		cass_read(hw, C2_IXE_CFG_DISP_ORD, &ord, sizeof(ord));
+		ord.get_ro_body = 1;
+		ord.get_ro_last = 1;
+		cass_write(hw, C2_IXE_CFG_DISP_ORD, &ord, sizeof(ord));
+
+		cass_read(hw, C_IXE_CFG_DISP_CDT_LIM, &cdt_limits,
+			  sizeof(cdt_limits));
+		cdt_limits.atu_req_cdts = 4;
+		cass_write(hw, C_IXE_CFG_DISP_CDT_LIM, &cdt_limits,
+			   sizeof(cdt_limits));
+	}
+
+	/* RoCE */
+	set_bth_opcode(hw);
+
+	ret = cass_ixe_set_amo_remap_to_pcie_fadd(hw, amo_remap_to_pcie_fadd);
+	if (ret) {
+		pr_err("Failed to remap NIC AMO to PCIe fetch add: %d\n", ret);
+		return ret;
+	}
+
+	hw->ixe_pbuf_rd_err.irq = C_IXE_IRQA_MSIX_INT;
+	hw->ixe_pbuf_rd_err.is_ext = false;
+	hw->ixe_pbuf_rd_err.err_flags.ixe_err_flg.pbuf_rd_err = 1;
+	hw->ixe_pbuf_rd_err.cb = uncor_cb;
+	cxi_register_hw_errors(hw, &hw->ixe_pbuf_rd_err);
+
+	return 0;
+}
+
+void cass_ixe_fini(struct cass_dev *hw)
+{
+	cxi_unregister_hw_errors(hw, &hw->ixe_pbuf_rd_err);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_lmon.c b/drivers/net/ethernet/hpe/ss1/cass_lmon.c
new file mode 100644
index 000000000000..401dd247638a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_lmon.c
@@ -0,0 +1,573 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cassini link monitor
+ * Copyright 2020-2024,2025 Hewlett Packard Enterprise Development LP
+ */
+
+#include <linux/iopoll.h>
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/kthread.h>
+#include <linux/hpe/sbl/sbl_mb.h>
+#include <linux/hpe/sbl/sbl.h>
+#include <uapi/ethernet/sbl-abi.h>
+#include <uapi/ethernet/sbl_serdes.h>
+
+#include "cass_core.h"
+
+/*
+ * make sure code is aligned with address map
+ */
+#if (CASS_PCS_NUM_FECL_CNTRS != 8)
+#error fecl counter number mismatch
+#endif
+
+/* FEC monitoring */
+#define CASS_LMON_WAKEUP_INTERVAL                 1000    /* ms */
+#define CASS_LMON_MAX_FEC_WARNINGS                   3
+#define CASS_LMON_MIN_FEC_WINDOW                  1000    /* ms */
+
+/* wakeup rate limiting */
+#define CASS_LMON_MAX_WAKEUPS                       10
+#define CASS_LMON_WAKEUP_DELAY                     100    /* ms */
+#define CASS_LMON_WAKEUP_LIMITER                   500    /* ms */
+#define CASS_LMON_WAKEUP_WINDOW                   1000    /* ms */
+
+/* thread init data */
+struct cass_lmon_data {
+	struct cass_dev *hw;
+	struct completion running;
+};
+
+/*
+ * test to see if link should be up
+ *
+ * This function is called with the port locked
+ */
+static bool cass_lmon_link_should_auto_restart(struct cass_dev *hw)
+{
+	if (kthread_should_stop())
+		return false;
+
+	if (hw->port->link_down_origin == CASS_DOWN_ORIGIN_CONFIG) {
+		/* link has been told to come down */
+		return false;
+	}
+
+	if (!(hw->port->lattr.options & CASS_LINK_OPT_UP_AUTO_RESTART)) {
+		/* auto restart not configured */
+		return false;
+	}
+
+	if (hw->port->lmon_up_pause) {
+		/* auto restart has been paused */
+		return false;
+	}
+
+	/* should auto restart */
+	return true;
+}
+
+/*
+ * test to see if monitor should wake up and do something
+ */
+static bool cass_lmon_wakeup(struct cass_dev *hw)
+{
+	int lmon_dirn;
+	int lstate;
+	bool auto_restart;
+
+	if (kthread_should_stop())
+		return true;
+
+	spin_lock(&hw->port->lock);
+	lmon_dirn = hw->port->lmon_dirn;
+	lstate = hw->port->lstate;
+	auto_restart = cass_lmon_link_should_auto_restart(hw);
+	spin_unlock(&hw->port->lock);
+
+	if (lmon_dirn == CASS_LMON_DIRECTION_RESET) {
+		/* always do reset */
+		return true;
+	} else if (lstate == CASS_LINK_STATUS_ERROR) {
+		/* error can generally only be cleared by a reset */
+		return false;
+	} else if (lstate == CASS_LINK_STATUS_UNCONFIGURED) {
+		/* can't do anything without configuration */
+		return false;
+	} else if ((lmon_dirn == CASS_LMON_DIRECTION_UP &&
+		    lstate != CASS_LINK_STATUS_UP) ||
+		   (lmon_dirn == CASS_LMON_DIRECTION_DOWN &&
+		    (lstate != CASS_LINK_STATUS_DOWN || auto_restart))) {
+		/* if we should be up or down and not, then there is
+		 *  something to do
+		 */
+		return true;
+	}
+
+	return false;
+}
+
+static void cass_lmon_wakeup_limiter_reset(struct cass_dev *hw)
+{
+	spin_lock(&hw->port->lock);
+	hw->port->lmon_wake_cnt = 0;
+	hw->port->lmon_wake_jiffies = jiffies +
+		msecs_to_jiffies(CASS_LMON_WAKEUP_WINDOW);
+	hw->port->lmon_limiter_on = false;
+	spin_unlock(&hw->port->lock);
+}
+
+/*
+ * make sure we are not waking too frequently
+ */
+static void cass_lmon_wakeup_limiter(struct cass_dev *hw)
+{
+	spin_lock(&hw->port->lock);
+	if (time_is_after_jiffies(hw->port->lmon_wake_jiffies)) {
+		if (++hw->port->lmon_wake_cnt < CASS_LMON_MAX_WAKEUPS) {
+			spin_unlock(&hw->port->lock);
+			msleep(CASS_LMON_WAKEUP_DELAY);
+			cxidev_dbg(&hw->cdev, "lmon wakeup limiter - %d\n",
+				   hw->port->lmon_wake_cnt);
+			return;
+		}
+
+		cxidev_dbg(&hw->cdev, "lmon wakeup limiter - sleeping\n");
+		hw->port->lmon_limiter_on = true;
+		spin_unlock(&hw->port->lock);
+		atomic_inc(&hw->port->lmon_counters[lmon_limiter]);
+		msleep(CASS_LMON_WAKEUP_LIMITER);
+		return;
+	}
+	spin_unlock(&hw->port->lock);
+	cass_lmon_wakeup_limiter_reset(hw);
+}
+
+/*
+ * called from thread other than the link monitor
+ */
+int cass_lmon_request_up(struct cass_dev *hw)
+{
+	bool wakeup_lmon = false;
+	int err = 0;
+
+	spin_lock(&hw->port->lock);
+	switch (hw->port->lstate) {
+
+	case CASS_LINK_STATUS_UNKNOWN:
+	case CASS_LINK_STATUS_UNCONFIGURED:
+	case CASS_LINK_STATUS_ERROR:
+		cxidev_err_ratelimited(&hw->cdev,
+				       "lmon: up request failed, wrong state (%s)\n",
+			cass_link_state_str(hw->port->lstate));
+		err = -ESTALE;
+		break;
+
+	case CASS_LINK_STATUS_STARTING:
+	case CASS_LINK_STATUS_UP:
+		/* continue coming up */
+		if (cass_version(hw, CASSINI_1))
+			sbl_base_link_enable_start(hw->sbl, 0);
+		break;
+
+	case CASS_LINK_STATUS_STOPPING:
+	case CASS_LINK_STATUS_DOWN:
+		/* start it coming up */
+		if (cass_version(hw, CASSINI_1))
+			sbl_base_link_enable_start(hw->sbl, 0);
+		hw->port->lmon_dirn = CASS_LMON_DIRECTION_UP;
+		hw->port->link_restart_count = 0;
+		hw->port->link_restart_time_idx = 0;
+		memset(hw->port->link_restart_time_buf, 0, sizeof(hw->port->link_restart_time_buf));
+		wakeup_lmon = true;
+		break;
+
+	case CASS_LINK_STATUS_RESETTING:
+		/* have to wait for this to finish - do nothing */
+		err = -EBUSY;
+		break;
+	}
+	spin_unlock(&hw->port->lock);
+
+	if (wakeup_lmon)
+		wake_up_interruptible(&hw->port->lmon_wq);
+
+	return err;
+}
+
+int cass_lmon_request_down(struct cass_dev *hw)
+{
+	bool wakeup_lmon = false;
+	int err = 0;
+
+	/*
+	 * first change direction
+	 * then, if we need to cancel an ongoing startup, it
+	 * will restarts with the new direction
+	 */
+	spin_lock(&hw->port->lock);
+	switch (hw->port->lstate) {
+
+	case CASS_LINK_STATUS_UNCONFIGURED:
+	case CASS_LINK_STATUS_UNKNOWN:
+	case CASS_LINK_STATUS_ERROR:
+		cxidev_err(&hw->cdev, "lmon: down request failed, wrong state (%s)\n",
+			   cass_link_state_str(hw->port->lstate));
+		err = -ESTALE;
+		break;
+
+	case CASS_LINK_STATUS_STARTING:
+	case CASS_LINK_STATUS_UP:
+		/* start coming down*/
+		hw->port->lmon_dirn = CASS_LMON_DIRECTION_DOWN;
+		wakeup_lmon = true;
+		break;
+
+	case CASS_LINK_STATUS_STOPPING:
+	case CASS_LINK_STATUS_DOWN:
+		/* nothing to do */
+		break;
+
+	case CASS_LINK_STATUS_RESETTING:
+		/* have to wait for this to finish - do nothing */
+		err = -EBUSY;
+		break;
+	}
+
+	/* cancel any starting operation */
+	if (cass_version(hw, CASSINI_1) &&
+	    (hw->port->lstate == CASS_LINK_STATUS_STARTING)) {
+		sbl_base_link_cancel_start(hw->sbl, 0);
+	}
+	spin_unlock(&hw->port->lock);
+
+	if (wakeup_lmon)
+		wake_up_interruptible(&hw->port->lmon_wq);
+
+	return err;
+}
+
+int cass_lmon_request_reset(struct cass_dev *hw)
+{
+	bool wakeup_lmon = false;
+	int err = 0;
+
+	/*
+	 * first change direction
+	 * then, if we need to cancel an ongoing startup, it
+	 * will restarts with the new direction
+	 */
+	spin_lock(&hw->port->lock);
+	switch (hw->port->lstate) {
+
+	case CASS_LINK_STATUS_UNKNOWN:
+		cxidev_err(&hw->cdev, "lmon: down request failed, wrong state (%s)\n",
+			   cass_link_state_str(hw->port->lstate));
+		err = -ESTALE;
+		break;
+
+	case CASS_LINK_STATUS_STARTING:
+	case CASS_LINK_STATUS_UP:
+	case CASS_LINK_STATUS_STOPPING:
+	case CASS_LINK_STATUS_DOWN:
+	case CASS_LINK_STATUS_ERROR:
+	case CASS_LINK_STATUS_UNCONFIGURED:
+	case CASS_LINK_STATUS_RESETTING:
+		/* start reset */
+		hw->port->lmon_dirn = CASS_LMON_DIRECTION_RESET;
+		wakeup_lmon = true;
+		break;
+	}
+
+	/* cancel any starting operation */
+	if (cass_version(hw, CASSINI_1) &&
+	    (hw->port->lstate == CASS_LINK_STATUS_STARTING)) {
+		sbl_base_link_cancel_start(hw->sbl, 0);
+	}
+	spin_unlock(&hw->port->lock);
+
+	if (wakeup_lmon)
+		wake_up_interruptible(&hw->port->lmon_wq);
+
+	return err;
+}
+
+int cass_lmon_get_dirn(struct cass_dev *hw)
+{
+	int dirn;
+
+	spin_lock(&hw->port->lock);
+	dirn = hw->port->lmon_dirn;
+	spin_unlock(&hw->port->lock);
+
+	return dirn;
+}
+
+void cass_lmon_set_dirn(struct cass_dev *hw, int dirn)
+{
+	spin_lock(&hw->port->lock);
+	hw->port->lmon_dirn = dirn;
+	spin_unlock(&hw->port->lock);
+}
+
+bool cass_lmon_get_active(struct cass_dev *hw)
+{
+	bool state;
+
+	spin_lock(&hw->port->lock);
+	state = hw->port->lmon_active;
+	spin_unlock(&hw->port->lock);
+
+	return state;
+}
+
+void cass_lmon_set_active(struct cass_dev *hw, bool state)
+{
+	spin_lock(&hw->port->lock);
+	hw->port->lmon_active = state;
+	spin_unlock(&hw->port->lock);
+}
+
+void cass_lmon_set_up_pause(struct cass_dev *hw, bool state)
+{
+	spin_lock(&hw->port->lock);
+	hw->port->lmon_up_pause = state;
+	spin_unlock(&hw->port->lock);
+	if (!state)
+		wake_up_interruptible(&hw->port->lmon_wq);
+}
+
+bool cass_lmon_get_up_pause(struct cass_dev *hw)
+{
+	bool state;
+
+	spin_lock(&hw->port->lock);
+	state = hw->port->lmon_up_pause;
+	spin_unlock(&hw->port->lock);
+
+	return state;
+}
+
+static int cass_lmon(void *data)
+{
+	struct cass_lmon_data *thrd_data = data;
+	struct cass_dev *hw = thrd_data->hw;
+	long timeout = msecs_to_jiffies(CASS_LMON_WAKEUP_INTERVAL);
+	int down_origin;
+	int status;
+	char base_link_state_str[SBL_BASE_LINK_STATE_STR_LEN];
+
+	cxidev_dbg(&hw->cdev, "lmon starting");
+
+	complete(&thrd_data->running);
+
+	cass_lmon_wakeup_limiter_reset(hw);
+	cass_lmon_set_active(hw, true);
+
+	// FIXME: temp delay before first link up.  Relates to NETCASSINI-6454
+	if (cass_version(hw, CASSINI_2))
+		msleep(5000);
+
+	while (!kthread_should_stop()) {
+
+		while (!cass_lmon_wakeup(hw)) {
+
+			if (cass_lmon_get_active(hw)) {
+				cxidev_dbg(&hw->cdev, "lmon sleeping\n");
+				cass_lmon_set_active(hw, false);
+			}
+
+			status = wait_event_interruptible_timeout(
+							  hw->port->lmon_wq,
+							  cass_lmon_wakeup(hw),
+							  timeout);
+
+			atomic_inc(&hw->port->lmon_counters[lmon_wakeup]);
+
+			if (kthread_should_stop())
+				goto out;
+
+			if (!status) {
+				/* timed out and nothing needing attention */
+				continue;
+			}
+
+			cxidev_dbg(&hw->cdev, "lmon active\n");
+			cass_lmon_set_active(hw, true);
+		}
+
+		atomic_inc(&hw->port->lmon_counters[lmon_active]);
+
+		if (kthread_should_stop())
+			goto out;
+
+		cass_lmon_wakeup_limiter(hw);
+
+		switch (cass_lmon_get_dirn(hw)) {
+
+		case CASS_LMON_DIRECTION_UP:
+
+			if (cass_lmon_get_up_pause(hw)) {
+				cxidev_dbg(&hw->cdev, "lmon up paused\n");
+				break;
+			}
+
+			if (cass_phy_is_headshell_removed(hw))
+				break;
+
+			cxidev_dbg(&hw->cdev, "lmon up action\n");
+
+			hw->link_ops->link_up(hw);
+			break;
+
+		case CASS_LMON_DIRECTION_DOWN:
+			if (cass_version(hw, CASSINI_1)) {
+				down_origin = cass_link_get_down_origin(hw);
+				cass_sbl_counters_down_origin_inc(hw, down_origin);
+				sbl_base_link_state_str(hw->sbl, 0, base_link_state_str,
+							SBL_BASE_LINK_STATE_STR_LEN);
+				cxidev_info(&hw->cdev,
+					    "lmon taking link down (reason %s, bl: %s)\n",
+					    cass_link_down_origin_str(down_origin),
+					    base_link_state_str);
+			}
+
+			hw->link_ops->link_down(hw);
+
+			spin_lock(&hw->port->lock);
+			if (cass_lmon_link_should_auto_restart(hw)) {
+				if (cass_version(hw, CASSINI_1))
+					atomic_inc(&hw->sbl_counters[link_auto_restart]);
+				cxidev_dbg(&hw->cdev,
+					   "lmon auto restarting link up\n");
+				hw->port->lmon_dirn = CASS_LMON_DIRECTION_UP;
+				hw->port->link_restart_count++;
+				hw->port->link_restart_time_buf[hw->port->link_restart_time_idx]
+					= ktime_get_real_seconds();
+				hw->port->link_restart_time_idx++;
+				if (hw->port->link_restart_time_idx >=
+					CASS_SBL_LINK_RESTART_TIME_SIZE)
+					hw->port->link_restart_time_idx = 0;
+			}
+			spin_unlock(&hw->port->lock);
+
+			if (cass_version(hw, CASSINI_2)) {
+				if (cass_lmon_link_should_auto_restart(hw))
+					cass_phy_trigger_machine(hw);
+			}
+
+			break;
+
+		case CASS_LMON_DIRECTION_RESET:
+			cxidev_dbg(&hw->cdev, "lmon reset action\n");
+			hw->link_ops->link_reset(hw);
+			hw->port->lmon_dirn = CASS_LMON_DIRECTION_NONE;
+			break;
+
+		case CASS_LMON_DIRECTION_NONE:
+			/* don't do anything - thread is going to terminate */
+			break;
+		}
+	}
+
+out:
+	return 0;
+}
+
+/**
+ * cass_lmon_start_all() - Starts lmon thread
+ *
+ * @hw: the device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cass_lmon_start_all(struct cass_dev *hw)
+{
+	struct cass_lmon_data thrd_data;
+	struct task_struct *lmon;
+	int err;
+	int i = 0;
+
+	thrd_data.hw = hw;
+
+	init_completion(&thrd_data.running);
+
+	if (hw->port->lmon)
+		return 0;
+
+	lmon = kthread_run(cass_lmon, (void *)&thrd_data, "lmon");
+
+	err = IS_ERR(lmon);
+	if (err) {
+		cxidev_err(&hw->cdev, "lmon %d: failed to start monitor [%d]\n",
+			   i, err);
+		goto out_err;
+	} else {
+		hw->port->lmon = lmon;
+	}
+
+	wait_for_completion(&thrd_data.running);
+	cxidev_dbg(&hw->cdev, "lmon %d: started\n", i);
+
+	return 0;
+
+ out_err:
+	cass_lmon_kill_all(hw);
+	return err;
+
+}
+
+int cass_lmon_stop_all(struct cass_dev *hw)
+{
+	/* TODO add cleanup */
+	cass_lmon_kill_all(hw);
+	return 0;
+}
+
+void cass_lmon_kill_all(struct cass_dev *hw)
+{
+	int err = 0;
+
+	if (!hw->port->lmon)
+		return;
+
+	/*
+	 * cancel any starting ports and stop any more actions
+	 */
+	if (cass_version(hw, CASSINI_1) && (hw->sbl))
+		sbl_base_link_cancel_start(hw->sbl, 0);
+	if (cass_version(hw, CASSINI_2))
+		hw->sl.is_canceled = true;
+	cass_lmon_set_dirn(hw, CASS_LMON_DIRECTION_NONE);
+	wake_up_interruptible(&hw->port->lmon_wq);
+
+	err = kthread_stop(hw->port->lmon);
+	if (err)
+		cxidev_err(&hw->cdev, "thread stop failed [%d]\n", err);
+
+	hw->port->lmon = NULL;
+
+	cxidev_dbg(&hw->cdev, "lmon thread destroyed\n");
+}
+
+/*
+ * Update lmon counters
+ */
+void cass_lmon_counters_init(struct cass_dev *hw)
+{
+	int i;
+
+	hw->port->lmon_counters = kzalloc(sizeof(atomic_t) * CASS_LMON_NUM_COUNTERS, GFP_KERNEL);
+
+	for (i = 0; i < CASS_LMON_NUM_COUNTERS; ++i)
+		atomic_set(&hw->port->lmon_counters[i], 0);
+}
+
+/*
+ * Destroy the port's counter array
+ */
+void cass_lmon_counters_term(struct cass_dev *hw)
+{
+	kfree(hw->port->lmon_counters);
+	hw->port->lmon_counters = NULL;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_lni.c b/drivers/net/ethernet/hpe/ss1/cass_lni.c
new file mode 100644
index 000000000000..bb33bd00f92c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_lni.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Cassini NI management */
+
+#include <linux/types.h>
+
+#include "cass_core.h"
+#include "cxi_internal.h"
+#include "cxi_vf_cmd.h"
+#include "cass_ss1_debugfs.h"
+
+unsigned int cxi_lni_get_pe_num(struct cxi_lni_priv *lni)
+{
+	int pe;
+	int xchg;
+
+	/* Round robin across all PEs. */
+	do {
+		pe = atomic_read(&lni->lpe_pe_num);
+		xchg = pe + 1;
+		if (xchg == C_PE_COUNT)
+			xchg = 0;
+	} while (atomic_cmpxchg(&lni->lpe_pe_num, pe, xchg) != pe);
+
+	return pe;
+}
+
+/**
+ * cxi_lni_alloc_vf() - Allocate a logical NI (LNI) for VF
+ *
+ * @dev: CXI device
+ * @svc_id: Service ID of service to be used. May be CXI_DEFAULT_SVC_ID.
+ *
+ * Return: Pointer to allocated LNI on success, ERR_PTR on failure.
+ */
+static struct cxi_lni *cxi_lni_alloc_vf(struct cxi_dev *dev,
+					unsigned int svc_id)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_lni_priv_vf *lni_priv_vf;
+	const struct cxi_lni_alloc_cmd lni_alloc_cmd = {
+		.op = CXI_OP_LNI_ALLOC,
+		.svc_id = svc_id,
+	};
+	struct cxi_phys_lac_alloc_cmd lac_alloc_cmd = {
+		.op = CXI_OP_PHYS_LAC_ALLOC,
+		.resp = NULL,
+	};
+	struct cxi_lni_alloc_resp_vf lni_alloc_resp;
+	struct cxi_phys_lac_alloc_resp lac_alloc_resp;
+	size_t resp_len;
+	int rc;
+
+	lni_priv_vf = kzalloc(sizeof(*lni_priv_vf), GFP_KERNEL);
+	if (!lni_priv_vf)
+		return ERR_PTR(-ENOMEM);
+
+	resp_len = sizeof(lni_alloc_resp);
+	rc = cxi_send_msg_to_pf(&hw->cdev, &lni_alloc_cmd, sizeof(lni_alloc_cmd),
+				&lni_alloc_resp, &resp_len);
+	if (rc)
+		goto error_out;
+
+	lni_priv_vf->dev = dev;
+	lni_priv_vf->lni.id = lni_alloc_resp.base.lni;
+	lni_priv_vf->lni.rgid = lni_alloc_resp.rgid;
+
+	/* Allocate Physical LAC for this LNI */
+	resp_len = sizeof(lac_alloc_resp);
+	lac_alloc_cmd.lni = lni_priv_vf->lni.id;
+	rc = cxi_send_msg_to_pf(&hw->cdev, &lac_alloc_cmd, sizeof(lac_alloc_cmd),
+				&lac_alloc_resp, &resp_len);
+	if (rc) {
+		lni_priv_vf->phys_lac = -1;
+		cxi_lni_free(&lni_priv_vf->lni);
+		return ERR_PTR(rc);
+	}
+	lni_priv_vf->phys_lac = lac_alloc_resp.lac;
+
+	return &lni_priv_vf->lni;
+
+error_out:
+	kfree(lni_priv_vf);
+
+	return ERR_PTR(rc);
+}
+
+/**
+ * cxi_lni_alloc_internal() - Allocate a logical NI (LNI) internal function
+ *
+ * @dev: CXI device
+ * @svc_id: Service ID of service to be used. May be CXI_DEFAULT_SVC_ID.
+ * @vf_en: true if this LNI is for a VF
+ * @vf_num: VF number (ignored unless vf_en is true)
+ */
+struct cxi_lni *cxi_lni_alloc_internal(struct cxi_dev *dev, unsigned int svc_id,
+				       bool vf_en, u8 vf_num)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_lni_priv *lni_priv;
+	struct cxi_rgroup *rgroup;
+	int rc;
+	int id;
+	int rgid;
+	void *err;
+
+	rc = cxi_dev_find_rgroup_inc_refcount(dev, svc_id, &rgroup);
+	if (rc)
+		return ERR_PTR(-EINVAL);
+
+	/* Ensure service is enabled */
+	if (!cxi_rgroup_is_enabled(rgroup)) {
+		err = ERR_PTR(-EKEYREVOKED);
+		goto dec_svc;
+	}
+
+	/* Verify calling user/group has permission to use this service */
+	if (!cxi_rgroup_valid_user(rgroup)) {
+		err = ERR_PTR(-EPERM);
+		goto dec_svc;
+	}
+
+	rgid = cass_rgid_get(hw, rgroup);
+	if (rgid < 0) {
+		err = ERR_PTR(rgid);
+		goto dec_svc;
+	}
+
+	id = ida_alloc_min(&hw->lni_table, 1, GFP_KERNEL);
+	if (id < 0) {
+		err = ERR_PTR(id);
+		goto put_rgid;
+	}
+
+	lni_priv = kzalloc(sizeof(*lni_priv), GFP_KERNEL);
+	if (!lni_priv) {
+		err = ERR_PTR(-ENOMEM);
+		goto free_lni_id;
+	}
+
+	lni_priv->is_vf = vf_en;
+	if (vf_en) {
+		lni_priv->vf_num = vf_num;
+		lni_priv->phys_ac = hw->vfs[vf_num].phys_ac;
+	} else {
+		lni_priv->phys_ac = ATU_PHYS_AC;
+	}
+
+	lni_priv->rgroup = rgroup;
+	lni_priv->dev = dev;
+	lni_priv->lni.id = id;
+	lni_priv->lni.rgid = rgid;
+	lni_priv->pid = current->pid;
+	atomic_set(&lni_priv->lpe_pe_num, rgid % C_PE_COUNT);
+
+	spin_lock_init(&lni_priv->res_lock);
+	refcount_set(&lni_priv->refcount, 1);
+	mutex_init(&lni_priv->ac_list_mutex);
+
+	INIT_LIST_HEAD(&lni_priv->domain_list);
+	INIT_LIST_HEAD(&lni_priv->eq_list);
+	INIT_LIST_HEAD(&lni_priv->cq_list);
+	INIT_LIST_HEAD(&lni_priv->pt_list);
+	INIT_LIST_HEAD(&lni_priv->ac_list);
+	INIT_LIST_HEAD(&lni_priv->ct_list);
+	INIT_LIST_HEAD(&lni_priv->reserved_pids);
+	INIT_LIST_HEAD(&lni_priv->ct_cleanups_list);
+	INIT_LIST_HEAD(&lni_priv->pt_cleanups_list);
+	INIT_LIST_HEAD(&lni_priv->cq_cleanups_list);
+	INIT_LIST_HEAD(&lni_priv->eq_cleanups_list);
+
+	spin_lock(&hw->lni_lock);
+	list_add_tail(&lni_priv->list, &hw->lni_list);
+	atomic_inc(&hw->stats.lni);
+	spin_unlock(&hw->lni_lock);
+
+	refcount_inc(&hw->refcount);
+
+	lni_debugfs_create(lni_priv->lni.id, hw, lni_priv);
+
+	return &lni_priv->lni;
+
+free_lni_id:
+	ida_free(&hw->lni_table, id);
+put_rgid:
+	cass_rgid_put(hw, rgid);
+dec_svc:
+	cxi_rgroup_dec_refcount(rgroup);
+	return err;
+}
+EXPORT_SYMBOL(cxi_lni_alloc_internal);
+
+/**
+ * cxi_lni_alloc() - Allocate a logical NI (LNI)
+ *
+ * @dev: CXI device
+ * @svc_id: Service ID of service to be used. May be CXI_DEFAULT_SVC_ID.
+ */
+struct cxi_lni *cxi_lni_alloc(struct cxi_dev *dev, unsigned int svc_id)
+{
+	return dev->is_physfn ? cxi_lni_alloc_internal(dev, svc_id, false, 0) :
+				cxi_lni_alloc_vf(dev, svc_id);
+}
+EXPORT_SYMBOL(cxi_lni_alloc);
+
+int cxi_lni_pid_alloc(struct cxi_lni *lni)
+{
+	struct cxi_lni_priv *owner = container_of(lni, struct cxi_lni_priv, lni);
+	struct cass_dev *hw;
+	unsigned int pid;
+	int ret = -ENOSPC;
+
+	if (!owner->dev->is_physfn)
+		return -EOPNOTSUPP;
+	hw = container_of(owner->dev, struct cass_dev, cdev);
+	spin_lock(&hw->pid_pool_lock);
+	for (pid = 0; pid < owner->dev->prop.pid_count; pid++) {
+		if (test_bit(pid, hw->leased_pids) || hw->pid_usecount[pid])
+			continue;
+		set_bit(pid, hw->leased_pids);
+		set_bit(pid, owner->leased_pids);
+		ret = pid;
+		break;
+	}
+	spin_unlock(&hw->pid_pool_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cxi_lni_pid_alloc);
+
+void cxi_lni_pid_free(struct cxi_lni *lni, unsigned int pid)
+{
+	struct cxi_lni_priv *owner = container_of(lni, struct cxi_lni_priv, lni);
+	struct cass_dev *hw;
+
+	if (!owner->dev->is_physfn)
+		return;
+	hw = container_of(owner->dev, struct cass_dev, cdev);
+	spin_lock(&hw->pid_pool_lock);
+	if (!WARN_ON(pid >= owner->dev->prop.pid_count ||
+		     !test_bit(pid, owner->leased_pids) || hw->pid_usecount[pid])) {
+		clear_bit(pid, owner->leased_pids);
+		clear_bit(pid, hw->leased_pids);
+	}
+	spin_unlock(&hw->pid_pool_lock);
+}
+EXPORT_SYMBOL_GPL(cxi_lni_pid_free);
+
+/* Cleanup of an LNI. Return true if cleanup succeeded.
+ *
+ * If force is true, the LNI will be freed even if the CQs are still
+ * busy. This is only intended for driver unloading.
+ */
+static bool try_cleanup_lni(struct cxi_lni_priv *lni, bool force)
+{
+	struct cxi_dev *dev = lni->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	/* Cleanup cannot progress until all the CQs have been freed */
+	finalize_cq_cleanups(lni, force);
+	if (!force && !list_empty(&lni->cq_cleanups_list))
+		return false;
+
+	/* Same with the portals */
+	finalize_pt_cleanups(lni, force);
+	if (!force && !list_empty(&lni->pt_cleanups_list))
+		return false;
+
+	finalize_eq_cleanups(lni);
+	finalize_ct_cleanups(lni);
+
+	cass_acs_free(lni);
+
+	cxidev_WARN_ONCE(dev,
+			 !refcount_dec_and_test(&lni->refcount),
+			 "Resource leaks - LNI refcount not zero: %d\n",
+			 refcount_read(&lni->refcount));
+
+	debugfs_remove_recursive(lni->debug_dir);
+
+	cxi_rgroup_dec_refcount(lni->rgroup);
+	refcount_dec(&hw->refcount);
+	atomic_dec(&hw->stats.lni);
+	ida_free(&hw->lni_table, lni->lni.id);
+	cass_rgid_put(hw, lni->lni.rgid);
+
+	return true;
+}
+
+/* Try to cleanup all the pending LNIs.
+ * Returns false if at least one LNI is still pending.
+ *
+ * If force is true, the LNIs will be cleaned up.
+ */
+bool lni_cleanups(struct cass_dev *hw, bool force)
+{
+	struct cxi_lni_priv *lni;
+	struct cxi_lni_priv *tmp;
+	bool done = true;
+
+	mutex_lock(&hw->lni_cleanups_lock);
+
+	list_for_each_entry_safe(lni, tmp, &hw->lni_cleanups_list, list) {
+		if (try_cleanup_lni(lni, force)) {
+			list_del(&lni->list);
+			kfree(lni);
+		} else {
+			done = false;
+		}
+	}
+
+	mutex_unlock(&hw->lni_cleanups_lock);
+
+	return done;
+}
+
+void lni_cleanups_work(struct work_struct *work)
+{
+	struct cass_dev *hw =
+		container_of(work, struct cass_dev, lni_cleanups_work.work);
+
+	/* If cleanup is not complete, reschedule the work. */
+	if (!lni_cleanups(hw, false))
+		mod_delayed_work(system_wq, &hw->lni_cleanups_work, HZ);
+}
+
+/**
+ * cxi_lni_free_vf() - Shutdown and release an LNI for a VF.
+ *
+ * @lni: LNI to release
+ */
+static int cxi_lni_free_vf(struct cxi_lni *lni)
+{
+	struct cxi_lni_priv_vf *lni_priv_vf =
+		container_of(lni, struct cxi_lni_priv_vf, lni);
+	struct cxi_dev *dev = lni_priv_vf->dev;
+	const struct cxi_lni_free_cmd lni_free_cmd = {
+		.op = CXI_OP_LNI_FREE,
+		.lni = lni_priv_vf->lni.id,
+	};
+	const struct cxi_phys_lac_free_cmd lac_free_cmd = {
+		.op = CXI_OP_PHYS_LAC_FREE,
+		.lni = lni_priv_vf->lni.id,
+		.lac = lni_priv_vf->phys_lac,
+	};
+	size_t resp_len;
+	int rc;
+
+	/* Free the physical LAC */
+	if (lni_priv_vf->phys_lac >= 0) {
+		resp_len = 0;
+		cxi_send_msg_to_pf(dev, &lac_free_cmd, sizeof(lac_free_cmd), NULL, &resp_len);
+	}
+
+	/* Free LNI */
+	resp_len = 0;
+	rc = cxi_send_msg_to_pf(dev, &lni_free_cmd, sizeof(lni_free_cmd), NULL, &resp_len);
+	if (rc)
+		return rc;
+
+	kfree(lni_priv_vf);
+
+	return 0;
+}
+
+/**
+ * cxi_lni_free() - Shutdown and release an LNI.
+ *
+ * @lni: LNI to release
+ */
+int cxi_lni_free(struct cxi_lni *lni)
+{
+	struct cxi_lni_priv *lni_priv =
+		container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *dev = lni_priv->dev;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	if (!hw->cdev.is_physfn)
+		return cxi_lni_free_vf(lni);
+
+	spin_lock(&hw->lni_lock);
+	list_del(&lni_priv->list);
+	spin_unlock(&hw->lni_lock);
+
+	cxi_domain_lni_cleanup(lni_priv);
+
+	if (hw->cdev.is_physfn) {
+		cass_acs_disable(lni_priv);
+		cxi_inbound_wait(dev);
+	}
+
+	if (try_cleanup_lni(lni_priv, false)) {
+		kfree(lni_priv);
+	} else {
+		mutex_lock(&hw->lni_cleanups_lock);
+		list_add_tail(&lni_priv->list, &hw->lni_cleanups_list);
+		mutex_unlock(&hw->lni_cleanups_lock);
+
+		mod_delayed_work(system_wq, &hw->lni_cleanups_work, HZ);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_lni_free);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_odp_decouple.c b/drivers/net/ethernet/hpe/ss1/cass_odp_decouple.c
new file mode 100644
index 000000000000..29711586e535
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_odp_decouple.c
@@ -0,0 +1,599 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2021 Hewlett Packard Enterprise Development LP */
+
+/*
+ * ODP decoupling in software to work around Cassini ERRATA-3260
+ *
+ * Notes:
+ *
+ * 1. We will enter ODP decoupling when an invalidation completion wait
+ *    times out.
+ * 2. Find out the ID of the previous epoch. The completion wait command
+ *    triggers the switch between epochs. We need to know which one is blocked.
+ *    Read C_ATU_STS_AT_EPOCH. The previous epoch x = !CURRENT_EPOCH
+ * 3. If IXE_EPOCH*x*CNTR_NE0 is zero. The completion wait just finished.
+ *    Return from decoupling procedure and continue ODP processing. (return)
+ * 4. If IXE_EPOCH*x*_CNTR_NE0 is one, we need to find out if this epoch
+ *    counter is stuck or continues to decrement. Read repeatedly to see if
+ *    EPOCH*x* is moving. The interval between reads should be around 32
+ *    microseconds.
+ * 5. If EPOCH*x* returns to zero, return from decoupling procedure. (return)
+ * 6. If EPOCH*x* does not change between two reads, we determine that WRQ is
+ *    stuck with ODP at the head of the queue.
+ * 6.1  Get the previous Inbound Epoch. z = !C_ATU_STS_IB_EPOCH.CURRENT_EPOCH
+ * 6.2  Check C_ATU_STS_IB_EPOCH_CNTR.EPOCH*z*
+ *      If it is zero, we are not in the active Inbound wait and ready to
+ *      issue a new InboundWait (step 6.3)
+ *      If it is not zero, InboundWait is in progress. We need to wait for
+ *      this counter to get to zero before we issue a new one (step 6.3).
+ *      This counter may stop decrementing before it gets to zero. If it
+ *      happens, we do not need to issue a new InboundWait and should
+ *      proceed to step #7.
+ * 6.3  Issue an InboundWait and update z = !C_ATU_STS_IB_EPOCH.CURRENT_EPOCH
+ * 6.4  Monitor C_ATU_STS_IB_EPOCH_CNTR.EPOCH*z*
+ *      If it returns to zero, exit this procedure. Check
+ *      C_ATU_STS_IXE_AT_EPOCH_CNTR.EPOCHx. We expect the translation epoch
+ *      to be zero as well so no need for HW decoupling. If the translation
+ *      epoch counter is not zero, return a critical error.
+ *      If the counter stops decrementing, proceed to step #7.
+ * 7. To avoid Cassini ERRATA-3241, make sure EE and OXE epochs are at zero. Read
+ *    C_ATU_STS_AT_EPOCH to check if OXE_EPOCH*x*_CNTR_NE0 and
+ *    EE_EPOCH*x*_CNTR_NE0 are zero. If that is not the case, start pulling
+ *    C_ATU_STS_OXE_AT_EPOCH_CNTR and C_ATU_STS_EE_AT_EPOCH_CNTR, checking
+ *    EPOCH*x*, at 100 microseconds intervals. These counters should decrement
+ *    to zero. Detecting one of the counters being stuck indicates an
+ *    unexpected problem; print a critical error.
+ * 8. At this point, it is safe to enable HW decoupling
+ *    (C_ATU_CFG_ODP_DECOUPLE.ENABLE=1)
+ * 9. Continue reading C_ATU_STS_IXE_AT_EPOCH_CNTR, waiting for EPOCH*x* to
+ *    return to zero. If it does not happen for 100 ms, we have a problem,
+ *    print a critical error to get the node rebooted.
+ * 10.Once EPOCH*x* values for all three clients are zero, disable HW
+ *    decoupling (C_ATU_CFG_ODP_DECOUPLE.ENABLE=0) continue processing
+ *    invalidations. Return from decoupling procedure and continue ODP
+ *    processing. (return)
+ */
+
+#include <linux/iopoll.h>
+#include "cass_core.h"
+
+#define IXE_ECNTR C_ATU_STS_IXE_AT_EPOCH_CNTR
+#define IB_ECNTR C_ATU_STS_IB_EPOCH_CNTR
+
+static int ibw_epoch_wait_us = 50;
+module_param(ibw_epoch_wait_us, int, 0644);
+MODULE_PARM_DESC(ibw_epoch_wait_us,
+		 "Inbound epoch counter decrement wait time");
+
+static int ixe_epoch_wait_us = 32;
+module_param(ixe_epoch_wait_us, int, 0644);
+MODULE_PARM_DESC(ixe_epoch_wait_us,
+		 "Initial IXE epoch counter decrement wait time");
+
+static int epoch_wait_us = 100;
+module_param(epoch_wait_us, int, 0644);
+MODULE_PARM_DESC(epoch_wait_us, "Epoch counter decrement wait time");
+
+static void enable_hw_decoupling(struct cass_dev *hw, bool enable)
+{
+	union c1_atu_cfg_odp_decouple odp_dcpl = {
+		.flush_req_delay = ATU_FLUSH_REQ_DELAY,
+		.enable = enable
+	};
+
+	cass_write(hw, C1_ATU_CFG_ODP_DECOUPLE, &odp_dcpl, sizeof(odp_dcpl));
+}
+
+/* read/clear file operations */
+static int decouple_stats_read(struct seq_file *s, void *unused)
+{
+	int i;
+	long bin;
+	struct timespec64 time;
+	struct cass_dev *hw = s->private;
+
+	seq_printf(s, "completion_wait:%d\n",
+		   atomic_read(&hw->dcpl_comp_wait));
+	seq_printf(s, "md_clear_inval:%d\n",
+		   atomic_read(&hw->dcpl_md_clear_inval));
+	seq_printf(s, "nta_mn_inval:%d\n",
+		   atomic_read(&hw->dcpl_nta_mn_inval));
+	seq_printf(s, "ats_mn_inval:%d\n",
+		   atomic_read(&hw->dcpl_ats_mn_inval));
+	seq_printf(s, "ee_cntr_dec_0:%d\n",
+		   atomic_read(&hw->dcpl_ee_cntr_dec_0));
+	seq_printf(s, "ee_cntr_stuck:%d\n",
+		   atomic_read(&hw->dcpl_ee_cntr_stuck));
+	seq_printf(s, "oxe_cntr_dec_0:%d\n",
+		   atomic_read(&hw->dcpl_oxe_cntr_dec_0));
+	seq_printf(s, "oxe_cntr_stuck:%d\n",
+		   atomic_read(&hw->dcpl_oxe_cntr_stuck));
+	seq_printf(s, "ixe_cntr_0:%d\n",
+		   atomic_read(&hw->dcpl_ixe_cntr_0));
+	seq_printf(s, "ixe_cntr_dec_0:%d\n",
+		   atomic_read(&hw->dcpl_ixe_cntr_dec_0));
+	seq_printf(s, "ixe_cntr_stuck:%d\n",
+		   atomic_read(&hw->dcpl_ixe_cntr_stuck));
+	seq_printf(s, "ibw_cntr_dec_0_62:%d\n",
+		   atomic_read(&hw->dcpl_ibw_cntr_dec_0_62));
+	seq_printf(s, "ibw_cntr_dec_0_62_count:%d\n",
+		   atomic_read(&hw->dcpl_ibw_cntr_dec_0_62_count));
+	seq_printf(s, "ibw_cntr_dec_0_64:%d\n",
+		   atomic_read(&hw->dcpl_ibw_cntr_dec_0_64));
+	seq_printf(s, "ibw_cntr_dec_0_64_count:%d\n",
+		   atomic_read(&hw->dcpl_ibw_cntr_dec_0_64_count));
+	seq_printf(s, "step7:%d\n",
+		   atomic_read(&hw->dcpl_step7));
+	seq_printf(s, "ibw_active_stuck:%d\n",
+		   atomic_read(&hw->dcpl_ibw_active_stuck));
+	seq_printf(s, "ibw_idle_wait:%d\n",
+		   atomic_read(&hw->dcpl_ibw_idle_wait));
+	seq_printf(s, "ibw_cntr_is_0:%d\n",
+		   atomic_read(&hw->dcpl_ibw_cntr_is_0));
+	seq_printf(s, "ibw_issued:%d\n",
+		   atomic_read(&hw->dcpl_ibw_issued));
+	seq_printf(s, "entered:%d\n",
+		   atomic_read(&hw->dcpl_entered));
+	seq_printf(s, "success:%d\n",
+		   atomic_read(&hw->dcpl_success));
+
+	time = ktime_to_timespec64(hw->dcpl_max_time);
+	seq_printf(s, "dcpl_max_time:%lld.%06lds\n",
+		   time.tv_sec,
+		       time.tv_nsec / NSEC_PER_USEC);
+
+	for (i = 0, bin = FIRST_BIN; i < DBINS; i++, bin <<= 1) {
+		time = ktime_to_timespec64(bin);
+		seq_printf(s, "dcpl_time_bin:%lld.%06lds:%d\n",
+			   time.tv_sec, time.tv_nsec / NSEC_PER_USEC,
+			   hw->dcpl_time[i]);
+	}
+
+	time = ktime_to_timespec64(hw->pri_max_md_time);
+	seq_printf(s, "pri_max_md_time:%lld.%06lds\n",
+		   time.tv_sec,
+		       time.tv_nsec / NSEC_PER_USEC);
+
+	for (i = 0, bin = FIRST_MDBIN; i < MDBINS; i++, bin <<= 1) {
+		time = ktime_to_timespec64(bin);
+		seq_printf(s, "pri_md_time_bin:%lld.%06lds:%d\n",
+			   time.tv_sec, time.tv_nsec / NSEC_PER_USEC,
+			   hw->pri_md_time[i]);
+	}
+
+	time = ktime_to_timespec64(hw->pri_max_fault_time);
+	seq_printf(s, "pri_max_fault_time:%lld.%06lds\n",
+		   time.tv_sec,
+		       time.tv_nsec / NSEC_PER_USEC);
+
+	for (i = 0, bin = FIRST_FBIN; i < FBINS; i++, bin <<= 1) {
+		time = ktime_to_timespec64(bin);
+		seq_printf(s, "pri_fault_time_bin:%lld.%06lds:%d\n",
+			   time.tv_sec, time.tv_nsec / NSEC_PER_USEC,
+			   hw->pri_fault_time[i]);
+	}
+
+	return 0;
+}
+
+static ssize_t decouple_stats_write(struct file *f, const char __user *buf,
+				    size_t size, loff_t *pos)
+{
+	int i;
+	struct cass_dev *hw = file_inode(f)->i_private;
+
+	atomic_set(&hw->dcpl_md_clear_inval, 0);
+	atomic_set(&hw->dcpl_nta_mn_inval, 0);
+	atomic_set(&hw->dcpl_ats_mn_inval, 0);
+	atomic_set(&hw->dcpl_comp_wait, 0);
+	atomic_set(&hw->dcpl_entered, 0);
+	atomic_set(&hw->dcpl_ixe_cntr_0, 0);
+	atomic_set(&hw->dcpl_ixe_cntr_dec_0, 0);
+	atomic_set(&hw->dcpl_ee_cntr_dec_0, 0);
+	atomic_set(&hw->dcpl_ee_cntr_stuck, 0);
+	atomic_set(&hw->dcpl_oxe_cntr_dec_0, 0);
+	atomic_set(&hw->dcpl_oxe_cntr_stuck, 0);
+	atomic_set(&hw->dcpl_ixe_cntr_stuck, 0);
+	atomic_set(&hw->dcpl_success, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_dec_0_62, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_dec_0_62_count, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_dec_0_64, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_dec_0_64_count, 0);
+	atomic_set(&hw->dcpl_step7, 0);
+	atomic_set(&hw->dcpl_ibw_active_stuck, 0);
+	atomic_set(&hw->dcpl_ibw_idle_wait, 0);
+	atomic_set(&hw->dcpl_ibw_cntr_is_0, 0);
+	atomic_set(&hw->dcpl_ibw_issued, 0);
+
+	hw->dcpl_max_time = 0;
+	for (i = 0; i < DBINS; i++)
+		hw->dcpl_time[i] = 0;
+
+	hw->pri_max_md_time = 0;
+	for (i = 0; i < MDBINS; i++)
+		hw->pri_md_time[i] = 0;
+	hw->pri_max_fault_time = 0;
+	for (i = 0; i < FBINS; i++)
+		hw->pri_fault_time[i] = 0;
+
+	return size;
+}
+
+static int decouple_stats_read_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, decouple_stats_read, inode->i_private);
+}
+
+const struct file_operations decouple_stats_fops = {
+	.owner = THIS_MODULE,
+	.open = decouple_stats_read_open,
+	.read = seq_read,
+	.write = decouple_stats_write,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+static ssize_t sw_dcpl_read(struct file *f, char __user *buf, size_t size,
+			    loff_t *pos)
+{
+	char b[3];
+
+	b[0] = odp_sw_decouple ? 'Y' : 'N';
+	b[1] = '\n';
+	b[2] = '\0';
+
+	return simple_read_from_buffer(buf, size, pos, b, 3);
+}
+
+static ssize_t sw_dcpl_write(struct file *f, const char __user *buf,
+			     size_t size, loff_t *pos)
+{
+	int ret;
+	bool user_value;
+	struct cass_dev *hw = file_inode(f)->i_private;
+
+	ret = kstrtobool_from_user(buf, size, &user_value);
+	if (ret)
+		return ret;
+
+	odp_sw_decouple = user_value;
+	enable_hw_decoupling(hw, !odp_sw_decouple);
+
+	return size;
+}
+
+const struct file_operations sw_decouple_fops = {
+	.owner = THIS_MODULE,
+	.read = sw_dcpl_read,
+	.write = sw_dcpl_write,
+	.llseek = default_llseek
+};
+
+static void add_dcpl_time_to_bin(struct cass_dev *hw, ktime_t time)
+{
+	int i;
+	int bin = FIRST_BIN;
+
+	if (ktime_compare(hw->dcpl_max_time, time) < 0)
+		hw->dcpl_max_time = time;
+
+	for (i = 0; i < DBINS; i++, bin <<= 1) {
+		if (time < bin) {
+			hw->dcpl_time[i]++;
+			break;
+		}
+	}
+}
+
+/**
+ * cass_wait_epoch_cntr_dec_zero()
+ *
+ * Wait for one of the c_atu_sts_*_at_epoch_cntr counters to decrement to 0.
+ * The counters all use the same struct.
+ *
+ * @hw: the device
+ * @csr: Address of CSR to poll
+ * @sleep_us: Sleep time in microseconds
+ * @epoch: Which counter (0 or 1) to poll
+ * @loop_count: How many times through the loop. If the count is 0 the first
+ *              time, the count will be zero.
+ * Return: 0 on success, -1 if not decrementing
+ */
+static int cass_wait_epoch_cntr_dec_zero(struct cass_dev *hw, u64 csr,
+					 ulong sleep_us, int epoch,
+					 int *loop_count)
+{
+	int i;
+	int ret = 0;
+	u64 count;
+	u64 last_count = 0xffff;
+	union c_atu_sts_ixe_at_epoch_cntr ecntr;
+
+	for (i = 0; last_count > 0; i++) {
+		cass_read(hw, csr, &ecntr, sizeof(ecntr));
+		count = epoch ? ecntr.epoch1 : ecntr.epoch0;
+
+		if (!count)
+			break;
+
+		if (count >= last_count) {
+			ret = -1;
+			break;
+		}
+
+		last_count = count;
+		usleep_range(sleep_us, sleep_us * 2);
+	};
+
+	*loop_count = i;
+
+	return ret;
+}
+
+/**
+ * ixe_epoch_cntr_0() - Check if IXE epoch counter is zero
+ *
+ * @epoch_sts: Epoch status
+ * @epoch: The current epoch (false for epoch 0, true for epoch 1)
+ * Return: true if zero, false if not zero
+ */
+static bool ixe_epoch_cntr_0(union c_atu_sts_at_epoch *epoch_sts, bool epoch)
+{
+	if (!epoch) {
+		if (!epoch_sts->ixe_epoch0_cntr_ne0)
+			return true;
+	} else {
+		if (!epoch_sts->ixe_epoch1_cntr_ne0)
+			return true;
+	}
+
+	return false;
+}
+
+/**
+ * ibw_epoch_cntr_is_0() - Check if IBW epoch counter is zero
+ *
+ * @hw: the device
+ * @epoch_ret: Return the current_epoch
+ * Return: true if zero, false if not zero
+ */
+static bool ibw_epoch_cntr_is_0(struct cass_dev *hw, bool *epoch_ret)
+{
+	bool epoch;
+	union c_atu_sts_ib_epoch epoch_sts;
+
+	cass_read(hw, C_ATU_STS_IB_EPOCH, &epoch_sts, sizeof(epoch_sts));
+	epoch = !epoch_sts.current_epoch;
+
+	*epoch_ret = epoch;
+
+	if (!epoch) {
+		if (!epoch_sts.epoch0_cntr_ne0)
+			return true;
+	} else {
+		if (!epoch_sts.epoch1_cntr_ne0)
+			return true;
+	}
+
+	return false;
+}
+
+/**
+ * ibw_epoch_cntr_is_stuck() - Check if IBW counter is not decrementing
+ *                             Steps 6.1 and 6.2
+ *
+ * @hw: the device
+ * Return: true if stuck, false if 0 or returned to 0
+ */
+static bool ibw_epoch_cntr_is_stuck(struct cass_dev *hw)
+{
+	int ret;
+	int count;
+	bool ibw_epoch;
+
+	/* Step 6.1 - Get the previous Inbound Epoch */
+	ret = ibw_epoch_cntr_is_0(hw, &ibw_epoch);
+	if (ret)
+		return false;
+
+	/* Step 6.2 - Wait for inbound epoch counter to decrement to zero. */
+	ret = cass_wait_epoch_cntr_dec_zero(hw, IB_ECNTR, ibw_epoch_wait_us,
+					    ibw_epoch, &count);
+	if (!ret) {
+		atomic_inc(&hw->dcpl_ibw_cntr_dec_0_62);
+		atomic_add(count, &hw->dcpl_ibw_cntr_dec_0_62_count);
+		return false;
+	}
+
+	return true;
+}
+
+/**
+ * cass_odp_decouple() - handles spurious translation request due to
+ * bug
+ *
+ * WORKAROUND for Cassini ERRATA-3260
+ * In specific conditions, writes can be acked with a spurious pending
+ * translation request remaining. If not addressed with this function,
+ * then data corruption could occur.
+ *
+ * @hw: the device
+ * Return: 0 on success, negative value on failure
+ */
+int cass_odp_decouple(struct cass_dev *hw)
+{
+	int ret = 0;
+	int count;
+	bool ibw_epoch;
+	bool blocked_epoch;
+	union c_atu_sts_at_epoch at_epoch_sts;
+	union c_atu_sts_ixe_at_epoch_cntr ecntr;
+	struct cass_atu_cq *cq = &hw->atu_cq;
+	ktime_t start = ktime_get_raw();
+	struct sts_idle ibw_idle = {
+		.hw = hw,
+		.ib_wait = true
+	};
+
+	/* Step 1 */
+	atomic_inc(&hw->dcpl_entered);
+
+	/* Step 2 */
+	cass_read(hw, C_ATU_STS_AT_EPOCH, &at_epoch_sts, sizeof(at_epoch_sts));
+	blocked_epoch = !at_epoch_sts.current_epoch;
+
+	/* Step 3 - Check either IXE epoch counter 0 or 1 depending on the
+	 * current epoch.
+	 */
+	if (ixe_epoch_cntr_0(&at_epoch_sts, blocked_epoch)) {
+		atomic_inc(&hw->dcpl_ixe_cntr_0);
+		goto done;
+	}
+
+	/* Step 4/5 - Check if C_ATU_STS_IXE_AT_EPOCH_CNTR is stuck or returns
+	 * to 0.
+	 */
+	ret = cass_wait_epoch_cntr_dec_zero(hw, IXE_ECNTR, ixe_epoch_wait_us,
+					    blocked_epoch, &count);
+	if (!ret) {
+		atomic_inc(&hw->dcpl_ixe_cntr_dec_0);
+		goto done;
+	}
+
+	/* This function may have completed with IBW active so check if it
+	 * still is. Also, inbound wait leaves the inbound_wait_idle inactive
+	 * for some time after it has completed so we need to wait for idle
+	 * before issuing a new inbound wait.
+	 * If IBW is not idle, check if the IBW epoch counter is stuck.
+	 */
+	while (!cass_sts_idle(&ibw_idle)) {
+		if (ibw_epoch_cntr_is_stuck(hw)) {
+			atomic_inc(&hw->dcpl_ibw_active_stuck);
+			goto step_7;
+		}
+		usleep_range(10, 20);
+	}
+
+	/* Determine if another process has issued an inbound wait since the
+	 * lock will be held in that case.
+	 * If we don't get the lock, then cxi_inbound_wait() is in progress.
+	 * If IBW is idle, the c_atu_cfg_inbound_wait may not have been
+	 * written yet or it is just completing and the lock will be released
+	 * soon. We will wait for a not idle status before we can continue to
+	 * step 6.1.
+	 */
+	while (!mutex_trylock(&cq->atu_ib_mutex)) {
+		if (cass_sts_idle(&ibw_idle)) {
+			atomic_inc(&hw->dcpl_ibw_idle_wait);
+			usleep_range(10, 20);
+			continue;
+		}
+
+		/* Step 6.1/6.2 */
+		ret = ibw_epoch_cntr_is_stuck(hw);
+		if (ret)
+			goto step_7;
+
+		atomic_inc(&hw->dcpl_ibw_cntr_is_0);
+	}
+
+	/* Check for idle after we have the lock */
+	if (!cass_sts_idle(&ibw_idle)) {
+		if (ibw_epoch_cntr_is_stuck(hw)) {
+			mutex_unlock(&cq->atu_ib_mutex);
+			goto step_7;
+		}
+	}
+
+	/* Step 6.3 - Issue inbound wait and update current epoch */
+	atomic_inc(&hw->dcpl_ibw_issued);
+	ret = cass_inbound_wait(hw, false);
+	if (ret) {
+		cxidev_crit_once(&hw->cdev, "IBW failed %d\n", ret);
+		mutex_unlock(&cq->atu_ib_mutex);
+		goto done;
+	}
+
+	/* get the new epoch */
+	ibw_epoch_cntr_is_0(hw, &ibw_epoch);
+	mutex_unlock(&cq->atu_ib_mutex);
+
+	/* 6.4  Monitor inbound epoch counter */
+	ret = cass_wait_epoch_cntr_dec_zero(hw, IB_ECNTR, ibw_epoch_wait_us,
+					    ibw_epoch, &count);
+	if (!ret) {
+		atomic_inc(&hw->dcpl_ibw_cntr_dec_0_64);
+		atomic_add(count, &hw->dcpl_ibw_cntr_dec_0_64_count);
+
+		cass_read(hw, C_ATU_STS_AT_EPOCH, &at_epoch_sts,
+			  sizeof(at_epoch_sts));
+		if (blocked_epoch != !at_epoch_sts.current_epoch)
+			cxidev_crit_once(&hw->cdev, "IXE epoch changed\n");
+
+		if (!ixe_epoch_cntr_0(&at_epoch_sts, blocked_epoch))
+			cxidev_crit_once(&hw->cdev, "IXE epoch cntr should be 0\n");
+
+		goto done;
+	}
+
+step_7:
+	/* Step 7 - Check if C_ATU_STS_EE/OXE_AT_EPOCH_CNTR are at 0. */
+	atomic_inc(&hw->dcpl_step7);
+
+	cass_read(hw, C_ATU_STS_AT_EPOCH, &at_epoch_sts, sizeof(at_epoch_sts));
+	if ((!blocked_epoch && at_epoch_sts.ee_epoch0_cntr_ne0) ||
+	    (blocked_epoch && at_epoch_sts.ee_epoch1_cntr_ne0)) {
+		atomic_inc(&hw->dcpl_ee_cntr_dec_0);
+		ret = cass_wait_epoch_cntr_dec_zero(hw,
+						    C_ATU_STS_EE_AT_EPOCH_CNTR, epoch_wait_us,
+				blocked_epoch, &count);
+		if (ret) {
+			cxidev_crit_once(&hw->cdev,
+					 "EE_AT_EPOCH_CNTR did not return to 0\n");
+			atomic_inc(&hw->dcpl_ee_cntr_stuck);
+			ret = -1;
+			goto done;
+		}
+	}
+
+	if ((!blocked_epoch && at_epoch_sts.oxe_epoch0_cntr_ne0) ||
+	    (blocked_epoch && at_epoch_sts.oxe_epoch1_cntr_ne0)) {
+		atomic_inc(&hw->dcpl_oxe_cntr_dec_0);
+		ret = cass_wait_epoch_cntr_dec_zero(hw,
+						    C_ATU_STS_OXE_AT_EPOCH_CNTR,
+				epoch_wait_us, blocked_epoch, &count);
+		if (!ret) {
+			cxidev_crit_once(&hw->cdev,
+					 "OXE_AT_EPOCH_CNTR did not return to 0\n");
+			atomic_inc(&hw->dcpl_oxe_cntr_stuck);
+			ret = -1;
+			goto done;
+		}
+	}
+
+	/* Step 8 - Now we can enable hw decoupling */
+	enable_hw_decoupling(hw, true);
+
+	/* Step 9 - Wait for IXE epoch cntr to return to 0 */
+	ret = cass_wait_epoch_cntr_dec_zero(hw, IXE_ECNTR, epoch_wait_us,
+					    blocked_epoch, &count);
+	if (!ret) {
+		atomic_inc(&hw->dcpl_success);
+	} else {
+		cass_read(hw, IXE_ECNTR, &ecntr,
+			  sizeof(ecntr));
+		cxidev_crit_once(&hw->cdev,
+				 "IXE EPOCH counter not 0 with decoupling enabled epoch:%d epoch0:%x epoch1:%x\n",
+				 blocked_epoch, ecntr.epoch0, ecntr.epoch1);
+		ret = -1;
+		atomic_inc(&hw->dcpl_ixe_cntr_stuck);
+	}
+
+	/* Step 10 - Disable hw decoupling */
+	enable_hw_decoupling(hw, false);
+
+done:
+	add_dcpl_time_to_bin(hw, ktime_get_raw() - start);
+
+	return ret;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_pcie_mon.c b/drivers/net/ethernet/hpe/ss1/cass_pcie_mon.c
new file mode 100644
index 000000000000..5b06427b7804
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_pcie_mon.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022 Hewlett Packard Enterprise Development LP */
+
+/* Monitoring of vendor specific PCIe counters */
+
+#include "cass_core.h"
+
+#define NUM_LANES 16
+
+/* Options for EVENT_COUNTER_CONTROL_REG register. */
+#define COUNTERS_CLEAR_ONE  (0x01 << 0)
+#define COUNTERS_CLEAR_ALL  (0x03 << 0)
+#define COUNTERS_ENABLE_ALL (0x07 << 2)
+
+struct pcie_cntrs_group {
+	u8 first;
+	u8 last;
+	const char *names[];
+};
+
+static const struct pcie_cntrs_group group_0 = {
+	0, 10,
+	{ "RX Elastic Buffer Overflow Error",
+	  "RX Elastic Buffer Underflow Error",
+	  "Decode Error",
+	  "Disparity Error",
+	  "SKP OS Parity Error",
+	  "SYNC Header Error",
+	  "RX valid de-assertion",
+	  "CTL SKP OS Parity Error",
+	  "1st Retimer Parity Error",
+	  "2nd Retimer Parity Error",
+	  "Margin CRC and Parity Error"
+	}
+};
+
+static const struct pcie_cntrs_group group_1 = {
+	5, 10,
+	{ "Detect EI Infer",
+	  "Receiver Error",
+	  "RX Recovery Request",
+	  "N_FTS Timeout",
+	  "Framing Error",
+	  "Deskew Error"
+	}
+};
+
+static const struct pcie_cntrs_group group_2 = {
+	0, 7,
+	{ "BAD TLP",
+	  "LCRC Error",
+	  "BAD DLLP",
+	  "Replay Number Rollover",
+	  "Replay Timeout",
+	  "RX Nak DLLP",
+	  "TX Nak DLLP",
+	  "Retry LLP"
+	}
+};
+
+static const struct pcie_cntrs_group group_3 = {
+	0, 5,
+	{ "FC Timeout",
+	  "Poisoned TLP",
+	  "ECRC Error",
+	  "Unsupported Request",
+	  "Completer Abort",
+	  "Completion Timeout"
+	}
+};
+
+static const struct pcie_cntrs_group group_4 = {
+	0, 1,
+	{ "EBUF SKP Add",
+	  "EBUF SKP Del"
+	}
+};
+
+static const struct pcie_cntrs_group group_5 = {
+	0, 13,
+	{ "L0 to Recovery Entry",
+	  "L1 to Recovery Entry",
+	  "TX L0s Entry",
+	  "RX L0s Entry",
+	  "ASPM L1 Reject",
+	  "L1 Entry",
+	  "L1 CPM",
+	  "L1.1 Entry",
+	  "L1.2 Entry",
+	  "L1 Short Duration",
+	  "L1.1 Abort",
+	  "L2 Entry",
+	  "Speed Change",
+	  "Link Width Change",
+	}
+};
+
+static const struct pcie_cntrs_group group_6 = {
+	0, 6,
+	{ "TX Ack DLLP",
+	  "TX Update FC DLLP",
+	  "RX ACK DLLP",
+	  "RX Update FC DLLP",
+	  "RX Nullified TLP",
+	  "TX Nullified TLP",
+	  "RX Duplicate TLP"
+	}
+};
+
+static const struct pcie_cntrs_group group_7 = {
+	0, 23,
+	{ "TX Memory Write",
+	  "TX Memory Read",
+	  "TX Configuration Write",
+	  "TX Configuration Read",
+	  "TX IO Write",
+	  "TX IO Read",
+	  "TX Completion w/o data",
+	  "TX Completion w/ data",
+	  "TX Message TLP",
+	  "TX Atomic",
+	  "TX TLP with Prefix",
+	  "RX Memory Write",
+	  "RX Memory Read",
+	  "RX Configuration Write",
+	  "RX Configuration Read",
+	  "RX IO Write",
+	  "RX IO Read",
+	  "RX Completion without data",
+	  "RX Completion w data",
+	  "RX Message TLP",
+	  "RX Atomic",
+	  "RX TLP with Prefix",
+	  "TX CCIX TLP",
+	  "RX CCIX TLP"
+	}
+};
+
+static const struct pcie_cntrs_group *groups[8] = {
+	&group_0, &group_1, &group_2, &group_3,
+	&group_4, &group_5, &group_6, &group_7
+};
+
+/* Enable and clear counters for all lanes. */
+static void enable_pcie_counters(struct cass_dev *hw)
+{
+	unsigned int lane;
+
+	for (lane = 0; lane < NUM_LANES; lane++) {
+		u32 val = lane << 8 | COUNTERS_ENABLE_ALL | COUNTERS_CLEAR_ALL;
+
+		pci_write_config_dword(hw->cdev.pdev,
+				       hw->pcie_mon.event_counter_control, val);
+	}
+}
+
+/* Clear a single lane */
+static void clear_counter_events(struct cass_dev *hw, u8 lane)
+{
+	u32 val = (lane << 8) | COUNTERS_CLEAR_ALL;
+
+	pci_write_config_dword(hw->cdev.pdev,
+			       hw->pcie_mon.event_counter_control, val);
+}
+
+/* Check whether events in a particular group are above an acceptable
+ * threshold.
+ */
+static int check_group(struct cass_dev *hw, u8 group, int first, int last,
+		       unsigned int acceptable)
+{
+	u8 event;
+	int err = 0;
+
+	for (event = first; event <= last; event++) {
+		u32 val = (group << 24) | (event << 16);
+
+		pci_write_config_dword(hw->cdev.pdev,
+				       hw->pcie_mon.event_counter_control, val);
+		pci_read_config_dword(hw->cdev.pdev,
+				      hw->pcie_mon.event_counter_data, &val);
+
+		err += val;
+
+		if (val > acceptable) {
+			const struct pcie_cntrs_group *ginfo = groups[group];
+
+			/* TODO: something that wouldn't spam logs */
+			cxidev_err(&hw->cdev, "PCIe error: %s=%u\n",
+				   ginfo->names[event - ginfo->first], val);
+		}
+	}
+
+	return err;
+}
+
+/* Monitor groups with correctable and uncorrectable errors.
+ */
+static void pcie_monitoring_task(struct work_struct *work)
+{
+	struct cass_dev *hw =
+		container_of(work, struct cass_dev, pcie_mon.task.work);
+
+	/* Uncorrectable errors. None acceptable. */
+	hw->pcie_mon.uncorr_err += check_group(hw, 3, 0, 5, 0);
+
+	/* Correctable errors. */
+	if (hw->pcie_mon.corr_err_min) {
+		hw->pcie_mon.corr_err += check_group(hw, 1, 7, 7,
+						     hw->pcie_mon.corr_err_min);
+		hw->pcie_mon.corr_err += check_group(hw, 2, 0, 7,
+						     hw->pcie_mon.corr_err_min);
+		hw->pcie_mon.corr_err += check_group(hw, 5, 0, 0,
+						     hw->pcie_mon.corr_err_min);
+	}
+
+	clear_counter_events(hw, 0);
+
+	mod_delayed_work(system_wq, &hw->pcie_mon.task, 60 * HZ);
+}
+
+void start_pcie_monitoring(struct cass_dev *hw)
+{
+	int pos;
+
+	/* Get Vendor Specific Information block */
+	pos = 0;
+	while ((pos = pci_find_next_ext_capability(hw->cdev.pdev, pos,
+						   PCI_EXT_CAP_ID_VNDR))) {
+		u32 header;
+
+		pci_read_config_dword(hw->cdev.pdev,
+				      pos + PCI_VNDR_HEADER, &header);
+
+		if (PCI_VNDR_HEADER_ID(header) == 2 &&
+		    PCI_VNDR_HEADER_REV(header) == 4 &&
+		    PCI_VNDR_HEADER_LEN(header) == 0x100) {
+			hw->pcie_mon.event_counter_control = pos + 8;
+			hw->pcie_mon.event_counter_data = pos + 12;
+			break;
+		}
+	}
+
+	if (!hw->pcie_mon.event_counter_control) {
+		cxidev_err(&hw->cdev, "PCIe monitoring is not available\n");
+		return;
+	}
+
+	/* Set the number of acceptable correctable errors per
+	 * minute depending on the link speed.
+	 */
+	switch (hw->pcie_link_speed) {
+	case PCIE_SPEED_2_5GT:
+		hw->pcie_mon.corr_err_min = 5;
+		break;
+	case PCIE_SPEED_5_0GT:
+		hw->pcie_mon.corr_err_min = 10;
+		break;
+	case PCIE_SPEED_8_0GT:
+		hw->pcie_mon.corr_err_min = 15;
+		break;
+	case PCIE_SPEED_16_0GT:
+		hw->pcie_mon.corr_err_min = 31;
+		break;
+	case CASS_SPEED_20_0GT:
+		hw->pcie_mon.corr_err_min = 40;
+		break;
+	case CASS_SPEED_25_0GT:
+		hw->pcie_mon.corr_err_min = 48;
+		break;
+	case CASS_SPEED_32_0GT:
+		hw->pcie_mon.corr_err_min = 61;
+		break;
+	}
+
+	enable_pcie_counters(hw);
+
+	INIT_DELAYED_WORK(&hw->pcie_mon.task, pcie_monitoring_task);
+	mod_delayed_work(system_wq, &hw->pcie_mon.task, 60 * HZ);
+}
+
+void stop_pcie_monitoring(struct cass_dev *hw)
+{
+	if (!hw->pcie_mon.event_counter_control)
+		return;
+
+	cancel_delayed_work_sync(&hw->pcie_mon.task);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_pt.c b/drivers/net/ethernet/hpe/ss1/cass_pt.c
new file mode 100644
index 000000000000..8763255b4459
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_pt.c
@@ -0,0 +1,1255 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2018-2020, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Create and destroy Cassini portal tables */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/iopoll.h>
+#include <linux/uaccess.h>
+#include <linux/delay.h>
+
+#include "cass_core.h"
+#include "cass_ss1_debugfs.h"
+
+/* Use the last logical endpoint for rendezvous offload. */
+#define RDZV_GET_IDX(pid_granule) ((pid_granule) - 1)
+
+static bool rdzv_get_en_default = true;
+module_param(rdzv_get_en_default, bool, 0444);
+MODULE_PARM_DESC(rdzv_get_en_default, "Hardware rendezvous get enable default");
+
+#define PE_LE_MAX (C_LPE_STS_LIST_ENTRIES_ENTRIES / C_PE_COUNT)
+
+/* By default, all pools share all LEs. Limits are set via use of a service.
+ * Reduce pe_total_les to limit the number of LEs available.
+ */
+unsigned int pe_total_les = PE_LE_MAX;
+module_param(pe_total_les, uint, 0644);
+MODULE_PARM_DESC(pe_total_les, "Maximum number of LEs accessible to a PE");
+
+static void init_le_pools(struct cass_dev *hw)
+{
+	int pe;
+	int pool;
+	union c_lpe_cfg_pe_le_pools le_pool;
+
+	/* Validate module parameters */
+	if (pe_total_les > PE_LE_MAX) {
+		pe_total_les = PE_LE_MAX;
+		cxidev_warn(&hw->cdev, "Total LEs (%u) exceeded maximum (%u).\n",
+			    pe_total_les, PE_LE_MAX);
+	}
+
+	/* Configure LE Pools */
+	for (pe = 0; pe < C_PE_COUNT; pe++) {
+		union c_lpe_cfg_pe_le_shared le_shared = {
+			.num_total = pe_total_les,
+			.num_shared = pe_total_les,
+		};
+
+		cass_write(hw, C_LPE_CFG_PE_LE_SHARED(pe), &le_shared,
+			   sizeof(le_shared));
+
+		for (pool = 0; pool < CASS_NUM_LE_POOLS; pool++) {
+
+			le_pool.max_alloc = pe_total_les;
+			le_pool.num_reserved = 0;
+			cass_config_lpe_reserve_pool(hw, pe, pool, &le_pool);
+
+			cxidev_dbg(&hw->cdev, "pe: %u pool: %u max: %u res: %u\n",
+				   pe, pool, le_pool.max_alloc,
+				   le_pool.num_reserved);
+		}
+
+		cxidev_dbg(&hw->cdev, "pe: %u total: %u shared: %u\n",
+			   pe, pe_total_les, le_shared.num_shared);
+
+		/* Reliquish the core. This takes a long time on the Z1. */
+		if (HW_PLATFORM_Z1(hw))
+			cond_resched();
+	}
+}
+
+/* Do necessary CSR updates to reserve or release(share) LEs */
+void cass_cfg_le_pools(struct cass_dev *hw, int pool_id, int pe,
+		       const struct cxi_limits *les, bool release)
+{
+	int sign = 1;
+	union c_lpe_cfg_pe_le_shared le_shared;
+	union c_lpe_cfg_pe_le_pools le_pool = {
+		.max_alloc = les->max,
+		.num_reserved = les->res,
+	};
+
+	if (release) {
+		le_pool.max_alloc = les->max;
+		le_pool.num_reserved = 0;
+		sign = -1;
+	}
+
+	cass_read(hw, C_LPE_CFG_PE_LE_SHARED(pe), &le_shared,
+		  sizeof(le_shared));
+	le_shared.num_shared -= (les->res * sign);
+
+	/*
+	 * NUM_SHARED should be reduced before
+	 * dedicating entries to pools.
+	 */
+	if (release) {
+		cass_config_lpe_reserve_pool(hw, pe, pool_id, &le_pool);
+		cass_write(hw, C_LPE_CFG_PE_LE_SHARED(pe), &le_shared,
+			   sizeof(le_shared));
+	} else {
+		cass_write(hw, C_LPE_CFG_PE_LE_SHARED(pe), &le_shared,
+			   sizeof(le_shared));
+		cass_config_lpe_reserve_pool(hw, pe, pool_id, &le_pool);
+	}
+}
+
+void cass_pte_set_get_ctrl(struct cass_dev *hw)
+{
+	union c_lpe_cfg_get_ctrl cfg_get_ctrl = {
+		.transaction_type = TRANSACTION_TYPE,
+		.get_en = !!hw->cdev.prop.rdzv_get_en,
+		.dfa_nid = hw->cdev.prop.nid,
+	};
+
+	cfg_get_ctrl.get_index = cxi_build_dfa_ep(0, hw->cdev.prop.pid_bits,
+						  hw->cdev.prop.rdzv_get_idx);
+	cfg_get_ctrl.get_index_ext =
+		cxi_build_dfa_ext(hw->cdev.prop.rdzv_get_idx);
+
+	cass_write(hw, C_LPE_CFG_GET_CTRL, &cfg_get_ctrl,
+		   sizeof(cfg_get_ctrl));
+}
+
+void cass_pte_init(struct cass_dev *hw)
+{
+	const union c_lpe_cfg_initiator_ctrl cfg_initiator_ctrl = {
+		.pid_bits = hw->cdev.prop.pid_bits,
+	};
+
+	hw->cdev.prop.rdzv_get_idx = RDZV_GET_IDX(hw->cdev.prop.pid_granule);
+
+	/*
+	 * Configure CSRs for HW rendezvous offload. The target NIC will build
+	 * the GET DFA by utilizing the source PID within the initiator field
+	 * from rendezvous command. In order for the target NIC to target the
+	 * correct PtlTE, SW must allocate and map a PtlTE at the max PID offset
+	 * value. For example, if number of PIDs equal 512 (9 bits for PID), 8
+	 * bits remain for PID offset. A rendezvous PtlTE needs to be mapped at
+	 * PID offset 0xFF.
+	 */
+	cass_write(hw, C_LPE_CFG_INITIATOR_CTRL, &cfg_initiator_ctrl,
+		   sizeof(cfg_initiator_ctrl));
+
+	hw->cdev.prop.rdzv_get_en = rdzv_get_en_default;
+	cass_pte_set_get_ctrl(hw);
+
+	init_le_pools(hw);
+}
+
+/* Update an MST return code, and return true if the entry is still
+ * valid.
+ */
+static bool mst_rc_update(struct cass_dev *hw,
+			  const union c_mst_cfg_rc_update *mst_update)
+{
+	const void __iomem *csr = cass_csr(hw, C_MST_STS_RC_STS);
+	union c_mst_sts_rc_sts mst_update_sts;
+	int rc;
+
+	mutex_lock(&hw->mst_update_lock);
+
+	cass_write(hw, C_MST_CFG_RC_UPDATE, mst_update, sizeof(*mst_update));
+
+	/* Wait for MST entry update to complete. */
+	rc = readq_poll_timeout(csr, mst_update_sts.qw,
+				mst_update_sts.done == 1, 1, 1000);
+
+	mutex_unlock(&hw->mst_update_lock);
+
+	cxidev_WARN_ONCE(&hw->cdev, rc, "Timeout waiting for MST RC update");
+
+	return mst_update_sts.done == 1 && mst_update_sts.match == 1;
+}
+
+/*
+ * Clean the entries in the MST table that refer to that PT entry.
+ */
+static void pt_mst_cleanup(struct cxi_pte_priv *pt)
+{
+	struct cxi_dev *cdev = pt->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	const unsigned int ptlte_index = pt->pte.id;
+	int i;
+	union c_mst_cfg_rc_update cfg_rc_update = {
+		.return_code = C_RC_MST_CANCELLED,
+		.portal_vld = 1,
+		.portal_idx = ptlte_index,
+	};
+	union c_mst_sts_num_req mst_sts;
+
+	if (!HW_PLATFORM_NETSIM(hw))
+		cass_read(hw, C_MST_STS_NUM_REQ, &mst_sts, sizeof(mst_sts));
+	else
+		mst_sts.cnt = C_MST_DBG_MST_TABLE_ENTRIES;
+
+	for (i = 0; i < C_MST_DBG_MST_TABLE_ENTRIES && mst_sts.cnt; i++) {
+		/* Read only the 3rd 64 bits word from the entry, for
+		 * the portal_index field.
+		 */
+
+		/* TODO: (TAG_NO_PTE_0) we need to determine whether
+		 * an MST is valid before accessing it.
+		 * Currently, we rely on the pte index to not be 0.
+		 * This prevents lots on unneeded writes to C_MST_CFG_RC_UPDATE.
+		 */
+		struct c_mst_table_simple mst_entry;
+		u64 offset = C_MST_DBG_MST_TABLE(i) + C_MST_TABLE_SIMPLE_OFFSET;
+
+		cass_read(hw, offset, &mst_entry, sizeof(mst_entry));
+
+		if (mst_entry.portal_index != ptlte_index)
+			continue;
+
+		cfg_rc_update.mst_idx = i;
+
+		if (mst_rc_update(hw, &cfg_rc_update))
+			set_bit(i, pt->mst_rc_update);
+
+		mst_sts.cnt--;
+	}
+
+	cass_flush_pci(hw);
+}
+
+#define PE_FREE_MASK_LEN (C_LPE_STS_PE_FREE_MASK_ENTRIES / C_PE_COUNT)
+
+/*
+ * Set the free bit in the corresponding FREE_MASK CSRs.
+ */
+static void cxi_pte_le_mark_free(struct cass_dev *hw, unsigned int le_idx,
+				 unsigned int pe_num)
+{
+	unsigned int fm_idx;
+	unsigned int fm_bit;
+	u64 offset;
+	union c_lpe_sts_pe_free_mask sts_pe_free_mask;
+
+	fm_idx = le_idx % PE_FREE_MASK_LEN;
+	fm_bit = le_idx / PE_FREE_MASK_LEN;
+	sts_pe_free_mask.free_mask = BIT(fm_bit);
+
+	/* All 4 pools are consecutive in memory, so only use pool0
+	 * for the address computation.
+	 */
+	offset = C_LPE_STS_PE_FREE_MASK(pe_num * PE_FREE_MASK_LEN + fm_idx);
+
+	cass_write(hw, offset, &sts_pe_free_mask, sizeof(sts_pe_free_mask));
+}
+
+/* Walk a PtlTE list, and free the entries. The list must be valid. */
+static void cxi_pte_le_free(struct cass_dev *hw,
+			    const struct c_lpe_cfg_ptl_table_ptrs *list,
+			    unsigned int pe_num, unsigned int le_pool)
+{
+	const union c_lpe_msc_le_pool_free le_pool_free = {
+		.free_en = 1,
+		.le_pool = le_pool,
+	};
+	unsigned int le_idx = list->head;
+
+	/* Walk the list entries marking each one as ready to be freed. */
+	while (true) {
+		/* Read only the 6th 64 bits from the entry. */
+		struct c_list_entry_simple le;
+		u64 offset =
+			C_LPE_STS_LIST_ENTRIES(pe_num * PE_LE_MAX + le_idx) +
+			5 * sizeof(u64);
+
+		cass_read(hw, offset, &le, sizeof(le));
+
+		cxi_pte_le_mark_free(hw, le_idx, pe_num);
+
+		/* Tell NIC an entry was freed */
+		cass_write(hw, C_LPE_MSC_LE_POOL_FREE(pe_num),
+			   &le_pool_free, sizeof(le_pool_free));
+
+		if (le.vld) {
+			le_idx = le.addr;
+		} else {
+			WARN_ON_ONCE(list->tail != le_idx);
+			break;
+		}
+	}
+}
+
+/* Clean up resources associated with the PtlTE. */
+static void pt_cleanup(struct cxi_pte_priv *pt)
+{
+	struct cxi_lni_priv *lni = pt->lni_priv;
+	struct cxi_dev *cdev = lni->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_lpe_cfg_ptl_table ptl_table;
+	int i;
+
+	/* Cleaning Up Portal Table Entries */
+
+	spin_lock(&hw->lpe_shadow_lock);
+	cass_read_pte(hw, pt->pte.id, &ptl_table);
+	spin_unlock(&hw->lpe_shadow_lock);
+
+	/* Walk the various lists in the PtlTE, free LEs, and
+	 * invalidate the list.
+	 */
+	for (i = 0; i < ARRAY_SIZE(ptl_table.l); i++) {
+		struct c_lpe_cfg_ptl_table_ptrs *list = &ptl_table.l[i];
+
+		if (!list->list_vld)
+			continue;
+
+		cxi_pte_le_free(hw, list, ptl_table.pe_num,
+				ptl_table.le_pool);
+	}
+
+	pt_mst_cleanup(pt);
+
+	/* Clear the entire PTE descriptor including list_vld and list
+	 * pointers.
+	 */
+	memset(&ptl_table, 0, sizeof(ptl_table));
+	cass_write(hw, C_LPE_CFG_PTL_TABLE(pt->pte.id),
+		   &ptl_table, sizeof(ptl_table));
+
+	cass_flush_pci(hw);
+}
+
+static struct cxi_pte *cxi_pte_alloc_vf(struct cxi_lni *lni,
+					struct cxi_eq *evtq,
+					const struct cxi_pt_alloc_opts *opts)
+{
+	struct cxi_lni_priv *lni_priv =
+		container_of(lni, struct cxi_lni_priv, lni);
+	const struct cxi_pte_alloc_cmd cmd = {
+		.op = CXI_OP_PTE_ALLOC,
+		.lni_hndl = lni_priv->lni.id,
+		.evtq_hndl = evtq ? evtq->eqn : C_EQ_NONE,
+		.opts = *opts,
+	};
+	struct cxi_pte_alloc_resp resp = {};
+	size_t resp_size = sizeof(resp);
+	int rc;
+	struct cxi_pte_priv *pt_priv;
+
+	pt_priv = kzalloc(sizeof(*pt_priv), GFP_KERNEL);
+	if (!pt_priv)
+		return ERR_PTR(-ENOMEM);
+
+	rc = cxi_send_msg_to_pf(lni_priv->dev, &cmd, sizeof(cmd),
+				&resp, &resp_size);
+	if (rc)
+		goto free_pt;
+
+	pt_priv->lni_priv = lni_priv;
+	pt_priv->pte.id = resp.pte_number;
+
+	if (evtq)
+		pt_priv->eq = container_of(evtq, struct cxi_eq_priv, eq);
+	else
+		pt_priv->eq = NULL;
+
+	return &pt_priv->pte;
+
+free_pt:
+	kfree(pt_priv);
+	return ERR_PTR(rc);
+}
+
+/**
+ * cxi_pte_alloc() - Allocate a portal table entry (PTE)
+ *
+ * @lni: LNI used for PTE allocation
+ * @evtq: Event Queue to associate with the PTE
+ * @opts: Options affecting the PTE
+ *
+ * @return: the PTE or an error pointer
+ */
+struct cxi_pte *cxi_pte_alloc(struct cxi_lni *lni, struct cxi_eq *evtq,
+			      const struct cxi_pt_alloc_opts *opts)
+{
+	struct cxi_lni_priv *lni_priv =
+		container_of(lni, struct cxi_lni_priv, lni);
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_pte_priv *pt;
+	struct cxi_eq_priv *eq = NULL;
+	int pt_n;
+	int rc;
+	union c_lpe_cfg_ptl_table ptl_table = {
+		.en_event_match = opts->en_event_match,
+		.clr_remote_offset = opts->clr_remote_offset,
+		.en_flowctrl = opts->en_flowctrl,
+		.use_long_event = opts->use_long_event,
+		.lossless = opts->lossless,
+		.en_restricted_unicast_lm = opts->en_restricted_unicast_lm,
+		.use_logical = opts->use_logical,
+		.is_matching = opts->is_matching,
+		.en_match_on_vni = opts->en_match_on_vni,
+		.do_space_check = opts->do_space_check,
+		.en_align_lm = opts->en_align_lm,
+		.en_sw_hw_st_chng = opts->en_sw_hw_st_chng,
+		.ptl_state = opts->ethernet ?
+			C_PTLTE_ETHERNET : C_PTLTE_DISABLED,
+		.signal_invalid = opts->signal_invalid,
+		.signal_underflow = opts->signal_underflow,
+		.signal_overflow = opts->signal_overflow,
+		.signal_inexact = opts->signal_inexact,
+	};
+	bool pt_reuse = false;
+	int count;
+
+	if (!cdev->is_physfn)
+		return cxi_pte_alloc_vf(lni, evtq, opts);
+
+	if (opts->ethernet && !capable(CAP_NET_RAW))
+		return ERR_PTR(-EPERM);
+
+	if (evtq)
+		eq = container_of(evtq, struct cxi_eq_priv, eq);
+
+	/* Prefer a PTE already allocated to this LNI */
+	spin_lock(&lni_priv->res_lock);
+	pt = list_first_entry_or_null(&lni_priv->pt_cleanups_list,
+				      struct cxi_pte_priv, list);
+	if (pt) {
+		list_del(&pt->list);
+		spin_unlock(&lni_priv->res_lock);
+
+		pt_reuse = true;
+		pt_n = pt->pte.id;
+	} else {
+		spin_unlock(&lni_priv->res_lock);
+
+		pt = kzalloc(sizeof(*pt), GFP_KERNEL);
+		if (pt == NULL)
+			return ERR_PTR(-ENOMEM);
+
+		/* Check the associated service to see if this PTE can be
+		 * allocated
+		 */
+		rc = cxi_rgroup_alloc_resource(lni_priv->rgroup,
+					       CXI_RESOURCE_PTLTE);
+		if (rc)
+			goto pt_free;
+
+		/* TODO: Don't allocate PTE 0 until we can determine whether
+		 * an MST entry is valid. See tag TAG_NO_PTE_0 in this file.
+		 */
+		pt_n = ida_alloc_range(&hw->pte_table, 1,
+				       C_LPE_CFG_PTL_TABLE_ENTRIES - 1, GFP_KERNEL);
+		if (pt_n < 0) {
+			rc = pt_n;
+			goto dec_rsrc_use;
+		}
+	}
+
+	pt->lni_priv = lni_priv;
+	pt->eq = eq;
+	pt->pte.id = pt_n;
+	pt->mcast_n = -1;
+	refcount_set(&pt->refcount, 1);
+	bitmap_zero(pt->mst_rc_update, C_MST_DBG_MST_TABLE_ENTRIES);
+
+	if (!ptl_table.is_matching && ptl_table.ptl_state != C_PTLTE_ETHERNET &&
+	    !ptl_table.do_space_check) {
+		ptl_table.do_space_check = true;
+
+		while (true) {
+			count = atomic_read(&hw->plec_count);
+			if (count >= PLEC_SIZE) {
+				cxidev_dbg(cdev, "plec full\n");
+				break;
+			}
+
+			rc = atomic_cmpxchg(&hw->plec_count, count, count + 1);
+			if (rc == count) {
+				pt->plec_enabled = true;
+				ptl_table.do_space_check = false;
+				break;
+			}
+		}
+	}
+
+	/* TODO: Have separate EQs for no rendezvous get events. */
+	if (eq) {
+		ptl_table.eq_handle = eq->eq.eqn;
+		ptl_table.eq_handle_no_rget = eq->eq.eqn;
+	} else {
+		ptl_table.eq_handle = C_EQ_NONE;
+		ptl_table.eq_handle_no_rget = C_EQ_NONE;
+	}
+
+	cass_assign_ptlte_to_rgid(hw, pt->pte.id, lni_priv->lni.rgid);
+
+	ptl_table.pe_num = cxi_lni_get_pe_num(lni_priv);
+	pt->pe_num = ptl_table.pe_num;
+	ptl_table.le_pool = pt->le_pool =
+		cxi_rgroup_le_pool_id(pt->lni_priv->rgroup, pt->pe_num);
+
+	spin_lock(&hw->lpe_shadow_lock);
+	cass_config_pte(hw, pt_n, &ptl_table);
+	spin_unlock(&hw->lpe_shadow_lock);
+
+	spin_lock(&lni_priv->res_lock);
+	list_add_tail(&pt->list, &lni_priv->pt_list);
+	spin_unlock(&lni_priv->res_lock);
+
+	if (!pt_reuse) {
+		atomic_inc(&hw->stats.pt);
+
+		pt_debugfs_create(pt->pte.id, pt, hw, lni_priv);
+		refcount_inc(&lni_priv->refcount);
+	}
+
+	if (eq)
+		refcount_inc(&eq->refcount);
+
+	cass_flush_pci(hw);
+
+	return &pt->pte;
+
+dec_rsrc_use:
+	if (!pt_reuse)
+		cxi_rgroup_free_resource(lni_priv->rgroup, CXI_RESOURCE_PTLTE);
+pt_free:
+	if (pt_reuse) {
+		spin_lock(&lni_priv->res_lock);
+		list_add_tail(&pt->list, &lni_priv->pt_cleanups_list);
+		spin_unlock(&lni_priv->res_lock);
+	} else {
+		kfree(pt);
+	}
+
+	return ERR_PTR(rc);
+}
+EXPORT_SYMBOL(cxi_pte_alloc);
+
+static void cxi_pte_free_vf(struct cxi_pte *pt)
+{
+	struct cxi_pte_priv *pt_priv =
+		container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_lni_priv *lni_priv = pt_priv->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	const struct cxi_pte_free_cmd cmd = {
+		.op = CXI_OP_PTE_FREE,
+		.pte_number = pt_priv->pte.id,
+	};
+	int rc;
+	size_t resp_len = 0;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		cxidev_err(cdev, "Failed to free PTE %u on PF: %d\n",
+			   pt_priv->pte.id, rc);
+
+	kfree(pt_priv);
+}
+
+/**
+ * cxi_pte_free() - Release a portal table entry
+ *
+ * @pt: the portal table entry
+ */
+void cxi_pte_free(struct cxi_pte *pt)
+{
+	struct cxi_pte_priv *pt_priv =
+		container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_lni_priv *lni_priv = pt_priv->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	const u64 ptl_state = C_PTLTE_RESET;
+	u64 before;
+	u64 after;
+
+	if (!cdev->is_physfn) {
+		cxi_pte_free_vf(pt);
+		return;
+	}
+
+	cxidev_WARN_ONCE(cdev, !refcount_dec_and_test(&pt_priv->refcount),
+			 "Resource leaks - PT refcount not zero: %d\n",
+			 refcount_read(&pt_priv->refcount));
+
+	cass_assign_ptlte_to_rgid(hw, pt_priv->pte.id, C_RESERVED_RGID);
+
+	/* Set the PtlTE to the Reset state. Only write the last
+	 * 64-bits word, at offset 0x18, as to not overwrite the list
+	 * pointers.
+	 * Repeat as long as PLEC_FREES_CSR increases (Cassini ERRATA-4383).
+	 */
+	do {
+		static const unsigned int offset =
+			offsetof(struct c_lpe_cntrs_group, lpe.plec_frees_csr) /
+			sizeof(u64);
+
+		cass_read(hw, C_LPE_STS_EVENT_CNTS(offset), &before, sizeof(before));
+
+		cass_write(hw, C_LPE_CFG_PTL_TABLE(pt_priv->pte.id) + 0x18,
+			   &ptl_state, sizeof(ptl_state));
+
+		cass_read(hw, C_LPE_STS_EVENT_CNTS(offset), &after, sizeof(after));
+	} while (before != after);
+
+	pt_cleanup(pt_priv);
+
+	if (pt_priv->eq) {
+		refcount_dec(&pt_priv->eq->refcount);
+		pt_priv->eq = NULL;
+	}
+
+	if (pt_priv->plec_enabled) {
+		atomic_dec(&hw->plec_count);
+		pt_priv->plec_enabled = false;
+	}
+
+	spin_lock(&lni_priv->res_lock);
+	list_del(&pt_priv->list);
+	list_add_tail(&pt_priv->list, &lni_priv->pt_cleanups_list);
+	spin_unlock(&lni_priv->res_lock);
+}
+EXPORT_SYMBOL(cxi_pte_free);
+
+/* Check whether an MST entry is valid */
+static bool is_mst_valid(struct cass_dev *hw, unsigned int mst)
+{
+	union c_mst_dbg_match_done match_done = {
+		.mst_idx = mst,
+	};
+
+	spin_lock(&hw->mst_match_done_lock);
+	cass_write(hw, C_MST_DBG_MATCH_DONE, &match_done, sizeof(match_done));
+	cass_read(hw, C_MST_DBG_MATCH_DONE, &match_done, sizeof(match_done));
+	spin_unlock(&hw->mst_match_done_lock);
+
+	return match_done.mst_idx_st == 1;
+}
+
+/* Go through each MST that where the return_code was updated, and
+ * check whether they are now not valid or reused.
+ */
+static bool is_pt_done(struct cass_dev *hw, struct cxi_pte_priv *pt)
+{
+	union c_mst_cfg_rc_update cfg_rc_update = {
+		.return_code = C_RC_MST_CANCELLED,
+		.portal_vld = 1,
+		.portal_idx = pt->pte.id,
+	};
+	unsigned int mst;
+
+	for_each_set_bit(mst, pt->mst_rc_update, C_MST_DBG_MST_TABLE_ENTRIES) {
+		if (is_mst_valid(hw, mst)) {
+			/* MST entry is still valid, but it may have
+			 * been reused for another portal entry.
+			 */
+			cfg_rc_update.mst_idx = mst;
+			if (mst_rc_update(hw, &cfg_rc_update))
+				return false;
+		}
+
+		clear_bit(mst, pt->mst_rc_update);
+	}
+
+	return true;
+}
+
+/* When the LNI closes, the PTEs are ready to be cleaned up and
+ * released.
+ */
+void finalize_pt_cleanups(struct cxi_lni_priv *lni, bool force)
+{
+	struct cxi_dev *cdev = lni->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cxi_pte_priv *pt;
+	struct cxi_pte_priv *tmp;
+
+	list_for_each_entry_safe(pt, tmp, &lni->pt_cleanups_list, list) {
+		if (!force && !is_pt_done(hw, pt))
+			continue;
+
+		list_del(&pt->list);
+
+		debugfs_remove(pt->lni_dir);
+		debugfs_remove_recursive(pt->debug_dir);
+
+		refcount_dec(&lni->refcount);
+		atomic_dec(&hw->stats.pt);
+		cxi_rgroup_free_resource(lni->rgroup, CXI_RESOURCE_PTLTE);
+		ida_free(&hw->pte_table, pt->pte.id);
+		kfree(pt);
+	}
+}
+
+static int cxi_pte_map_vf(struct cxi_pte *pt, struct cxi_domain *domain,
+			  unsigned int pid_offset, bool is_multicast,
+			  unsigned int *pt_index)
+{
+	struct cxi_pte_priv *pt_priv =
+		container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_lni_priv *lni_priv = pt_priv->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cxi_pte_map_cmd cmd = {
+		.op = CXI_OP_PTE_MAP,
+		.pte_number = pt->id,
+		.domain_hndl = domain->id,
+		.pid_offset = pid_offset,
+		.is_multicast = is_multicast,
+	};
+	struct cxi_pte_map_resp resp = {};
+	size_t resp_size = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd),
+				&resp, &resp_size);
+	if (rc)
+		return rc;
+
+	*pt_index = resp.pte_index;
+
+	return 0;
+}
+
+/**
+ * cxi_pte_map() - Map a portal entry to a portal index entry
+ *
+ * A portal entry can be mapped several times to a portal index entry.
+ *
+ * @pt: the portal entry
+ * @domain: the domain
+ * @pid_offset: offset of the portal in the domain's PID slice for
+ *   unicast, or the (union cxi_pte_map_offset) uintval field for multicast.
+ * @is_multicast: whether the address is multicast
+ * @pt_index: the allocated portal index entry, to be passed when
+ *   unmapping.
+ *
+ * @return: 0 on success or a negative errno
+ */
+int cxi_pte_map(struct cxi_pte *pt, struct cxi_domain *domain,
+		unsigned int pid_offset, bool is_multicast,
+		unsigned int *pt_index)
+{
+	struct cxi_pte_priv *pt_priv =
+			container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_domain_priv *domain_priv =
+			container_of(domain, struct cxi_domain_priv, domain);
+	struct cxi_dev *cdev = pt_priv->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	unsigned int ptl_idx;
+	unsigned int index_ext;
+	union c_rmu_cfg_portal_list rmu_cfg_portal_list = {};
+	int mcast_n;
+	int pti_n;
+	int ret;
+
+	if (!cdev->is_physfn)
+		return cxi_pte_map_vf(pt, domain, pid_offset,
+				      is_multicast, pt_index);
+
+	/* Sanity checks */
+	if (domain_priv->lni_priv != pt_priv->lni_priv)
+		return -EINVAL;
+
+	/* Generate ptl_idx and index_ext */
+	if (is_multicast) {
+		union cxi_pte_map_offset map_offset;
+
+		if (pid_offset >= (1 << (C_DFA_MULTICAST_ID_BITS +
+					 C_DFA_INDEX_EXT_BITS)))
+			return -EINVAL;
+
+		if (pt_priv->mcast_n != -1)
+			return -EINVAL;
+
+		/* structure maps directly to RMU fields.
+		 * | vni | ... | 1:1 | pad:2 | ptl_idx:13    | index_ext:5  |
+		 */
+		map_offset.uintval = pid_offset;
+		ptl_idx = map_offset.mcast_id;
+		index_ext = map_offset.mcast_pte_index;
+	} else {
+		/* pid_offset does not map directly to RMU fields.
+		 * | vni | ... | 0:1 | pad:3 | pid:9      |    pid_offset:8 |
+		 * | vni | ... | 0:1 | pad:3 | ptl_idx:12    | index_ext:5  |
+		 */
+		if (pid_offset >= cdev->prop.pid_granule)
+			return -EINVAL;
+		ptl_idx = cxi_build_dfa_ep(domain->pid, cdev->prop.pid_bits,
+					   pid_offset);
+		index_ext = cxi_build_dfa_ext(pid_offset);
+		if (ptl_idx >= (1 << C_DFA_ENDPOINT_DEFINED_BITS))
+			return -EINVAL;
+	}
+
+	/* Acquire an unused RMU_CFG_PORTAL_LIST slot */
+	pti_n = ida_alloc_max(&hw->pt_index_table, C_RMU_CFG_PORTAL_LIST_ENTRIES - 1,
+			      GFP_KERNEL);
+	if (pti_n < 0)
+		return pti_n;
+
+	if (is_multicast) {
+		/* Prevent re-issue of this mcast_id/index_ext pair */
+		mcast_n = ida_alloc_range(&hw->multicast_table,
+					  pid_offset, pid_offset, GFP_KERNEL);
+		if (mcast_n < 0) {
+			ret = mcast_n;
+			goto rls_pti_n;
+		}
+		pt_priv->mcast_n = mcast_n;
+	}
+
+	refcount_inc(&domain_priv->refcount);
+	refcount_inc(&pt_priv->refcount);
+
+	rmu_cfg_portal_list.index_ext = index_ext;
+	rmu_cfg_portal_list.multicast_id = ptl_idx;
+	rmu_cfg_portal_list.is_multicast = is_multicast;
+	rmu_cfg_portal_list.vni_list_idx =
+				domain_priv->rx_profile->config.rmu_index;
+
+	spin_lock(&hw->rmu_portal_list_lock);
+	cass_config_portal_list(hw, pti_n, pt_priv->pte.id,
+				&rmu_cfg_portal_list);
+	spin_unlock(&hw->rmu_portal_list_lock);
+
+	*pt_index = pti_n;
+
+	return 0;
+rls_pti_n:
+	ida_free(&hw->pt_index_table, pti_n);
+	return ret;
+}
+EXPORT_SYMBOL(cxi_pte_map);
+
+static int cxi_pte_unmap_vf(struct cxi_pte *pt, struct cxi_domain *domain,
+			    int pt_index)
+{
+	struct cxi_pte_priv *pt_priv =
+		container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_lni_priv *lni_priv = pt_priv->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cxi_pte_unmap_cmd cmd = {
+		.op = CXI_OP_PTE_UNMAP,
+		.pte_index = pt_index,
+	};
+	int rc;
+	size_t resp_len = 0;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+/**
+ * cxi_pte_unmap() - Unmap a portal entry from the index table
+ *
+ * @pt: the portal table entry
+ * @domain: the domain to use
+ * @pt_index: the portal entry index returned by cxi_pte_map()
+ */
+int cxi_pte_unmap(struct cxi_pte *pt, struct cxi_domain *domain, int pt_index)
+{
+	struct cxi_pte_priv *pt_priv =
+			container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_domain_priv *domain_priv =
+			container_of(domain, struct cxi_domain_priv, domain);
+	struct cxi_dev *cdev = domain_priv->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!cdev->is_physfn)
+		return cxi_pte_unmap_vf(pt, domain, pt_index);
+
+	cass_invalidate_portal_list(hw, pt_index);
+
+	/* If this was a multicast, release the ID and free the memory */
+	if (pt_priv->mcast_n != -1) {
+		ida_free(&hw->multicast_table, pt_priv->mcast_n);
+		pt_priv->mcast_n = -1;
+	}
+
+	/* Release the pte index value */
+	ida_free(&hw->pt_index_table, pt_index);
+
+	refcount_dec(&pt_priv->refcount);
+	refcount_dec(&domain_priv->refcount);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_pte_unmap);
+
+static void cxi_pte_le_invalidate_vf(struct cxi_pte *pt,
+				     unsigned int buffer_id,
+				     enum c_ptl_list list)
+{
+	struct cxi_pte_priv *pt_priv =
+		container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_lni_priv *lni_priv = pt_priv->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cxi_pte_le_invalidate_cmd cmd = {
+		.op = CXI_OP_PTE_LE_INVALIDATE,
+		.pte_index = pt->id,
+		.buffer_id = buffer_id,
+		.list = list,
+	};
+	int rc;
+	size_t resp_len = 0;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), NULL, &resp_len);
+	if (rc)
+		cxidev_err(cdev, "Failed to invalidate LE on PTE %u on PF: %d\n",
+			   pt_priv->pte.id, rc);
+}
+
+/**
+ * cxi_pte_le_invalidate() - Invalidate a non-locally managed persistent LE.
+ * @pt: Portal table entry.
+ * @buffer_id: Buffer ID used to identify the LE.
+ * @list: Portal list the LE was appended to.
+ *
+ * Non-locally managed persistent LE invalidation is required due to the LE
+ * unlink not cleaning up all resources.
+ *
+ * If the LE has success and communication events enabled, the PtlTE EQ should
+ * be drained to ensure that no outstanding events exist on the EQ using this
+ * buffer ID, PtlTE, and Ptl list (assuming the PtlTE was configured with an
+ * EQ).
+ *
+ * If a user has enabled matching events for the PtlTE and is correctly counting
+ * the number of match events and target DMA operation events
+ * (Put, Get, etc...), persistent LE invalidation does not need to occur.
+ *
+ * Note: If the PtlTE is configured with a EQ, target DMA operation events may
+ * complete with a RC of C_RC_MST_CANCELLED. These target events should be
+ * ignored by the user.
+ */
+void cxi_pte_le_invalidate(struct cxi_pte *pt, unsigned int buffer_id,
+			   enum c_ptl_list list)
+{
+	struct cxi_pte_priv *pt_priv =
+		container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_dev *cdev = pt_priv->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_mst_dbg_mst_table *mst_entry = hw->mst_entries;
+	union c_mst_cfg_rc_update mst_update = {
+		.return_code = C_RC_MST_CANCELLED,
+		.buffer_idx = buffer_id,
+		.portal_idx = pt->id,
+		.ptl_list = list,
+		.ptl_vld = 1,
+		.portal_vld = 1,
+		.buffer_vld = 1,
+	};
+	int i;
+	int rc;
+
+	if (!cdev->is_physfn) {
+		cxi_pte_le_invalidate_vf(pt, buffer_id, list);
+		return;
+	}
+
+	mutex_lock(&hw->mst_table_lock);
+
+	rc = cxi_dmac_xfer(cdev, hw->dmac_pt_id);
+	if (cxidev_WARN_ONCE(cdev, rc, "Unable to get MST table: %d\n", rc)) {
+		mutex_unlock(&hw->mst_table_lock);
+		return;
+	}
+
+	/* Walk all the MST entries cleaning up matching entries. */
+	for (i = 0; i < C_MST_DBG_MST_TABLE_ENTRIES; i++, mst_entry++) {
+		if (mst_entry->portal_index == pt->id &&
+		    mst_entry->ptl_list == list &&
+		    mst_entry->buffer_id == buffer_id) {
+			/* Issue a MST RC update to the NIC. */
+			mst_update.mst_idx = i;
+
+			mst_rc_update(hw, &mst_update);
+		}
+	}
+
+	mutex_unlock(&hw->mst_table_lock);
+}
+EXPORT_SYMBOL(cxi_pte_le_invalidate);
+
+static int cxi_pte_status_vf(struct cxi_pte *pt,
+			     struct cxi_pte_status *status)
+{
+	struct cxi_pte_priv *pt_priv =
+		container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_lni_priv *lni_priv = pt_priv->lni_priv;
+	struct cxi_dev *cdev = lni_priv->dev;
+	struct cxi_pte_status_cmd cmd = {
+		.op = CXI_OP_PTE_STATUS,
+		.pte_index = pt->id,
+	};
+	struct cxi_pte_status_resp resp = {};
+	size_t resp_size = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), &resp, &resp_size);
+	if (rc)
+		return rc;
+
+	*status = resp.status;
+	return 0;
+}
+
+#define ULE_START_OFFSET 24
+
+/**
+ * cxi_pte_status() - Return collection of PTE stats
+ *
+ * @pt: Portal table entry.
+ * @status: Pointer to struct where PTE stats will be written
+ *
+ * status->ule_offsets and status->ule_count are used as inputs. ule_offsets
+ * is an array where ULE information is stored on output. ule_count is the
+ * size in entries of ule_offsets.
+ *
+ * If ule_offsets is set, the PTE unexpected list is walked. The remote
+ * offset field of each ULE is written into ule_offsets (if space is
+ * available). The total number of ULEs found is returned in ule_count. If
+ * ule_offsets is unset, the Unexpected list walk is skipped. This interface
+ * is used to query ULE remote offset information needed for Rendezvous Puts
+ * that are dequeued using a SearchAndDelete command.
+ */
+int cxi_pte_status(struct cxi_pte *pt, struct cxi_pte_status *status)
+{
+	struct cxi_pte_priv *pt_priv =
+		container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_dev *cdev = pt_priv->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_lpe_cfg_ptl_table ptl_table;
+	struct c_lpe_cfg_ptl_table_ptrs ule_list;
+	union c_lpe_cfg_pe_le_pools le_pool;
+	union c_lpe_sts_pe_le_alloc le_alloc;
+	size_t ule_count = 0;
+	unsigned int idx;
+
+	if (!cdev->is_physfn)
+		return cxi_pte_status_vf(pt, status);
+
+	spin_lock(&hw->lpe_shadow_lock);
+	cass_read_pte(hw, pt_priv->pte.id, &ptl_table);
+	spin_unlock(&hw->lpe_shadow_lock);
+
+	idx = (pt_priv->pe_num * 16) + pt_priv->le_pool;
+
+	cass_read(hw, C_LPE_CFG_PE_LE_POOLS(idx), &le_pool,
+		  sizeof(le_pool));
+	cass_read(hw, C_LPE_STS_PE_LE_ALLOC(idx), &le_alloc,
+		  sizeof(le_alloc));
+
+	status->drop_count = ptl_table.drop_count;
+	status->state = ptl_table.ptl_state;
+	status->les_reserved = le_pool.num_reserved;
+	status->les_max = le_pool.max_alloc;
+	status->les_allocated = le_alloc.num_allocated;
+	ule_list = ptl_table.l[C_PTL_LIST_UNEXPECTED];
+
+	if (status->ule_offsets && ule_list.list_vld) {
+		unsigned int le_idx = ule_list.head;
+		u64 ule_offset;
+		struct c_ule_entry ule;
+		void *ule_ptr = (void *)&ule + ULE_START_OFFSET;
+
+		if (!user_access_begin(status->ule_offsets,
+				       status->ule_count * sizeof(u64)))
+			return -EFAULT;
+
+		while (true) {
+			/* Read only the last 3 QWs of the ULE */
+			ule_offset = C_LPE_STS_LIST_ENTRIES(pt_priv->pe_num *
+							    PE_LE_MAX +
+							    le_idx) +
+					ULE_START_OFFSET;
+			cass_read(hw, ule_offset, ule_ptr,
+				  sizeof(ule) - ULE_START_OFFSET);
+
+			if (ule_count < status->ule_count) {
+				u64 offset = ule.start_or_offset;
+
+				unsafe_put_user(offset,
+						&status->ule_offsets[ule_count],
+						err_put_user);
+			}
+			ule_count++;
+
+			if (ule.vld) {
+				le_idx = ule.addr;
+			} else {
+				WARN_ON_ONCE(ule_list.tail != le_idx);
+				break;
+			}
+		}
+
+		user_access_end();
+	}
+
+	/* Return the real number of ULEs */
+	status->ule_count = ule_count;
+
+	return 0;
+
+err_put_user:
+	user_access_end();
+
+	return -EFAULT;
+}
+EXPORT_SYMBOL(cxi_pte_status);
+
+/**
+ * cxi_pte_transition_sm() - Transition a disabled PTE to software managed.
+ *
+ * @pt: Portal table entry.
+ * @drop_count: Expected drop_count
+ *
+ * If the PTE is in the disable state, and its drop_count matches,
+ * this will transition it into the software managed state. The
+ * drop_count is reset to 0.
+ *
+ * Returns -EINVAL if the PTE is not disabled, -ETIMEDOUT if the
+ * hardware has issues, -EAGAIN if the drop_count doesn't match, or 0 on
+ * success.
+ */
+int cxi_pte_transition_sm(struct cxi_pte *pt, unsigned int drop_count)
+{
+	struct cxi_pte_priv *pt_priv = container_of(pt, struct cxi_pte_priv, pte);
+	struct cxi_dev *cdev = pt_priv->lni_priv->dev;
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_lpe_sts_cdts_in_use cdts_in_use_mask = {
+		.event_cdts_in_use = ~0,
+		.ixe_mst_cdts_in_use = ~0,
+		.ixe_get_cdts_in_use = ~0,
+		.ixe_put_cdts_in_use = ~0,
+	};
+	union c_lpe_sts_cdts_in_use cdts_in_use;
+	union c_lpe_cfg_cdt_limits cdt_limits;
+	union c_lpe_cfg_ptl_table ptl_table;
+	u8 old_rrq_cdts;
+	int count;
+	int ret;
+
+	if (!cdev->is_physfn)
+		return -EOPNOTSUPP;
+
+	spin_lock(&hw->lpe_shadow_lock);
+	cass_read_pte(hw, pt_priv->pte.id, &ptl_table);
+	spin_unlock(&hw->lpe_shadow_lock);
+
+	if (ptl_table.ptl_state == C_PTLTE_SOFTWARE_MANAGED)
+		return 0;
+
+	if (ptl_table.ptl_state != C_PTLTE_DISABLED)
+		return -EINVAL;
+
+	mutex_lock(&hw->pte_transition_sm_lock);
+
+	/* Stop all LPE requests arbitration before the point where
+	 * the PtlTE RAM is read.
+	 */
+	cass_read(hw, C_LPE_CFG_CDT_LIMITS, &cdt_limits, sizeof(cdt_limits));
+	old_rrq_cdts = cdt_limits.rrq_cdts;
+	cdt_limits.rrq_cdts = 0;
+	cass_write(hw, C_LPE_CFG_CDT_LIMITS, &cdt_limits, sizeof(cdt_limits));
+
+	/* Read stats until load and max are 0 */
+	count = 0;
+	do {
+		static union c_lpe_msc_load_stats_doorbell doorbell = {
+			.doorbell = 1,
+		};
+		union c_lpe_sts_load_stats stats;
+
+		cass_write(hw, C_LPE_MSC_LOAD_STATS_DOORBELL,
+			   &doorbell, sizeof(doorbell));
+
+		cass_read(hw, C_LPE_STS_LOAD_STATS(ptl_table.pe_num),
+			  &stats, sizeof(stats));
+
+		if (stats.max == 0 && stats.load == 0)
+			break;
+
+		count++;
+		if (count >= 250) {
+			ret = -ETIMEDOUT;
+			goto out;
+		}
+
+		usleep_range(5000, 10000);
+	} while (true);
+
+	/* Add the matching PE*_RRQ_CDTS_IN_USE to the mask */
+	switch (ptl_table.pe_num) {
+	case 0:
+		cdts_in_use_mask.pe0_rrq_cdts_in_use = ~0;
+		break;
+	case 1:
+		cdts_in_use_mask.pe1_rrq_cdts_in_use = ~0;
+		break;
+	case 2:
+		cdts_in_use_mask.pe2_rrq_cdts_in_use = ~0;
+		break;
+	case 3:
+		cdts_in_use_mask.pe3_rrq_cdts_in_use = ~0;
+		break;
+	}
+
+	/* Poll until selected fields in C_LPE_STS_CDTS_IN_USE are all
+	 * zeroes.
+	 */
+	ret = readq_poll_timeout(cass_csr(hw, C_LPE_STS_CDTS_IN_USE),
+				 cdts_in_use.qw,
+				 (cdts_in_use.qw & cdts_in_use_mask.qw) == 0,
+				 1, 1000000);
+	if (ret)
+		goto out;
+
+	/* Read the state again since the PE is now quiesced. */
+	spin_lock(&hw->lpe_shadow_lock);
+	cass_read_pte(hw, pt_priv->pte.id, &ptl_table);
+	spin_unlock(&hw->lpe_shadow_lock);
+
+	if (ptl_table.ptl_state == C_PTLTE_SOFTWARE_MANAGED) {
+		ret = 0;
+	} else if (ptl_table.ptl_state != C_PTLTE_DISABLED) {
+		ret = -EINVAL;
+	} else if (drop_count == ptl_table.drop_count) {
+		/* Change the state and drop count. Only write a
+		 * single u64 at offset 0x18, as to not overwrite
+		 * other fields.
+		 */
+		u64 *state_dc = ((u64 *)&ptl_table) + 3;
+
+		ptl_table.ptl_state = C_PTLTE_SOFTWARE_MANAGED;
+		ptl_table.drop_count = 0;
+		cass_write(hw, C_LPE_CFG_PTL_TABLE(pt_priv->pte.id) + 0x18,
+			   state_dc, sizeof(u64));
+
+		ret = 0;
+	} else {
+		ret = -EAGAIN;
+	}
+
+out:
+	cdt_limits.rrq_cdts = old_rrq_cdts;
+	cass_write(hw, C_LPE_CFG_CDT_LIMITS, &cdt_limits, sizeof(cdt_limits));
+
+	mutex_unlock(&hw->pte_transition_sm_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(cxi_pte_transition_sm);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_ptp.c b/drivers/net/ethernet/hpe/ss1/cass_ptp.c
new file mode 100644
index 000000000000..33afbb064475
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_ptp.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019 Hewlett Packard Enterprise Development LP */
+
+/* Cassini Precision Time Protocol support */
+
+#include <linux/ptp_clock_kernel.h>
+
+#include "cass_core.h"
+
+#define RTC_NS_WIDTH 30
+#define RTC_MAX_ADJ (RTC_NS_WIDTH / 2)
+#define RTC_FNS_WIDTH 32
+#define RTC_MAX_FNS (1ULL << RTC_FNS_WIDTH)
+
+static void write_rtc(struct cass_dev *hw, const struct timespec64 *ts)
+{
+	union c_mb_cfg_rtc_time rtc;
+	const union c_mb_cfg_rtc rtc_cfg = {
+		.rtc_load = 1,
+		.rtc_enable = 1,
+		.etc_enable = 1,
+	};
+
+	rtc.seconds_47_34 = ts->tv_sec >> 34;
+	rtc.seconds_33_0 = ts->tv_sec & (BIT(34) - 1);
+	rtc.nanoseconds = ts->tv_nsec;
+
+	cass_write(hw, C_MB_CFG_RTC_TIME, &rtc, C_MB_CFG_RTC_TIME_SIZE);
+	cass_write(hw, C_MB_CFG_RTC, &rtc_cfg, sizeof(rtc_cfg));
+}
+
+static void read_current_time(struct cass_dev *hw,
+			      union c_mb_sts_rtc_current_time *rtc)
+{
+	cass_read(hw, C_MB_STS_RTC_CURRENT_TIME, rtc, sizeof(*rtc));
+}
+
+/* Transform a time retrieved with read_current_time(). */
+static void current_time_to_ts(const union c_mb_sts_rtc_current_time *rtc,
+			       struct timespec64 *ts)
+{
+	ts->tv_sec = rtc->seconds_47_34;
+	ts->tv_sec <<= 34;
+	ts->tv_sec |= rtc->seconds_33_0;
+	ts->tv_nsec = rtc->nanoseconds;
+}
+
+static void adjust_rtc(struct cass_dev *hw, s64 delta)
+{
+	const union c_mb_cfg_rtc rtc_cfg = {
+		.rtc_update = 1,
+		.rtc_enable = 1,
+		.etc_enable = 1,
+	};
+	struct timespec64 rtc_ts;
+	struct timespec64 delta_ts;
+
+	if (abs(delta) > RTC_MAX_ADJ) {
+		union c_mb_sts_rtc_current_time rtc;
+
+		read_current_time(hw, &rtc);
+		current_time_to_ts(&rtc, &rtc_ts);
+		delta_ts = ns_to_timespec64(delta);
+		rtc_ts = timespec64_add(rtc_ts, delta_ts);
+		write_rtc(hw, &rtc_ts);
+	} else {
+		union c_mb_cfg_rtc_time rtc = {};
+
+		if (delta > 0)
+			rtc.nanoseconds = delta;
+		else
+			rtc.nanoseconds = BIT(RTC_NS_WIDTH) + delta;
+
+		cass_write(hw, C_MB_CFG_RTC_TIME, &rtc,
+			   C_MB_CFG_RTC_TIME_SIZE);
+		cass_write(hw, C_MB_CFG_RTC, &rtc_cfg, sizeof(rtc_cfg));
+	}
+}
+
+static void adjust_rtc_freq(struct cass_dev *hw, long scaled_ppm)
+{
+	union c_mb_cfg_rtc_inc rtc_inc = {};
+	bool neg_adj;
+	u64 frac_ns;
+	u64 adj_ns;
+
+	if (scaled_ppm < 0) {
+		neg_adj = true;
+		scaled_ppm = -scaled_ppm;
+	} else {
+		neg_adj = false;
+	}
+
+	/* From ptp_clock.c:
+	 *    ppb = scaled_ppm * 10^3 * 2^-16
+	 *
+	 * adj_ns = ppb * 2^32 / clk_hz
+	 *     = scaled_ppm * 10^3 * 2^-16 * 2^32 / clk_hz
+	 *     = scaled_ppm * 65536000 / clk_hz
+	 *     = scaled_ppm << 16 / clk_khz
+	 */
+	if (scaled_ppm) {
+		adj_ns = scaled_ppm;
+		adj_ns <<= 16;
+		if (cass_version(hw, CASSINI_1))
+			adj_ns = div_u64(adj_ns, C1_CLK_FREQ_HZ / 1000);
+		else
+			adj_ns = div_u64(adj_ns, C2_CLK_FREQ_HZ / 1000);
+	} else {
+		adj_ns = 0;
+	}
+
+	/* Set the default value for the clock frequency */
+	if (cass_version(hw, CASSINI_1))
+		frac_ns = RTC_MAX_FNS;	/* i.e. 1ns */
+	else
+		frac_ns = 3904515724; /* 2^32 * 1.0 Ghz / 1.1Ghz */
+
+	/* And adjust it */
+	if (neg_adj)
+		frac_ns -= adj_ns;
+	else
+		frac_ns += adj_ns;
+
+	if (frac_ns >= RTC_MAX_FNS) {
+		rtc_inc.nanoseconds = 1;
+		rtc_inc.fractional_ns = frac_ns - RTC_MAX_FNS;
+	} else {
+		rtc_inc.nanoseconds = 0;
+		rtc_inc.fractional_ns = frac_ns;
+	}
+
+	cass_write(hw, C_MB_CFG_RTC_INC, &rtc_inc, sizeof(rtc_inc));
+
+	/* Perform NOP RTC update so Cassini loads the new RTC_INC value. */
+	adjust_rtc(hw, 0);
+}
+
+/* Initialize the time keeping CSRs before the clock is
+ * started. Hopefully it's close enough to the RTC start that the
+ * small time difference won't matter. RT_OFFSET could be calculated
+ * later to compensate if needed.
+ */
+static void set_elapsed_time(struct cass_dev *hw, const struct timespec64 *ts)
+{
+	struct eltime {
+		unsigned int elapsed_time;
+		unsigned int time_offset_ns;
+		unsigned int rt_offset;
+	} time_init[] = {
+		{ C_ATU_ERR_ELAPSED_TIME, 4, 0 },
+		{ C_CQ_ERR_ELAPSED_TIME, 8, 0 },
+		{ C_EE_ERR_ELAPSED_TIME, 7, C_EE_CFG_RT_OFFSET },
+		{ C_HNI_ERR_ELAPSED_TIME, 12, C_HNI_CFG_RT_OFFSET },
+		{ C_HNI_PML_ERR_ELAPSED_TIME, 13, 0 },
+		{ C_IXE_ERR_ELAPSED_TIME, 17, 0 },
+		{ C_LPE_ERR_ELAPSED_TIME, 11, 0 },
+		{ C_MB_ERR_ELAPSED_TIME, 3, C_MB_CFG_RT_OFFSET },
+		{ C_MST_ERR_ELAPSED_TIME, 13, C_MST_CFG_RT_OFFSET },
+		{ C_OXE_ERR_ELAPSED_TIME, 18, C_OXE_CFG_RT_OFFSET },
+		{ C_PARBS_ERR_ELAPSED_TIME, 9, C_PARBS_CFG_RT_OFFSET },
+		{ C_PCT_ERR_ELAPSED_TIME, 10, 0 },
+		{ C_PI_ERR_ELAPSED_TIME, 6, C_PI_CFG_RT_OFFSET },
+		{ C_PI_IPD_ERR_ELAPSED_TIME, 15, C_PI_IPD_CFG_RT_OFFSET },
+		{ C_RMU_ERR_ELAPSED_TIME, 15, 0 },
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(time_init); i++) {
+		struct eltime *t = &time_init[i];
+		struct timespec64 offset_ts = *ts;
+		union c_mb_err_elapsed_time err_elapsed_time;
+
+		timespec64_add_ns(&offset_ts, time_init->time_offset_ns);
+		err_elapsed_time.nanoseconds = offset_ts.tv_nsec,
+		err_elapsed_time.seconds = offset_ts.tv_sec,
+
+		cass_write(hw, t->elapsed_time, &err_elapsed_time,
+			   sizeof(err_elapsed_time));
+		if (t->rt_offset)
+			cass_clear(hw, t->rt_offset, C_MB_CFG_RT_OFFSET_SIZE);
+	}
+}
+
+static void init_rtc(struct cass_dev *hw)
+{
+	struct timespec64 ts = {};
+
+	adjust_rtc_freq(hw, 0);
+
+	ktime_get_real_ts64(&ts);
+	set_elapsed_time(hw, &ts);
+	write_rtc(hw, &ts);
+}
+
+static void fini_rtc(struct cass_dev *hw)
+{
+	cass_clear(hw, C_MB_CFG_RTC, C_MB_CFG_RTC_SIZE);
+}
+
+static int cass_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
+{
+	struct cass_dev *hw = container_of(ptp, struct cass_dev, ptp_info);
+	unsigned long flags;
+
+	spin_lock_irqsave(&hw->rtc_lock, flags);
+	adjust_rtc_freq(hw, scaled_ppm);
+	spin_unlock_irqrestore(&hw->rtc_lock, flags);
+
+	return 0;
+}
+
+static int cass_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
+{
+	struct cass_dev *hw = container_of(ptp, struct cass_dev, ptp_info);
+	unsigned long flags;
+
+	spin_lock_irqsave(&hw->rtc_lock, flags);
+	adjust_rtc(hw, delta);
+	spin_unlock_irqrestore(&hw->rtc_lock, flags);
+
+	return 0;
+}
+
+static int cass_ptp_gettimex64(struct ptp_clock_info *ptp,
+			       struct timespec64 *ts,
+			       struct ptp_system_timestamp *sts)
+{
+	struct cass_dev *hw = container_of(ptp, struct cass_dev, ptp_info);
+	union c_mb_sts_rtc_current_time rtc;
+	unsigned long flags;
+
+	spin_lock_irqsave(&hw->rtc_lock, flags);
+
+	ptp_read_system_prets(sts);
+	read_current_time(hw, &rtc);
+	ptp_read_system_postts(sts);
+
+	spin_unlock_irqrestore(&hw->rtc_lock, flags);
+
+	current_time_to_ts(&rtc, ts);
+
+	return 0;
+}
+
+static int cass_ptp_settime64(struct ptp_clock_info *ptp,
+			      const struct timespec64 *ts)
+{
+	struct cass_dev *hw = container_of(ptp, struct cass_dev, ptp_info);
+	unsigned long flags;
+
+	spin_lock_irqsave(&hw->rtc_lock, flags);
+	write_rtc(hw, ts);
+	spin_unlock_irqrestore(&hw->rtc_lock, flags);
+
+	return 0;
+}
+
+static int cass_ptp_enable(struct ptp_clock_info *ptp,
+			   struct ptp_clock_request *request, int on)
+{
+	return -EOPNOTSUPP;
+}
+
+static int cass_ptp_verify(struct ptp_clock_info *ptp, unsigned int pin,
+			   enum ptp_pin_function func, unsigned int chan)
+{
+	return -EOPNOTSUPP;
+}
+
+static struct ptp_clock_info cass_ptp_info = {
+	.owner		= THIS_MODULE,
+	.name		= "Cassini clock",
+	.max_adj	= RTC_MAX_FNS - 1, /* Max. freq. adj. in  ppb */
+	.adjfine	= cass_ptp_adjfine,
+	.adjtime	= cass_ptp_adjtime,
+	.gettimex64	= cass_ptp_gettimex64,
+	.settime64	= cass_ptp_settime64,
+	.enable		= cass_ptp_enable,
+	.verify		= cass_ptp_verify,
+};
+
+int cass_ptp_init(struct cass_dev *hw)
+{
+	spin_lock_init(&hw->rtc_lock);
+	hw->ptp_info = cass_ptp_info;
+
+	init_rtc(hw);
+
+	hw->ptp_clock = ptp_clock_register(&hw->ptp_info,
+					   &hw->cdev.pdev->dev);
+	if (IS_ERR(hw->ptp_clock)) {
+		fini_rtc(hw);
+		return PTR_ERR(hw->ptp_clock);
+	}
+
+	return 0;
+}
+
+void cass_ptp_fini(struct cass_dev *hw)
+{
+	ptp_clock_unregister(hw->ptp_clock);
+	fini_rtc(hw);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_rgid.c b/drivers/net/ethernet/hpe/ss1/cass_rgid.c
new file mode 100644
index 000000000000..68c8e096b7a9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_rgid.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+/* Cassini RGID management */
+
+#include <linux/debugfs.h>
+#include <linux/types.h>
+
+#include "cass_core.h"
+
+struct cass_rgid_priv {
+	int lnis;
+	int svc_id;
+	struct ida lac_table;
+	struct idr lcid_table;
+	refcount_t refcount;
+};
+
+/**
+ * cass_rgid_init() - Initialize the RGID array
+ *
+ * @hw: Cassini device
+ */
+void cass_rgid_init(struct cass_dev *hw)
+{
+	xa_init_flags(&hw->rgid_array, XA_FLAGS_ALLOC1);
+	refcount_set(&hw->rgids_refcount, 1);
+}
+
+/**
+ * cass_rgid_fini() - Clean up the RGID array
+ *
+ * @hw: Cassini device
+ */
+void cass_rgid_fini(struct cass_dev *hw)
+{
+	unsigned long id;
+	struct cass_rgid_priv *rgid_priv;
+
+	xa_for_each(&hw->rgid_array, id, rgid_priv)
+		kfree(rgid_priv);
+
+	xa_destroy(&hw->rgid_array);
+}
+
+/**
+ * cass_lac_get() - Get an LAC
+ *
+ * @hw: Cassini device
+ * @id: Value of RGID to get an LAC from
+ * @return: 0 on success or negative error
+ */
+int cass_lac_get(struct cass_dev *hw, int id)
+{
+	struct cass_rgid_priv *rgid_priv = xa_load(&hw->rgid_array, id);
+
+	if (!rgid_priv)
+		return 0;
+
+	return ida_alloc_max(&rgid_priv->lac_table, C_NUM_LACS - 1, GFP_KERNEL);
+}
+
+/**
+ * cass_lac_put() - Free an LAC
+ *
+ * @hw: Cassini device
+ * @id: Value of RGID
+ * @lac: LAC to free
+ */
+void cass_lac_put(struct cass_dev *hw, int id, int lac)
+{
+	struct cass_rgid_priv *rgid_priv = xa_load(&hw->rgid_array, id);
+
+	if (!rgid_priv)
+		return;
+
+	ida_free(&rgid_priv->lac_table, lac);
+}
+
+/**
+ * cass_lcid_get() - Get an LCID
+ *
+ * @hw: Cassini device
+ * @cp_priv: Communication Profile object
+ * @rgid: Value of RGID to get an LCID from
+ * @cp_type: Request LCID 0 for type TRIG_LCID
+ * @return: 0 or positive value on success or negative error
+ */
+int cass_lcid_get(struct cass_dev *hw, struct cxi_cp_priv *cp_priv, int rgid,
+		  enum cxi_trig_cp cp_type)
+	__must_hold(&hw->cp_lock)
+{
+	struct cass_rgid_priv *rgid_priv = xa_load(&hw->rgid_array, rgid);
+
+	if (!rgid_priv)
+		return -ENOENT;
+
+	/* When an TRIG_LCID is requested, return error if it
+	 * cannot be allocated.
+	 */
+	if (cp_type == TRIG_LCID)
+		return idr_alloc(&rgid_priv->lcid_table, cp_priv, 0, 1,
+				   GFP_KERNEL);
+
+	return idr_alloc(&rgid_priv->lcid_table, cp_priv,
+			 (cp_type == NON_TRIG_LCID) ? 1 : 0,
+			 C_COMM_PROF_PER_CQ, GFP_KERNEL);
+}
+
+/**
+ * cass_lcid_put() - Free an LCID
+ *
+ * @hw: Cassini device
+ * @rgid: Value of RGID
+ * @lcid: LCID to free
+ */
+void cass_lcid_put(struct cass_dev *hw, int rgid, int lcid)
+	__must_hold(&hw->cp_lock)
+{
+	struct cass_rgid_priv *rgid_priv = xa_load(&hw->rgid_array, rgid);
+
+	if (!rgid_priv)
+		return;
+
+	idr_remove(&rgid_priv->lcid_table, lcid);
+}
+
+/**
+ * cass_cp_find() - Get the CP accociated with an RGID and LCID
+ *
+ * @hw: Cassini device
+ * @rgid: Value of RGID
+ * @lcid: Value of LCID
+ * @return: CP object on success or NULL on error
+ */
+struct cxi_cp_priv *cass_cp_find(struct cass_dev *hw, int rgid, int lcid)
+{
+	struct cxi_cp_priv *cp_priv;
+	struct cass_rgid_priv *rgid_priv = xa_load(&hw->rgid_array, rgid);
+
+	if (!rgid_priv)
+		return NULL;
+
+	mutex_lock(&hw->cp_lock);
+	cp_priv = idr_find(&rgid_priv->lcid_table, lcid);
+	mutex_unlock(&hw->cp_lock);
+
+	return cp_priv;
+}
+
+/**
+ * cass_cp_rgid_find() - Get the CP associated with an RGID that matches
+ *                       the {vni_pcp,tc,tc_type,lni_id} tuple.
+ *                       Only return a CP with LCID of 0 if requested
+ *                       with TRIG_LCID or ANY_LCID.
+ *
+ * @hw: Cassini device
+ * @lni_priv: the Logical Network Interface
+ * @vni_pcp: VNI of communication profile. If using an ethernet tc
+ *           this argument is treated as PCP.
+ * @tc: Traffic class of the communication profile
+ * @tc_type: Traffic class type of the communication profile
+ * @cp_type: Allow LNIs sharing a CP with lcid 0 only
+ * @return: CP object on success or NULL on error
+ */
+struct cxi_cp_priv *cass_cp_rgid_find(struct cass_dev *hw,
+				      struct cxi_lni_priv *lni_priv,
+				      unsigned int vni_pcp, unsigned int tc,
+				      enum cxi_traffic_class_type tc_type,
+				      enum cxi_trig_cp cp_type)
+{
+	int lcid;
+	struct cxi_cp_priv *cp_priv;
+	bool share_lcid0 = cp_type != NON_TRIG_LCID;
+	struct cass_rgid_priv *rgid_priv = xa_load(&hw->rgid_array,
+						   lni_priv->lni.rgid);
+
+	if (!rgid_priv)
+		return NULL;
+
+	for (lcid = 0; lcid < C_COMM_PROF_PER_CQ; lcid++) {
+		cp_priv = idr_find(&rgid_priv->lcid_table, lcid);
+		if (!cp_priv)
+			continue;
+
+		if (vni_pcp == cp_priv->cp.vni_pcp &&
+		    tc == cp_priv->cp.tc &&
+		    tc_type == cp_priv->cass_cp->tc_type &&
+		    ((share_lcid0 && !lcid) ||
+		     (!share_lcid0 && lcid &&
+		      (lni_priv->lni.id == cp_priv->lni_id)))) {
+			refcount_inc(&cp_priv->refcount);
+
+			return cp_priv;
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * cass_rgid_get() - Get an RGID from the pool
+ *
+ * @hw: Cassini device
+ * @rgroup: Resource group container
+ * @return: rgid on success or negative error
+ */
+int cass_rgid_get(struct cass_dev *hw, struct cxi_rgroup *rgroup)
+{
+	int ret;
+	u32 id;
+	unsigned long idx;
+	struct cass_rgid_priv *rgidp;
+	struct cass_rgid_priv *rgid_priv;
+	unsigned int lnis_per_rgid = rgroup->attr.lnis_per_rgid;
+
+	rgid_priv = kzalloc(sizeof(*rgid_priv), GFP_KERNEL);
+	if (!rgid_priv)
+		return -ENOMEM;
+
+	xa_lock(&hw->rgid_array);
+
+	xa_for_each(&hw->rgid_array, idx, rgidp) {
+		if ((rgidp->svc_id == rgroup->id) &&
+		    (rgidp->lnis == lnis_per_rgid) &&
+		    (refcount_read(&rgidp->refcount) < rgidp->lnis)) {
+			refcount_inc(&rgidp->refcount);
+			kfree(rgid_priv);
+			id = idx;
+			goto done;
+		}
+	}
+
+	ret = __xa_alloc(&hw->rgid_array, &id, rgid_priv,
+			 XA_LIMIT(1, C_NUM_RGIDS - 1), GFP_KERNEL);
+
+	/* -EBUSY is returned when there is no room */
+	if (ret == -EBUSY)
+		ret = -ENOSPC;
+
+	if (ret)
+		goto unlock_free;
+
+	rgid_priv->svc_id = rgroup->id;
+	rgid_priv->lnis = lnis_per_rgid;
+	refcount_set(&rgid_priv->refcount, 1);
+	ida_init(&rgid_priv->lac_table);
+	idr_init(&rgid_priv->lcid_table);
+	refcount_inc(&hw->rgids_refcount);
+
+done:
+	xa_unlock(&hw->rgid_array);
+
+	return id;
+
+unlock_free:
+	xa_unlock(&hw->rgid_array);
+	kfree(rgid_priv);
+
+	if (ret == -ENOSPC)
+		pr_debug("RGID space exhausted\n");
+	else
+		pr_err("Failed to store id %d ret:%d\n", id, ret);
+
+	return ret;
+}
+
+/**
+ * cass_rgid_put() - Return RGID to the pool
+ *
+ * @hw: Cassini device
+ * @id: Value of RGID
+ */
+void cass_rgid_put(struct cass_dev *hw, int id)
+{
+	struct cass_rgid_priv *rgid_priv;
+
+	xa_lock(&hw->rgid_array);
+
+	rgid_priv = xa_load(&hw->rgid_array, id);
+	if (!rgid_priv) {
+		pr_err("rgid_priv NULL for id:%d\n", id);
+		goto unlock;
+	}
+
+	if (refcount_dec_and_test(&rgid_priv->refcount)) {
+		WARN_ON(__xa_erase(&hw->rgid_array, id) == NULL);
+		refcount_dec(&hw->rgids_refcount);
+		kfree(rgid_priv);
+	}
+unlock:
+	xa_unlock(&hw->rgid_array);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_rgroup.c b/drivers/net/ethernet/hpe/ss1/cass_rgroup.c
new file mode 100644
index 000000000000..840f1d7a2373
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_rgroup.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+/* Resource Group implementation */
+
+#include "cass_core.h"
+
+/**
+ * get_cxi_dev() - type-safe function to get CXI device pointer
+ *                 from Cassini device
+ *
+ * @hw: cass_dev pointer
+ *
+ * Return: Embedded CXI device pointer
+ */
+static struct cxi_dev *get_cxi_dev(struct cass_dev *hw)
+{
+	return &hw->cdev;
+}
+
+void cass_dev_rgroup_init(struct cass_dev *hw)
+{
+	int i;
+
+	spin_lock_init(&hw->rgrp_lock);
+
+	hw->resource_use[CXI_RESOURCE_PTLTE].max = C_NUM_PTLTES;
+	hw->resource_use[CXI_RESOURCE_TXQ].max = C_NUM_TRANSMIT_CQS;
+	hw->resource_use[CXI_RESOURCE_TGQ].max = C_NUM_TARGET_CQS;
+	hw->resource_use[CXI_RESOURCE_EQ].max = EQS_AVAIL;
+	hw->resource_use[CXI_RESOURCE_CT].max = CTS_AVAIL;
+	hw->resource_use[CXI_RESOURCE_PE0_LE].max = pe_total_les;
+	hw->resource_use[CXI_RESOURCE_PE1_LE].max = pe_total_les;
+	hw->resource_use[CXI_RESOURCE_PE2_LE].max = pe_total_les;
+	hw->resource_use[CXI_RESOURCE_PE3_LE].max = pe_total_les;
+	hw->resource_use[CXI_RESOURCE_TLE].max = C_NUM_TLES;
+	/* AC 0 invalid and one reserved for shared physical mappings */
+	hw->resource_use[CXI_RESOURCE_AC].max = ACS_AVAIL;
+
+	/* start with all resources shared */
+	for (i = 0; i < CXI_RESOURCE_MAX; i++) {
+		hw->resource_use[i].in_use = 0;
+		hw->resource_use[i].reserved = 0;
+		hw->resource_use[i].shared_use = 0;
+		hw->resource_use[i].shared = hw->resource_use[i].max;
+	}
+
+	cxi_dev_rgroup_init(get_cxi_dev(hw));
+}
+
+void cass_dev_rgroup_fini(struct cass_dev *hw)
+{
+	cxi_dev_rgroup_fini(get_cxi_dev(hw));
+}
+
+int cass_rgroup_add_resource(struct cxi_rgroup *rgroup,
+			     struct cxi_resource_entry *resource)
+{
+	int rc = 0;
+	struct cass_dev *hw = rgroup->hw;
+	struct cxi_resource_use *r_use = &hw->resource_use[resource->type];
+
+	if (!resource->limits.max && !resource->limits.reserved)
+		return 0;
+
+	spin_lock(&hw->rgrp_lock);
+
+	if (resource->type == CXI_RESOURCE_TLE) {
+		/* Enforce minimum TLEs */
+		if (resource->limits.reserved) {
+			if (resource->limits.reserved < CASS_MIN_POOL_TLES) {
+				pr_debug("%s reserved minimum must be >= %d\n",
+					 cxi_resource_type_to_str(CXI_RESOURCE_TLE),
+					 CASS_MIN_POOL_TLES);
+				rc = -EINVAL;
+				goto unlock;
+			}
+		}
+
+		/* Enforce max and reserved TLEs equal */
+		if (resource->limits.max != resource->limits.reserved) {
+			pr_debug("%s max must equal reserved\n",
+				 cxi_resource_type_to_str(CXI_RESOURCE_TLE));
+			rc = -EINVAL;
+			goto unlock;
+		}
+	}
+
+	if (resource->limits.reserved > r_use->shared) {
+		pr_debug("Error - %s reserved requested (%lu) > shared available (%lu)\n",
+			 cxi_resource_type_to_str(resource->type),
+			 resource->limits.reserved, r_use->shared);
+		rc = -ENOSPC;
+		goto unlock;
+	}
+
+	if (resource->limits.max > r_use->max) {
+		pr_debug("Error - %s max requested (%lu) > max available (%lu)\n",
+			 cxi_resource_type_to_str(resource->type),
+			 resource->limits.max, r_use->max);
+		rc = -ENOSPC;
+		goto unlock;
+	}
+
+	/* resources that need extra configuring */
+	if (resource->type >= CXI_RESOURCE_PE0_LE &&
+	    resource->type <= CXI_RESOURCE_PE3_LE) {
+		int le_pool_id;
+		int pe = resource->type - CXI_RESOURCE_PE0_LE;
+
+		le_pool_id = ida_alloc_range(&hw->le_pool_ids[pe],
+					     DEFAULT_LE_POOL_ID,
+					     CASS_NUM_LE_POOLS - 1, GFP_NOWAIT);
+		if (le_pool_id < 0) {
+			pr_debug("%s pool unavailable.\n",
+				 cxi_resource_type_to_str(resource->type));
+			rc = -EBADR;
+			goto unlock;
+		}
+
+		rgroup->pools.le_pool_id[pe] = le_pool_id;
+	} else if (resource->type == CXI_RESOURCE_TLE) {
+		int tle_pool_id;
+
+		tle_pool_id = ida_alloc_range(&hw->tle_pool_ids,
+					      DEFAULT_TLE_POOL_ID,
+					      C_CQ_CFG_TLE_POOL_ENTRIES - 1,
+					      GFP_NOWAIT);
+		if (tle_pool_id < 0) {
+			pr_debug("%s pool unavailable.\n",
+				 cxi_resource_type_to_str(resource->type));
+			rc = -EBADR;
+			goto unlock;
+		}
+
+		rgroup->pools.tle_pool_id = tle_pool_id;
+	}
+
+	r_use->reserved += resource->limits.reserved;
+	r_use->shared -= resource->limits.reserved;
+
+	pr_debug("type:%s limits.reserved:%ld limits.max:%ld reserved:%ld shared:%ld\n",
+		 cxi_resource_type_to_str(resource->type),
+		 resource->limits.reserved, resource->limits.max,
+		 r_use->reserved, r_use->shared);
+
+	if (resource->type >= CXI_RESOURCE_PE0_LE &&
+	    resource->type <= CXI_RESOURCE_PE3_LE) {
+		int pe = resource->type - CXI_RESOURCE_PE0_LE;
+		struct cxi_limits les = {
+			.max = resource->limits.max,
+			.res = resource->limits.reserved,
+		};
+
+		cass_cfg_le_pools(hw, rgroup->pools.le_pool_id[pe], pe, &les,
+				  false);
+	} else if (resource->type == CXI_RESOURCE_TLE) {
+		struct cxi_limits tles = {
+			.max = resource->limits.max,
+			.res = resource->limits.reserved,
+		};
+
+		cass_cfg_tle_pool(hw, rgroup->pools.tle_pool_id, &tles, false);
+	}
+
+unlock:
+	spin_unlock(&hw->rgrp_lock);
+
+	return rc;
+}
+
+int cass_rgroup_remove_resource(struct cxi_rgroup *rgroup,
+				struct cxi_resource_entry *resource)
+{
+	struct cass_dev *hw = rgroup->hw;
+	struct cxi_resource_use *r_use;
+
+	r_use = &hw->resource_use[resource->type];
+
+	spin_lock(&hw->rgrp_lock);
+
+	r_use->reserved -= resource->limits.reserved;
+	r_use->shared += resource->limits.reserved;
+
+	pr_debug("type:%s limits.reserved:%ld limits.max:%ld reserved:%ld shared:%ld\n",
+		 cxi_resource_type_to_str(resource->type),
+		 resource->limits.reserved, resource->limits.max,
+		 r_use->reserved, r_use->shared);
+
+	if (resource->type >= CXI_RESOURCE_PE0_LE &&
+	    resource->type <= CXI_RESOURCE_PE3_LE) {
+		int pe = resource->type - CXI_RESOURCE_PE0_LE;
+		struct cxi_limits les = {
+			.max = resource->limits.max,
+			.res = resource->limits.reserved,
+		};
+
+		cass_cfg_le_pools(hw, rgroup->pools.le_pool_id[pe], pe, &les,
+				  true);
+		ida_free(&hw->le_pool_ids[pe], rgroup->pools.le_pool_id[pe]);
+		rgroup->pools.le_pool_id[pe] = -1;
+	} else if (resource->type == CXI_RESOURCE_TLE) {
+		struct cxi_limits tles = {
+			.max = resource->limits.max,
+			.res = resource->limits.reserved,
+		};
+
+		cass_cfg_tle_pool(hw, rgroup->pools.tle_pool_id, &tles, true);
+		ida_free(&hw->tle_pool_ids, rgroup->pools.tle_pool_id);
+		rgroup->pools.tle_pool_id = -1;
+	}
+
+	spin_unlock(&hw->rgrp_lock);
+
+	return 0;
+}
+
+void cass_free_resource(struct cxi_rgroup *rgroup,
+			struct cxi_resource_entry *entry)
+{
+	struct cass_dev *hw = rgroup->hw;
+	struct cxi_resource_use *r_use = &hw->resource_use[entry->type];
+
+	spin_lock(&hw->rgrp_lock);
+
+	/* Free from shared space if applicable */
+	if (entry->limits.in_use > entry->limits.reserved)
+		r_use->shared_use--;
+
+	r_use->in_use--;
+	entry->limits.in_use--;
+
+	spin_unlock(&hw->rgrp_lock);
+}
+
+int cass_alloc_resource(struct cxi_rgroup *rgroup,
+			struct cxi_resource_entry *entry)
+{
+	int rc = 0;
+	size_t available;
+	struct cass_dev *hw = rgroup->hw;
+	struct cxi_resource_use *r_use = &hw->resource_use[entry->type];
+
+	spin_lock(&hw->rgrp_lock);
+
+	available = r_use->max - r_use->shared_use;
+
+	if (entry->limits.in_use < entry->limits.reserved) {
+		r_use->in_use++;
+		entry->limits.in_use++;
+	} else if (entry->limits.in_use < entry->limits.max && available) {
+		entry->limits.in_use++;
+		r_use->in_use++;
+		r_use->shared_use++;
+	} else {
+		pr_debug("%s unavailable use:%ld reserved:%ld max:%ld shared_use:%ld\n",
+			 cxi_resource_type_to_str(entry->type),
+			 entry->limits.in_use, entry->limits.reserved,
+			 entry->limits.max, r_use->shared_use);
+		rc = -ENOSPC;
+	}
+
+	spin_unlock(&hw->rgrp_lock);
+
+	return rc;
+}
+
+void cass_get_tle_in_use(struct cxi_rgroup *rgroup,
+			 struct cxi_resource_entry *entry)
+{
+	union c_cq_sts_tle_in_use tle_in_use;
+
+	if (cxi_rgroup_tle_pool_id(rgroup) == -1)
+		return;
+
+	cass_read(rgroup->hw,
+		  C_CQ_STS_TLE_IN_USE(cxi_rgroup_tle_pool_id(rgroup)),
+		  &tle_in_use, sizeof(tle_in_use));
+
+	entry->limits.in_use = tle_in_use.count;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_sbus.c b/drivers/net/ethernet/hpe/ss1/cass_sbus.c
new file mode 100644
index 000000000000..bdce46dc1de7
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_sbus.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020, 2022, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Cassini SBUS driver */
+
+#include <linux/hpe/cxi/cxi.h>
+#include <linux/iopoll.h>
+
+#include "cass_core.h"
+
+#include <linux/hpe/sbl/sbl.h>
+
+/**
+ * cxi_sbus_op_reset() - Perform an SBus op reset
+ *
+ * Note this doesn't reset the SBus - all it does is clear the MB
+ * accessor registers.
+ *
+ * @cdev: CXI device
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_sbus_op_reset(struct cxi_dev *cdev)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	union c_mb_dbg_cfg_sbus_master cfg = {};
+	union c_mb_dbg_sts_sbus_master sts;
+	int rc;
+
+	if (!cdev->is_physfn)
+		return -EPERM;
+
+	rc = mutex_lock_interruptible(&hw->sbus_mutex);
+	if (rc) {
+		mutex_unlock(&hw->sbus_mutex);
+		return -ERESTARTSYS;
+	}
+
+	/* clear config register */
+	cass_write(hw, C_MB_DBG_CFG_SBUS_MASTER, &cfg, sizeof(cfg));
+
+	/* clear any sticky status bits */
+	cass_read(hw, C_MB_DBG_STS_SBUS_MASTER, &sts, sizeof(sts));
+	if (sts.overrun || sts.write_error) {
+		cass_write(hw, C_MB_DBG_STS_SBUS_MASTER, &sts, sizeof(sts));
+		cass_flush_pci(hw);
+	}
+
+	mutex_unlock(&hw->sbus_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_sbus_op_reset);
+
+/**
+ * cxi_sbus_op() - Perform an SBus operation
+ *
+ * Performs target SBus operation on the single Cassini SBus ring.
+ *
+ * This function will also correct the overrun and write_error
+ * conditions if they happen.
+ *
+ * @cdev: CXI device
+ * @params: command parameters
+ * @rsp_data: pointer to store response data
+ * @result_code: pointer to store result code from SBus request
+ * @overrun: pointer to store request overrun condition
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_sbus_op(struct cxi_dev *cdev, const struct cxi_sbus_op_params *params,
+		u32 *rsp_data, u8 *result_code,	u8 *overrun)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	const union c_mb_dbg_cfg_sbus_master cfg = {
+		.execute = 1,
+		.mode = 1,
+		.command = params->command,
+		.receiver_address = params->rx_addr,
+		.data_address = params->data_addr,
+		.data = params->req_data,
+	};
+	union c_mb_dbg_sts_sbus_master sts;
+	void __iomem *sts_csr = cass_csr(hw, C_MB_DBG_STS_SBUS_MASTER);
+	int rc;
+
+	if (!cdev->is_physfn)
+		return -EPERM;
+
+	if (!rsp_data || !result_code || !overrun)
+		return -EINVAL;
+
+	if (params->timeout == 0 || params->timeout > 5000)
+		return -EINVAL;
+
+	if (params->poll_interval == 0 || params->poll_interval > 1000)
+		return -EINVAL;
+
+	if (params->delay > 100)
+		return -EINVAL;
+
+	cxidev_dbg(cdev, "sbus op: %d, %d, %d %d\n", params->req_data,
+		   params->data_addr, params->rx_addr, params->command);
+
+	rc = mutex_lock_interruptible(&hw->sbus_mutex);
+	if (rc)
+		return -ERESTARTSYS;
+
+	/* Start the operation */
+	cass_write(hw, C_MB_DBG_CFG_SBUS_MASTER, &cfg, sizeof(cfg));
+	cass_flush_pci(hw);
+
+	if (params->delay)
+		udelay(params->delay);
+
+	/* Poll for completion */
+	rc = readq_poll_timeout(sts_csr, sts.qw,
+				sts.rcv_data_valid == 1,
+				(params->poll_interval * USEC_PER_MSEC),
+				(params->timeout * USEC_PER_MSEC));
+	if (rc) {
+		mutex_unlock(&hw->sbus_mutex);
+		return rc;
+	}
+
+	if (sts.overrun || sts.write_error) {
+		cass_write(hw, C_MB_DBG_STS_SBUS_MASTER, &sts, sizeof(sts));
+		cass_flush_pci(hw);
+	}
+
+	mutex_unlock(&hw->sbus_mutex);
+
+	*rsp_data = sts.data;
+	*result_code = sts.result_code;
+	*overrun = sts.overrun;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_sbus_op);
+
+/**
+ * cxi_serdes_op() - Perform a SERDES operation
+ *
+ * Passthrough to the SBL driver.
+ *
+ * @cdev: CXI device
+ * @serdes_sel:
+ * @op:
+ * @data:
+ * @timeout:
+ * @flags:
+ * @result:
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_serdes_op(struct cxi_dev *cdev, u64 serdes_sel, u64 op, u64 data,
+		  int timeout, unsigned int flags, u16 *result)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+
+	if (!cdev->is_physfn)
+		return -EPERM;
+
+	if (!cass_version(hw, CASSINI_1)) {
+		cxidev_err(cdev, "%s NOT IMPLEMENTED!\n", __func__);
+		return -ENOTSUPP;
+	}
+
+	return sbl_pml_serdes_op(hw->sbl, 0, serdes_sel, op, data, result,
+				 timeout, flags);
+}
+EXPORT_SYMBOL(cxi_serdes_op);
diff --git a/drivers/net/ethernet/hpe/ss1/cass_svc.c b/drivers/net/ethernet/hpe/ss1/cass_svc.c
new file mode 100644
index 000000000000..b2d91993e070
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_svc.c
@@ -0,0 +1,2011 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Service Management */
+
+#include <linux/cred.h>
+
+#include "cass_core.h"
+#include "cxi_rxtx_profile.h"
+#include "cxi_rxtx_profile_list.h"
+#include "cass_ss1_debugfs.h"
+#include "cxi_vf_cmd.h"
+
+static bool disable_default_svc = true;
+module_param(disable_default_svc, bool, 0444);
+MODULE_PARM_DESC(disable_default_svc, "Disable the default service.");
+
+static bool default_svc_test_mode;
+module_param(default_svc_test_mode, bool, 0444);
+MODULE_PARM_DESC(default_svc_test_mode,
+		 "Remove all safety rails for default service.");
+
+static int default_svc_num_tles = 512;
+module_param(default_svc_num_tles, int, 0644);
+MODULE_PARM_DESC(default_svc_num_tles,
+		 "Number of reserved TLEs for default service");
+
+static unsigned int default_vnis[CXI_SVC_MAX_VNIS] = {1, 10, 0, 0};
+module_param_array(default_vnis, uint, NULL, 0444);
+MODULE_PARM_DESC(default_vnis,
+		 "Default VNIS. Should be consistent at the fabric level");
+
+static bool enable_rgid_sharing = true;
+module_param(enable_rgid_sharing, bool, 0644);
+MODULE_PARM_DESC(enable_rgid_sharing,
+		 "Allow future CXI service allocations to use RGID sharing.");
+
+static int default_lnis_per_rgid = CXI_DEFAULT_LNIS_PER_RGID;
+module_param(default_lnis_per_rgid, int, 0644);
+MODULE_PARM_DESC(default_lnis_per_rgid, "Number of LNIs per RGID");
+
+static void svc_destroy(struct cass_dev *hw, struct cxi_svc_priv *svc_priv);
+
+static enum cxi_resource_type stype_to_rtype(enum cxi_rsrc_type type, int pe)
+{
+	switch (type) {
+	case CXI_RSRC_TYPE_PTE:
+		return CXI_RESOURCE_PTLTE;
+	case CXI_RSRC_TYPE_TXQ:
+		return CXI_RESOURCE_TXQ;
+	case CXI_RSRC_TYPE_TGQ:
+		return CXI_RESOURCE_TGQ;
+	case CXI_RSRC_TYPE_EQ:
+		return CXI_RESOURCE_EQ;
+	case CXI_RSRC_TYPE_CT:
+		return CXI_RESOURCE_CT;
+	case CXI_RSRC_TYPE_LE:
+		return CXI_RESOURCE_PE0_LE + pe;
+	case CXI_RSRC_TYPE_TLE:
+		return CXI_RESOURCE_TLE;
+	case CXI_RSRC_TYPE_AC:
+		return CXI_RESOURCE_AC;
+	default:
+		return CXI_RESOURCE_MAX;
+	}
+}
+
+static void copy_rsrc_use(struct cxi_dev *dev, struct cxi_rsrc_use *rsrcs,
+			  struct cxi_rgroup *rgroup)
+{
+	int rc;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	union c_cq_sts_tle_in_use tle_in_use;
+	int type;
+	enum cxi_resource_type rtype;
+	struct cxi_resource_entry *entry;
+
+	for (type = 0; type < CXI_RSRC_TYPE_MAX; type++) {
+		rtype = stype_to_rtype(type, 0);
+		if (type == CXI_RSRC_TYPE_TLE) {
+			if (cxi_rgroup_tle_pool_id(rgroup) == -1)
+				continue;
+
+			cass_read(hw,
+				  C_CQ_STS_TLE_IN_USE(cxi_rgroup_tle_pool_id(rgroup)),
+				  &tle_in_use, sizeof(tle_in_use));
+			rsrcs->in_use[type] = tle_in_use.count;
+			rsrcs->tle_pool_id = cxi_rgroup_tle_pool_id(rgroup);
+		} else {
+			rc = cxi_rgroup_get_resource_entry(rgroup,
+							   rtype, &entry);
+			if (rc) {
+				rsrcs->in_use[type] = 0;
+				continue;
+			}
+
+			rsrcs->in_use[type] = entry->limits.in_use;
+		}
+	}
+}
+
+void cass_cfg_tle_pool(struct cass_dev *hw, int pool_id,
+		       const struct cxi_limits *tles, bool release)
+{
+	union c_cq_cfg_tle_pool tle_pool;
+
+	if (release) {
+		tle_pool.max_alloc = 0;
+		tle_pool.num_reserved = 0;
+	} else {
+		tle_pool.max_alloc = tles->max;
+		tle_pool.num_reserved = tles->res;
+	}
+	cass_write(hw, C_CQ_CFG_TLE_POOL(pool_id), &tle_pool,
+		   sizeof(tle_pool));
+}
+
+void cass_tle_init(struct cass_dev *hw)
+{
+	int i;
+	union c_cq_cfg_sts_tle_shared tle_shared;
+	union c_cq_cfg_tle_pool tle_pool_cfg = {
+		.max_alloc = 0,
+		.num_reserved = 0,
+	};
+
+	/* Ensure there is no shared space for TLEs */
+	tle_shared.num_shared = 0;
+	cass_write(hw, C_CQ_CFG_STS_TLE_SHARED, &tle_shared,
+		   sizeof(tle_shared));
+
+	/* Disable all pools */
+	for (i = 0; i < C_CQ_CFG_TLE_POOL_ENTRIES; i++)
+		cass_write(hw, C_CQ_CFG_TLE_POOL(i), &tle_pool_cfg,
+			   sizeof(tle_pool_cfg));
+}
+
+static void default_rsrc_limits(struct cxi_rsrc_limits *limits)
+{
+	memset(limits, 0, sizeof(*limits));
+
+	limits->type[CXI_RSRC_TYPE_PTE].max = C_NUM_PTLTES;
+	limits->type[CXI_RSRC_TYPE_TXQ].max = C_NUM_TRANSMIT_CQS;
+	limits->type[CXI_RSRC_TYPE_TGQ].max = C_NUM_TARGET_CQS;
+	limits->type[CXI_RSRC_TYPE_EQ].max = EQS_AVAIL;
+	limits->type[CXI_RSRC_TYPE_CT].max = CTS_AVAIL;
+	limits->type[CXI_RSRC_TYPE_LE].max = pe_total_les;
+	limits->type[CXI_RSRC_TYPE_TLE].max = C_NUM_TLES;
+	limits->type[CXI_RSRC_TYPE_AC].max = ACS_AVAIL;
+}
+
+int cass_svc_init(struct cass_dev *hw)
+{
+	static struct cxi_svc_desc svc_desc = {
+		.resource_limits = true,
+	};
+	int i, svc_id;
+	struct cxi_svc_priv *svc_priv;
+	struct cxi_rsrc_limits limits;
+
+	/* TODO differentiate PF/VF */
+	if (!hw->cdev.is_physfn)
+		return 0;
+
+	default_rsrc_limits(&hw->cdev.prop.rsrcs);
+
+	for (i = 0; i < CXI_RSRC_TYPE_MAX; i++) {
+		/* Set up resource limits for default service */
+		if (i != CXI_RSRC_TYPE_TLE) {
+			limits.type[i].max = hw->cdev.prop.rsrcs.type[i].max;
+			limits.type[i].res = 0;
+		} else {
+			limits.type[i].res = max(CASS_MIN_POOL_TLES,
+						 default_svc_num_tles);
+			limits.type[i].max = limits.type[i].res;
+		}
+	}
+	svc_desc.limits = limits;
+
+	for (i = CXI_TC_DEDICATED_ACCESS; i <= CXI_TC_BEST_EFFORT; ++i)
+		svc_desc.tcs[i] = true;
+
+	if (!default_svc_test_mode) {
+		svc_desc.restricted_vnis = true;
+		svc_desc.num_vld_vnis = 0;
+
+		for (i = 0; i < CXI_SVC_MAX_VNIS; i++) {
+			if (!is_vni_valid(default_vnis[i]))
+				break;
+			svc_desc.num_vld_vnis++;
+			svc_desc.vnis[i] = default_vnis[i];
+		}
+
+		if (!svc_desc.num_vld_vnis)
+			return -EINVAL;
+	}
+
+	mutex_init(&hw->svc_lock);
+	idr_init(&hw->svc_ids);
+	INIT_LIST_HEAD(&hw->svc_list);
+	hw->svc_count = 0;
+
+	/* Create default service. It will get the default ID of
+	 * CXI_DEFAULT_SVC_ID
+	 */
+	svc_id = cxi_svc_alloc(&hw->cdev, &svc_desc, NULL, "default");
+	if (svc_id < 0)
+		return svc_id;
+
+	mutex_lock(&hw->svc_lock);
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	mutex_unlock(&hw->svc_lock);
+
+	cxi_rgroup_set_lnis_per_rgid_compat(svc_priv->rgroup, 1);
+
+	svc_service_debugfs_create(hw);
+
+	return 0;
+}
+
+/* Check if a there are enough unused instances of a particular resource */
+static bool rsrc_available(struct cass_dev *hw,
+			   struct cxi_rsrc_limits *limits,
+			   enum cxi_rsrc_type type, int pe,
+			   struct cxi_svc_fail_info *fail_info)
+{
+	u16 shared_avail;
+	enum cxi_resource_type rtype;
+
+	rtype = stype_to_rtype(type, pe);
+	if (rtype >= CXI_RESOURCE_MAX)
+		return false;
+
+	shared_avail = hw->resource_use[rtype].shared;
+
+	/* Always fill out fail_info if a resource was requested so it
+	 * accurately reflects how many of resource X was available.
+	 * If all resources are in fact available, it won't be sent
+	 * back to the user.
+	 */
+	if (fail_info)
+		fail_info->rsrc_avail[type] = shared_avail;
+
+	if (limits->type[type].res > shared_avail)
+		return false;
+
+	return true;
+}
+
+/* Return resource reservations upon destruction of a service
+ * Caller must hold hw->svc_lock.
+ */
+static void free_rsrc(struct cxi_svc_priv *svc_priv,
+		      enum cxi_rsrc_type type)
+{
+	int rc;
+	int pe;
+	enum cxi_resource_type rtype = stype_to_rtype(type, 0);
+
+	if (type == CXI_RSRC_TYPE_LE) {
+		for (pe = 0; pe < C_PE_COUNT; pe++) {
+			rc = cxi_rgroup_delete_resource(svc_priv->rgroup,
+							rtype + pe);
+			if (rc)
+				pr_debug("delete resource %s failed %d\n",
+					 cxi_resource_type_to_str(type + pe),
+					 rc);
+		}
+
+		return;
+	}
+
+	rc = cxi_rgroup_delete_resource(svc_priv->rgroup, rtype);
+	if (rc)
+		pr_debug("delete resource %s failed %d\n",
+			 cxi_rsrc_type_to_str(type), rc);
+}
+
+static void free_rsrcs(struct cxi_svc_priv *svc_priv)
+{
+	int i;
+
+	for (i = 0; i < CXI_RSRC_TYPE_MAX; i++)
+		free_rsrc(svc_priv, i);
+}
+
+static int add_resource(struct cxi_rgroup *rgroup, enum cxi_rsrc_type type,
+			struct cxi_resource_limits *limits)
+{
+	int rc;
+	int pe;
+
+	if (type == CXI_RSRC_TYPE_LE) {
+		for (pe = 0; pe < C_PE_COUNT; pe++) {
+			rc = cxi_rgroup_add_resource(rgroup,
+						     stype_to_rtype(type, pe),
+						     limits);
+			if (rc) {
+				pr_debug("add resource %s PE %d failed\n",
+					 cxi_rsrc_type_to_str(type), pe);
+				return rc;
+			}
+		}
+
+		return rc;
+	}
+
+	rc = cxi_rgroup_add_resource(rgroup,
+				     stype_to_rtype(type, 0), limits);
+	if (rc)
+		pr_debug("add resource %s failed\n",
+			 cxi_rsrc_type_to_str(type));
+
+	return rc;
+}
+
+/* For each resource requested, check if enough of that resource is available.
+ * If they are all available, update the reserved values in the device.
+ * Caller must hold hw->svc_lock.
+ */
+static int reserve_rsrcs(struct cass_dev *hw,
+			 struct cxi_svc_priv *svc_priv,
+			 struct cxi_svc_fail_info *fail_info)
+{
+	int i;
+	int pe;
+	int rc = 0;
+	struct cxi_rgroup *rgroup = svc_priv->rgroup;
+	struct cxi_rsrc_limits *limits = &svc_priv->svc_desc.limits;
+
+	/* Default pool for default svc or when there are no LE limits */
+	if (!svc_priv->svc_desc.resource_limits)
+		default_rsrc_limits(limits);
+
+	for (i = CXI_RSRC_TYPE_PTE; i < CXI_RSRC_TYPE_MAX; i++) {
+		if (!limits->type[i].res && !limits->type[i].max)
+			continue;
+
+		if (i == CXI_RSRC_TYPE_TLE) {
+			if (svc_priv->svc_desc.svc_id != CXI_DEFAULT_SVC_ID) {
+				/* Ensure TLE max/res are at least CASS_MIN_POOL_TLES */
+				if (limits->type[i].res < CASS_MIN_POOL_TLES)
+					limits->type[i].res = CASS_MIN_POOL_TLES;
+				/* Force TLE max/res to be equal */
+				limits->type[i].max = limits->type[i].res;
+			}
+		} else if (i == CXI_RSRC_TYPE_LE) {
+			for (pe = 0; pe < C_PE_COUNT; pe++) {
+				if (!rsrc_available(hw, limits, i, pe,
+						    fail_info)) {
+					pr_debug("resource %s PE %d unavailable\n",
+						 cxi_rsrc_type_to_str(i), pe);
+					rc = -ENOSPC;
+					goto nospace;
+				}
+			}
+		} else if (!rsrc_available(hw, limits, i, 0, fail_info)) {
+			pr_debug("resource %s unavailable\n",
+				 cxi_rsrc_type_to_str(i));
+			rc = -ENOSPC;
+			goto nospace;
+		}
+	}
+
+nospace:
+	if (rc)
+		return rc;
+
+	/* Now reserve resources since needed ones are available */
+	for (i = CXI_RSRC_TYPE_PTE; i < CXI_RSRC_TYPE_MAX; i++) {
+		struct cxi_resource_limits lim = {
+			.reserved = limits->type[i].res,
+			.max = limits->type[i].max
+		};
+
+		if (!lim.reserved && !lim.max)
+			continue;
+
+		rc = add_resource(rgroup, i, &lim);
+		if (rc) {
+			pr_debug("resource %s add_resource failed %d\n",
+				 cxi_rsrc_type_to_str(i), rc);
+
+			if (rc == -EBADR) {
+				if (i == CXI_RSRC_TYPE_TLE)
+					fail_info->no_tle_pools = true;
+
+				if (i == CXI_RSRC_TYPE_LE)
+					fail_info->no_le_pools = true;
+				rc = -ENOSPC;
+			}
+
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	/* Remove any resources we already allocated */
+	for (--i; i >= CXI_RSRC_TYPE_PTE; i--) {
+		if (!limits->type[i].res)
+			continue;
+
+		free_rsrc(svc_priv, i);
+	}
+
+	return rc;
+}
+
+/* Basic sanity checks for user provided service descriptor */
+static int validate_descriptor(struct cass_dev *hw,
+			       const struct cxi_svc_desc *svc_desc)
+{
+	int i;
+
+	if (svc_desc->restricted_vnis) {
+		if (svc_desc->num_vld_vnis > CXI_SVC_MAX_VNIS)
+			return -EINVAL;
+		for (i = 0; i < svc_desc->num_vld_vnis; i++) {
+			if (!is_vni_valid(svc_desc->vnis[i]))
+				return -EINVAL;
+		}
+	}
+
+	if (svc_desc->restricted_members) {
+		for (i = 0; i < CXI_SVC_MAX_MEMBERS; i++) {
+			if (svc_desc->members[i].type < 0 ||
+			    svc_desc->members[i].type >= CXI_SVC_MEMBER_MAX)
+				return -EINVAL;
+		}
+	}
+
+	if (svc_desc->resource_limits) {
+		for (i = 0; i < CXI_RSRC_TYPE_MAX; i++) {
+			if (svc_desc->limits.type[i].max <
+			    svc_desc->limits.type[i].res)
+				return -EINVAL;
+			if (svc_desc->limits.type[i].max >
+			    hw->cdev.prop.rsrcs.type[i].max)
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static enum cxi_ac_type svc_mbr_to_ac_type(enum cxi_svc_member_type type,
+					   bool restricted_members)
+{
+	if (!restricted_members)
+		return CXI_AC_OPEN;
+
+	switch (type) {
+	case CXI_SVC_MEMBER_UID:
+		return CXI_AC_UID;
+	case CXI_SVC_MEMBER_GID:
+		return CXI_AC_GID;
+	case CXI_SVC_MEMBER_NET_NS:
+		return CXI_AC_NETNS;
+	case CXI_SVC_MEMBER_IGNORE:
+		fallthrough;
+	default:
+		return 0;
+	}
+}
+
+static void set_tcs(struct cxi_dev *dev, struct cxi_svc_priv *svc_priv)
+{
+	int i, j;
+	struct cxi_tx_profile *tx_profile;
+	struct cxi_svc_desc *svc_desc = &svc_priv->svc_desc;
+
+	for (i = 0; i < svc_priv->svc_desc.num_vld_vnis; i++) {
+		tx_profile = svc_priv->tx_profile[i];
+
+		for (j = 0; j < CXI_TC_MAX; j++)
+			if (!svc_desc->restricted_tcs || svc_desc->tcs[j])
+				cxi_tx_profile_set_tc(tx_profile, j, true);
+	}
+}
+
+static int alloc_rgroup_ac_entries(struct cxi_dev *dev,
+				   struct cxi_svc_priv *svc_priv)
+{
+	int i;
+	int rc;
+	enum cxi_ac_type type;
+	unsigned int ac_entry_id;
+	union cxi_ac_data ac_data = {};
+	struct cxi_svc_desc *svc_desc = &svc_priv->svc_desc;
+
+	if (!svc_desc->restricted_members)
+		return cxi_rgroup_add_ac_entry(svc_priv->rgroup, CXI_AC_OPEN,
+					       &ac_data, &ac_entry_id);
+
+	for (i = 0; i < CXI_SVC_MAX_MEMBERS; i++) {
+		/* No AC entry for member[].type of CXI_SVC_MEMBER_IGNORE */
+		type = svc_mbr_to_ac_type(svc_desc->members[i].type,
+					  svc_desc->restricted_members);
+		if (!type)
+			continue;
+
+		if (type == CXI_AC_UID)
+			ac_data.uid = svc_desc->members[i].svc_member.uid;
+		else if (type == CXI_AC_GID)
+			ac_data.gid = svc_desc->members[i].svc_member.gid;
+
+		rc = cxi_rgroup_add_ac_entry(svc_priv->rgroup, type, &ac_data,
+					     &ac_entry_id);
+		if (rc)
+			goto cleanup;
+	}
+
+	return 0;
+
+cleanup:
+	cxi_ac_entry_list_destroy(&svc_priv->rgroup->ac_entry_list);
+
+	return rc;
+}
+
+static void remove_profile_ac_entries(struct cxi_dev *dev,
+				      struct cxi_svc_priv *svc_priv)
+{
+	int i;
+	struct cxi_svc_desc *svc_desc = &svc_priv->svc_desc;
+
+	for (i = 0; i < svc_desc->num_vld_vnis; i++) {
+		cxi_tx_profile_remove_ac_entries(svc_priv->tx_profile[i]);
+		cxi_rx_profile_remove_ac_entries(svc_priv->rx_profile[i]);
+	}
+}
+
+/* No AC entry will be allocated for a member[].type of
+ * CXI_SVC_MEMBER_IGNORE.
+ */
+static int alloc_profile_ac_entries(struct cxi_dev *dev,
+				    struct cxi_svc_priv *svc_priv)
+{
+	int i;
+	int j;
+	int rc;
+	enum cxi_ac_type type;
+	unsigned int ac_entry_id;
+	struct cxi_svc_desc *svc_desc = &svc_priv->svc_desc;
+
+	if (!svc_desc->restricted_members) {
+		for (j = 0; j < svc_priv->svc_desc.num_vld_vnis; j++) {
+			rc = cxi_rx_profile_add_ac_entry(svc_priv->rx_profile[j],
+							 CXI_AC_OPEN, 0, 0, 0,
+							 &ac_entry_id);
+			if (rc)
+				goto cleanup;
+
+			rc = cxi_tx_profile_add_ac_entry(svc_priv->tx_profile[j],
+							 CXI_AC_OPEN, 0, 0, 0,
+							 &ac_entry_id);
+			if (rc)
+				goto cleanup;
+		}
+
+		return 0;
+	}
+
+	for (j = 0; j < svc_priv->svc_desc.num_vld_vnis; j++) {
+		for (i = 0; i < CXI_SVC_MAX_MEMBERS; i++) {
+			type = svc_mbr_to_ac_type(svc_desc->members[i].type,
+						  svc_desc->restricted_members);
+			if (!type)
+				continue;
+
+			rc = cxi_rx_profile_add_ac_entry(
+					svc_priv->rx_profile[j], type,
+					svc_desc->members[i].svc_member.uid,
+					svc_desc->members[i].svc_member.gid,
+					0,
+					&ac_entry_id);
+			if (rc)
+				goto cleanup;
+
+			rc = cxi_tx_profile_add_ac_entry(
+					svc_priv->tx_profile[j], type,
+					svc_desc->members[i].svc_member.uid,
+					svc_desc->members[i].svc_member.gid,
+					0,
+					&ac_entry_id);
+			if (rc)
+				goto cleanup;
+		}
+	}
+
+	return 0;
+
+cleanup:
+	remove_profile_ac_entries(dev, svc_priv);
+
+	return rc;
+}
+
+static void release_rxtx_profiles(struct cxi_dev *dev,
+				  struct cxi_svc_priv *svc_priv)
+{
+	int i;
+
+	remove_profile_ac_entries(dev, svc_priv);
+
+	for (i = 0; i < svc_priv->svc_desc.num_vld_vnis; i++) {
+		cxi_rx_profile_dec_refcount(dev, svc_priv->rx_profile[i]);
+		cxi_tx_profile_dec_refcount(dev, svc_priv->tx_profile[i],
+					    true);
+	}
+}
+
+/* Update the Netns in RX/TX profile */
+static int update_profile_netns_entries(struct cxi_dev *dev,
+					struct cxi_svc_priv *svc_priv, unsigned int netns)
+{
+	int j;
+	int rc = 0;
+	union cxi_ac_data data = {};
+	unsigned int ac_entry_id;
+
+	for (j = 0; j < svc_priv->svc_desc.num_vld_vnis; j++) {
+		if (!svc_priv->rx_profile[j] || !svc_priv->tx_profile[j])
+			return -ENODATA;
+
+		data.netns = netns;
+		rc = cxi_rxtx_profile_add_ac_entry(&svc_priv->rx_profile[j]->profile_common,
+						   CXI_AC_NETNS, &data, &ac_entry_id);
+		if (rc)
+			goto cleanup;
+
+		rc = cxi_rxtx_profile_add_ac_entry(&svc_priv->tx_profile[j]->profile_common,
+						   CXI_AC_NETNS, &data, &ac_entry_id);
+		if (rc)
+			goto cleanup;
+	}
+
+	return 0;
+
+cleanup:
+	remove_profile_ac_entries(dev, svc_priv);
+	return rc;
+}
+
+/* Setup up to 4 RX/TX Profiles if restricted_vnis = 1
+ * Otherwise set up a single RX/TX profile for a requested VNI range
+ */
+static int alloc_rxtx_profiles(struct cxi_dev *dev,
+			       struct cxi_svc_priv *svc_priv,
+			       const struct cxi_rxtx_vni_attr *vni_range_attr)
+{
+	int i;
+	int rc;
+	const struct cxi_rxtx_vni_attr *vni_attr;
+	struct cxi_svc_desc *svc_desc = &svc_priv->svc_desc;
+
+	if (!svc_desc->restricted_vnis) {
+		if (!vni_range_attr) {
+			cxidev_err(dev, "vni_range_attr NULL for vni_range\n");
+			return -EINVAL;
+		}
+		svc_priv->svc_desc.num_vld_vnis = 1;
+	}
+
+	for (i = 0; i < svc_priv->svc_desc.num_vld_vnis; i++) {
+		struct cxi_tx_attr tx_attr = {};
+		struct cxi_rx_attr rx_attr = {};
+		struct cxi_rxtx_vni_attr restricted_vni_attr = {
+			.ignore = 0,
+			.match = svc_desc->vnis[i],
+			.name = "",
+		};
+
+		vni_attr = &restricted_vni_attr;
+		if (!svc_desc->restricted_vnis)
+			vni_attr = vni_range_attr;
+
+		tx_attr.vni_attr = *vni_attr;
+		rx_attr.vni_attr = *vni_attr;
+
+		svc_priv->tx_profile[i] = cxi_dev_alloc_tx_profile(dev,
+								   &tx_attr);
+		if (IS_ERR(svc_priv->tx_profile[i])) {
+			rc = PTR_ERR(svc_priv->tx_profile[i]);
+			svc_priv->tx_profile[i] = NULL;
+			goto release_profiles;
+		}
+
+		svc_priv->rx_profile[i] = cxi_dev_alloc_rx_profile(dev,
+								   &rx_attr);
+		if (IS_ERR(svc_priv->rx_profile[i])) {
+			rc = PTR_ERR(svc_priv->rx_profile[i]);
+			svc_priv->rx_profile[i] = NULL;
+			goto release_profiles;
+		}
+	}
+
+	rc = alloc_profile_ac_entries(dev, svc_priv);
+	if (rc)
+		goto release_profiles;
+
+	set_tcs(dev, svc_priv);
+
+	return 0;
+
+release_profiles:
+	release_rxtx_profiles(dev, svc_priv);
+	return rc;
+}
+
+static int svc_enable(struct cxi_dev *dev, struct cxi_svc_priv *svc_priv,
+		      bool enable)
+	__must_hold(&hw->svc_lock)
+{
+	int i;
+	int rc = 0;
+
+	if (enable) {
+		cxi_rgroup_enable(svc_priv->rgroup);
+		svc_priv->svc_desc.enable = 1;
+
+		for (i = 0; i < svc_priv->svc_desc.num_vld_vnis; i++) {
+			rc = cxi_tx_profile_enable(dev,
+						   svc_priv->tx_profile[i]);
+			if (rc)
+				goto disable;
+
+			rc = cxi_rx_profile_enable(dev,
+						   svc_priv->rx_profile[i]);
+			if (rc)
+				goto disable;
+		}
+
+		return 0;
+	}
+
+disable:
+	cxi_rgroup_disable(svc_priv->rgroup);
+	svc_priv->svc_desc.enable = 0;
+
+	for (i = 0; i < svc_priv->svc_desc.num_vld_vnis; i++) {
+		cxi_tx_profile_disable(dev, svc_priv->tx_profile[i]);
+		cxi_rx_profile_disable(dev, svc_priv->rx_profile[i]);
+	}
+
+	return rc;
+}
+
+/**
+ * cxi_svc_alloc() - Allocate a service
+ *
+ * @dev: Cassini Device
+ * @svc_desc: A service descriptor that contains requests for various resources,
+ *            and optionally identifies member processes, tcs, vnis, etc. see
+ *            cxi_svc_desc.
+ * @fail_info: extra information when a failure occurs
+ * @name: name for service
+ *
+ * Return: Service ID on success. Else, negative errno value.
+ */
+int cxi_svc_alloc(struct cxi_dev *dev, const struct cxi_svc_desc *svc_desc,
+		  struct cxi_svc_fail_info *fail_info, char *name)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+	int rc;
+	struct cxi_rgroup *rgroup;
+	struct cxi_rgroup_attr attr = {
+		.id = svc_desc->svc_id,
+		.cntr_pool_id = svc_desc->cntr_pool_id,
+		.system_service = svc_desc->is_system_svc,
+		.lnis_per_rgid = default_lnis_per_rgid,
+	};
+
+	/* Service allocation is not allowed in VF */
+	if (!dev->is_physfn)
+		return -EPERM;
+
+	rc = validate_descriptor(hw, svc_desc);
+	if (rc)
+		return rc;
+
+	svc_priv = kzalloc(sizeof(*svc_priv), GFP_KERNEL);
+	if (!svc_priv)
+		return -ENOMEM;
+	svc_priv->svc_desc = *svc_desc;
+
+	rgroup = cxi_dev_alloc_rgroup(dev, &attr);
+	if (IS_ERR(rgroup)) {
+		rc = PTR_ERR(rgroup);
+		goto free_svc;
+	}
+
+	svc_priv->rgroup = rgroup;
+	svc_priv->svc_desc.svc_id = cxi_rgroup_id(rgroup);
+
+	rc = idr_alloc(&hw->svc_ids, svc_priv, cxi_rgroup_id(rgroup),
+		       cxi_rgroup_id(rgroup) + 1,
+		       GFP_NOWAIT);
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "%s Service idr could not be obtained for rgroup ID %d rc:%d\n",
+			   hw->cdev.name, cxi_rgroup_id(rgroup), rc);
+		goto release_rgroup;
+	}
+
+	cxi_rgroup_set_name(rgroup, name);
+
+	if (svc_desc->is_system_svc)
+		cxi_rgroup_set_lnis_per_rgid(svc_priv->rgroup, 1);
+
+	rc = alloc_rgroup_ac_entries(dev, svc_priv);
+	if (rc)
+		goto remove_idr;
+
+	/* If restricted_vnis is set setup profiles now. Otherwise they will
+	 * set up later when a vni range is requested
+	 */
+	if (svc_desc->restricted_vnis) {
+		rc = alloc_rxtx_profiles(dev, svc_priv, NULL);
+		if (rc)
+			goto remove_rgrp_ac_entries;
+	}
+
+	mutex_lock(&hw->svc_lock);
+	rc = reserve_rsrcs(hw, svc_priv, fail_info);
+	if (rc)
+		goto unlock;
+
+	/* SVC is enabled by default for backwards compatibility.
+	 * If disable_default_svc is true, the default service
+	 * will be disabled.
+	 * Setting restricted_vnis = 0 now indicates that a
+	 * VNI range will be set up after the service is enabled.
+	 * Do not enable the svc/rgroup/profiles until then.
+	 */
+	if (((cxi_rgroup_id(rgroup) == CXI_DEFAULT_SVC_ID) &&
+	     disable_default_svc) ||
+	    !svc_desc->restricted_vnis) {
+		svc_priv->svc_desc.enable = 0;
+	} else {
+		rc = svc_enable(dev, svc_priv, true);
+		if (rc)
+			goto free_resources;
+	}
+
+	list_add_tail(&svc_priv->list, &hw->svc_list);
+	hw->svc_count++;
+	mutex_unlock(&hw->svc_lock);
+	refcount_inc(&hw->refcount);
+
+	return cxi_rgroup_id(rgroup);
+
+free_resources:
+	free_rsrcs(svc_priv);
+unlock:
+	mutex_unlock(&hw->svc_lock);
+	if (svc_desc->restricted_vnis)
+		release_rxtx_profiles(dev, svc_priv);
+remove_rgrp_ac_entries:
+	cxi_ac_entry_list_destroy(&svc_priv->rgroup->ac_entry_list);
+remove_idr:
+	idr_remove(&hw->svc_ids, cxi_rgroup_id(rgroup));
+release_rgroup:
+	cxi_rgroup_dec_refcount(rgroup);
+	return rc;
+free_svc:
+	kfree(svc_priv);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_svc_alloc);
+
+static void svc_destroy(struct cass_dev *hw, struct cxi_svc_priv *svc_priv)
+{
+	int rc;
+	int svc_id = cxi_rgroup_id(svc_priv->rgroup);
+
+	free_rsrcs(svc_priv);
+
+	release_rxtx_profiles(&hw->cdev, svc_priv);
+
+	rc = cxi_rgroup_dec_refcount(svc_priv->rgroup);
+	if (rc)
+		pr_err("cxi_dev_release_rgroup_by_id failed %d\n", rc);
+
+	idr_remove(&hw->svc_ids, svc_id);
+	list_del(&svc_priv->list);
+	hw->svc_count--;
+
+	refcount_dec(&hw->refcount);
+	kfree(svc_priv);
+}
+
+/**
+ * cxi_svc_destroy() - Destroy a service
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of service to be destroyed.
+ *
+ * Return: 0 on success. Else a negative errno value.
+ */
+int cxi_svc_destroy(struct cxi_dev *dev, u32 svc_id)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+
+	/* Service allocation is not allowed in VF */
+	if (!dev->is_physfn)
+		return -EPERM;
+
+	/* Don't destroy default svc */
+	if (svc_id == CXI_DEFAULT_SVC_ID)
+		return -EINVAL;
+
+	mutex_lock(&hw->svc_lock);
+
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		mutex_unlock(&hw->svc_lock);
+		return -EINVAL;
+	}
+
+	/* Don't delete if an LNI is still using this SVC */
+	if (cxi_rgroup_refcount(svc_priv->rgroup) > 1) {
+		mutex_unlock(&hw->svc_lock);
+		return -EBUSY;
+	}
+
+	svc_destroy(hw, svc_priv);
+
+	mutex_unlock(&hw->svc_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_svc_destroy);
+
+static int cxi_svc_rsrc_list_get_vf(struct cxi_dev *dev, int count,
+				    struct cxi_rsrc_use *rsrc_list)
+{
+	const struct cxi_svc_rsrc_list_get_cmd cmd = {
+		.op = CXI_OP_SVC_RSRC_LIST_GET,
+		.count = count,
+	};
+	struct cxi_svc_rsrc_list_get_resp_vf *resp;
+	size_t resp_len = sizeof(struct cxi_svc_rsrc_list_get_resp_vf) +
+			  count * sizeof(struct cxi_rsrc_use);
+	int rc;
+
+	resp = kzalloc(resp_len, GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), resp, &resp_len);
+	if (rc)
+		goto free_buf;
+
+	if (count >= resp->base.count)
+		memcpy(rsrc_list, resp->rsrc_list,
+		       resp->base.count * sizeof(struct cxi_rsrc_use));
+	rc = resp->base.count;
+free_buf:
+	kfree(resp);
+	return rc;
+}
+
+/*
+ * cxi_svc_rsrc_list_get - Get per service information on resource usage.
+ *
+ * @dev: Cassini Device
+ * @count: number of services descriptors for which space
+ *         has been allocated. 0 initially, to determine count.
+ * @rsrc_list: destination to land service descriptors
+ *
+ * Return: number of service descriptors
+ * If the specified count is equal to (or greater than) the number of
+ * active service descriptors, they are copied to the provided user
+ * buffer.
+ */
+int cxi_svc_rsrc_list_get(struct cxi_dev *dev, int count,
+			  struct cxi_rsrc_use *rsrc_list)
+{
+
+	int i = 0;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	unsigned int rgroup_count;
+	unsigned long index;
+	struct cxi_rgroup *rgroup;
+
+	if (!dev->is_physfn)
+		return cxi_svc_rsrc_list_get_vf(dev, count, rsrc_list);
+
+	mutex_lock(&hw->svc_lock);
+	cxi_dev_lock_rgroup_list(hw);
+
+	rgroup_count = cxi_dev_get_rgroup_count(dev);
+	if (count < rgroup_count) {
+		cxi_dev_unlock_rgroup_list(hw);
+		mutex_unlock(&hw->svc_lock);
+		return rgroup_count;
+	}
+
+	for_each_rgroup(index, rgroup) {
+		if (i >= rgroup_count) {
+			pr_debug("Found more rgroups than expected: %u\n", rgroup_count);
+			break;
+		}
+
+		copy_rsrc_use(dev, &rsrc_list[i], rgroup);
+		rsrc_list[i].svc_id = rgroup->id;
+		i++;
+	}
+
+	cxi_dev_unlock_rgroup_list(hw);
+	mutex_unlock(&hw->svc_lock);
+
+	return i;
+}
+EXPORT_SYMBOL(cxi_svc_rsrc_list_get);
+
+static int cxi_svc_rsrc_get_vf(struct cxi_dev *dev, unsigned int svc_id,
+			       struct cxi_rsrc_use *rsrc_use)
+{
+	const struct cxi_svc_rsrc_get_cmd cmd = {
+		.op = CXI_OP_SVC_RSRC_GET,
+		.svc_id = svc_id,
+	};
+	struct cxi_svc_rsrc_get_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	*rsrc_use = resp.rsrcs;
+
+	return 0;
+}
+
+/*
+ * cxi_svc_rsrc_get - Get rsrc_use from svc_id
+ *
+ * @dev: Cassini Device
+ * @svc_id: svc_id of the descriptor to find which is equivalent to the
+ *          rgroup ID.
+ * @rsrc_use: destination to land resource usage
+ *
+ * Return: 0 on success or a negative errno
+ */
+int cxi_svc_rsrc_get(struct cxi_dev *dev, unsigned int svc_id,
+		     struct cxi_rsrc_use *rsrc_use)
+{
+	int rc;
+	struct cxi_rgroup *rgroup;
+
+	if (!dev->is_physfn)
+		return cxi_svc_rsrc_get_vf(dev, svc_id, rsrc_use);
+
+	rc = cxi_dev_find_rgroup_inc_refcount(dev, svc_id, &rgroup);
+	if (rc)
+		return -EINVAL;
+
+	copy_rsrc_use(dev, rsrc_use, rgroup);
+	cxi_rgroup_dec_refcount(rgroup);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_svc_rsrc_get);
+
+static enum cxi_svc_member_type ac_type_to_svc_mbr(enum cxi_ac_type type)
+{
+	switch (type) {
+	case CXI_AC_UID:
+		return CXI_SVC_MEMBER_UID;
+	case CXI_AC_GID:
+		return CXI_SVC_MEMBER_GID;
+	default:
+		return CXI_SVC_MEMBER_IGNORE;
+	}
+}
+
+static void add_rgroup_ac_entry_to_svc(struct cxi_svc_desc *desc,
+				       struct cxi_rgroup *rgroup)
+{
+	int i;
+	int rc;
+	size_t num_ids;
+	size_t max_ids;
+	unsigned int *ac_entry_ids = NULL;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+
+	desc->restricted_members = false;
+
+	rc = cxi_rgroup_get_ac_entry_ids(rgroup, 0, ac_entry_ids, &num_ids);
+	if (rc && rc != -ENOSPC)
+		return;
+
+	ac_entry_ids = kmalloc_array(num_ids, sizeof(*ac_entry_ids),
+				     GFP_ATOMIC);
+	if (!ac_entry_ids)
+		return;
+
+	rc = cxi_rgroup_get_ac_entry_ids(rgroup, num_ids, ac_entry_ids,
+					 &max_ids);
+	if (rc)
+		goto freemem;
+
+	for (i = 0; i < num_ids; i++) {
+		rc = cxi_rgroup_get_ac_entry_data(rgroup, ac_entry_ids[i],
+						  &ac_type, &ac_data);
+		if (rc || ac_type == CXI_AC_OPEN)
+			goto freemem;
+	}
+
+	desc->restricted_members = true;
+	for (i = 0; i < num_ids && i < CXI_SVC_MAX_MEMBERS; i++) {
+		rc = cxi_rgroup_get_ac_entry_data(rgroup, ac_entry_ids[i],
+						  &ac_type, &ac_data);
+		if (rc)
+			continue;
+
+		desc->members[i].type = ac_type_to_svc_mbr(ac_type);
+		desc->members[i].svc_member.uid = ac_data.uid;
+	}
+
+freemem:
+	kfree(ac_entry_ids);
+}
+
+static int cxi_svc_list_get_vf(struct cxi_dev *dev, int count,
+			       struct cxi_svc_desc *svc_list)
+{
+	const struct cxi_svc_list_get_cmd cmd = {
+		.op = CXI_OP_SVC_LIST_GET,
+		.count = count,
+	};
+	struct cxi_svc_list_get_resp_vf *resp;
+	size_t resp_len = sizeof(struct cxi_svc_list_get_resp_vf) +
+			  count * sizeof(struct cxi_svc_desc);
+	int rc;
+
+	resp = kzalloc(resp_len, GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), resp, &resp_len);
+	if (rc)
+		goto free_buf;
+
+	if (count >= resp->base.count)
+		memcpy(svc_list, resp->svc_list,
+		       resp->base.count * sizeof(struct cxi_svc_desc));
+
+	rc = resp->base.count;
+free_buf:
+	kfree(resp);
+	return rc;
+}
+
+/*
+ * cxi_svc_list_get - Assemble list of active services descriptors
+ *
+ * @dev: Cassini Device
+ * @count: number of services descriptors for which space
+ *         has been allocated. 0 initially, to determine count.
+ * @svc_list: destination to land service descriptors
+ *
+ * Return: number of service descriptors
+ * If the specified count is equal to (or greater than) the number of
+ * active service descriptors, they are copied to the provided user
+ * buffer.
+ */
+int cxi_svc_list_get(struct cxi_dev *dev, int count,
+		     struct cxi_svc_desc *svc_list)
+{
+
+	int i = 0;
+	int ret;
+	enum cxi_resource_type rt;
+	enum cxi_rsrc_type svc_rt;
+	unsigned int rgroup_count;
+	struct cxi_svc_priv *svc_priv;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_desc rgroup_svc_desc;
+	unsigned long index;
+	struct cxi_rgroup *rgroup;
+	struct cxi_resource_entry *entry;
+
+	if (!dev->is_physfn)
+		return cxi_svc_list_get_vf(dev, count, svc_list);
+
+	mutex_lock(&hw->svc_lock);
+	cxi_dev_lock_rgroup_list(hw);
+
+	rgroup_count = cxi_dev_get_rgroup_count(dev);
+	if (count < rgroup_count) {
+		cxi_dev_unlock_rgroup_list(hw);
+		mutex_unlock(&hw->svc_lock);
+		return rgroup_count;
+	}
+
+	for_each_rgroup(index, rgroup) {
+		svc_priv = idr_find(&hw->svc_ids, cxi_rgroup_id(rgroup));
+		if (svc_priv) {
+			svc_list[i++] = svc_priv->svc_desc;
+			continue;
+		}
+
+		memset(&rgroup_svc_desc, 0, sizeof(rgroup_svc_desc));
+		rgroup_svc_desc.svc_id = rgroup->id;
+		rgroup_svc_desc.enable = rgroup->state.enabled;
+		rgroup_svc_desc.resource_limits = true;
+		rgroup_svc_desc.is_system_svc =
+					cxi_rgroup_system_service(rgroup);
+		add_rgroup_ac_entry_to_svc(&rgroup_svc_desc, rgroup);
+
+		for (rt = 1, svc_rt = 0; rt < CXI_RESOURCE_MAX; rt++) {
+			ret = cxi_rgroup_get_resource_entry(rgroup, rt,
+							    &entry);
+			if (!ret) {
+				if (svc_rt == CXI_RSRC_TYPE_MAX)
+					break;
+
+				if (rt == CXI_RESOURCE_PE1_LE ||
+				    rt == CXI_RESOURCE_PE2_LE ||
+				    rt == CXI_RESOURCE_PE3_LE)
+					continue;
+
+				rgroup_svc_desc.limits.type[svc_rt].max =
+							entry->limits.max;
+				rgroup_svc_desc.limits.type[svc_rt].res =
+							entry->limits.reserved;
+			}
+			svc_rt++;
+		}
+		svc_list[i++] = rgroup_svc_desc;
+	}
+
+	cxi_dev_unlock_rgroup_list(hw);
+	mutex_unlock(&hw->svc_lock);
+	return i;
+}
+EXPORT_SYMBOL(cxi_svc_list_get);
+
+/* cxi_svc_get_vf - Get svc_desc from svc_id for a VF
+ *
+ * @dev: Cassini Device
+ * @svc_id: svc_id of the descriptor to find which is equivalent to the
+ *          rgroup ID.
+ * @svc_desc: destination to land service descriptor
+ *
+ * Return: 0 on success or a negative errno
+ */
+static int cxi_svc_get_vf(struct cxi_dev *dev, unsigned int svc_id,
+			  struct cxi_svc_desc *svc_desc)
+{
+	const struct cxi_svc_get_cmd cmd = {
+		.op = CXI_OP_SVC_GET,
+		.svc_id = svc_id,
+	};
+	struct cxi_svc_get_resp resp;
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	*svc_desc = resp.svc_desc;
+
+	return 0;
+}
+
+/*
+ * cxi_svc_get - Get svc_desc from svc_id
+ *
+ * @dev: Cassini Device
+ * @svc_id: svc_id of the descriptor to find which is equivalent to the
+ *          rgroup ID.
+ * @svc_desc: destination to land service descriptor
+ *
+ * Return: 0 on success or a negative errno
+ */
+int cxi_svc_get(struct cxi_dev *dev, unsigned int svc_id,
+		struct cxi_svc_desc *svc_desc)
+{
+	struct cxi_svc_priv *svc_priv;
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	if (!dev->is_physfn)
+		return cxi_svc_get_vf(dev, svc_id, svc_desc);
+
+	mutex_lock(&hw->svc_lock);
+
+	/* Find priv descriptor */
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		mutex_unlock(&hw->svc_lock);
+		return -EINVAL;
+	}
+
+	*svc_desc = svc_priv->svc_desc;
+	mutex_unlock(&hw->svc_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_svc_get);
+
+void cxi_free_resource(struct cxi_dev *dev, struct cxi_svc_priv *svc_priv,
+		       enum cxi_rsrc_type type)
+{
+	return cxi_rgroup_free_resource(svc_priv->rgroup,
+					stype_to_rtype(type, 0));
+}
+
+/* used to allocate ACs, etc. */
+int cxi_alloc_resource(struct cxi_dev *dev, struct cxi_svc_priv *svc_priv,
+		       enum cxi_rsrc_type type)
+{
+	return cxi_rgroup_alloc_resource(svc_priv->rgroup,
+					 stype_to_rtype(type, 0));
+}
+
+/**
+ * cxi_svc_enable() - Enable or Disable a service.
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of the service to be enabled.
+ * @enable: Boolean value indicating whether to enable or disable the service.
+ *
+ * Return: 0 on success or negative errno value.
+ */
+int cxi_svc_enable(struct cxi_dev *dev, unsigned int svc_id, bool enable)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+	int rc = 0;
+
+	if (!dev->is_physfn)
+		return -EPERM;
+
+	mutex_lock(&hw->svc_lock);
+
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		rc = -EINVAL;
+		cxidev_err(dev, "Invalid service ID: %u\n", svc_id);
+		goto unlock;
+	}
+
+	/* Service must be unused for it to be enabled/disabled. */
+	if (refcount_read(&svc_priv->rgroup->state.refcount) > 1) {
+		rc = -EBUSY;
+		goto unlock;
+	}
+
+	rc = svc_enable(dev, svc_priv, enable);
+unlock:
+	mutex_unlock(&hw->svc_lock);
+	return rc;
+}
+EXPORT_SYMBOL(cxi_svc_enable);
+
+/**
+ * cxi_svc_update() - Modify an existing service.
+ *
+ * @dev: Cassini Device
+ * @svc_desc: A service descriptor that contains requests for various resources,
+ *            and optionally identifies member processes, tcs, vnis, etc. see
+ *            cxi_svc_desc.
+ *
+ * Currently does not honor changes to resource limits in a svc_desc.
+ *
+ * Return: 0 on success. Else, negative errno value.
+ */
+int cxi_svc_update(struct cxi_dev *dev, const struct cxi_svc_desc *svc_desc)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+	int rc;
+
+	if (!dev->is_physfn)
+		return -EPERM;
+
+	rc = validate_descriptor(hw, svc_desc);
+	if (rc)
+		return rc;
+
+	mutex_lock(&hw->svc_lock);
+
+	/* Find priv descriptor */
+	svc_priv = idr_find(&hw->svc_ids, svc_desc->svc_id);
+	if (!svc_priv) {
+		rc = -EINVAL;
+		goto error;
+	}
+
+	/* Service must be unused for it to be updated. */
+	if (refcount_read(&svc_priv->rgroup->state.refcount) > 1) {
+		rc = -EBUSY;
+		goto error;
+	}
+
+	/* TODO Handle Resource Reservation Changes */
+	if (svc_priv->svc_desc.resource_limits != svc_desc->resource_limits) {
+		rc = -EINVAL;
+		goto error;
+	}
+
+	rc = svc_enable(dev, svc_priv, svc_desc->enable);
+	if (rc)
+		goto error;
+
+	/* Update TCs, VNIs, Members */
+	svc_priv->svc_desc.restricted_members = svc_desc->restricted_members;
+	svc_priv->svc_desc.restricted_vnis = svc_desc->restricted_vnis;
+	svc_priv->svc_desc.num_vld_vnis = svc_desc->num_vld_vnis;
+	svc_priv->svc_desc.restricted_tcs = svc_desc->restricted_tcs;
+	svc_priv->svc_desc.cntr_pool_id = svc_desc->cntr_pool_id;
+	svc_priv->svc_desc.enable = svc_desc->enable;
+
+	memcpy(svc_priv->svc_desc.tcs, svc_desc->tcs, sizeof(svc_desc->tcs));
+	memcpy(svc_priv->svc_desc.vnis, svc_desc->vnis, sizeof(svc_desc->vnis));
+	memcpy(svc_priv->svc_desc.members, svc_desc->members, sizeof(svc_desc->members));
+	// TODO: update TX profile?
+error:
+	mutex_unlock(&hw->svc_lock);
+	return rc;
+}
+EXPORT_SYMBOL(cxi_svc_update);
+
+int cxi_job_tc_bind(struct cxi_dev *dev, unsigned int job_id,
+		    unsigned int svc_id, unsigned int tc,
+		    enum cxi_traffic_class_type tc_type, bool create_tc,
+		    const struct cxi_rsrc_limits *limits,
+		    unsigned int *bound_svc_id, bool *created_tc)
+{
+	struct cxi_svc_desc svc_desc = {};
+	struct cxi_svc_fail_info fail_info = {};
+	int ret;
+
+	if (!dev->is_physfn)
+		return -EPERM;
+	if (!is_vni_valid(job_id))
+		return -EINVAL;
+	if (tc >= CXI_TC_MAX || tc_type >= CXI_TC_TYPE_MAX)
+		return -EINVAL;
+	if (created_tc)
+		*created_tc = false;
+
+	if (create_tc) {
+		ret = cxi_tc_cfg(dev, tc, tc_type);
+		if (ret && ret != -EEXIST)
+			return ret;
+		if (!ret && created_tc)
+			*created_tc = true;
+	} else {
+		ret = cxi_tc_validate(dev, tc, tc_type);
+		if (ret)
+			return ret;
+	}
+
+	svc_desc.svc_id = svc_id;
+	svc_desc.restricted_vnis = true;
+	svc_desc.num_vld_vnis = 1;
+	svc_desc.vnis[0] = job_id;
+	svc_desc.restricted_tcs = true;
+	svc_desc.tcs[tc] = true;
+	svc_desc.resource_limits = true;
+	svc_desc.enable = true;
+	if (limits)
+		svc_desc.limits = *limits;
+
+	ret = cxi_svc_alloc(dev, &svc_desc, &fail_info, "uet-job-tc");
+	if (ret < 0)
+		return ret;
+
+	if (bound_svc_id)
+		*bound_svc_id = ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_job_tc_bind);
+
+/**
+ * cxi_svc_set_lpr() - Update an existing service to set the LNIs per RGID
+ *
+ * For backwards compatibility, check if service is in use instead of
+ * checking if rgroup is enabled.
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of service to be updated.
+ * @lnis_per_rgid: New value of lnis_per_rgid
+ *
+ * Return: 0 on success or negative errno value.
+ */
+int cxi_svc_set_lpr(struct cxi_dev *dev, unsigned int svc_id,
+		    unsigned int lnis_per_rgid)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+
+	if (!dev->is_physfn)
+		return -EPERM;
+
+	if (lnis_per_rgid > C_NUM_LACS)
+		return -EINVAL;
+
+	if (!enable_rgid_sharing) {
+		cxidev_warn(dev, "RGID sharing is disabled\n");
+		return 0;
+	}
+
+	mutex_lock(&hw->svc_lock);
+
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		mutex_unlock(&hw->svc_lock);
+		return -EINVAL;
+	}
+
+	/* Service must be unused for it to be updated. */
+	if (cxi_rgroup_refcount(svc_priv->rgroup) > 1) {
+		mutex_unlock(&hw->svc_lock);
+		return -EBUSY;
+	}
+
+	cxi_rgroup_set_lnis_per_rgid_compat(svc_priv->rgroup, lnis_per_rgid);
+
+	mutex_unlock(&hw->svc_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_svc_set_lpr);
+
+static int cxi_svc_get_lpr_vf(struct cxi_dev *dev, unsigned int svc_id)
+{
+	const struct cxi_svc_lpr_cmd cmd = {
+		.op = CXI_OP_SVC_GET_LPR,
+		.svc_id = svc_id,
+	};
+	struct cxi_svc_get_value_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	return resp.value;
+}
+
+/**
+ * cxi_svc_get_lpr() - Get the LNIs per RGID of the indicated service
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of service to be updated.
+ *
+ * Return: lnis_per_rgid on success or negative errno value.
+ */
+int cxi_svc_get_lpr(struct cxi_dev *dev, unsigned int svc_id)
+{
+	struct cxi_rgroup *rgroup;
+	int ret;
+
+	if (!dev->is_physfn)
+		return cxi_svc_get_lpr_vf(dev, svc_id);
+
+	ret = cxi_dev_find_rgroup_inc_refcount(dev, svc_id, &rgroup);
+	if (ret)
+		return -EINVAL;
+
+	ret = cxi_rgroup_lnis_per_rgid(rgroup);
+	cxi_rgroup_dec_refcount(rgroup);
+
+	return ret;
+}
+EXPORT_SYMBOL(cxi_svc_get_lpr);
+
+/**
+ * cxi_svc_set_exclusive_cp() - Set the exclusive_cp bit for a service
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of service to be updated.
+ * @exclusive_cp: New value for exclusive_cp (true or false)
+ *
+ * Return: 0 on success or negative errno value.
+ */
+int cxi_svc_set_exclusive_cp(struct cxi_dev *dev, unsigned int svc_id,
+			     bool exclusive_cp)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+	int rc;
+
+	if (!dev->is_physfn)
+		return -EPERM;
+
+	mutex_lock(&hw->svc_lock);
+
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		rc = -EINVAL;
+		goto unlock;
+	}
+
+	if (svc_priv->svc_desc.restricted_vnis) {
+		cxidev_err(dev, "Exclusive CP not allowed with restricted VNIs\n");
+		rc = -EINVAL;
+		goto unlock;
+	}
+
+	/* One VNI Range will be allowed, tied to tx_profile 0.
+	 * This call will fail if the svc/tx_profile is already enabled
+	 */
+	if (!svc_priv->tx_profile[0]) {
+		cxidev_err(dev, "tx_profile[0] not initialized for svc_id: %d\n",
+			   svc_id);
+		rc = -EINVAL;
+		goto unlock;
+	}
+
+	rc = cxi_tx_profile_set_exclusive_cp(svc_priv->tx_profile[0],
+					     exclusive_cp);
+	if (rc)
+		cxidev_err(dev, "Failed to set exclusive CP for svc_id: %d rc:%d\n",
+			   svc_id, rc);
+
+unlock:
+	mutex_unlock(&hw->svc_lock);
+	return rc;
+}
+EXPORT_SYMBOL(cxi_svc_set_exclusive_cp);
+
+static int cxi_svc_get_exclusive_cp_vf(struct cxi_dev *dev, unsigned int svc_id)
+{
+	const struct cxi_svc_get_exclusive_cp_cmd cmd = {
+		.op = CXI_OP_SVC_GET_EXCLUSIVE_CP,
+		.svc_id = svc_id,
+	};
+	struct cxi_svc_get_exclusive_cp_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	return resp.exclusive_cp ? 1 : 0;
+}
+
+/**
+ * cxi_svc_get_exclusive_cp() - Get the exclusive_cp bit for a service
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of service to query.
+ *
+ * Return: 1 if exclusive_cp is set, 0 if not, or negative errno value.
+ */
+int cxi_svc_get_exclusive_cp(struct cxi_dev *dev, unsigned int svc_id)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+	int rc;
+
+	if (!dev->is_physfn)
+		return cxi_svc_get_exclusive_cp_vf(dev, svc_id);
+
+	mutex_lock(&hw->svc_lock);
+
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		rc = -EINVAL;
+		goto unlock;
+	}
+
+	if (!svc_priv->tx_profile[0]) {
+		rc = -ENOENT;
+		goto unlock;
+	}
+
+	/* Grab the first TX Profile and report its exclusive_cp value */
+	rc = cxi_tx_profile_exclusive_cp(svc_priv->tx_profile[0]);
+unlock:
+	mutex_unlock(&hw->svc_lock);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_svc_get_exclusive_cp);
+
+/**
+ * cxi_svc_set_vni_range() - Add TX/RX profiles for a contiguous range of VNIs to a service
+ *
+ * The provided range must be exactly representable as a mask/match pair.
+ * Requirements:
+ *   - The number of values in the range must be a power of two (1, 2, 4, 8, 16, ...).
+ *   - The first value in the range (vni_min) must be a multiple of the range size.
+ *   - The svc must not have the restricted_vnis bit set.
+ *
+ * For example:
+ *   64–127: 64 values, starting value (64) is a multiple of the
+ *           range size (64), so the range is valid.
+ *   32–95 : 64 values, starting value (32) is not a multiple of the
+ *           range size (64), so the range is invalid.
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of service to be updated.
+ * @vni_min: Minimum VNI value (inclusive)
+ * @vni_max: Maximum VNI value (inclusive)
+ *
+ * Return: 0 on success, or negative errno value on failure.
+ */
+int cxi_svc_set_vni_range(struct cxi_dev *dev, unsigned int svc_id,
+			  unsigned int vni_min, unsigned int vni_max)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+	struct cxi_rxtx_vni_attr vni_attr = {
+		.name = "",
+	};
+	unsigned int range;
+	int rc = 0;
+
+	if (!dev->is_physfn)
+		return -EPERM;
+
+	mutex_lock(&hw->svc_lock);
+
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+
+	/* VNI range is incompatible with distinct VNIs */
+	if (svc_priv->svc_desc.restricted_vnis) {
+		cxidev_err(dev, "Cannot specify distinct VNIs and a VNI range");
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+	if (!is_vni_valid(vni_min)) {
+		cxidev_err(dev, "vni_min %u invalid", vni_min);
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+	if (!is_vni_valid(vni_max)) {
+		cxidev_err(dev, "vni_max %u invalid", vni_max);
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+	if (vni_max < vni_min) {
+		cxidev_err(dev, "vni_max %u is less than vni_min %u",
+			   vni_max, vni_min);
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+
+	range = vni_max - vni_min + 1;
+
+	if (!is_power_of_2(range)) {
+		cxidev_err(dev, "VNI range [%u, %u] is not a power-of-two size",
+			   vni_min, vni_max);
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+	/* Validate the range is aligned */
+	if (vni_min & (range - 1)) {
+		cxidev_err(dev, "VNI range [%u, %u] is not aligned. min (%u) must be a multiple of range size (%u)",
+			   vni_min, vni_max, vni_min, range);
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+
+	vni_attr.match = vni_min;
+	vni_attr.ignore = range - 1;
+
+	rc = alloc_rxtx_profiles(dev, svc_priv, &vni_attr);
+
+unlock_return:
+	mutex_unlock(&hw->svc_lock);
+	return rc;
+}
+EXPORT_SYMBOL(cxi_svc_set_vni_range);
+
+static int cxi_svc_get_vni_range_vf(struct cxi_dev *dev, unsigned int svc_id,
+				    unsigned int *vni_min, unsigned int *vni_max)
+{
+	const struct cxi_svc_vni_range_cmd cmd = {
+		.op = CXI_OP_SVC_GET_VNI_RANGE,
+		.svc_id = svc_id,
+	};
+	struct cxi_svc_get_vni_range_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	*vni_min = resp.vni_min;
+	*vni_max = resp.vni_max;
+
+	return 0;
+}
+
+/**
+ * cxi_svc_get_vni_range() - Get the VNI range associated with a service
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of service to query.
+ * @vni_min: Pointer to store minimum VNI value (inclusive)
+ * @vni_max: Pointer to store maximum VNI value (inclusive)
+ *
+ * Return: 0 on success, or negative errno value.
+ */
+int cxi_svc_get_vni_range(struct cxi_dev *dev, unsigned int svc_id,
+			  unsigned int *vni_min, unsigned int *vni_max)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+	struct cxi_tx_attr tx_attr;
+	int rc = 0;
+	struct cxi_rgroup *rgroup;
+
+	if (!dev->is_physfn)
+		return cxi_svc_get_vni_range_vf(dev, svc_id, vni_min, vni_max);
+
+	mutex_lock(&hw->svc_lock);
+
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		rc = cxi_dev_find_rgroup_inc_refcount(dev, svc_id, &rgroup);
+		if (!rc) {
+			/* We don't support getting a VNI range for rgroups */
+			cxi_rgroup_dec_refcount(rgroup);
+			cxidev_dbg(dev, "svc_id %u is a rgroup", svc_id);
+			rc = -EOPNOTSUPP;
+			goto unlock_return;
+		}
+
+		cxidev_err(dev, "svc_id %u not found", svc_id);
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+	if (svc_priv->svc_desc.restricted_vnis) {
+		cxidev_err(dev, "svc_id %u does not have a vni range", svc_id);
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+	if (!svc_priv->svc_desc.num_vld_vnis) {
+		cxidev_err(dev, "svc_id %u has no valid TX/RX profiles", svc_id);
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+
+	if (!svc_priv->tx_profile[0]) {
+		rc = -ENOENT;
+		goto unlock_return;
+	}
+
+	rc = cxi_tx_profile_get_info(dev, svc_priv->tx_profile[0], &tx_attr,
+				     NULL);
+	if (rc) {
+		cxidev_err(dev, "Failed to get TX profile info for svc_id %u",
+			   svc_id);
+		goto unlock_return;
+	}
+
+	*vni_min = tx_attr.vni_attr.match;
+	*vni_max = tx_attr.vni_attr.match + tx_attr.vni_attr.ignore;
+
+unlock_return:
+	mutex_unlock(&hw->svc_lock);
+	return rc;
+}
+EXPORT_SYMBOL(cxi_svc_get_vni_range);
+
+/**
+ * cxi_svc_set_netns() - Set netns Access control to existing service
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of service to be set.
+ * @netns: The Namespace id
+ * * Return:
+ * * 0       - success
+ * * -EEXIST - The service was originally created with a UID or GID,
+ * *           so netns access control cannot be applied
+ * * -EINVAL - The specified service does not exist
+ */
+int cxi_svc_set_netns(struct cxi_dev *dev, unsigned int svc_id, unsigned int netns)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+	unsigned int ac_entry_id;
+	union cxi_ac_data ac_data = {};
+	struct cxi_ac_entry_list list = {};
+	int rc;
+
+	if (!dev->is_physfn)
+		return -EPERM;
+
+	mutex_lock(&hw->svc_lock);
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+
+	/* Make sure that the ac list is empty.	 */
+	list = svc_priv->rgroup->ac_entry_list;
+	if (!xa_empty(&list.uid.xarray) || !xa_empty(&list.gid.xarray) || list.open_entry) {
+		cxidev_dbg(dev,
+			   "Failed to add netns for svc_id: %u (netns is not supported with uid/gid/open)",
+			   svc_id);
+		rc = -EEXIST;
+		goto unlock_return;
+	}
+
+	ac_data.netns = netns;
+
+	rc = cxi_rgroup_update_ac_entry(svc_priv->rgroup, CXI_AC_NETNS, &ac_data,
+					&ac_entry_id);
+	if (rc)
+		goto unlock_return;
+
+	rc = update_profile_netns_entries(dev, svc_priv, netns);
+	if (rc)
+		goto unlock_return;
+unlock_return:
+	mutex_unlock(&hw->svc_lock);
+	return rc;
+}
+EXPORT_SYMBOL(cxi_svc_set_netns);
+
+static int cxi_svc_get_netns_vf(struct cxi_dev *dev, unsigned int svc_id,
+				unsigned int *netns)
+{
+	const struct cxi_svc_get_netns_cmd cmd = {
+		.op = CXI_OP_SVC_GET_NETNS,
+		.svc_id = svc_id,
+	};
+	struct cxi_svc_get_value_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(dev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	*netns = resp.value;
+
+	return 0;
+}
+
+/**
+ * cxi_svc_get_netns() - Get the network namespace associated with a service
+ *
+ * @dev: Cassini Device
+ * @svc_id: Service ID of service to query.
+ * @netns: Pointer to store namespace ID
+ *
+ * Return: 0 on success, or negative errno value.
+ */
+int cxi_svc_get_netns(struct cxi_dev *dev, unsigned int svc_id,
+		      unsigned int *netns)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_svc_priv *svc_priv;
+	union cxi_ac_data ac_data = {};
+	int rc;
+
+	if (!dev->is_physfn)
+		return cxi_svc_get_netns_vf(dev, svc_id, netns);
+
+	mutex_lock(&hw->svc_lock);
+
+	svc_priv = idr_find(&hw->svc_ids, svc_id);
+	if (!svc_priv) {
+		cxidev_dbg(dev, "svc_id %u not found", svc_id);
+		rc = -EINVAL;
+		goto unlock_return;
+	}
+	rc = cxi_ac_entry_list_retrieve_netns(&svc_priv->rgroup->ac_entry_list, &ac_data);
+	if (rc)
+		goto unlock_return;
+
+	*netns = ac_data.netns;
+
+unlock_return:
+	mutex_unlock(&hw->svc_lock);
+	return rc;
+}
+EXPORT_SYMBOL(cxi_svc_get_netns);
+
+void cass_svc_fini(struct cass_dev *hw)
+{
+	struct cxi_svc_priv *svc_priv;
+	struct cxi_svc_priv *tmp;
+
+	if (!hw->cdev.is_physfn)
+		return;
+
+	debugfs_remove(hw->svc_debug);
+	list_for_each_entry_safe(svc_priv, tmp, &hw->svc_list, list)
+		svc_destroy(hw, svc_priv);
+
+	idr_destroy(&hw->svc_ids);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_sysfs.c b/drivers/net/ethernet/hpe/ss1/cass_sysfs.c
new file mode 100644
index 000000000000..ae0da46e774d
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_sysfs.c
@@ -0,0 +1,849 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022 Hewlett Packard Enterprise Development LP */
+
+#include "cass_core.h"
+
+#define PROP_ATTR_RO(_name) \
+	static struct kobj_attribute dev_attr_##_name = __ATTR_RO(_name)
+
+#define PROP_ATTR_RW(_name) \
+	static struct kobj_attribute dev_attr_##_name = __ATTR_RW(_name)
+
+static ssize_t nic_addr_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			     char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "0x%x\n", hw->cdev.prop.nic_addr);
+}
+PROP_ATTR_RO(nic_addr);
+
+static ssize_t nid_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "0x%x\n", hw->cdev.prop.nid);
+}
+
+static ssize_t nid_store(struct kobject *kobj, struct kobj_attribute *attr,
+			 const char *buf, size_t count)
+{
+	struct cass_dev *hw = container_of(kobj, struct cass_dev,
+					   properties_kobj);
+	u32 nid;
+
+	if (kstrtoint(buf, 0, &nid) < 0)
+		return -EINVAL;
+
+	cxi_set_nid(&hw->cdev, nid);
+
+	return count;
+}
+PROP_ATTR_RW(nid);
+
+static ssize_t pid_bits_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			     char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.pid_bits);
+}
+PROP_ATTR_RO(pid_bits);
+
+static ssize_t system_type_identifier_show(struct kobject *kobj, struct kobj_attribute *kattr,
+					   char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", hw->cdev.system_type_identifier);
+}
+PROP_ATTR_RO(system_type_identifier);
+
+static ssize_t pid_count_show(struct kobject *kobj,
+			      struct kobj_attribute *kattr,
+			      char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.pid_count);
+}
+PROP_ATTR_RO(pid_count);
+
+static ssize_t pid_granule_show(struct kobject *kobj,
+				struct kobj_attribute *kattr,
+				char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.pid_granule);
+}
+PROP_ATTR_RO(pid_granule);
+
+static ssize_t min_free_shift_show(struct kobject *kobj,
+				   struct kobj_attribute *kattr,
+				   char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.min_free_shift);
+}
+PROP_ATTR_RO(min_free_shift);
+
+static ssize_t rdzv_get_idx_show(struct kobject *kobj,
+				 struct kobj_attribute *kattr,
+				 char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.rdzv_get_idx);
+}
+PROP_ATTR_RO(rdzv_get_idx);
+
+static ssize_t num_ptes_show(struct kobject *kobj,
+			     struct kobj_attribute *kattr,
+			     char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.rsrcs.ptes.max);
+}
+PROP_ATTR_RO(num_ptes);
+
+static ssize_t num_txqs_show(struct kobject *kobj,
+			     struct kobj_attribute *kattr,
+			     char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.rsrcs.txqs.max);
+}
+PROP_ATTR_RO(num_txqs);
+
+static ssize_t num_tgqs_show(struct kobject *kobj,
+			     struct kobj_attribute *kattr,
+			     char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.rsrcs.tgqs.max);
+}
+PROP_ATTR_RO(num_tgqs);
+
+static ssize_t num_eqs_show(struct kobject *kobj,
+			    struct kobj_attribute *kattr,
+			    char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.rsrcs.eqs.max);
+}
+PROP_ATTR_RO(num_eqs);
+
+static ssize_t num_cts_show(struct kobject *kobj,
+			    struct kobj_attribute *kattr,
+			    char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.rsrcs.cts.max);
+}
+PROP_ATTR_RO(num_cts);
+
+static ssize_t num_acs_show(struct kobject *kobj,
+			    struct kobj_attribute *kattr,
+			    char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.rsrcs.acs.max);
+}
+PROP_ATTR_RO(num_acs);
+
+static ssize_t num_tles_show(struct kobject *kobj,
+			     struct kobj_attribute *kattr,
+			     char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.rsrcs.tles.max);
+}
+PROP_ATTR_RO(num_tles);
+
+static ssize_t num_les_show(struct kobject *kobj,
+			    struct kobj_attribute *kattr,
+			    char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", hw->cdev.prop.rsrcs.les.max);
+}
+PROP_ATTR_RO(num_les);
+
+static ssize_t rgids_avail_show(struct kobject *kobj,
+				struct kobj_attribute *kattr, char *buf)
+{
+	struct cass_dev *hw = container_of(kobj, struct cass_dev,
+					   properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n",
+			 C_NUM_RGIDS - refcount_read(&hw->rgids_refcount));
+}
+PROP_ATTR_RO(rgids_avail);
+
+static ssize_t hpc_mtu_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			    char *buf)
+{
+	return scnprintf(buf, PAGE_SIZE, "%u\n", C_MAX_HPC_MTU);
+}
+PROP_ATTR_RO(hpc_mtu);
+
+static ssize_t speed_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			  char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+	int speed;
+
+	if (hw->port)
+		cass_sbl_link_mode_to_speed(hw->port->lattr.bl.link_mode, &speed);
+	else
+		speed = 0;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", speed);
+}
+PROP_ATTR_RO(speed);
+
+static ssize_t link_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			 char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+	int state = hw->phy.state == CASS_PHY_RUNNING;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", state);
+}
+PROP_ATTR_RO(link);
+
+static ssize_t rev_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", hw->cdev.prop.device_rev);
+}
+PROP_ATTR_RO(rev);
+
+static ssize_t proto_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			  char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", hw->cdev.prop.device_proto);
+}
+PROP_ATTR_RO(proto);
+
+static ssize_t platform_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			     char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n",
+			 hw->cdev.prop.device_platform);
+}
+PROP_ATTR_RO(platform);
+
+static ssize_t cassini_version_show(struct kobject *kobj,
+				    struct kobj_attribute *kattr, char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+	const char *str;
+
+	switch (hw->cdev.prop.cassini_version) {
+	case CASSINI_1_0:
+		str = "1.0";
+		break;
+	case CASSINI_1_1:
+		str = "1.1";
+		break;
+	case CASSINI_2_0:
+		str = "2.0";
+		break;
+	default:
+		str = "unknown";
+		break;
+	}
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", str);
+}
+PROP_ATTR_RO(cassini_version);
+
+static ssize_t uc_nic_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			   char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", hw->uc_nic);
+}
+PROP_ATTR_RO(uc_nic);
+
+static ssize_t pct_eq_show(struct kobject *kobj, struct kobj_attribute *kattr,
+			   char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", hw->pct_eq_n);
+}
+PROP_ATTR_RO(pct_eq);
+
+/* This function is similar to the kernel's current_link_speed_show() and
+ * ideally would be merged into it
+ */
+static ssize_t current_esm_link_speed_show(struct kobject *kobj,
+					   struct kobj_attribute *kattr,
+					   char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+	const char *speed;
+
+	if (!hw->esm_active)
+		return scnprintf(buf, PAGE_SIZE, "Disabled\n");
+
+	switch (hw->pcie_link_speed) {
+	case CASS_SPEED_2_5GT:
+		speed = "2.5 GT/s";
+		break;
+	case CASS_SPEED_5_0GT:
+		speed = "5.0 GT/s";
+		break;
+	case CASS_SPEED_8_0GT:
+		speed = "8.0 GT/s";
+		break;
+	case CASS_SPEED_16_0GT:
+		speed = "16.0 GT/s";
+		break;
+	case CASS_SPEED_20_0GT:
+		speed = "20.0 GT/s";
+		break;
+	case CASS_SPEED_25_0GT:
+		speed = "25.0 GT/s";
+		break;
+	case CASS_SPEED_32_0GT:
+		speed = "32.0 GT/s";
+		break;
+	default:
+		speed = "Unknown speed";
+		break;
+	}
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", speed);
+}
+PROP_ATTR_RO(current_esm_link_speed);
+
+static ssize_t rdzv_get_en_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buf)
+{
+	struct cass_dev *hw = container_of(kobj, struct cass_dev,
+					   properties_kobj);
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", !!hw->cdev.prop.rdzv_get_en);
+}
+
+static ssize_t rdzv_get_en_store(struct kobject *kobj,
+				 struct kobj_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct cass_dev *hw = container_of(kobj, struct cass_dev,
+					   properties_kobj);
+	bool flag;
+
+	mutex_lock(&hw->get_ctrl_mutex);
+	if (kstrtobool(buf, &flag) < 0) {
+		mutex_unlock(&hw->get_ctrl_mutex);
+
+		return -EINVAL;
+	}
+	hw->cdev.prop.rdzv_get_en = flag;
+	cass_pte_set_get_ctrl(hw);
+	mutex_unlock(&hw->get_ctrl_mutex);
+
+	return count;
+}
+PROP_ATTR_RW(rdzv_get_en);
+
+static ssize_t amo_remap_to_pcie_fadd_show(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *buf)
+{
+	struct cass_dev *hw = container_of(kobj, struct cass_dev,
+					   properties_kobj);
+
+	return snprintf(buf, PAGE_SIZE, "%d\n",
+			hw->cdev.prop.amo_remap_to_pcie_fadd);
+}
+
+static ssize_t amo_remap_to_pcie_fadd_store(struct kobject *kobj,
+					    struct kobj_attribute *attr,
+					    const char *buf, size_t count)
+{
+	struct cass_dev *hw = container_of(kobj, struct cass_dev,
+					   properties_kobj);
+	int amo_remap_to_pcie_fadd;
+	int ret;
+
+	ret = kstrtoint(buf, 10, &amo_remap_to_pcie_fadd);
+	if (ret)
+		return ret;
+
+	mutex_lock(&hw->amo_remap_to_pcie_fadd_mutex);
+	ret = cass_ixe_set_amo_remap_to_pcie_fadd(hw, amo_remap_to_pcie_fadd);
+	mutex_unlock(&hw->amo_remap_to_pcie_fadd_mutex);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+PROP_ATTR_RW(amo_remap_to_pcie_fadd);
+
+static ssize_t pcie_corr_err_show(struct kobject *kobj,
+				  struct kobj_attribute *kattr, char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%llu\n", hw->pcie_mon.corr_err);
+}
+PROP_ATTR_RO(pcie_corr_err);
+
+static ssize_t pcie_uncorr_err_show(struct kobject *kobj,
+				    struct kobj_attribute *kattr, char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, properties_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%llu\n", hw->pcie_mon.uncorr_err);
+}
+PROP_ATTR_RO(pcie_uncorr_err);
+
+static struct attribute *properties_attrs[] = {
+	&dev_attr_nic_addr.attr,
+	&dev_attr_nid.attr,
+	&dev_attr_pid_bits.attr,
+	&dev_attr_pid_count.attr,
+	&dev_attr_pid_granule.attr,
+	&dev_attr_min_free_shift.attr,
+	&dev_attr_rdzv_get_idx.attr,
+	&dev_attr_hpc_mtu.attr,
+	&dev_attr_speed.attr,
+	&dev_attr_link.attr,
+	&dev_attr_rev.attr,
+	&dev_attr_proto.attr,
+	&dev_attr_platform.attr,
+	&dev_attr_system_type_identifier.attr,
+	&dev_attr_cassini_version.attr,
+	&dev_attr_uc_nic.attr,
+	&dev_attr_num_ptes.attr,
+	&dev_attr_num_txqs.attr,
+	&dev_attr_num_tgqs.attr,
+	&dev_attr_num_eqs.attr,
+	&dev_attr_num_cts.attr,
+	&dev_attr_num_acs.attr,
+	&dev_attr_num_tles.attr,
+	&dev_attr_num_les.attr,
+	&dev_attr_rgids_avail.attr,
+	&dev_attr_pct_eq.attr,
+	&dev_attr_current_esm_link_speed.attr,
+	&dev_attr_rdzv_get_en.attr,
+	&dev_attr_pcie_corr_err.attr,
+	&dev_attr_pcie_uncorr_err.attr,
+	&dev_attr_amo_remap_to_pcie_fadd.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(properties);
+
+static struct kobj_type properties_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = properties_groups,
+};
+
+/* FRU attributes from the uC. The FRU information is made available
+ * in hw->fru_info[]. Create each entry with the index in that table.
+ */
+#define FRU_ATTR(_name, _idx)						\
+	static ssize_t _name##_show(struct kobject *kobj,		\
+				    struct kobj_attribute *kattr,	\
+				    char *buf)				\
+	{								\
+		struct cass_dev *hw =					\
+			container_of(kobj, struct cass_dev, fru_kobj);	\
+		if (!hw->fru_info_valid)				\
+			uc_cmd_get_fru(hw);				\
+		if (hw->fru_info[_idx])					\
+			return scnprintf(buf, PAGE_SIZE, "%s\n",	\
+					 hw->fru_info[_idx]);		\
+		else							\
+			return 0;					\
+	}								\
+	static struct kobj_attribute dev_attr_##_name = __ATTR_RO(_name)
+
+FRU_ATTR(chassis_type, PLDM_FRU_FIELD_CHASSIS_TYPE);
+FRU_ATTR(model, PLDM_FRU_FIELD_MODEL);
+FRU_ATTR(part_number, PLDM_FRU_FIELD_PART_NUMBER);
+FRU_ATTR(serial_number, PLDM_FRU_FIELD_SERIAL_NUMBER);
+FRU_ATTR(manufacturer, PLDM_FRU_FIELD_MANUFACTURER);
+FRU_ATTR(manufacture_date, PLDM_FRU_FIELD_MANUFACTURE_DATE);
+FRU_ATTR(vendor, PLDM_FRU_FIELD_VENDOR);
+FRU_ATTR(name, PLDM_FRU_FIELD_NAME);
+FRU_ATTR(sku, PLDM_FRU_FIELD_SKU);
+FRU_ATTR(version, PLDM_FRU_FIELD_VERSION);
+FRU_ATTR(asset_tag, PLDM_FRU_FIELD_ASSET_TAG);
+FRU_ATTR(description, PLDM_FRU_FIELD_DESCRIPTION);
+FRU_ATTR(engineering_change_level,
+	 PLDM_FRU_FIELD_ENGINEERING_CHANGE_LEVEL);
+FRU_ATTR(other, PLDM_FRU_FIELD_OTHER);
+FRU_ATTR(vendor_iana, PLDM_FRU_FIELD_VENDOR_IANA);
+
+static struct attribute *fru_attrs[] = {
+	&dev_attr_chassis_type.attr,
+	&dev_attr_model.attr,
+	&dev_attr_part_number.attr,
+	&dev_attr_serial_number.attr,
+	&dev_attr_manufacturer.attr,
+	&dev_attr_manufacture_date.attr,
+	&dev_attr_vendor.attr,
+	&dev_attr_name.attr,
+	&dev_attr_sku.attr,
+	&dev_attr_version.attr,
+	&dev_attr_asset_tag.attr,
+	&dev_attr_description.attr,
+	&dev_attr_engineering_change_level.attr,
+	&dev_attr_other.attr,
+	&dev_attr_vendor_iana.attr,
+
+	NULL,
+};
+ATTRIBUTE_GROUPS(fru);
+
+static struct kobj_type fru_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = fru_groups,
+};
+
+#define LINK_RESTART_TIME(_idx)					\
+	static ssize_t time_##_idx##_show(struct kobject *kobj,	\
+		struct kobj_attribute *kattr, char *buf)	\
+	{							\
+		struct cass_dev *hw =				\
+			container_of(kobj, struct cass_dev,	\
+			link_restarts_kobj);			\
+								\
+		return scnprintf(buf, PAGE_SIZE, "%lld\n",	\
+			hw->port->link_restart_time_buf[_idx]);	\
+	}							\
+	PROP_ATTR_RO(time_##_idx)
+
+LINK_RESTART_TIME(0);
+LINK_RESTART_TIME(1);
+LINK_RESTART_TIME(2);
+LINK_RESTART_TIME(3);
+LINK_RESTART_TIME(4);
+LINK_RESTART_TIME(5);
+LINK_RESTART_TIME(6);
+LINK_RESTART_TIME(7);
+LINK_RESTART_TIME(8);
+LINK_RESTART_TIME(9);
+/* NOTE: don't forget to add more buffer entries */
+
+static struct attribute *link_restarts_attrs[] = {
+	&dev_attr_time_0.attr,
+	&dev_attr_time_1.attr,
+	&dev_attr_time_2.attr,
+	&dev_attr_time_3.attr,
+	&dev_attr_time_4.attr,
+	&dev_attr_time_5.attr,
+	&dev_attr_time_6.attr,
+	&dev_attr_time_7.attr,
+	&dev_attr_time_8.attr,
+	&dev_attr_time_9.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(link_restarts);
+
+static struct kobj_type link_restarts_info = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = link_restarts_groups,
+};
+
+#define SENSOR_ATTR_RO(_name, _fmt, _field)				\
+	static ssize_t sensor_##_name##_show(struct kobject *kobj,	\
+					     struct kobj_attribute *kattr, \
+					     char *buf)			\
+	{								\
+		struct pldm_sensor *sensor =				\
+			container_of(kobj, struct pldm_sensor, kobj);	\
+									\
+		return scnprintf(buf, PAGE_SIZE, _fmt "\n",		\
+				 sensor->_field);			\
+	}								\
+									\
+	static struct kobj_attribute dev_attr_sensor_##_name = {	\
+		.attr   = { .name = __stringify(_name), .mode = 0444 },	\
+		.show   = sensor_##_name##_show,			\
+	}
+
+SENSOR_ATTR_RO(name, "%s", name);
+SENSOR_ATTR_RO(base_unit, "%u", num.base_unit);
+SENSOR_ATTR_RO(unit_modifier, "%d", num.unit_modifier);
+SENSOR_ATTR_RO(rate_unit, "%u", num.rate_unit);
+
+#define SENSOR_SSD_ATTR_RO(_name, _field)				\
+	static ssize_t sensor_##_name##_show(struct kobject *kobj,	\
+					     struct kobj_attribute *kattr, \
+					     char *buf)			\
+	{								\
+		struct pldm_sensor *sensor =				\
+			container_of(kobj, struct pldm_sensor, kobj);	\
+									\
+		return scnprintf(buf, PAGE_SIZE, "%llu\n",		\
+				 get_pldm_value(sensor, _field));	\
+	}								\
+									\
+	static struct kobj_attribute dev_attr_sensor_##_name = {	\
+		.attr   = { .name = __stringify(_name), .mode = 0444 },	\
+		.show   = sensor_##_name##_show,			\
+	}
+
+SENSOR_SSD_ATTR_RO(range_field_supported, range_field_support);
+SENSOR_SSD_ATTR_RO(nominal_value, nominal_value);
+SENSOR_SSD_ATTR_RO(warning_high, warning_high);
+SENSOR_SSD_ATTR_RO(warning_low, warning_low);
+SENSOR_SSD_ATTR_RO(critical_high, critical_high);
+SENSOR_SSD_ATTR_RO(critical_low, critical_low);
+SENSOR_SSD_ATTR_RO(fatal_high, fatal_high);
+SENSOR_SSD_ATTR_RO(fatal_low, fatal_low);
+
+#define SENSOR_VAL_ATTR_RO(_name, _fmt)					\
+	static ssize_t sensor_##_name##_show(struct kobject *kobj,	\
+					     struct kobj_attribute *kattr, \
+					     char *buf)			\
+	{								\
+		struct pldm_sensor *sensor =				\
+			container_of(kobj, struct pldm_sensor, kobj);	\
+		struct pldm_sensor_reading result;			\
+		int rc;							\
+									\
+		rc = update_sensor(sensor, &result);			\
+		if (rc)							\
+			return rc;					\
+									\
+		return scnprintf(buf, PAGE_SIZE, _fmt "\n", result._name); \
+	}								\
+									\
+	static struct kobj_attribute dev_attr_sensor_##_name = {	\
+		.attr   = { .name = __stringify(_name), .mode = 0400 },	\
+		.show   = sensor_##_name##_show,			\
+	}
+
+SENSOR_VAL_ATTR_RO(operational_state, "%u");
+SENSOR_VAL_ATTR_RO(present_state, "%u");
+SENSOR_VAL_ATTR_RO(previous_state, "%u");
+SENSOR_VAL_ATTR_RO(present_reading, "%lld");
+
+static struct attribute *sensor_attrs[] = {
+	&dev_attr_sensor_name.attr,
+	&dev_attr_sensor_base_unit.attr,
+	&dev_attr_sensor_unit_modifier.attr,
+	&dev_attr_sensor_rate_unit.attr,
+	&dev_attr_sensor_nominal_value.attr,
+	&dev_attr_sensor_range_field_supported.attr,
+	&dev_attr_sensor_warning_high.attr,
+	&dev_attr_sensor_warning_low.attr,
+	&dev_attr_sensor_critical_high.attr,
+	&dev_attr_sensor_critical_low.attr,
+	&dev_attr_sensor_fatal_high.attr,
+	&dev_attr_sensor_fatal_low.attr,
+	&dev_attr_sensor_operational_state.attr,
+	&dev_attr_sensor_present_state.attr,
+	&dev_attr_sensor_previous_state.attr,
+	&dev_attr_sensor_present_reading.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(sensor);
+
+static struct kobj_type sensor_settings = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = sensor_groups,
+};
+
+static int create_sensors(struct cass_dev *hw)
+{
+	struct pldm_sensor *sensor;
+	int id;
+	int bad_id;
+	int rc;
+
+	hw->pldm_sensors_kobj =
+		kobject_create_and_add("sensors", &hw->cdev.pdev->dev.kobj);
+	if (!hw->pldm_sensors_kobj)
+		return -ENOMEM;
+
+	idr_for_each_entry(&hw->pldm_sensors, sensor, id) {
+		rc = kobject_init_and_add(&sensor->kobj, &sensor_settings,
+					  hw->pldm_sensors_kobj,
+					  "%u", id);
+		if (rc)
+			goto err;
+	}
+
+	return 0;
+
+err:
+	bad_id = id;
+	idr_for_each_entry(&hw->pldm_sensors, sensor, id) {
+		kobject_put(&sensor->kobj);
+		if (id == bad_id)
+			break;
+	}
+
+	kobject_put(hw->pldm_sensors_kobj);
+
+	return rc;
+}
+
+static void delete_sensors(struct cass_dev *hw)
+{
+	struct pldm_sensor *sensor;
+	int id;
+
+	idr_for_each_entry(&hw->pldm_sensors, sensor, id)
+		kobject_put(&sensor->kobj);
+
+	kobject_put(hw->pldm_sensors_kobj);
+}
+
+static ssize_t ac_filter_disabled_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	struct cass_dev *hw = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", hw->ac_filter_disabled);
+}
+
+static ssize_t ac_filter_disabled_store(struct device *dev,
+					struct device_attribute *attr,
+				       const char *buf,
+				       size_t count)
+{
+	struct cass_dev *hw = dev_get_drvdata(dev);
+
+	if (kstrtobool(buf, &hw->ac_filter_disabled) < 0)
+		return -EINVAL;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(ac_filter_disabled);
+
+static struct attribute *cxi_dev_settings[] = {
+	&dev_attr_ac_filter_disabled.attr,
+	NULL,
+};
+
+static const struct attribute_group cxi_dev_settings_group = {
+	.name = "settings",
+	.attrs = cxi_dev_settings,
+};
+
+int create_sysfs_properties(struct cass_dev *hw)
+{
+	int rc;
+
+	if (!hw->cdev.is_physfn)
+		return 0;
+
+	rc = kobject_init_and_add(&hw->properties_kobj, &properties_info,
+				  &hw->cdev.pdev->dev.kobj,
+				  "properties");
+	if (rc)
+		goto put_properties;
+
+	rc = kobject_init_and_add(&hw->link_restarts_kobj, &link_restarts_info,
+				  &hw->cdev.pdev->dev.kobj,
+				  "link_restarts");
+	if (rc)
+		goto put_link_restarts;
+
+	if (!hw->cdev.is_physfn)
+		return 0;
+
+	rc = kobject_init_and_add(&hw->fru_kobj, &fru_info,
+				  &hw->cdev.pdev->dev.kobj,
+				  "fru");
+	if (rc)
+		goto put_fru;
+
+	rc = sysfs_create_group(&hw->cdev.pdev->dev.kobj,
+				&cxi_dev_settings_group);
+	if (rc)
+		goto put_fru;
+
+	rc = cass_create_tc_sysfs(hw);
+	if (rc)
+		goto remove_sysfs_group;
+
+	rc = create_sensors(hw);
+	if (rc)
+		goto remove_tc;
+
+	return 0;
+
+remove_tc:
+	cass_destroy_tc_sysfs(hw);
+remove_sysfs_group:
+	sysfs_remove_group(&hw->cdev.pdev->dev.kobj, &cxi_dev_settings_group);
+put_fru:
+	kobject_put(&hw->fru_kobj);
+put_link_restarts:
+	kobject_put(&hw->link_restarts_kobj);
+put_properties:
+	kobject_put(&hw->properties_kobj);
+
+	return rc;
+}
+
+void destroy_sysfs_properties(struct cass_dev *hw)
+{
+	if (!hw->cdev.is_physfn)
+		return;
+
+	delete_sensors(hw);
+	cass_destroy_tc_sysfs(hw);
+	sysfs_remove_group(&hw->cdev.pdev->dev.kobj, &cxi_dev_settings_group);
+	kobject_put(&hw->fru_kobj);
+	kobject_put(&hw->link_restarts_kobj);
+	kobject_put(&hw->properties_kobj);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_tc.c b/drivers/net/ethernet/hpe/ss1/cass_tc.c
new file mode 100644
index 000000000000..f057e3dea520
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_tc.c
@@ -0,0 +1,2780 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020, 2024-2026 Hewlett Packard Enterprise Development LP */
+
+/* Traffic Class (TC) Management */
+#include <linux/lockdep.h>
+
+#include "cass_core.h"
+#include "cass_ss1_debugfs.h"
+
+static unsigned int pfc_buf_skid_space = 65280;
+module_param(pfc_buf_skid_space, uint, 0444);
+MODULE_PARM_DESC(pfc_buf_skid_space,
+		 "PFC buffer skid space (high water threshold) in bytes");
+
+/* PCP that PCT Traffic will use. By default we use the PCP specified
+ * in the QoS Profile.
+ */
+static int pct_control_traffic_pcp = -1;
+module_param(pct_control_traffic_pcp, int, 0444);
+MODULE_PARM_DESC(pct_control_traffic_pcp,
+		 "PCP used for PCT control traffic.\n"
+		 "Values 0-7 are valid\n"
+		 "Value -1 - Use PCP Specified in QoS Profile\n");
+
+/* Prevent (or not) usage of PCT PCP by an RDMA TC */
+static bool disable_user_pct_tc_usage = true;
+module_param(disable_user_pct_tc_usage, bool, 0644);
+MODULE_PARM_DESC(disable_user_pct_tc_usage,
+		 "Prevent users from using traffic class assigned to PCT control traffic");
+
+/* PCT Control Traffic needs a dedicated PCP that is configured to ignore
+ * pause from Rosetta. However if the provided PCP is in use by an RDMA TC
+ * we may disallow use of this RDMA TC. This value will only be set if
+ * an RDMA TC is in fact using the PCP used by PCP.
+ */
+static int pct_control_traffic_tc = -1;
+
+static unsigned int active_qos_profile = 2;
+module_param(active_qos_profile, uint, 0444);
+MODULE_PARM_DESC(active_qos_profile,
+		 "QoS Profile to load. Must match fabric QoS Profile\n"
+		 "1 - HPC\n"
+		 "2 - LL_BE_BD_ET\n"
+		 "3 - LL_BE_BD_ET1_ET2\n");
+
+static const char * const cxi_qos_strs[] = {
+	[CXI_QOS_HPC] = "HPC",
+	[CXI_QOS_LL_BE_BD_ET] = "LL_BE_BD_ET",
+	[CXI_QOS_LL_BE_BD_ET1_ET2] = "LL_BE_BD_ET1_ET2",
+};
+
+static const char * const cxi_tc_strs_lc[] = {
+	[CXI_TC_DEDICATED_ACCESS]	= "dedicated_access",
+	[CXI_TC_LOW_LATENCY]            = "low_latency",
+	[CXI_TC_BULK_DATA]              = "bulk_data",
+	[CXI_TC_BEST_EFFORT]            = "best_effort",
+	[CXI_ETH_SHARED]		= "ethernet_shared",
+	[CXI_ETH_TC1]			= "ethernet1",
+	[CXI_ETH_TC2]			= "ethernet2",
+};
+
+static const char * const cxi_tc_strs_uc[] = {
+	[CXI_TC_DEDICATED_ACCESS]	= "DEDICATED_ACCESS",
+	[CXI_TC_LOW_LATENCY]            = "LOW_LATENCY",
+	[CXI_TC_BULK_DATA]              = "BULK_DATA",
+	[CXI_TC_BEST_EFFORT]            = "BEST_EFFORT",
+	[CXI_ETH_SHARED]		= "ETHERNET_SHARED",
+	[CXI_ETH_TC1]			= "ETHERNET1",
+	[CXI_ETH_TC2]			= "ETHERNET2",
+};
+
+static int cxi_get_tc_req_pcp_vf(struct cxi_dev *cdev, unsigned int tc)
+{
+	struct cxi_eth_tc_req_pcp_get_cmd cmd = {
+		.op = CXI_OP_ETH_TC_REQ_PCP_GET,
+		.tc = tc,
+	};
+	struct cxi_get_tc_req_pcp_resp resp = {};
+	size_t resp_len = sizeof(resp);
+	int rc;
+
+	rc = cxi_send_msg_to_pf(cdev, &cmd, sizeof(cmd), &resp, &resp_len);
+	if (rc)
+		return rc;
+
+	return resp.req_pcp;
+}
+
+/**
+ * cxi_get_tc_req_pcp() - Get the request PCP associated with a TC.
+ * If the TC is not enabled return -1.
+ *
+ * @dev: CXI device
+ * @tc: Traffic Class
+ */
+int cxi_get_tc_req_pcp(struct cxi_dev *dev, unsigned int tc)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	if (!dev->is_physfn)
+		return cxi_get_tc_req_pcp_vf(dev, tc);
+
+	if (tc >= CXI_ETH_TC_MAX)
+		return -EINVAL;
+
+	if (!hw->qos.tcs_active[tc])
+		return -1;
+
+	if (is_eth_tc(tc))
+		return hw->qos.tcs[tc].eth_settings.pcp;
+	else
+		return hw->qos.tcs[tc].dscp_pcp_settings.req_pcp;
+}
+EXPORT_SYMBOL(cxi_get_tc_req_pcp);
+
+static int cass_tc_get_oxe_bc(struct cass_dev *hw)
+{
+	int bc = hw->next_oxe_bc;
+
+	if (bc >= C_OXE_CFG_BUF_BC_PARAM_ENTRIES)
+		return -ENOSPC;
+
+	hw->next_oxe_bc++;
+
+	return bc;
+}
+
+static int cass_tc_req_oxe_bc_cfg(struct cass_dev *hw, unsigned int spt_rsvd,
+				  unsigned int smt_rsvd, unsigned int sct_rsvd,
+				  unsigned int srb_rsvd, unsigned int pbuf_rsvd)
+{
+	const union c_oxe_cfg_pct_bc_cdt pct_bc_cdt_cfg = {
+		.spt_cdt_rsvd = hw->reduced_pct_tables ? 8 : spt_rsvd,
+		.smt_cdt_rsvd = hw->reduced_pct_tables ? 8 : smt_rsvd,
+		.sct_cdt_rsvd = hw->reduced_pct_tables ? 8 : sct_rsvd,
+		.srb_cdt_rsvd = hw->reduced_pct_tables ? 8 : srb_rsvd,
+	};
+	const union c_oxe_cfg_buf_bc_param buf_bc_param_cfg = {
+		.bc_reserv_buf_cdt = pbuf_rsvd,
+		.bc_max_mtu = DIV_ROUND_UP(PORTALS_MAX_FRAME_SIZE, 256),
+	};
+	int bc;
+
+	bc = cass_tc_get_oxe_bc(hw);
+	if (bc < 0)
+		goto out;
+
+	cass_write(hw, C_OXE_CFG_PCT_BC_CDT(bc), &pct_bc_cdt_cfg,
+		   sizeof(pct_bc_cdt_cfg));
+	cass_write(hw, C_OXE_CFG_BUF_BC_PARAM(bc), &buf_bc_param_cfg,
+		   sizeof(buf_bc_param_cfg));
+
+	if (hw->reduced_pct_tables) {
+		static const union c_oxe_cfg_pct_cdt oxe_cfg_pct_cdt = {
+			.spt_cdt_limit = 208,
+			.smt_cdt_limit = 112,
+			.srb_cdt_limit = 336,
+			.sct_cdt_limit = 112,
+		};
+
+		cass_write(hw, C_OXE_CFG_PCT_CDT, &oxe_cfg_pct_cdt,
+			   sizeof(oxe_cfg_pct_cdt));
+	}
+
+out:
+	return bc;
+}
+
+static int cass_tc_rsp_oxe_bc_cfg(struct cass_dev *hw, unsigned int pbuf_rsvd)
+{
+	const union c_oxe_cfg_pct_bc_cdt pct_bc_cdt_cfg = {
+		.ignore_spt = 1,
+		.ignore_smt = 1,
+		.ignore_sct = 1,
+		.ignore_srb = 1,
+	};
+	const union c_oxe_cfg_buf_bc_param buf_bc_param_cfg = {
+		.bc_reserv_buf_cdt = pbuf_rsvd,
+		.bc_max_mtu = DIV_ROUND_UP(PORTALS_MAX_FRAME_SIZE, 256),
+	};
+	int bc;
+
+	bc = cass_tc_get_oxe_bc(hw);
+	if (bc < 0)
+		goto out;
+
+	cass_write(hw, C_OXE_CFG_PCT_BC_CDT(bc), &pct_bc_cdt_cfg,
+		   sizeof(pct_bc_cdt_cfg));
+	cass_write(hw, C_OXE_CFG_BUF_BC_PARAM(bc), &buf_bc_param_cfg,
+		   sizeof(buf_bc_param_cfg));
+
+out:
+	return bc;
+}
+
+static int cass_tc_eth_oxe_bc_cfg(struct cass_dev *hw, unsigned int spt_rsvd,
+				  unsigned int pbuf_rsvd)
+{
+	const union c_oxe_cfg_pct_bc_cdt pct_bc_cdt_cfg = {
+		.spt_cdt_rsvd = spt_rsvd,
+		.ignore_smt = 1,
+		.ignore_sct = 1,
+		.ignore_srb = 1,
+	};
+	const union c_oxe_cfg_buf_bc_param buf_bc_param_cfg = {
+		.bc_reserv_buf_cdt = pbuf_rsvd,
+		.bc_max_mtu = DIV_ROUND_UP(ETHERNET_MAX_FRAME_SIZE, 256),
+	};
+	int bc;
+
+	bc = cass_tc_get_oxe_bc(hw);
+	if (bc < 0)
+		goto out;
+
+	cass_write(hw, C_OXE_CFG_PCT_BC_CDT(bc), &pct_bc_cdt_cfg,
+		   sizeof(pct_bc_cdt_cfg));
+	cass_write(hw, C_OXE_CFG_BUF_BC_PARAM(bc), &buf_bc_param_cfg,
+		   sizeof(buf_bc_param_cfg));
+
+out:
+	return bc;
+}
+
+static int cass_tc_get_branch_bucket(struct cass_dev *hw)
+{
+	int bucket = hw->next_oxe_branch_bucket;
+
+	if (bucket >= C_OXE_CFG_ARB_BRANCH_ENTRIES)
+		return -ENOSPC;
+
+	hw->next_oxe_branch_bucket++;
+
+	return bucket;
+}
+
+static int cass_tc_get_leaf_bucket(struct cass_dev *hw)
+{
+	int bucket = hw->next_oxe_leaf_bucket;
+
+	if (bucket >= C_OXE_CFG_ARB_LEAF_ENTRIES)
+		return -ENOSPC;
+
+	hw->next_oxe_leaf_bucket++;
+
+	return bucket;
+}
+
+static int cass_tc_oxe_mcu_cfg(struct cass_dev *hw, unsigned int mcu_base,
+			       unsigned int mcu_count, unsigned int pcp,
+			       unsigned int tsc, unsigned int bc,
+			       unsigned int mfs_index)
+{
+	const union c_oxe_cfg_mcu_param mcu_cfg = {
+		.bc_map = bc,
+		.tsc_map = tsc,
+		.pcp_map = pcp,
+		.wdrr_in_sel = mfs_index,
+		.wdrr_out_sel = mfs_index,
+	};
+	int i;
+
+	if (mcu_base >= C_OXE_MCU_COUNT ||
+	    (mcu_base + mcu_count) >  C_OXE_MCU_COUNT)
+		return -EINVAL;
+
+	for (i = 0; i < mcu_count; i++)
+		cass_write(hw, C_OXE_CFG_MCU_PARAM(mcu_base + i), &mcu_cfg,
+			   sizeof(mcu_cfg));
+
+	return 0;
+}
+
+static int cass_tc_oxe_pcp_pause_cfg(struct cass_dev *hw, unsigned int pcp,
+				     unsigned int tsc)
+{
+	union c_oxe_cfg_arb_pcp_mask pcp_mask;
+
+	if (pcp >= C_OXE_CFG_ARB_PCP_MASK_ENTRIES)
+		return -EINVAL;
+
+	cass_read(hw, C_OXE_CFG_ARB_PCP_MASK(pcp), &pcp_mask, sizeof(pcp_mask));
+
+	pcp_mask.tsc_mask |= BIT(tsc);
+
+	cass_write(hw, C_OXE_CFG_ARB_PCP_MASK(pcp), &pcp_mask,
+		   sizeof(pcp_mask));
+
+	return 0;
+}
+
+static void cass_tc_oxe_branch_bucket_cfg(struct cass_dev *hw,
+					  int tc)
+{
+	const struct cass_tc_oxe_settings *oxe_settings =
+		&hw->qos.tcs[tc].oxe_settings;
+	int assured_fill_qty =
+		max_t(int, 1, hw->tsc_fill_qty * oxe_settings->assured_percent / 100);
+	int ceiling_fill_qty =
+		max_t(int, 1, hw->tsc_fill_qty * oxe_settings->ceiling_percent / 100);
+	int branch = hw->qos.tcs[tc].branch;
+	const union c_oxe_cfg_arb_branch branch_cfg = {
+		.pri = oxe_settings->branch_priority,
+		.mfs_in_sel = oxe_settings->mfs_index,
+		.mfs_out_sel = oxe_settings->mfs_index,
+	};
+	const union c_oxe_cfg_arb_branch_out_a branch_out_a_cfg = {
+		.fill_qty = assured_fill_qty,
+		.limit = oxe_settings->bucket_limit,
+	};
+	const union c_oxe_cfg_arb_branch_out_c branch_out_c_cfg = {
+		.fill_qty = ceiling_fill_qty,
+		.limit = oxe_settings->bucket_limit,
+		.enable = 1,
+	};
+	const union c_oxe_cfg_arb_branch_in_a branch_in_a_cfg = {
+		.fill_qty = assured_fill_qty,
+		.limit = oxe_settings->bucket_limit,
+	};
+	const union c_oxe_cfg_arb_branch_in_c branch_in_c_cfg = {
+		.fill_qty = ceiling_fill_qty,
+		.limit = oxe_settings->bucket_limit,
+		.enable = 1,
+	};
+
+	if (branch >= C_OXE_CFG_ARB_BRANCH_ENTRIES)
+		return;
+
+	cass_write(hw, C_OXE_CFG_ARB_BRANCH(branch), &branch_cfg,
+		   sizeof(branch_cfg));
+	cass_write(hw, C_OXE_CFG_ARB_BRANCH_OUT_A(branch), &branch_out_a_cfg,
+		   sizeof(branch_out_a_cfg));
+	cass_write(hw, C_OXE_CFG_ARB_BRANCH_OUT_C(branch), &branch_out_c_cfg,
+		   sizeof(branch_out_c_cfg));
+	cass_write(hw, C_OXE_CFG_ARB_BRANCH_IN_A(branch), &branch_in_a_cfg,
+		   sizeof(branch_in_a_cfg));
+	cass_write(hw, C_OXE_CFG_ARB_BRANCH_IN_C(branch), &branch_in_c_cfg,
+		   sizeof(branch_in_c_cfg));
+}
+
+static void cass_tc_oxe_leaf_bucket_cfg(struct cass_dev *hw,
+					int tc, int leaf, bool req)
+{
+	const struct cass_tc_oxe_settings *oxe_settings =
+		&hw->qos.tcs[tc].oxe_settings;
+	bool is_ethernet = is_eth_tc(tc);
+	int assured_fill_qty = is_ethernet ?
+		max_t(int, 1, hw->tsc_fill_qty * oxe_settings->assured_percent / 100) :
+		1;
+	int ceiling_fill_qty = is_ethernet ?
+		max_t(int, 1, hw->tsc_fill_qty * oxe_settings->ceiling_percent / 100) :
+		hw->tsc_fill_qty;
+	unsigned int priority = req ? oxe_settings->leaf_request_priority :
+				oxe_settings->leaf_response_priority;
+	const union c_oxe_cfg_arb_leaf leaf_cfg = {
+		.pri = priority,
+		.parent = hw->qos.tcs[tc].branch,
+		.enable_in = !is_ethernet,
+		.mfs_in_sel = oxe_settings->mfs_index,
+		.mfs_out_sel = oxe_settings->mfs_index,
+	};
+	const union c_oxe_cfg_arb_leaf_out_a leaf_out_a_cfg = {
+		.fill_qty = assured_fill_qty,
+		.limit = oxe_settings->bucket_limit,
+	};
+	const union c_oxe_cfg_arb_leaf_out_c leaf_out_c_cfg = {
+		.fill_qty = ceiling_fill_qty,
+		.limit = oxe_settings->bucket_limit,
+		.enable = 1,
+	};
+	const union c_oxe_cfg_arb_leaf_in_a leaf_in_a_cfg = {
+		.fill_qty = assured_fill_qty,
+		.limit = oxe_settings->bucket_limit,
+	};
+	const union c_oxe_cfg_arb_leaf_in_c leaf_in_c_cfg = {
+		.fill_qty = ceiling_fill_qty,
+		.limit = oxe_settings->bucket_limit,
+		.enable = 1,
+	};
+
+	cass_write(hw, C_OXE_CFG_ARB_LEAF(leaf), &leaf_cfg, sizeof(leaf_cfg));
+	cass_write(hw, C_OXE_CFG_ARB_LEAF_OUT_A(leaf), &leaf_out_a_cfg,
+		   sizeof(leaf_out_a_cfg));
+	cass_write(hw, C_OXE_CFG_ARB_LEAF_OUT_C(leaf), &leaf_out_c_cfg,
+		   sizeof(leaf_out_c_cfg));
+	cass_write(hw, C_OXE_CFG_ARB_LEAF_IN_A(leaf), &leaf_in_a_cfg,
+		   sizeof(leaf_in_a_cfg));
+	cass_write(hw, C_OXE_CFG_ARB_LEAF_IN_C(leaf), &leaf_in_c_cfg,
+		   sizeof(leaf_in_c_cfg));
+}
+
+/* Configure OXE for RDMA classes */
+static int cass_tc_oxe_cfg(struct cass_dev *hw, enum cxi_traffic_class tc,
+			   unsigned int req_pcp, unsigned int rsp_pcp,
+			   unsigned int cq_mcu_base,
+			   unsigned int cq_mcu_count,
+			   unsigned int lpe_mcu_base,
+			   unsigned int lpe_mcu_count,
+			   unsigned int ixe_mcu_base,
+			   unsigned int ixe_mcu_count,
+			   unsigned int tou_mcu)
+{
+	const struct cass_tc_oxe_settings *oxe_settings =
+		&hw->qos.tcs[tc].oxe_settings;
+	int req_bc;
+	int rsp_bc;
+	int branch_bucket;
+	int req_leaf_bucket;
+	int rsp_leaf_bucket;
+	int ret;
+	int spt_rsvd = oxe_settings->spt_rsvd;
+
+	/* If PCT control traffic needs to be remapped to a different traffic
+	 * class, reuse the response PCP of the remapped traffic class.
+	 */
+	int mcu_pcp = hw->qos.pct_control_pcp;
+
+	/* Calculate SPT reserved back on number of MCUs and ordered packets
+	 * inflight. Only 3 MCUs worth of SPT entries are currently supported
+	 * being reserved.
+	 */
+	if (!spt_rsvd) {
+		spt_rsvd = min_t(int, 3, cq_mcu_count);
+		if (cass_version(hw, CASSINI_2))
+			spt_rsvd *= CASS2_MAX_PACKETS_INFLIGHT;
+		else
+			spt_rsvd *= CASS1_MAX_PACKETS_INFLIGHT;
+	}
+
+	req_bc = cass_tc_req_oxe_bc_cfg(hw, spt_rsvd, oxe_settings->smt_rsvd,
+					oxe_settings->sct_rsvd,
+					oxe_settings->srb_rsvd,
+					oxe_settings->pbuf_rsvd);
+	if (req_bc < 0)
+		return req_bc;
+
+	hw->qos.tcs[tc].req_bc = req_bc;
+
+	rsp_bc = cass_tc_rsp_oxe_bc_cfg(hw, oxe_settings->pbuf_rsvd);
+	if (rsp_bc < 0)
+		return rsp_bc;
+
+	branch_bucket = cass_tc_get_branch_bucket(hw);
+	if (branch_bucket < 0)
+		return branch_bucket;
+
+	hw->qos.tcs[tc].branch = branch_bucket;
+	cass_tc_oxe_branch_bucket_cfg(hw, tc);
+
+	req_leaf_bucket = cass_tc_get_leaf_bucket(hw);
+	if (req_leaf_bucket < 0)
+		return req_leaf_bucket;
+	cass_tc_oxe_leaf_bucket_cfg(hw, tc, req_leaf_bucket, true);
+	hw->qos.tcs[tc].leaf[0] = req_leaf_bucket;
+
+	rsp_leaf_bucket = cass_tc_get_leaf_bucket(hw);
+	if (rsp_leaf_bucket < 0)
+		return rsp_leaf_bucket;
+	cass_tc_oxe_leaf_bucket_cfg(hw, tc, rsp_leaf_bucket, false);
+	hw->qos.tcs[tc].leaf[1] = rsp_leaf_bucket;
+
+	ret = cass_tc_oxe_mcu_cfg(hw, cq_mcu_base, cq_mcu_count, mcu_pcp,
+				  req_leaf_bucket, req_bc,
+				  oxe_settings->mfs_index);
+	if (ret)
+		return ret;
+
+	ret = cass_tc_oxe_mcu_cfg(hw, tou_mcu, 1, mcu_pcp, req_leaf_bucket,
+				  req_bc, oxe_settings->mfs_index);
+	if (ret)
+		return ret;
+
+	ret = cass_tc_oxe_mcu_cfg(hw, lpe_mcu_base, lpe_mcu_count, mcu_pcp,
+				  req_leaf_bucket, req_bc,
+				  oxe_settings->mfs_index);
+	if (ret)
+		return ret;
+
+	ret = cass_tc_oxe_mcu_cfg(hw, ixe_mcu_base, ixe_mcu_count, rsp_pcp,
+				  rsp_leaf_bucket, rsp_bc,
+				  oxe_settings->mfs_index);
+	if (ret)
+		return ret;
+
+	ret = cass_tc_oxe_pcp_pause_cfg(hw, req_pcp, req_leaf_bucket);
+	if (ret)
+		return ret;
+
+	ret = cass_tc_oxe_pcp_pause_cfg(hw, rsp_pcp, rsp_leaf_bucket);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int cass_tc_get_cq_tc(struct cass_dev *hw)
+{
+	int tc = hw->next_cq_tc;
+
+	if (tc >= C_CQ_CFG_FQ_RESRV_ENTRIES)
+		return -ENOSPC;
+
+	hw->next_cq_tc++;
+
+	return tc;
+}
+
+static void cass_tc_cq_pfq_cfg(struct cass_dev *hw, unsigned int cq_tc,
+			       unsigned int pfq, unsigned int high_thresh)
+{
+	const union c_cq_cfg_pfq_tc_map tc_map_cfg = {
+		.pfq_tc = cq_tc,
+	};
+	const union c_cq_cfg_pfq_thresh_table thresh_table_cfg = {
+		.high_thresh = high_thresh,
+	};
+
+	cass_write(hw, C_CQ_CFG_PFQ_TC_MAP(pfq), &tc_map_cfg,
+		   sizeof(tc_map_cfg));
+	cass_write(hw, C_CQ_CFG_PFQ_THRESH_TABLE(pfq), &thresh_table_cfg,
+		   sizeof(thresh_table_cfg));
+}
+
+static void cass_tc_cq_fq_cfg(struct cass_dev *hw, unsigned int cq_tc,
+			      unsigned int buf_rsvd)
+{
+	const union c_cq_cfg_fq_resrv fq_resrv_cfg = {
+		.num_reserved = buf_rsvd,
+		.max_alloc = 256,
+	};
+
+	cass_write(hw, C_CQ_CFG_FQ_RESRV(cq_tc), &fq_resrv_cfg,
+		   sizeof(fq_resrv_cfg));
+};
+
+static int cass_tc_get_ocuset(struct cass_dev *hw, unsigned int fq_count)
+{
+	int ocuset = hw->next_cq_ocuset;
+
+	if (hw->next_cq_ocuset >= C_CQ_CFG_OCUSET_OCU_TABLE_ENTRIES ||
+	    (hw->next_cq_ocuset + fq_count) >
+	     C_CQ_CFG_OCUSET_OCU_TABLE_ENTRIES)
+		return -EINVAL;
+
+	hw->next_cq_ocuset += fq_count;
+
+	return ocuset;
+}
+
+static int cass_tc_get_ocu(struct cass_dev *hw, unsigned int ocu_count)
+{
+	int ocu = hw->next_cq_ocu;
+
+	if (hw->next_cq_ocu >= C_CQ_CFG_OCU_TABLE_ENTRIES ||
+	    (hw->next_cq_ocu + ocu_count) > C_CQ_CFG_OCU_TABLE_ENTRIES)
+		return -EINVAL;
+
+	hw->next_cq_ocu += ocu_count;
+
+	return ocu;
+}
+
+static int cass_tc_cq_dynamic_ocuset_cfg(struct cass_dev *hw,
+					 unsigned int ocu_base,
+					 unsigned int ocu_count,
+					 unsigned int fq_count)
+{
+	const union c_cq_cfg_ocuset_ocu_table ocu_table_cfg = {
+		.ocu_base = ocu_base,
+		.ocu_count = ilog2(ocu_count),
+	};
+	const union c_cq_cfg_ocuset_fq_table fq_table_cfg = {
+		.fq_count = min_t(unsigned int, fq_count, 8),
+	};
+	int ocuset;
+
+	ocuset = cass_tc_get_ocuset(hw, fq_table_cfg.fq_count);
+	if (ocuset < 0)
+		return ocuset;
+
+	cass_write(hw, C_CQ_CFG_OCUSET_OCU_TABLE(ocuset), &ocu_table_cfg,
+		   sizeof(ocu_table_cfg));
+	cass_write(hw, C_CQ_CFG_OCUSET_FQ_TABLE(ocuset), &fq_table_cfg,
+		   sizeof(fq_table_cfg));
+
+	return ocuset;
+}
+
+static int cass_tc_cq_static_ocuset_cfg(struct cass_dev *hw,
+					unsigned int ocu_base,
+					unsigned int ocu_count,
+					unsigned int fq_count)
+{
+	const union c_cq_cfg_ocuset_ocu_table ocu_table_cfg = {
+		.ocu_base = ocu_base,
+		.ocu_count = ilog2(ocu_count),
+		.ocu_static = 1,
+	};
+	union c_cq_cfg_ocu_table ocu_cfg = {};
+	int ocuset;
+	int ocu;
+
+	ocuset = cass_tc_get_ocuset(hw, fq_count);
+	if (ocuset < 0)
+		return ocuset;
+
+	cass_write(hw, C_CQ_CFG_OCUSET_OCU_TABLE(ocuset), &ocu_table_cfg,
+		   sizeof(ocu_table_cfg));
+
+	for (ocu = ocu_base; ocu < (ocu_base + ocu_count); ocu++) {
+		ocu_cfg.fq = ocuset + (ocu % fq_count);
+
+		cass_write(hw, C_CQ_CFG_OCU_TABLE(ocu), &ocu_cfg,
+			   sizeof(ocu_cfg));
+	}
+
+	return ocuset;
+}
+
+static int cass_tc_cq_cfg(struct cass_dev *hw, enum cxi_traffic_class tc,
+			  unsigned int *cq_mcu_base,
+			  unsigned int *cq_mcu_count,
+			  unsigned int *cq_tc, bool is_static)
+{
+	const struct cass_tc_cq_settings *cq_settings =
+		&hw->qos.tcs[tc].cq_settings;
+	unsigned int fq_count;
+	unsigned int ocu_count;
+	int ocu_base;
+	int tc_cq;
+	int ocuset;
+
+	fq_count = is_static ? cq_settings->static_fq_count :
+		cq_settings->dynamic_fq_count;
+	if (!fq_count)
+		return -EINVAL;
+
+	ocu_count = is_static ? fq_count : fq_count * 4;
+
+	ocu_base = cass_tc_get_ocu(hw, ocu_count);
+	if (ocu_base < 0)
+		return ocu_base;
+
+	tc_cq = cass_tc_get_cq_tc(hw);
+	if (tc_cq < 0)
+		return tc_cq;
+
+	if (is_static)
+		ocuset = cass_tc_cq_static_ocuset_cfg(hw, ocu_base, ocu_count,
+						      fq_count);
+	else
+		ocuset = cass_tc_cq_dynamic_ocuset_cfg(hw, ocu_base, ocu_count,
+						       fq_count);
+	if (ocuset < 0)
+		return ocuset;
+
+	cass_tc_cq_pfq_cfg(hw, tc_cq, ocuset, cq_settings->pfq_high_thresh);
+	cass_tc_cq_fq_cfg(hw, tc_cq, cq_settings->fq_buf_reserved);
+
+	*cq_mcu_base = ocuset + C_OXE_CQ_MCU_START;
+	*cq_mcu_count = fq_count;
+	*cq_tc = tc_cq;
+
+	return ocuset;
+}
+
+static void cass_tc_get_ixe_wrq(struct cass_dev *hw,
+				unsigned int *wrq_base, unsigned int *wrq_mask)
+{
+	*wrq_base = hw->next_ixe_wrq;
+	*wrq_mask = 3;
+
+	hw->next_ixe_wrq += 4;
+	if (hw->next_ixe_wrq >= 32)
+		hw->next_ixe_wrq = 0;
+}
+
+static void cass_tc_ixe_dscp_pcp_map(struct cass_dev *hw, unsigned int dscp,
+				     unsigned int pcp, unsigned int rsp_dscp)
+{
+	union c_ixe_cfg_dscp_wrq_map wrq_map_cfg;
+	union c_ixe_cfg_dscp_dscp_tc_map tc_map_cfg;
+	unsigned int wrq_base;
+	unsigned int wrq_mask;
+	unsigned int index = dscp / C_IXE_CFG_DSCP_DSCP_TC_MAP_ARRAY_SIZE;
+	unsigned int offset = dscp % C_IXE_CFG_DSCP_DSCP_TC_MAP_ARRAY_SIZE;
+
+	cass_tc_get_ixe_wrq(hw, &wrq_base, &wrq_mask);
+
+	cass_read(hw, C_IXE_CFG_DSCP_WRQ_MAP(dscp), &wrq_map_cfg,
+		  sizeof(wrq_map_cfg));
+
+	wrq_map_cfg.base = wrq_base;
+	wrq_map_cfg.hash_mask = wrq_mask;
+
+	cass_write(hw, C_IXE_CFG_DSCP_WRQ_MAP(dscp), &wrq_map_cfg,
+		   sizeof(wrq_map_cfg));
+
+	cass_read(hw, C_IXE_CFG_DSCP_DSCP_TC_MAP(index), &tc_map_cfg,
+		  sizeof(tc_map_cfg));
+
+	tc_map_cfg.map[offset].dscp = rsp_dscp;
+	tc_map_cfg.map[offset].tc = pcp;
+
+	cass_write(hw, C_IXE_CFG_DSCP_DSCP_TC_MAP(index), &tc_map_cfg,
+		   sizeof(tc_map_cfg));
+}
+
+static int cass_tc_get_ixe_fq(struct cass_dev *hw, unsigned int fq_count)
+{
+	int fq = hw->next_ixe_fq;
+
+	if (hw->next_ixe_fq >= 24 ||
+	    (hw->next_ixe_fq + fq_count) > 24)
+		return -EINVAL;
+
+	hw->next_ixe_fq += fq_count;
+
+	return fq;
+}
+
+static int cass_tc_ixe_fq_cfg(struct cass_dev *hw, enum cxi_traffic_class tc,
+			      unsigned int req_pcp, unsigned int *ixe_mcu_base,
+			      unsigned int *ixe_mcu_count)
+{
+	const struct cass_tc_ixe_settings *ixe_settings =
+		&hw->qos.tcs[tc].ixe_settings;
+	union c_ixe_cfg_tc_fq_map fq_map_cfg = {};
+	union c_ixe_cfg_mp_tc_fq_map mp_fq_map_cfg = {};
+	unsigned int i;
+	int fq_base;
+
+	fq_base = cass_tc_get_ixe_fq(hw, ixe_settings->fq_count);
+	if (fq_base < 0)
+		return fq_base;
+
+	for (i = 0; i < ixe_settings->fq_count; i++)
+		fq_map_cfg.put_resp_mask |= BIT(fq_base + i);
+	fq_map_cfg.get_req_mask = fq_map_cfg.put_resp_mask;
+
+	cass_write(hw, C_IXE_CFG_TC_FQ_MAP(req_pcp), &fq_map_cfg,
+		   sizeof(fq_map_cfg));
+
+	mp_fq_map_cfg.base = fq_base;
+	mp_fq_map_cfg.num_fqs_mask =
+		min_t(unsigned int, 4,
+		      rounddown_pow_of_two(ixe_settings->fq_count)) - 1;
+
+	cass_write(hw, C_IXE_CFG_MP_TC_FQ_MAP(req_pcp), &mp_fq_map_cfg,
+		   sizeof(mp_fq_map_cfg));
+
+	*ixe_mcu_base = fq_base + C_OXE_IXE_MCU_START;
+	*ixe_mcu_count = ixe_settings->fq_count;
+
+	return 0;
+}
+
+static int cass_tc_get_lpe_fq(struct cass_dev *hw, unsigned int fq_count)
+{
+	int fq = hw->next_lpe_fq;
+
+	if (hw->next_lpe_fq >= 16 ||
+	    (hw->next_lpe_fq + fq_count) > 16)
+		return -EINVAL;
+
+	hw->next_lpe_fq += fq_count;
+
+	return fq;
+}
+
+static int cass_tc_lpe_fq_cfg(struct cass_dev *hw, unsigned int req_pcp,
+			      unsigned int fq_count)
+{
+	union c_lpe_cfg_fq_tc_map fq_tc_map_cfg;
+	int fq_base;
+
+	fq_base = cass_tc_get_lpe_fq(hw, fq_count);
+	if (fq_base < 0)
+		return fq_base;
+
+	cass_read(hw, C_LPE_CFG_FQ_TC_MAP, &fq_tc_map_cfg,
+		  sizeof(fq_tc_map_cfg));
+
+	fq_tc_map_cfg.tc[req_pcp].fq_base = fq_base;
+	fq_tc_map_cfg.tc[req_pcp].fq_mask =
+		min_t(unsigned int, 8, rounddown_pow_of_two(fq_count)) - 1;
+
+	cass_write(hw, C_LPE_CFG_FQ_TC_MAP, &fq_tc_map_cfg,
+		   sizeof(fq_tc_map_cfg));
+
+	return fq_base;
+}
+
+static int cass_tc_lpe_cfg(struct cass_dev *hw, enum cxi_traffic_class tc,
+			   unsigned int req_pcp, unsigned int *lpe_mcu_base,
+			   unsigned int *lpe_mcu_count)
+{
+	const struct cass_tc_lpe_settings *lpe_settings =
+		&hw->qos.tcs[tc].lpe_settings;
+	int fq_base;
+
+	fq_base = cass_tc_lpe_fq_cfg(hw, req_pcp, lpe_settings->fq_count);
+	if (fq_base < 0)
+		return fq_base;
+
+	*lpe_mcu_base = fq_base + C_OXE_LPE_MCU_START;
+	*lpe_mcu_count = lpe_settings->fq_count;
+
+	return 0;
+}
+
+static void cass_tc_pct_pcp_cfg(struct cass_dev *hw, unsigned int req_pcp,
+				unsigned int trs_rsvd, unsigned int trs_max,
+				unsigned int tct_rsvd, unsigned int tct_max,
+				unsigned int mst_rsvd, unsigned int mst_max)
+{
+	const union c_pct_cfg_mst_tc_ded_limit mst_ded_limit_cfg = {
+		.ded_limit = mst_rsvd,
+	};
+	const union c_pct_cfg_mst_tc_max_limit mst_max_limit_cfg = {
+		.max_limit = mst_max,
+	};
+	const union c_pct_cfg_tct_tc_ded_limit tct_ded_limit_cfg = {
+		.ded_limit = tct_rsvd,
+	};
+	const union c_pct_cfg_tct_tc_max_limit tct_max_limit_cfg = {
+		.max_limit = tct_max,
+	};
+
+	if (cass_version(hw, CASSINI_1)) {
+		const union c1_pct_cfg_trs_tc_ded_limit trs_ded_limit_cfg = {
+			.ded_limit = trs_rsvd,
+		};
+		const union c1_pct_cfg_trs_tc_max_limit trs_max_limit_cfg = {
+			.max_limit = trs_max,
+		};
+
+		cass_write(hw, C1_PCT_CFG_TRS_TC_DED_LIMIT(req_pcp),
+			   &trs_ded_limit_cfg, sizeof(trs_ded_limit_cfg));
+		cass_write(hw, C1_PCT_CFG_TRS_TC_MAX_LIMIT(req_pcp),
+			   &trs_max_limit_cfg, sizeof(trs_max_limit_cfg));
+	} else {
+		const union c2_pct_cfg_trs_tc_ded_limit trs_ded_limit_cfg = {
+			.ded_limit = trs_rsvd,
+		};
+		const union c2_pct_cfg_trs_tc_max_limit trs_max_limit_cfg = {
+			.max_limit = trs_max,
+		};
+
+		cass_write(hw, C2_PCT_CFG_TRS_TC_DED_LIMIT(req_pcp),
+			   &trs_ded_limit_cfg, sizeof(trs_ded_limit_cfg));
+		cass_write(hw, C2_PCT_CFG_TRS_TC_MAX_LIMIT(req_pcp),
+			   &trs_max_limit_cfg, sizeof(trs_max_limit_cfg));
+	}
+
+	cass_write(hw, C_PCT_CFG_MST_TC_DED_LIMIT(req_pcp), &mst_ded_limit_cfg,
+		   sizeof(mst_ded_limit_cfg));
+	cass_write(hw, C_PCT_CFG_MST_TC_MAX_LIMIT(req_pcp), &mst_max_limit_cfg,
+		   sizeof(mst_max_limit_cfg));
+	cass_write(hw, C_PCT_CFG_TCT_TC_DED_LIMIT(req_pcp), &tct_ded_limit_cfg,
+		   sizeof(tct_ded_limit_cfg));
+	cass_write(hw, C_PCT_CFG_TCT_TC_MAX_LIMIT(req_pcp), &tct_max_limit_cfg,
+		   sizeof(tct_max_limit_cfg));
+}
+
+static void cass_tc_pct_dscp_pcp_map(struct cass_dev *hw, unsigned int req_pcp,
+				     unsigned int rsp_pcp,
+				     unsigned int req_dscp,
+				     unsigned int rsp_dscp)
+{
+	union c_pct_cfg_req_tc_rsp_tc_map req_tc_rsp_tc_map;
+	union c_pct_cfg_req_dscp_rsp_dscp_map req_dscp_rsp_dscp_map;
+	union c_pct_cfg_rsp_dscp_req_tc_map rsp_dscp_req_tc_map;
+	int req_dscp_index = req_dscp / 8;
+	int req_dscp_offset = req_dscp % 8;
+	int rsp_dscp_index = rsp_dscp / 16;
+
+	cass_read(hw, C_PCT_CFG_REQ_TC_RSP_TC_MAP, &req_tc_rsp_tc_map,
+		  sizeof(req_tc_rsp_tc_map));
+
+	/* Map the provided req_pcp to the provided rsp_pcp */
+	switch (req_pcp) {
+	case 0:
+		req_tc_rsp_tc_map.req_tc0 = rsp_pcp;
+		break;
+	case 1:
+		req_tc_rsp_tc_map.req_tc1 = rsp_pcp;
+		break;
+	case 2:
+		req_tc_rsp_tc_map.req_tc2 = rsp_pcp;
+		break;
+	case 3:
+		req_tc_rsp_tc_map.req_tc3 = rsp_pcp;
+		break;
+	case 4:
+		req_tc_rsp_tc_map.req_tc4 = rsp_pcp;
+		break;
+	case 5:
+		req_tc_rsp_tc_map.req_tc5 = rsp_pcp;
+		break;
+	case 6:
+		req_tc_rsp_tc_map.req_tc6 = rsp_pcp;
+		break;
+	default:
+		req_tc_rsp_tc_map.req_tc7 = rsp_pcp;
+		break;
+	}
+
+	cass_write(hw, C_PCT_CFG_REQ_TC_RSP_TC_MAP, &req_tc_rsp_tc_map,
+		   sizeof(req_tc_rsp_tc_map));
+
+	cass_read(hw, C_PCT_CFG_REQ_DSCP_RSP_DSCP_MAP(req_dscp_index),
+		  &req_dscp_rsp_dscp_map, sizeof(req_dscp_rsp_dscp_map));
+
+	req_dscp_rsp_dscp_map.map[req_dscp_offset].rsp_dscp = rsp_dscp;
+
+	cass_write(hw, C_PCT_CFG_REQ_DSCP_RSP_DSCP_MAP(req_dscp_index),
+		   &req_dscp_rsp_dscp_map, sizeof(req_dscp_rsp_dscp_map));
+
+	cass_read(hw, C_PCT_CFG_RSP_DSCP_REQ_TC_MAP(rsp_dscp_index),
+		  &rsp_dscp_req_tc_map, sizeof(rsp_dscp_req_tc_map));
+
+	switch (rsp_dscp % 16) {
+	case 0:
+		rsp_dscp_req_tc_map.dscp0_tc = req_pcp;
+		break;
+	case 1:
+		rsp_dscp_req_tc_map.dscp1_tc = req_pcp;
+		break;
+	case 2:
+		rsp_dscp_req_tc_map.dscp2_tc = req_pcp;
+		break;
+	case 3:
+		rsp_dscp_req_tc_map.dscp3_tc = req_pcp;
+		break;
+	case 4:
+		rsp_dscp_req_tc_map.dscp4_tc = req_pcp;
+		break;
+	case 5:
+		rsp_dscp_req_tc_map.dscp5_tc = req_pcp;
+		break;
+	case 6:
+		rsp_dscp_req_tc_map.dscp6_tc = req_pcp;
+		break;
+	case 7:
+		rsp_dscp_req_tc_map.dscp7_tc = req_pcp;
+		break;
+	case 8:
+		rsp_dscp_req_tc_map.dscp8_tc = req_pcp;
+		break;
+	case 9:
+		rsp_dscp_req_tc_map.dscp9_tc = req_pcp;
+		break;
+	case 10:
+		rsp_dscp_req_tc_map.dscp10_tc = req_pcp;
+		break;
+	case 11:
+		rsp_dscp_req_tc_map.dscp11_tc = req_pcp;
+		break;
+	case 12:
+		rsp_dscp_req_tc_map.dscp12_tc = req_pcp;
+		break;
+	case 13:
+		rsp_dscp_req_tc_map.dscp13_tc = req_pcp;
+		break;
+	case 14:
+		rsp_dscp_req_tc_map.dscp14_tc = req_pcp;
+		break;
+	default:
+		rsp_dscp_req_tc_map.dscp15_tc = req_pcp;
+		break;
+	}
+
+	cass_write(hw, C_PCT_CFG_RSP_DSCP_REQ_TC_MAP(rsp_dscp_index),
+		   &rsp_dscp_req_tc_map, sizeof(rsp_dscp_req_tc_map));
+}
+
+static unsigned int cass_tc_get_pct_shared_trs_limit(struct cass_dev *hw)
+{
+	enum cxi_traffic_class tc;
+	int rsvd = 0;
+
+	for (tc = 0; tc < CXI_MAX_RDMA_TCS; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+		rsvd += hw->qos.tcs[tc].pct_settings.trs_rsvd;
+	}
+
+	if (cass_version(hw, CASSINI_1))
+		return max_t(unsigned int, C1_PCT_CFG_TRS_CAM_ENTRIES - rsvd, 0);
+	else
+		return max_t(unsigned int, C2_PCT_CFG_TRS_CAM_ENTRIES - rsvd, 0);
+}
+
+static unsigned int cass_tc_get_pct_shared_mst_limit(struct cass_dev *hw)
+{
+	enum cxi_traffic_class tc;
+	int rsvd = 0;
+
+	for (tc = 0; tc < CXI_MAX_RDMA_TCS; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+		rsvd += hw->qos.tcs[tc].pct_settings.mst_rsvd;
+	}
+
+	return max_t(unsigned int, C_MST_DBG_MST_TABLE_ENTRIES - rsvd, 0);
+}
+
+static unsigned int cass_tc_get_pct_shared_tct_limit(struct cass_dev *hw)
+{
+	enum cxi_traffic_class tc;
+	int rsvd = 0;
+
+	for (tc = 0; tc < CXI_MAX_RDMA_TCS; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+		rsvd += hw->qos.tcs[tc].pct_settings.tct_rsvd;
+	}
+
+	return max_t(unsigned int, C_PCT_CFG_TCT_RAM_ENTRIES - rsvd, 0);
+}
+
+static void cass_tc_pct_cfg(struct cass_dev *hw, enum cxi_traffic_class tc,
+			    unsigned int req_pcp)
+{
+	const struct cass_tc_pct_settings *pct_settings =
+		&hw->qos.tcs[tc].pct_settings;
+	unsigned int shared_trs_limit = cass_tc_get_pct_shared_trs_limit(hw);
+	unsigned int shared_mst_limit = cass_tc_get_pct_shared_mst_limit(hw);
+	unsigned int shared_tct_limit = cass_tc_get_pct_shared_tct_limit(hw);
+
+	if (hw->reduced_pct_tables) {
+		cass_tc_pct_pcp_cfg(hw, req_pcp, 8,
+				    8 + 64,
+				    8,
+				    8 + 32,
+				    8,
+				    8 + 64);
+	} else {
+		cass_tc_pct_pcp_cfg(hw, req_pcp, pct_settings->trs_rsvd,
+				    pct_settings->trs_rsvd + shared_trs_limit,
+				    pct_settings->tct_rsvd,
+				    pct_settings->tct_rsvd + shared_tct_limit,
+				    pct_settings->mst_rsvd,
+				    pct_settings->mst_rsvd + shared_mst_limit);
+	}
+}
+
+static void cass_tc_pct_global_cfg(struct cass_dev *hw)
+{
+	const union c_pct_cfg_mst_crdt_limits mst_crdt_limits = {
+		.total_limit = hw->reduced_pct_tables ?
+			128 : C_MST_DBG_MST_TABLE_ENTRIES,
+		.shared_limit = hw->reduced_pct_tables ?
+			64 : cass_tc_get_pct_shared_mst_limit(hw),
+	};
+	const union c_pct_cfg_tct_crdt_limits tct_crdt_limits = {
+		.total_limit = hw->reduced_pct_tables ?
+			96 : C_PCT_CFG_TCT_RAM_ENTRIES,
+		.shared_limit = hw->reduced_pct_tables ?
+			32 : cass_tc_get_pct_shared_tct_limit(hw),
+	};
+
+	if (cass_version(hw, CASSINI_1)) {
+		const union c1_pct_cfg_trs_crdt_limits trs_crdt_limits = {
+			.total_limit = C1_PCT_CFG_TRS_CAM_ENTRIES,
+			.shared_limit = cass_tc_get_pct_shared_trs_limit(hw),
+		};
+
+		cass_write(hw, C1_PCT_CFG_TRS_CRDT_LIMITS, &trs_crdt_limits,
+			   sizeof(trs_crdt_limits));
+	} else {
+		const union c2_pct_cfg_trs_crdt_limits trs_crdt_limits = {
+			.total_limit = hw->reduced_pct_tables ?
+				128 : C2_PCT_CFG_TRS_CAM_ENTRIES,
+			.shared_limit = hw->reduced_pct_tables ?
+				64 : cass_tc_get_pct_shared_trs_limit(hw),
+		};
+
+		cass_write(hw, C2_PCT_CFG_TRS_CRDT_LIMITS, &trs_crdt_limits,
+			   sizeof(trs_crdt_limits));
+	}
+
+	cass_write(hw, C_PCT_CFG_MST_CRDT_LIMITS, &mst_crdt_limits,
+		   sizeof(mst_crdt_limits));
+	cass_write(hw, C_PCT_CFG_TCT_CRDT_LIMITS, &tct_crdt_limits,
+		   sizeof(tct_crdt_limits));
+}
+
+#define PFC_BUF_UNITS 64U
+
+#define C1_ETHERNET_PAUSE_RESPONSE_TIME_BYTES (15 * 1024)
+#define C2_ETHERNET_PAUSE_RESPONSE_TIME_BYTES (57 * 1024)
+
+#define C1_MAX_CABLE_LENGTH_BYTES 2560
+#define C2_MAX_CABLE_LENGTH_BYTES (5 * 1024)
+
+#define C1_MAC_LATENCY_BYTES (4 * 1024)
+#define C2_MAC_LATENCY_BYTES (10 * 1024)
+
+#define MAX_PACKET_SIZE (9 * 1024)
+#define STORE_AND_FORWARD_FIFO (9 * 1024)
+
+#define C1_SKID_BUF_SIZE (64 * 1024)
+#define C2_SKID_BUF_SIZE (128 * 1024)
+
+static unsigned int cass_tc_get_pfc_high_water(const struct cass_dev *hw)
+{
+	unsigned int skid_space;
+	unsigned int skid_buf_size;
+
+	if (cass_version(hw, CASSINI_1)) {
+		skid_space = C1_ETHERNET_PAUSE_RESPONSE_TIME_BYTES +
+			C1_MAX_CABLE_LENGTH_BYTES + C1_MAC_LATENCY_BYTES +
+			(2 * MAX_PACKET_SIZE) + STORE_AND_FORWARD_FIFO;
+		skid_buf_size = C1_SKID_BUF_SIZE;
+	} else {
+		skid_space = C2_ETHERNET_PAUSE_RESPONSE_TIME_BYTES +
+			C2_MAX_CABLE_LENGTH_BYTES + C2_MAC_LATENCY_BYTES +
+			(2 * MAX_PACKET_SIZE) + STORE_AND_FORWARD_FIFO;
+		skid_buf_size = C2_SKID_BUF_SIZE;
+	}
+
+	/* NIC-to-NIC needs extra store and forward fifo space. */
+	if (!switch_connected)
+		skid_space += STORE_AND_FORWARD_FIFO;
+
+	/* Only use the user-defined PFC buffer skid space if the requested skid
+	 * space is at least the minimal value.
+	 */
+	if (pfc_buf_skid_space) {
+		if (pfc_buf_skid_space < skid_space)
+			pr_info_once("PFC buf skid space %u too small. Using default %u\n",
+				     pfc_buf_skid_space, skid_space);
+		else if (pfc_buf_skid_space > (skid_buf_size - PFC_BUF_UNITS))
+			pr_info_once("PFC buf skid space %u too large. Using default %u\n",
+				     pfc_buf_skid_space, skid_space);
+		else
+			skid_space = pfc_buf_skid_space;
+	}
+
+	return (skid_buf_size - skid_space) / PFC_BUF_UNITS;
+}
+
+#define HIGH_LOW_WATER_SKID_SPACE_DELTA 4096U
+
+static unsigned int cass_tc_get_pfc_low_water(const struct cass_dev *hw)
+{
+	return max_t(int,
+		     (int)cass_tc_get_pfc_high_water(hw) -
+		     (int)(HIGH_LOW_WATER_SKID_SPACE_DELTA / PFC_BUF_UNITS), 0);
+}
+
+static void cass_tc_hni_pcp_cfg(struct cass_dev *hw, unsigned int pcp,
+				unsigned int pbuf_rsvd,
+				unsigned int max_frame_size)
+{
+	union c_hni_cfg_pbuf cfg_pbuf_cfg;
+
+	/* Since PCP packet buffer space is shared between Portals and Ethernet
+	 * traffic and my be updated twice for Portals and Ethernet
+	 * configuration, always take the max configured value.
+	 */
+	cass_read(hw, C_HNI_CFG_PBUF(pcp), &cfg_pbuf_cfg,
+		  sizeof(cfg_pbuf_cfg));
+
+	cfg_pbuf_cfg.mtu = max_t(unsigned int, cfg_pbuf_cfg.mtu,
+				 DIV_ROUND_UP(max_frame_size, 128));
+	cfg_pbuf_cfg.static_rsvd =
+		max_t(unsigned int, cfg_pbuf_cfg.static_rsvd, pbuf_rsvd);
+
+	cass_write(hw, C_HNI_CFG_PBUF(pcp), &cfg_pbuf_cfg,
+		   sizeof(cfg_pbuf_cfg));
+
+	if (cass_version(hw, CASSINI_1)) {
+		const union c1_hni_cfg_pfc_buf pfc_buf_cfg = {
+			.high_water = cass_tc_get_pfc_high_water(hw),
+			.low_water = cass_tc_get_pfc_low_water(hw),
+		};
+
+		cass_write(hw, C1_HNI_CFG_PFC_BUF(pcp), &pfc_buf_cfg,
+			   sizeof(pfc_buf_cfg));
+	} else {
+		const union c2_hni_cfg_pfc_buf pfc_buf_cfg = {
+			.high_water = cass_tc_get_pfc_high_water(hw),
+			.low_water = cass_tc_get_pfc_low_water(hw),
+		};
+
+		cass_write(hw, C2_HNI_CFG_PFC_BUF(pcp), &pfc_buf_cfg,
+			   sizeof(pfc_buf_cfg));
+	}
+}
+
+static void cass_tc_hni_dscp_pcp_map(struct cass_dev *hw, unsigned int dscp,
+				     unsigned int pcp)
+{
+	const union c_hni_cfg_dscp_pcp dscp_pcp_cfg = {
+		.pcp = pcp,
+	};
+
+	cass_write(hw, C_HNI_CFG_DSCP_PCP(dscp), &dscp_pcp_cfg,
+		   sizeof(dscp_pcp_cfg));
+}
+
+static void cass_tc_enable_tx_pause(struct cass_dev *hw, unsigned int pcp)
+{
+	union c_hni_cfg_pause_tx_ctrl tx_ctrl_cfg;
+
+	cass_read(hw, C_HNI_CFG_PAUSE_TX_CTRL, &tx_ctrl_cfg, sizeof(tx_ctrl_cfg));
+
+	tx_ctrl_cfg.enable_send_pause |= BIT(pcp);
+	tx_ctrl_cfg.pev |= BIT(pcp);
+
+	cass_write(hw, C_HNI_CFG_PAUSE_TX_CTRL, &tx_ctrl_cfg, sizeof(tx_ctrl_cfg));
+}
+
+static void cass_tc_disable_tx_pause(struct cass_dev *hw, unsigned int pcp)
+{
+	union c_hni_cfg_pause_tx_ctrl tx_ctrl_cfg;
+
+	cass_read(hw, C_HNI_CFG_PAUSE_TX_CTRL, &tx_ctrl_cfg, sizeof(tx_ctrl_cfg));
+
+	tx_ctrl_cfg.enable_send_pause &= ~BIT(pcp);
+	tx_ctrl_cfg.pev &= ~BIT(pcp);
+
+	cass_write(hw, C_HNI_CFG_PAUSE_TX_CTRL, &tx_ctrl_cfg, sizeof(tx_ctrl_cfg));
+}
+
+static void cass_tc_enable_rx_pause(struct cass_dev *hw, unsigned int pcp)
+{
+	union c_hni_cfg_pause_rx_ctrl rx_ctrl_cfg;
+
+	cass_read(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl_cfg, sizeof(rx_ctrl_cfg));
+
+	if (pcp == hw->qos.pct_control_pcp) {
+		/* Never enable the receiving of PFC pause if the
+		 * response PCP of a given traffic class is to be used
+		 * for PCT control traffic.  Failure to do this
+		 * results in packet drops and performance issues.
+		 */
+		rx_ctrl_cfg.enable_rec_pause &= ~BIT(pcp);
+	} else {
+		rx_ctrl_cfg.enable_rec_pause |= BIT(pcp);
+	}
+
+	cass_write(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl_cfg, sizeof(rx_ctrl_cfg));
+}
+
+static void cass_tc_disable_rx_pause(struct cass_dev *hw, unsigned int pcp)
+{
+	union c_hni_cfg_pause_rx_ctrl rx_ctrl_cfg;
+
+	cass_read(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl_cfg,
+		  sizeof(rx_ctrl_cfg));
+
+	rx_ctrl_cfg.enable_rec_pause &= ~(1U << pcp);
+
+	cass_write(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl_cfg,
+		   sizeof(rx_ctrl_cfg));
+}
+
+static void cass_tc_enable_pauses(struct cass_dev *hw, unsigned int pcp)
+{
+	cass_tc_enable_tx_pause(hw, pcp);
+	cass_tc_enable_rx_pause(hw, pcp);
+}
+
+void cass_tc_set_tx_pause_all(struct cass_dev *hw, bool enable)
+{
+	int i;
+
+	for (i = 0; i < PCP_COUNT; i++) {
+		if (enable)
+			cass_tc_enable_tx_pause(hw, i);
+		else
+			cass_tc_disable_tx_pause(hw, i);
+	}
+}
+
+void cass_tc_set_rx_pause_all(struct cass_dev *hw, bool enable)
+{
+	int i;
+
+	for (i = 0; i < PCP_COUNT; i++) {
+		if (enable)
+			cass_tc_enable_rx_pause(hw, i);
+		else
+			cass_tc_disable_rx_pause(hw, i);
+	}
+}
+
+void cass_tc_get_hni_pause_cfg(struct cass_dev *hw)
+{
+	u32 pause_type;
+	bool tx_pause;
+	bool rx_pause;
+	union c_hni_cfg_pause_tx_ctrl tx_ctrl_cfg;
+	union c_hni_cfg_pause_rx_ctrl rx_ctrl_cfg;
+
+	cass_read(hw, C_HNI_CFG_PAUSE_TX_CTRL, &tx_ctrl_cfg,
+		  sizeof(tx_ctrl_cfg));
+
+	cass_read(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl_cfg,
+		  sizeof(rx_ctrl_cfg));
+
+	tx_pause = ((tx_ctrl_cfg.enable_pfc_pause && tx_ctrl_cfg.pev) ||
+		    tx_ctrl_cfg.enable_pause) && tx_ctrl_cfg.enable_send_pause;
+
+	rx_pause = (rx_ctrl_cfg.pfc_rec_enable ||
+		    rx_ctrl_cfg.pause_rec_enable) &&
+		   rx_ctrl_cfg.enable_rec_pause;
+
+	if (!tx_ctrl_cfg.enable_pfc_pause && !tx_ctrl_cfg.enable_pause &&
+	    !rx_ctrl_cfg.pfc_rec_enable && !rx_ctrl_cfg.pause_rec_enable)
+		pause_type = CASS_PAUSE_TYPE_NONE;
+	else if (!tx_ctrl_cfg.enable_pfc_pause && tx_ctrl_cfg.enable_pause &&
+		 !rx_ctrl_cfg.pfc_rec_enable && rx_ctrl_cfg.pause_rec_enable)
+		pause_type = CASS_PAUSE_TYPE_GLOBAL;
+	else if (tx_ctrl_cfg.enable_pfc_pause &&
+		 rx_ctrl_cfg.pfc_rec_enable && !rx_ctrl_cfg.pause_rec_enable)
+		pause_type = CASS_PAUSE_TYPE_PFC;
+	else
+		pause_type = CASS_PAUSE_TYPE_INVALID;
+
+	spin_lock(&hw->port->pause_lock);
+	hw->port->pause_type = pause_type;
+	hw->port->tx_pause = tx_pause;
+	hw->port->rx_pause = rx_pause;
+	spin_unlock(&hw->port->pause_lock);
+}
+
+static void cass_tc_hni_cfg(struct cass_dev *hw, enum cxi_traffic_class tc,
+			    unsigned int req_pcp, unsigned int rsp_pcp)
+{
+	const struct cass_tc_hni_settings *hni_settings =
+		&hw->qos.tcs[tc].hni_settings;
+
+	cass_tc_hni_pcp_cfg(hw, req_pcp, hni_settings->pbuf_rsvd,
+			    hni_settings->mfs);
+
+	/* Response PCP is ignored for Ethernet configuration. */
+	if (tc != CXI_TC_ETH)
+		cass_tc_hni_pcp_cfg(hw, rsp_pcp, hni_settings->pbuf_rsvd,
+				    hni_settings->mfs);
+
+	/* TODO: Support disabling pause and global pause. */
+	cass_tc_enable_pauses(hw, req_pcp);
+
+	if (tc != CXI_TC_ETH)
+		cass_tc_enable_pauses(hw, rsp_pcp);
+}
+
+#define C1_RESTRICTED_BC_SPT_RSVD 1500U
+#define RESTRICTED_BC_SMT_RSVD 0U
+#define RESTRICTED_BC_SCT_RSVD 0U
+#define RESTRICTED_BC_SRB_RSVD 39U
+#define RESTRICTED_BC_PBUF_RSVD 39U
+
+/**
+ * cass_tc_init_res_req_oxe_bc() - Initialize global OXE buffer class to be
+ * used for restricted request MCUs.
+ *
+ * @hw: Cassini device
+ *
+ * This buffer class is to be used by all CXI_TC_TYPE_HRP and
+ * CXI_TC_TYPE_RESTRICTED traffic class types.
+ *
+ * This only applies for C1.
+ */
+static int cass_tc_init_res_req_oxe_bc(struct cass_dev *hw)
+{
+	int bc;
+
+	bc = cass_tc_req_oxe_bc_cfg(hw, C1_RESTRICTED_BC_SPT_RSVD,
+				    RESTRICTED_BC_SMT_RSVD,
+				    RESTRICTED_BC_SCT_RSVD,
+				    RESTRICTED_BC_SRB_RSVD,
+				    RESTRICTED_BC_PBUF_RSVD);
+
+	return bc;
+}
+
+/* Set the DSCP DFA mask. */
+static void set_dscp_dfa_mask(struct cass_dev *hw,
+			      int dscp, unsigned int new_mask)
+{
+	union c_pct_cfg_sct_tag_dfa_mask dfa_mask;
+	unsigned int idx = dscp / 4;
+	unsigned int offset = dscp % 4;
+
+	if (dscp == -1)
+		return;
+
+	cass_read(hw, C_PCT_CFG_SCT_TAG_DFA_MASK(idx),
+		  &dfa_mask, sizeof(dfa_mask));
+
+	dfa_mask.dscp[offset].dfa_mask = new_mask;
+
+	cass_write(hw, C_PCT_CFG_SCT_TAG_DFA_MASK(idx),
+		   &dfa_mask, sizeof(dfa_mask));
+
+	if (cass_version(hw, CASSINI_2))
+		cass_write(hw, C2_LPE_CFG_GET_FQ_DFA_MASK(idx),
+			   &dfa_mask, sizeof(dfa_mask));
+}
+
+/**
+ * cass_tc_dscp_pcp_map() - For all traffic classes, map DSCP and PCP values in
+ * hardware.
+ *
+ * @hw: Cassini device
+ */
+static void cass_tc_dscp_pcp_map(struct cass_dev *hw)
+{
+	int i;
+	const struct cass_tc_dscp_pcp_settings *dscp_pcp_settings;
+	const struct qos_profile *prof = &hw->qos;
+
+	/* For each TC program mappings into HW */
+	for (i = 0; i < CXI_MAX_RDMA_TCS; i++) {
+		/* Don't configure inactive TCs */
+		if (!prof->tcs_active[i])
+			continue;
+		dscp_pcp_settings = &prof->tcs[i].dscp_pcp_settings;
+
+		/* IXE Mappings */
+		cass_tc_ixe_dscp_pcp_map(hw, dscp_pcp_settings->res_req_dscp,
+					 dscp_pcp_settings->req_pcp,
+					 dscp_pcp_settings->res_rsp_dscp);
+		cass_tc_ixe_dscp_pcp_map(hw, dscp_pcp_settings->res_rsp_dscp,
+					 dscp_pcp_settings->rsp_pcp, 0);
+		cass_tc_ixe_dscp_pcp_map(hw, dscp_pcp_settings->unres_req_dscp,
+					 dscp_pcp_settings->req_pcp,
+					 dscp_pcp_settings->unres_rsp_dscp);
+		cass_tc_ixe_dscp_pcp_map(hw, dscp_pcp_settings->unres_rsp_dscp,
+					 dscp_pcp_settings->rsp_pcp, 0);
+
+		/* PCT Mapping Restricted Request DSCP */
+		cass_tc_pct_dscp_pcp_map(hw, dscp_pcp_settings->req_pcp,
+					 prof->pct_control_pcp,
+					 dscp_pcp_settings->res_req_dscp,
+					 dscp_pcp_settings->res_rsp_dscp);
+
+		/* PCT Mapping Unrestricted Request DSCP */
+		cass_tc_pct_dscp_pcp_map(hw, dscp_pcp_settings->req_pcp,
+					 prof->pct_control_pcp,
+					 dscp_pcp_settings->unres_req_dscp,
+					 dscp_pcp_settings->unres_rsp_dscp);
+
+		/* HNI Mappings */
+		cass_tc_hni_dscp_pcp_map(hw, dscp_pcp_settings->res_req_dscp,
+					 dscp_pcp_settings->req_pcp);
+		cass_tc_hni_dscp_pcp_map(hw, dscp_pcp_settings->res_rsp_dscp,
+					 dscp_pcp_settings->rsp_pcp);
+		cass_tc_hni_dscp_pcp_map(hw, dscp_pcp_settings->unres_req_dscp,
+					 dscp_pcp_settings->req_pcp);
+		cass_tc_hni_dscp_pcp_map(hw, dscp_pcp_settings->unres_rsp_dscp,
+					 dscp_pcp_settings->rsp_pcp);
+
+		/* Optionally configure TC "Type" CXI_TC_TYPE_HRP. */
+		if (dscp_pcp_settings->hrp_res_req_dscp >= 0) {
+			cass_tc_ixe_dscp_pcp_map(hw,
+						 dscp_pcp_settings->hrp_res_req_dscp,
+						 dscp_pcp_settings->req_pcp,
+						 dscp_pcp_settings->res_rsp_dscp);
+			cass_tc_pct_dscp_pcp_map(hw, dscp_pcp_settings->req_pcp,
+						 prof->pct_control_pcp,
+						 dscp_pcp_settings->hrp_res_req_dscp,
+						 dscp_pcp_settings->res_rsp_dscp);
+			cass_tc_hni_dscp_pcp_map(hw,
+						 dscp_pcp_settings->hrp_res_req_dscp,
+						 dscp_pcp_settings->req_pcp);
+		}
+
+		/* Optionally configure TC "Type" CXI_TC_TYPE_COLL_LEAF. */
+		if (dscp_pcp_settings->coll_leaf_res_req_dscp >= 0) {
+			cass_tc_ixe_dscp_pcp_map(hw,
+						 dscp_pcp_settings->coll_leaf_res_req_dscp,
+						 dscp_pcp_settings->req_pcp,
+						 dscp_pcp_settings->res_rsp_dscp);
+			cass_tc_pct_dscp_pcp_map(hw, dscp_pcp_settings->req_pcp,
+						 prof->pct_control_pcp,
+						 dscp_pcp_settings->coll_leaf_res_req_dscp,
+						 dscp_pcp_settings->res_rsp_dscp);
+			cass_tc_hni_dscp_pcp_map(hw,
+						 dscp_pcp_settings->coll_leaf_res_req_dscp,
+						 dscp_pcp_settings->req_pcp);
+		}
+
+		/* Optionally configure TC "Type" CXI_TC_TYPE_RESTRICTED. */
+		if (dscp_pcp_settings->restricted_unres_req_dscp >= 0) {
+			cass_tc_ixe_dscp_pcp_map(hw,
+						 dscp_pcp_settings->restricted_unres_req_dscp,
+						 dscp_pcp_settings->req_pcp,
+						 dscp_pcp_settings->unres_rsp_dscp);
+			cass_tc_pct_dscp_pcp_map(hw, dscp_pcp_settings->req_pcp,
+						 prof->pct_control_pcp,
+						 dscp_pcp_settings->restricted_unres_req_dscp,
+						 dscp_pcp_settings->unres_rsp_dscp);
+			cass_tc_hni_dscp_pcp_map(hw,
+						 dscp_pcp_settings->restricted_unres_req_dscp,
+						 dscp_pcp_settings->req_pcp);
+		}
+
+		/* Errata 3176. */
+		set_dscp_dfa_mask(hw, dscp_pcp_settings->res_req_dscp, 0xfff);
+		set_dscp_dfa_mask(hw, dscp_pcp_settings->hrp_res_req_dscp,
+				  0xfff);
+		set_dscp_dfa_mask(hw, dscp_pcp_settings->coll_leaf_res_req_dscp,
+				  0xfff);
+	}
+}
+
+static void hrp_enable_mask(struct cass_dev *hw, u64 *dscp_mask, u64 *hrp_mask)
+{
+	struct cass_tc_cfg *tc_cfg;
+
+	*dscp_mask = *hrp_mask = 0;
+	list_for_each_entry(tc_cfg, &hw->tc_list, tc_entry) {
+		*dscp_mask |= BIT(tc_cfg->res_req_dscp);
+		if (tc_cfg->tc_type == CXI_TC_TYPE_HRP)
+			*hrp_mask |= BIT(tc_cfg->res_req_dscp);
+	}
+}
+
+/**
+ * cass_tc_cfg_locked() - Configure a traffic class (TC) definition which can be
+ * used to allocate a communication profile. Called with hw->tc_lock held.
+ *
+ * @hw: Cassini device
+ * @tc: Traffic Class label
+ * @tc_type: Traffic Class type
+ *
+ * @return: 0 on success. Else negative errno value.
+ */
+static int cass_tc_cfg_locked(struct cass_dev *hw, unsigned int tc,
+			      enum cxi_traffic_class_type tc_type)
+	__must_hold(&hw->tc_lock)
+{
+	struct cass_tc_cfg *tc_cfg;
+	unsigned int i;
+	unsigned int req_pcp;
+	unsigned int res_req_dscp;
+	unsigned int res_rsp_dscp;
+	unsigned int unres_req_dscp;
+	unsigned int unres_rsp_dscp;
+	unsigned int rsp_pcp;
+	unsigned int ocuset;
+	unsigned int cq_tc;
+	u64 res_req_dscp_mask;
+	struct cxi_tc *cxi_tc = &hw->qos.tcs[tc];
+	bool eth_tc = is_eth_tc(tc);
+	unsigned int iterations = (tc == CXI_ETH_SHARED) ? PCP_COUNT : 1;
+	u64 dscp_mask = 0;
+	u64 hrp_mask = 0;
+	union c_ixe_cfg_hrp cfg_hrp = {};
+	bool hrp = tc_type == CXI_TC_TYPE_HRP;
+
+	/* runtime debug assert */
+	lockdep_assert_held(&hw->tc_lock);
+
+	if (eth_tc || tc_type == CXI_TC_TYPE_DEFAULT) {
+		ocuset = cxi_tc->default_ocuset;
+		cq_tc = cxi_tc->default_cq_tc;
+	} else {
+		ocuset = cxi_tc->restricted_ocuset;
+		cq_tc = cxi_tc->restricted_cq_tc;
+	}
+
+	/* Common defaults */
+	res_req_dscp = cxi_tc->dscp_pcp_settings.res_req_dscp;
+	res_rsp_dscp = cxi_tc->dscp_pcp_settings.res_rsp_dscp;
+	unres_rsp_dscp = cxi_tc->dscp_pcp_settings.unres_rsp_dscp;
+	req_pcp = cxi_tc->dscp_pcp_settings.req_pcp;
+	rsp_pcp = cxi_tc->dscp_pcp_settings.rsp_pcp;
+
+	/* Changed various fields based on TC Type */
+	if (tc_type == CXI_TC_TYPE_DEFAULT) {
+		unres_req_dscp = cxi_tc->dscp_pcp_settings.unres_req_dscp;
+	} else if (tc_type == CXI_TC_TYPE_RESTRICTED) {
+		unres_req_dscp = cxi_tc->dscp_pcp_settings.restricted_unres_req_dscp;
+	} else if (tc_type == CXI_TC_TYPE_HRP) {
+		res_req_dscp = cxi_tc->dscp_pcp_settings.hrp_res_req_dscp;
+		unres_req_dscp = cxi_tc->dscp_pcp_settings.unres_req_dscp;
+	} else if (tc_type == CXI_TC_TYPE_COLL_LEAF) {
+		res_req_dscp = cxi_tc->dscp_pcp_settings.coll_leaf_res_req_dscp;
+		unres_req_dscp = cxi_tc->dscp_pcp_settings.unres_req_dscp;
+	} else {
+		return -EINVAL;
+	}
+
+	res_req_dscp_mask = BIT(res_req_dscp);
+	/* rdscp must be used exclusively with or without HRP */
+	if (!eth_tc) {
+		hrp_enable_mask(hw, &dscp_mask, &hrp_mask);
+		if (res_req_dscp_mask & dscp_mask) {
+			if (((hrp && !(res_req_dscp_mask & hrp_mask))) ||
+			    (!hrp && (res_req_dscp_mask & hrp_mask))) {
+				return -EINVAL;
+			}
+		}
+	}
+
+	/* Run once for most TC / TC Type Combinations.
+	 * Run multiple times for the Shared Eth Class
+	 */
+	for (i = 0; i < iterations; i++) {
+		/* Skip PCPs not owned by the Shared Eth Class */
+		if (tc == CXI_ETH_SHARED &&
+		    !cxi_tc->eth_settings.tc_pcps[i])
+			continue;
+		/* Use PCP field from settings for non-Shared Eth Classes */
+		if (eth_tc) {
+			if (tc == CXI_ETH_SHARED)
+				req_pcp = i;
+			else
+				req_pcp = cxi_tc->eth_settings.pcp;
+		}
+
+		/* All traffic class configs have a unique traffic class label
+		 * and traffic class type. Should never be configured twice.
+		 */
+		list_for_each_entry(tc_cfg, &hw->tc_list, tc_entry) {
+			if (eth_tc) {
+				if (tc_cfg->tc == tc && tc_cfg->req_pcp == req_pcp &&
+				    tc_cfg->tc_type == tc_type)
+					return -EEXIST;
+			} else {
+				if (tc_cfg->tc == tc && tc_cfg->tc_type == tc_type)
+					return -EEXIST;
+			}
+		}
+
+		tc_cfg = kzalloc(sizeof(*tc_cfg), GFP_KERNEL);
+		if (!tc_cfg)
+			return -ENOMEM;
+
+		list_add_tail(&tc_cfg->tc_entry, &hw->tc_list);
+
+		/* Update mapping for TC Label */
+		tc_cfg->tc = tc;
+		tc_cfg->tc_type = tc_type;
+		tc_cfg->res_req_dscp = res_req_dscp;
+		tc_cfg->unres_req_dscp = unres_req_dscp;
+		tc_cfg->res_rsp_dscp = res_rsp_dscp;
+		tc_cfg->unres_rsp_dscp = unres_rsp_dscp;
+		tc_cfg->req_pcp = req_pcp;
+		tc_cfg->rsp_pcp = rsp_pcp;
+		tc_cfg->ocuset = ocuset;
+		tc_cfg->cq_tc = cq_tc;
+
+		/* For C1 Restricted and HRP Labels, use the global restricted
+		 * buffer class.
+		 * For all other labels, or C2, use the parent TC req_bc
+		 */
+		if (!cass_version(hw, CASSINI_2) &&
+		    (tc_type == CXI_TC_TYPE_RESTRICTED ||
+		     tc_type == CXI_TC_TYPE_HRP))
+			tc_cfg->req_bc = hw->qos.tc_restricted_oxe_req_bc;
+		else
+			tc_cfg->req_bc = cxi_tc->req_bc;
+	}
+
+	/* Configure IXE to not generate responses to requests from HRP DSCPs */
+	if (!eth_tc) {
+		hrp_enable_mask(hw, &dscp_mask, &hrp_mask);
+		cfg_hrp.hrp_enable = hrp_mask;
+		cass_write(hw, C_IXE_CFG_HRP, &cfg_hrp, sizeof(cfg_hrp));
+	}
+
+	return 0;
+}
+
+static int cass_tc_cfg(struct cass_dev *hw, unsigned int tc,
+		       enum cxi_traffic_class_type tc_type)
+{
+	int ret;
+
+	mutex_lock(&hw->tc_lock);
+	ret = cass_tc_cfg_locked(hw, tc, tc_type);
+	mutex_unlock(&hw->tc_lock);
+
+	return ret;
+}
+
+int cxi_tc_cfg(struct cxi_dev *dev, unsigned int tc,
+	       enum cxi_traffic_class_type tc_type)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	if (!dev->is_physfn)
+		return -EPERM;
+	if (tc >= CXI_TC_MAX || tc_type >= CXI_TC_TYPE_MAX)
+		return -EINVAL;
+
+	return cass_tc_cfg(hw, tc, tc_type);
+}
+EXPORT_SYMBOL(cxi_tc_cfg);
+
+int cxi_tc_validate(struct cxi_dev *dev, unsigned int tc,
+		    enum cxi_traffic_class_type tc_type)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cass_tc_cfg tc_cfg;
+
+	if (tc >= CXI_TC_MAX || tc_type >= CXI_TC_TYPE_MAX)
+		return -EINVAL;
+
+	return cass_tc_find(hw, tc, tc_type, 0, &tc_cfg);
+}
+EXPORT_SYMBOL(cxi_tc_validate);
+
+int cxi_tc_clear(struct cxi_dev *dev, unsigned int tc,
+		 enum cxi_traffic_class_type tc_type)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cass_tc_cfg *cfg, *tmp;
+	bool found = false;
+
+	if (!dev->is_physfn)
+		return -EPERM;
+	if (tc >= CXI_TC_MAX || tc_type >= CXI_TC_TYPE_MAX)
+		return -EINVAL;
+
+	mutex_lock(&hw->tc_lock);
+	list_for_each_entry_safe(cfg, tmp, &hw->tc_list, tc_entry) {
+		if (cfg->tc != tc || cfg->tc_type != tc_type)
+			continue;
+		list_del(&cfg->tc_entry);
+		kfree(cfg);
+		found = true;
+	}
+	mutex_unlock(&hw->tc_lock);
+
+	return found ? 0 : -ENOENT;
+}
+EXPORT_SYMBOL(cxi_tc_clear);
+
+int cxi_tc_list(struct cxi_dev *dev, struct cxi_tc_info *entries,
+		unsigned int max_entries, unsigned int *count)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cass_tc_cfg *cfg;
+	unsigned int index = 0;
+
+	mutex_lock(&hw->tc_lock);
+	list_for_each_entry(cfg, &hw->tc_list, tc_entry) {
+		if (entries && index < max_entries) {
+			entries[index].tc = cfg->tc;
+			entries[index].tc_type = cfg->tc_type;
+			entries[index].res_req_dscp = cfg->res_req_dscp;
+			entries[index].unres_req_dscp = cfg->unres_req_dscp;
+			entries[index].res_rsp_dscp = cfg->res_rsp_dscp;
+			entries[index].unres_rsp_dscp = cfg->unres_rsp_dscp;
+			entries[index].req_pcp = cfg->req_pcp;
+			entries[index].rsp_pcp = cfg->rsp_pcp;
+			entries[index].ocuset = cfg->ocuset;
+			entries[index].cq_tc = cfg->cq_tc;
+			entries[index].req_bc = cfg->req_bc;
+		}
+		index++;
+	}
+	mutex_unlock(&hw->tc_lock);
+
+	if (count)
+		*count = index;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_tc_list);
+
+/**
+ * cass_tc_default_type_cfg() - Configure traffic class type CXI_TC_TYPE_DEFAULT
+ * for a given traffic class.
+ *
+ * Each RDMA traffic class MUST have the CXI_TC_TYPE_DEFAULT type configured. This
+ * performs the initial allocation and configuration of required resources which
+ * can later be shared with other traffic class types with the same traffic
+ * class.
+ *
+ * @hw: Cassini device
+ * @tc: Traffic Class to initialize
+ */
+static int cass_tc_default_type_cfg(struct cass_dev *hw,
+				    enum cxi_traffic_class tc)
+{
+	struct cxi_tc *cxi_tc = &hw->qos.tcs[tc];
+	const struct cass_tc_dscp_pcp_settings *dscp_pcp_settings =
+		&cxi_tc->dscp_pcp_settings;
+	unsigned int cq_mcu_base;
+	unsigned int cq_mcu_count;
+	unsigned int ixe_mcu_base;
+	unsigned int ixe_mcu_count;
+	unsigned int lpe_mcu_base;
+	unsigned int lpe_mcu_count;
+	unsigned int tou_mcu;
+	int ret;
+
+	cxi_tc->default_ocuset = cass_tc_cq_cfg(hw, tc, &cq_mcu_base,
+						&cq_mcu_count,
+						&cxi_tc->default_cq_tc,
+						false);
+	if (cxi_tc->default_ocuset < 0)
+		return cxi_tc->default_ocuset;
+
+	tou_mcu = cxi_tc->default_cq_tc + C_OXE_TOU_MCU_START;
+
+	ret = cass_tc_ixe_fq_cfg(hw, tc, dscp_pcp_settings->req_pcp,
+				 &ixe_mcu_base, &ixe_mcu_count);
+	if (ret)
+		return ret;
+
+	ret = cass_tc_lpe_cfg(hw, tc, dscp_pcp_settings->req_pcp,
+			      &lpe_mcu_base, &lpe_mcu_count);
+	if (ret)
+		return ret;
+
+	ret = cass_tc_oxe_cfg(hw, tc, dscp_pcp_settings->req_pcp,
+			      dscp_pcp_settings->rsp_pcp,
+			      cq_mcu_base, cq_mcu_count, lpe_mcu_base,
+			      lpe_mcu_count, ixe_mcu_base, ixe_mcu_count,
+			      tou_mcu);
+	if (ret)
+		return ret;
+
+	cass_tc_pct_cfg(hw, tc, dscp_pcp_settings->req_pcp);
+
+	cass_tc_hni_cfg(hw, tc, dscp_pcp_settings->req_pcp,
+			dscp_pcp_settings->rsp_pcp);
+
+	ret = cass_tc_cfg(hw, tc, CXI_TC_TYPE_DEFAULT);
+
+	return ret;
+}
+
+/**
+ * cass_tc_restricted_cfg() - Configuration of restricted resources needed for
+ * CXI_TC_TYPE_RESTRICTED, CXI_TC_TYPE_HRP, and CXI_TC_TYPE_COLL_LEAF traffic
+ * class types.
+ *
+ * If a traffic class has CXI_TC_TYPE_RESTRICTED, CXI_TC_TYPE_HRP, and
+ * CXI_TC_TYPE_COLL_LEAF disabled, this restricted resource configuration is a
+ * NOOP.
+ *
+ * @hw: Cassini device
+ * @tc: Traffic Class to configure
+ */
+static int cass_tc_restricted_cfg(struct cass_dev *hw,
+				  enum cxi_traffic_class tc)
+{
+	const struct cass_tc_dscp_pcp_settings *dscp_pcp_settings =
+		&hw->qos.tcs[tc].dscp_pcp_settings;
+	const struct cass_tc_oxe_settings *oxe_settings =
+		&hw->qos.tcs[tc].oxe_settings;
+	int ocuset;
+	int ret;
+	unsigned int cq_mcu_base;
+	unsigned int cq_mcu_count;
+	unsigned int cq_tc;
+	unsigned int tou_mcu;
+	unsigned int restricted_bc;
+
+	/* If PCT control traffic needs to be remapped to a different traffic
+	 * class, reuse the response PCP of the remapped traffic class.
+	 */
+	int mcu_pcp = hw->qos.pct_control_pcp;
+
+	/* NOOP if CXI_TC_TYPE_RESTRICTED, CXI_TC_TYPE_HRP, and
+	 * CXI_TC_TYPE_COLL_LEAF are disabled.
+	 */
+	if (dscp_pcp_settings->restricted_unres_req_dscp < 0 &&
+	    dscp_pcp_settings->hrp_res_req_dscp < 0 &&
+	    dscp_pcp_settings->coll_leaf_res_req_dscp < 0)
+		return 0;
+
+	ocuset = cass_tc_cq_cfg(hw, tc, &cq_mcu_base, &cq_mcu_count, &cq_tc,
+				true);
+	if (ocuset < 0)
+		return ocuset;
+
+	tou_mcu = cq_tc + C_OXE_TOU_MCU_START;
+
+	/* For Restricted TC "Type" use the same BC as the parent TC for C2.
+	 * For C1 use the global restricted buffer class.
+	 */
+	restricted_bc = cass_version(hw, CASSINI_2) ?
+			hw->qos.tcs[tc].req_bc :
+			hw->qos.tc_restricted_oxe_req_bc;
+
+	ret = cass_tc_oxe_mcu_cfg(hw, cq_mcu_base, cq_mcu_count, mcu_pcp,
+				  hw->qos.tcs[tc].leaf[0],
+				  restricted_bc,
+				  oxe_settings->mfs_index);
+	if (ret)
+		return ret;
+
+	ret = cass_tc_oxe_mcu_cfg(hw, tou_mcu, 1, mcu_pcp,
+				  hw->qos.tcs[tc].leaf[0],
+				  restricted_bc,
+				  oxe_settings->mfs_index);
+	if (ret)
+		return ret;
+
+	hw->qos.tcs[tc].restricted_ocuset = ocuset;
+	hw->qos.tcs[tc].restricted_cq_tc = cq_tc;
+
+	return 0;
+}
+
+/**
+ * cass_tc_restricted_type_cfg() - Configure traffic class type
+ * CXI_TC_TYPE_RESTRICTED for a given traffic class.
+ *
+ * This traffic class type requires a unique OCUset. The resulting MCU
+ * configuration share the same request traffic shaping and PCP values as the
+ * CXI_TC_TYPE_DEFAULT traffic class type configuration for respective traffic
+ * class. But, all CXI_TC_TYPE_RESTRICTED traffic class configurations will
+ * share the same buffer class regardless of traffic class.
+ *
+ * In addition, the OCUset configured for CXI_TC_TYPE_RESTRICTED is shared with
+ * CXI_TC_TYPE_HRP and CXI_TC_TYPE_COLL_LEAF configurations.
+ *
+ * @hw: Cassini device
+ * @tc: Traffic Class label
+ */
+static int cass_tc_restricted_type_cfg(struct cass_dev *hw,
+				       enum cxi_traffic_class tc)
+{
+	const struct cass_tc_dscp_pcp_settings *dscp_pcp_settings =
+		&hw->qos.tcs[tc].dscp_pcp_settings;
+	int ret;
+
+	if (dscp_pcp_settings->restricted_unres_req_dscp < 0)
+		return 0;
+
+	ret = cass_tc_cfg(hw, tc, CXI_TC_TYPE_RESTRICTED);
+
+	return ret;
+}
+
+/**
+ * cass_tc_hrp_type_cfg() - Configure traffic class type CXI_TC_TYPE_HRP for a
+ * given traffic class.
+ *
+ * This traffic class type requires a unique OCUset. The resulting MCU
+ * configuration share the same request traffic shaping and PCP values as the
+ * CXI_TC_TYPE_DEFAULT traffic class type configuration for respective traffic
+ * class. But, all CXI_TC_TYPE_HRP traffic class configurations will
+ * share the same buffer class regardless of traffic class.
+ *
+ * In addition, the OCUset configured for CXI_TC_TYPE_HRP is shared with
+ * CXI_TC_TYPE_RESTRICTED and CXI_TC_TYPE_COLL_LEAF configurations.
+ *
+ * @hw: Cassini device
+ * @tc: Traffic Class label
+ */
+static int cass_tc_hrp_type_cfg(struct cass_dev *hw, enum cxi_traffic_class tc)
+{
+	const struct cass_tc_dscp_pcp_settings *dscp_pcp_settings =
+		&hw->qos.tcs[tc].dscp_pcp_settings;
+	int ret;
+
+	if (dscp_pcp_settings->hrp_res_req_dscp < 0)
+		return 0;
+
+	ret = cass_tc_cfg(hw, tc, CXI_TC_TYPE_HRP);
+
+	return ret;
+}
+
+/**
+ * cass_tc_coll_leaf_type_cfg() - Configure traffic class type
+ * CXI_TC_TYPE_COLL_LEAF for a given traffic class.
+ *
+ * This traffic class type requires a unique OCUset. The resulting MCU
+ * configuration share the same request traffic shaping and PCP values as the
+ * CXI_TC_TYPE_DEFAULT traffic class type configuration for respective traffic
+ * class. But, all CXI_TC_TYPE_COLL_LEAF traffic class configurations will share
+ * the same buffer class regardless of traffic class.
+ *
+ * In addition, the OCUset configured for CXI_TC_TYPE_COLL_LEAF is shared with
+ * CXI_TC_TYPE_RESTRICTED and CXI_TC_TYPE_HRP configurations.
+ *
+ * @hw: Cassini device
+ * @tc: Traffic Class label
+ */
+static int cass_tc_coll_leaf_type_cfg(struct cass_dev *hw, enum cxi_traffic_class tc)
+{
+	const struct cass_tc_dscp_pcp_settings *dscp_pcp_settings =
+		&hw->qos.tcs[tc].dscp_pcp_settings;
+	int ret;
+
+	if (dscp_pcp_settings->coll_leaf_res_req_dscp < 0)
+		return 0;
+
+	ret = cass_tc_cfg(hw, tc, CXI_TC_TYPE_COLL_LEAF);
+
+	return ret;
+}
+
+static void cass_tc_eth_hni_cfg(struct cass_dev *hw)
+{
+	const union c_hni_cfg_gen cfg_gen = {
+		.default_pcp = hw->qos.untagged_eth_pcp,
+	};
+	int i;
+
+	cass_write(hw, C_HNI_CFG_GEN, &cfg_gen, sizeof(cfg_gen));
+
+	for (i = 0; i < PCP_COUNT; i++)
+		cass_tc_hni_cfg(hw, CXI_TC_ETH, i, 0);
+}
+
+static int cass_tc_eth_oxe_cfg(struct cass_dev *hw,
+			       enum cxi_eth_traffic_class tc,
+			       unsigned int cq_mcu_base,
+			       unsigned int cq_mcu_count, unsigned int req_bc)
+{
+	struct cxi_tc *cxi_tc = &hw->qos.tcs[tc];
+	const struct cass_tc_oxe_settings *oxe_settings =
+		&cxi_tc->oxe_settings;
+	unsigned int leaf = cxi_tc->leaf[0];
+	int ret;
+	int i;
+
+	cass_tc_oxe_leaf_bucket_cfg(hw, tc, leaf, true);
+
+	ret = cass_tc_oxe_mcu_cfg(hw, cq_mcu_base, cq_mcu_count,
+				  hw->qos.untagged_eth_pcp,
+				  leaf, req_bc, oxe_settings->mfs_index);
+	if (ret)
+		return ret;
+
+	/* Configure PCP associated with an Eth TC */
+	if (tc != CXI_ETH_SHARED) {
+		ret = cass_tc_oxe_pcp_pause_cfg(hw, cxi_tc->eth_settings.pcp,
+						leaf);
+		if (ret)
+			return ret;
+	} else {
+		for (i = 0; i < PCP_COUNT; i++) {
+			/* Configure each PCP in the shared class */
+			if (cxi_tc->eth_settings.tc_pcps[i]) {
+				ret = cass_tc_oxe_pcp_pause_cfg(hw, i, leaf);
+				if (ret)
+					return ret;
+			}
+		}
+	}
+
+	return ret;
+}
+
+static int cass_tc_eth_init(struct cass_dev *hw)
+{
+	unsigned int cq_mcu_base;
+	unsigned int cq_mcu_count;
+	unsigned int shared_cq_mcu_base;
+	unsigned int shared_cq_mcu_count;
+	int req_bc;
+	int ret;
+	const struct cass_tc_oxe_settings *oxe_settings =
+		&hw->qos.tcs[CXI_TC_ETH].oxe_settings;
+	struct cxi_tc *cxi_tc;
+	int leaf;
+	int tc;
+	int i;
+	bool pcp_used[PCP_COUNT] =  {};
+
+	/* Get TSC for each Eth TC */
+	for (tc = CXI_TC_MAX; tc < CXI_ETH_TC_MAX; tc++) {
+
+		/* Skip TCs that aren't enabled */
+		if (!hw->qos.tcs_active[tc])
+			continue;
+
+		cxi_tc = &hw->qos.tcs[tc];
+
+		/* Use the head bucket for Ethernet, not a branch. */
+		cxi_tc->branch = 7;
+
+		leaf = cass_tc_get_leaf_bucket(hw);
+		if (leaf < 0)
+			return leaf;
+
+		cxi_tc->leaf[0] = leaf;
+	}
+
+	/* Due to buffer class exhaustion, a single buffer class is shared
+	 * between all Ethernet OXE configurations.
+	 */
+	req_bc = cass_tc_eth_oxe_bc_cfg(hw, oxe_settings->spt_rsvd,
+					oxe_settings->pbuf_rsvd);
+	if (req_bc < 0)
+		return req_bc;
+
+	/* Configure a traffic class configuration using a unique communication
+	 * profile and OCUset for the untagged Ethernet PCP. This will allow
+	 * for all traffic using the untagged Ethernet PCP to have unique
+	 * resources allocated.
+	 */
+	/* Get OCUset for each Eth TC */
+	for (tc = CXI_TC_MAX; tc < CXI_ETH_TC_MAX; tc++) {
+
+		/* Skip TCs that aren't enabled */
+		if (!hw->qos.tcs_active[tc])
+			continue;
+		cxi_tc = &hw->qos.tcs[tc];
+
+		cxi_tc->req_bc = req_bc;
+
+		cxi_tc->default_ocuset = cass_tc_cq_cfg(hw, CXI_TC_ETH,
+							&cq_mcu_base,
+							&cq_mcu_count,
+							&cxi_tc->default_cq_tc, true);
+		if (cxi_tc->default_ocuset < 0)
+			return cxi_tc->default_ocuset;
+
+		/* We will configure the Shared Eth class later */
+		if (tc == CXI_ETH_SHARED) {
+			shared_cq_mcu_base = cq_mcu_base;
+			shared_cq_mcu_count = cq_mcu_count;
+			continue;
+		}
+
+		/* Store info about each PCP that is used. The catch all
+		 * Eth class will be configured to use the rest.
+		 */
+		pcp_used[cxi_tc->eth_settings.pcp] = true;
+
+		ret = cass_tc_eth_oxe_cfg(hw, tc, cq_mcu_base, cq_mcu_count,
+					  req_bc);
+		if (ret)
+			return ret;
+
+		ret = cass_tc_cfg(hw, tc, CXI_TC_TYPE_DEFAULT);
+	}
+
+	/* Configure a catch-all traffic class configuration for all the
+	 * remaining Ethernet PCPs. This will allow for functionality of
+	 * packets using these PCPs at the cost of sharing resources.
+	 * In addition, any pause issued against one of the PCPs within the
+	 * catch-all will impact all PCPs.
+	 */
+
+	/* Determine which PCPs are "Shared" */
+	for (i = 0; i < PCP_COUNT; i++) {
+		if (!pcp_used[i])
+			hw->qos.tcs[CXI_ETH_SHARED].eth_settings.tc_pcps[i] = true;
+	}
+
+	cxi_tc = &hw->qos.tcs[CXI_ETH_SHARED];
+	ret = cass_tc_eth_oxe_cfg(hw, CXI_ETH_SHARED,
+				  shared_cq_mcu_base, shared_cq_mcu_count,
+				  req_bc);
+	if (ret)
+		return ret;
+
+	ret = cass_tc_cfg(hw, CXI_ETH_SHARED, CXI_TC_TYPE_DEFAULT);
+	if (ret)
+		return ret;
+
+	cass_tc_eth_hni_cfg(hw);
+
+	return ret;
+}
+
+int cass_tc_init(struct cass_dev *hw)
+{
+	union c_hni_cfg_pause_tx_ctrl tx_ctrl_cfg;
+	union c_hni_cfg_pause_rx_ctrl rx_ctrl_cfg;
+	int ret;
+	int tc;
+
+	if (!active_qos_profile ||
+	    active_qos_profile > CXI_QOS_NUM_PROF) {
+		pr_err("Invalid active_qos_profile: %d\n",
+		       active_qos_profile);
+		return -EINVAL;
+	}
+	pr_info("QoS Profile: %s\n", cxi_qos_strs[active_qos_profile]);
+
+	/* Choose QoS Profile */
+	hw->qos	= profiles[active_qos_profile];
+	mutex_init(&hw->qos.mutex);
+	for (tc = 0; tc < CXI_ETH_TC_MAX; tc++) {
+		/* Store TC idx for easy access */
+		hw->qos.tcs[tc].tc = tc;
+	}
+
+	/* Update QoS Profile Based on Device Generation */
+	cxi_qos_calculate_limits(&hw->qos, (cass_version(hw, CASSINI_2)));
+
+	/* Use user provided Untagged Eth PCP if applicable */
+	if (untagged_eth_pcp > -1)
+		hw->qos.untagged_eth_pcp = untagged_eth_pcp;
+
+	if (pct_control_traffic_pcp < -1 ||
+	    pct_control_traffic_pcp > 7) {
+		pr_err("Invalid PCT control traffic pcp: %d\n",
+		       pct_control_traffic_pcp);
+		return -EINVAL;
+	}
+
+	if (pct_control_traffic_pcp > -1)
+		hw->qos.pct_control_pcp = pct_control_traffic_pcp;
+
+	/* Check if any RDMA TCs are using the PCT PCP */
+	for (tc = 0; tc < CXI_TC_MAX; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+		if (hw->qos.tcs[tc].dscp_pcp_settings.req_pcp == hw->qos.pct_control_pcp ||
+		    hw->qos.tcs[tc].dscp_pcp_settings.rsp_pcp == hw->qos.pct_control_pcp)
+			pct_control_traffic_tc = tc;
+	}
+
+	cass_clear(hw, C_OXE_CFG_ARB_PCP_MASK(0), C_OXE_CFG_ARB_PCP_MASK_SIZE);
+
+	cass_tc_dscp_pcp_map(hw);
+
+	/* Configure for PFC pauses */
+	cass_read(hw, C_HNI_CFG_PAUSE_TX_CTRL, &tx_ctrl_cfg, sizeof(tx_ctrl_cfg));
+	tx_ctrl_cfg.enable_pfc_pause = 1;
+	tx_ctrl_cfg.enable_pause = 0;
+	tx_ctrl_cfg.mac_cntl_opcode = 0x0101;
+	cass_write(hw, C_HNI_CFG_PAUSE_TX_CTRL, &tx_ctrl_cfg, sizeof(tx_ctrl_cfg));
+
+	cass_read(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl_cfg, sizeof(rx_ctrl_cfg));
+	rx_ctrl_cfg.pfc_rec_enable = 1;
+	rx_ctrl_cfg.pause_rec_enable = 0;
+	cass_write(hw, C_HNI_CFG_PAUSE_RX_CTRL, &rx_ctrl_cfg, sizeof(rx_ctrl_cfg));
+
+	/* Setup Global OXE BC for restricted request MCUs for C1 */
+	if (!cass_version(hw, CASSINI_2)) {
+		ret = cass_tc_init_res_req_oxe_bc(hw);
+		if (ret)
+			return ret;
+	}
+
+	for (tc = 0; tc < CXI_MAX_RDMA_TCS; tc++) {
+		/* Don't configure inactive TCs */
+		if (!hw->qos.tcs_active[tc])
+			continue;
+
+		/* Setup CXI_TC_TYPE_DEFAULT for each RDMA TC */
+		ret = cass_tc_default_type_cfg(hw, tc);
+		if (ret)
+			return ret;
+
+		/* Must be run before CXI_TC_TYPE_RESTRICTED and
+		 * CXI_TC_TYPE_HRP configuration.
+		 */
+		ret = cass_tc_restricted_cfg(hw, tc);
+		if (ret)
+			return ret;
+
+		ret = cass_tc_restricted_type_cfg(hw, tc);
+		if (ret)
+			return ret;
+
+		ret = cass_tc_hrp_type_cfg(hw, tc);
+		if (ret)
+			return ret;
+
+		ret = cass_tc_coll_leaf_type_cfg(hw, tc);
+		if (ret)
+			return ret;
+	}
+
+	/* Set up global PCT Credit limits*/
+	cass_tc_pct_global_cfg(hw);
+
+	ret = cass_tc_eth_init(hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/* Re-program the ARB CFG CSRs when the link is going up, as they are
+ * dependent on the link speed, which may have changed.
+ *
+ * Matching formula between bandwidth, fill_qty and
+ * fill_rate. bandwidth should be slightly above the real
+ * value.
+ *   FILL_QTY * 16/(FILL_RATE+1) * clock = bandwidth
+ *
+ * For instance, for Cassini 1, if desired bandwidth is
+ * 200Gbps, assuming a FILL_RATE of 9, then FILL_QTY of 16
+ * does the job:
+ *   16 * 16/10 * 1_000_000_000 * 8 = 204_800_000_000
+ *
+ * Current fill_qty for Cassini 1 depending on the link speed, and a
+ * clock speed of 1GHz:
+ *    50: 4  ->  51.2
+ *   100: 8  -> 102.4
+ *   200: 16 -> 204.8
+ *
+ * Current fill_qty for Cassini 2 depending on the link speed, and a
+ * clock speed of 1.1GHz:
+ *    25: 2  ->  28.16
+ *    50: 4  ->  56.32
+ *   100: 8  -> 112.64
+ *   200: 15 -> 211.2
+ *   400: 29 -> 408.32
+ */
+void update_oxe_link_up(struct cass_dev *hw)
+{
+	struct cxi_link_info link_info;
+	int tc;
+
+	cxi_link_mode_get(&hw->cdev, &link_info);
+
+	if (cass_version(hw, CASSINI_1)) {
+		switch (link_info.speed) {
+		case SPEED_50000:
+			hw->tsc_fill_qty = 4;
+			break;
+		case SPEED_100000:
+			hw->tsc_fill_qty = 8;
+			break;
+		case SPEED_200000:
+		default:
+			hw->tsc_fill_qty = 16;
+			break;
+		}
+	} else {
+		switch (link_info.speed) {
+		case SPEED_25000:
+			hw->tsc_fill_qty = 2;
+			break;
+		case SPEED_50000:
+			hw->tsc_fill_qty = 4;
+			break;
+		case SPEED_100000:
+			hw->tsc_fill_qty = 8;
+			break;
+		case SPEED_200000:
+			hw->tsc_fill_qty = 15;
+			break;
+		case SPEED_400000:
+		default:
+			hw->tsc_fill_qty = 29;
+			break;
+		}
+	}
+
+	traffic_shaping_cfg(hw);
+
+	/* Configure BW for each TC */
+	for (tc = 0; tc < CXI_ETH_TC_MAX; tc++) {
+
+		/* CXI_TC_ETH is used for "general" eth config. The specific
+		 * Ethernet classes are the ones that actually will have BW
+		 * settings.
+		 */
+		if (tc == CXI_TC_ETH)
+			continue;
+
+		if (!hw->qos.tcs_active[tc])
+			continue;
+
+		/* Configure Branch specified in TC */
+		cass_tc_oxe_branch_bucket_cfg(hw, tc);
+
+		/* Configure leaf for RDMA and Ethernet */
+		cass_tc_oxe_leaf_bucket_cfg(hw, tc,
+					    hw->qos.tcs[tc].leaf[0], true);
+
+		/* Configure second leaf for RDMA. Not used for Ethernet */
+		if (tc < CXI_TC_ETH)
+			cass_tc_oxe_leaf_bucket_cfg(hw, tc,
+						    hw->qos.tcs[tc].leaf[1],
+						    false);
+	}
+}
+
+/**
+ * cass_tc_find() - Look up Traffic Class definition
+ *
+ * @hw: Cassini device
+ * @tc: Traffic Class label
+ * @tc_type: Traffic Class type
+ * @ethernet_pcp: Ethernet PCP (only valid for CXI_TC_ETH)
+ * @tc_cfg: Traffic Class description values
+ *
+ * @return: 0 on success. -EINVAL if a matching definition was not found.
+ */
+int cass_tc_find(struct cass_dev *hw, enum cxi_traffic_class tc,
+		 enum cxi_traffic_class_type tc_type, u8 ethernet_pcp,
+		 struct cass_tc_cfg *tc_cfg)
+{
+	struct cass_tc_cfg *cfg;
+
+	if (disable_user_pct_tc_usage && pct_control_traffic_tc == tc) {
+		pr_err_once("%s reserved for PCT control traffic\n",
+			    cxi_tc_strs[tc]);
+		return -EINVAL;
+	}
+
+	mutex_lock(&hw->tc_lock);
+	list_for_each_entry(cfg, &hw->tc_list, tc_entry) {
+		if (tc == CXI_TC_ETH) {
+			if (cfg->tc == tc && cfg->tc_type == tc_type &&
+			    cfg->req_pcp == ethernet_pcp) {
+				*tc_cfg = *cfg;
+				mutex_unlock(&hw->tc_lock);
+				return 0;
+			}
+		} else {
+			if (cfg->tc == tc && cfg->tc_type == tc_type) {
+				/* Return config by value */
+				*tc_cfg = *cfg;
+				mutex_unlock(&hw->tc_lock);
+				return 0;
+			}
+		}
+	}
+	mutex_unlock(&hw->tc_lock);
+
+	return -EINVAL;
+}
+
+/**
+ * cass_tc_fini() - Finalize Traffic Classes
+ *
+ * @hw: Cassini device to be finalized
+ */
+void cass_tc_fini(struct cass_dev *hw)
+{
+	struct cass_tc_cfg *tc_cfg;
+
+	/* Remove all TC definitions */
+	while ((tc_cfg = list_first_entry_or_null(&hw->tc_list,
+						  struct cass_tc_cfg,
+						  tc_entry))) {
+		list_del(&tc_cfg->tc_entry);
+		kfree(tc_cfg);
+	}
+}
+
+/*
+ * print out pause state for sysfs diags
+ *
+ */
+int cass_pause_sysfs_sprint(struct cass_dev *hw, char *buf, size_t size)
+{
+	int rc;
+	u32 pause_type;
+
+	spin_lock(&hw->port->pause_lock);
+	pause_type = hw->port->pause_type;
+	spin_unlock(&hw->port->pause_lock);
+
+	rc = scnprintf(buf, size, "%s", cass_pause_type_str(pause_type));
+
+	return rc;
+}
+
+static ssize_t active_qos_profile_show(struct kobject *kobj,
+				       struct kobj_attribute *kattr, char *buf)
+{
+	return scnprintf(buf, PAGE_SIZE, "%s\n",
+			 cxi_qos_strs[active_qos_profile]);
+}
+
+static struct kobj_attribute active_qos_profile_attribute = __ATTR_RO(active_qos_profile);
+
+static ssize_t untagged_eth_pcp_show(struct kobject *kobj,
+				     struct kobj_attribute *kattr, char *buf)
+{
+	struct cass_dev *hw = container_of(kobj, struct cass_dev, tcs_kobj);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n",
+			 hw->qos.untagged_eth_pcp);
+}
+
+static struct kobj_attribute untagged_eth_pcp_attribute = __ATTR_RO(untagged_eth_pcp);
+
+static ssize_t assured_bw_show(struct kobject *kobj,
+			       struct kobj_attribute *kattr, char *buf)
+{
+	const struct cxi_tc *tc_obj;
+	const struct cass_tc_oxe_settings *oxe_settings;
+
+	tc_obj = container_of(kobj, struct cxi_tc, kobj);
+	oxe_settings = &tc_obj->oxe_settings;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n",
+			 oxe_settings->assured_percent);
+}
+
+static ssize_t assured_bw_store(struct kobject *kobj,
+				struct kobj_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct cxi_tc *tc_obj;
+	struct qos_profile *qos;
+	struct cass_tc_oxe_settings *oxe_settings;
+	struct cass_dev *hw;
+	int ret, assured;
+	unsigned int tc;
+	unsigned int i;
+	unsigned int sum = 0;
+
+	tc_obj = container_of(kobj, struct cxi_tc, kobj);
+	tc = tc_obj->tc;
+	oxe_settings = &tc_obj->oxe_settings;
+	qos = container_of(tc_obj, struct qos_profile, tcs[tc]);
+	hw = container_of(qos, struct cass_dev, qos);
+
+	/* Validate input */
+	ret = kstrtoint(buf, 10, &assured);
+	if (ret)
+		return ret;
+
+	/* Input range check */
+	if (assured < 0 || assured > 100)
+		return -EINVAL;
+
+	/* Compare to ceiling */
+	if (assured > oxe_settings->ceiling_percent) {
+		pr_err("TC: %s requested assured_bw (%d) cannot be greater than ceiling_bw (%u)\n",
+		       cxi_tc_strs_uc[tc], assured,
+		       oxe_settings->ceiling_percent);
+		return -EINVAL;
+	}
+
+	/* Calculate the sum of current BW Percentages */
+	for (i = 0; i < CXI_ETH_TC_MAX; i++) {
+		/* Not a "real" TC that can have BW */
+		if (i == CXI_TC_ETH)
+			continue;
+		if (!qos->tcs_active[i])
+			continue;
+		if (i == tc)
+			continue;
+		sum += qos->tcs[i].oxe_settings.assured_percent;
+	}
+
+	/* Ensure requested assured value + sum of other BW Percentages
+	 * does not exceed 100
+	 */
+	sum += assured;
+	if (sum > 100) {
+		pr_err("Updating assured_bw for TC: %s to %d would exceed total available bandwidth. (calculated sum: %d)",
+		       cxi_tc_strs_uc[tc], assured, sum);
+		return -EINVAL;
+	}
+
+	mutex_lock(&hw->qos.mutex);
+	oxe_settings->assured_percent = assured;
+
+	/* Reconfigure branch bucket and leaf buckets for req/rsp */
+	cass_tc_oxe_branch_bucket_cfg(hw, tc);
+	cass_tc_oxe_leaf_bucket_cfg(hw, tc, hw->qos.tcs[tc].leaf[0], true);
+	if (tc < CXI_TC_ETH)
+		cass_tc_oxe_leaf_bucket_cfg(hw, tc, hw->qos.tcs[tc].leaf[1],
+					    false);
+	mutex_unlock(&hw->qos.mutex);
+
+	return count;
+}
+
+static struct kobj_attribute assured_bw_attribute = __ATTR_RW(assured_bw);
+
+static ssize_t ceiling_bw_show(struct kobject *kobj,
+			       struct kobj_attribute *kattr, char *buf)
+{
+	const struct cxi_tc *tc_obj;
+	const struct cass_tc_oxe_settings *oxe_settings;
+
+	tc_obj = container_of(kobj, struct cxi_tc, kobj);
+	oxe_settings = &tc_obj->oxe_settings;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n",
+			 oxe_settings->ceiling_percent);
+}
+
+static ssize_t ceiling_bw_store(struct kobject *kobj,
+				struct kobj_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct cxi_tc *tc_obj;
+	struct qos_profile *qos;
+	struct cass_tc_oxe_settings *oxe_settings;
+	struct cass_dev *hw;
+	int ret, ceiling;
+	unsigned int tc;
+
+	tc_obj = container_of(kobj, struct cxi_tc, kobj);
+	tc = tc_obj->tc;
+	oxe_settings = &tc_obj->oxe_settings;
+	qos = container_of(tc_obj, struct qos_profile, tcs[tc]);
+	hw = container_of(qos, struct cass_dev, qos);
+
+	/* Validate input */
+	ret = kstrtoint(buf, 10, &ceiling);
+	if (ret)
+		return ret;
+
+	if (ceiling < 0 || ceiling > 100)
+		return -EINVAL;
+
+	/* Compare to assured bw */
+	if (ceiling < oxe_settings->assured_percent) {
+		pr_err("TC: %s requested ceiling_bw (%d) cannot be lower than assured_bw (%u)\n",
+		       cxi_tc_strs_uc[tc], ceiling,
+		       oxe_settings->assured_percent);
+		return -EINVAL;
+	}
+
+	mutex_lock(&hw->qos.mutex);
+	oxe_settings->ceiling_percent = ceiling;
+
+	/* Reconfigure branch bucket and leaf buckets for req/rsp */
+	cass_tc_oxe_branch_bucket_cfg(hw, tc);
+	cass_tc_oxe_leaf_bucket_cfg(hw, tc, hw->qos.tcs[tc].leaf[0], true);
+	if (tc < CXI_TC_ETH)
+		cass_tc_oxe_leaf_bucket_cfg(hw, tc, hw->qos.tcs[tc].leaf[1],
+					    false);
+	mutex_unlock(&hw->qos.mutex);
+
+	return count;
+}
+
+static struct kobj_attribute ceiling_bw_attribute = __ATTR_RW(ceiling_bw);
+
+static struct attribute *tc_attrs[] = {
+	&assured_bw_attribute.attr,
+	&ceiling_bw_attribute.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(tc);
+
+static struct kobj_type tc_settings = {
+	.sysfs_ops	= &kobj_sysfs_ops,
+	.default_groups = tc_groups,
+};
+
+static struct kobj_type tc_dir = {
+	.sysfs_ops	= &kobj_sysfs_ops,
+};
+
+static struct attribute *tc_top_attrs[] = {
+	&active_qos_profile_attribute.attr,
+	&untagged_eth_pcp_attribute.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(tc_top);
+
+static struct kobj_type tc_top_info = {
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_groups = tc_top_groups,
+};
+
+int cass_create_tc_sysfs(struct cass_dev *hw)
+{
+	int tc, rc, bad_tc;
+
+	/* Create top level directory and files */
+	rc = kobject_init_and_add(&hw->tcs_kobj, &tc_top_info,
+				  &hw->cdev.pdev->dev.kobj,
+				  "traffic_classes");
+	if (rc)
+		goto destroy;
+
+	/* Create directory for each RDMA TC */
+	for (tc = 0; tc < CXI_TC_ETH; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+		rc = kobject_init_and_add(&hw->qos.tcs[tc].kobj,
+					  &tc_settings, &hw->tcs_kobj,
+					  "%s", cxi_tc_strs_lc[tc]);
+		if (rc)
+			goto put_rdma_tcs;
+	}
+
+	/* Create top level directory for ETH */
+	rc = kobject_init_and_add(&hw->qos.tcs[CXI_TC_ETH].kobj,
+				  &tc_dir, &hw->tcs_kobj,
+				  "%s", "ethernet");
+	if (rc) {
+		bad_tc = -1;
+		goto put_rdma_tcs;
+	}
+
+	/* Create directory for each Eth TC */
+	for (tc = CXI_TC_MAX; tc < CXI_ETH_TC_MAX; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+		rc = kobject_init_and_add(&hw->qos.tcs[tc].kobj,
+					  &tc_settings, &hw->qos.tcs[CXI_TC_ETH].kobj,
+					  "%s", cxi_tc_strs_lc[tc]);
+		if (rc)
+			goto put_eth_tcs;
+	}
+
+	return 0;
+
+put_eth_tcs:
+	bad_tc = tc;
+	for (tc = CXI_TC_MAX; tc < CXI_ETH_TC_MAX; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+
+		kobject_put(&hw->qos.tcs[tc].kobj);
+
+		if (tc == bad_tc)
+			break;
+	}
+	bad_tc = -1;
+put_rdma_tcs:
+	bad_tc = tc;
+	for (tc = 0; tc < CXI_MAX_RDMA_TCS; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+
+		kobject_put(&hw->qos.tcs[tc].kobj);
+
+		if (tc == bad_tc)
+			break;
+	}
+destroy:
+	kobject_put(&hw->tcs_kobj);
+	return rc;
+}
+
+void cass_destroy_tc_sysfs(struct cass_dev *hw)
+{
+	int tc;
+
+	for (tc = CXI_TC_MAX; tc < CXI_ETH_TC_MAX; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+		kobject_put(&hw->qos.tcs[tc].kobj);
+	}
+
+	kobject_put(&hw->qos.tcs[CXI_TC_ETH].kobj);
+
+	for (tc = 0; tc < CXI_TC_ETH; tc++) {
+		if (!hw->qos.tcs_active[tc])
+			continue;
+		kobject_put(&hw->qos.tcs[tc].kobj);
+	}
+	sysfs_remove_file(&hw->tcs_kobj, &active_qos_profile_attribute.attr);
+	kobject_put(&hw->tcs_kobj);
+}
+
+int tc_cfg_show(struct seq_file *s, void *unused)
+{
+	struct cass_dev *hw = s->private;
+	struct cass_tc_cfg *tc_cfg;
+	const char *label;
+
+	seq_printf(s, "Active QoS Profile: %s\n\n",
+		   cxi_qos_strs[active_qos_profile]);
+	seq_printf(s, "%18s%18s%15s%15s%15s%15s%8s%8s%7s%7s\n", "LABEL", "TYPE",
+		   "RES_REQ_DSCP", "UNRES_REQ_DSCP", "RES_RSP_DSCP",
+		   "UNRES_RSP_DSCP", "REQ_PCP", "RSP_PCP", "OCUSET", "BC");
+
+	mutex_lock(&hw->tc_lock);
+	list_for_each_entry(tc_cfg, &hw->tc_list, tc_entry) {
+		if (tc_cfg->tc < 0 || tc_cfg->tc > CXI_ETH_TC_MAX)
+			label = "(invalid)";
+		else
+			label = cxi_tc_strs_uc[tc_cfg->tc];
+		seq_printf(s, "%18s%18s%15d%15d%15d%15d%8d%8d%7d%7d\n",
+			   label, cxi_tc_type_to_str(tc_cfg->tc_type),
+			   tc_cfg->res_req_dscp, tc_cfg->unres_req_dscp,
+			   tc_cfg->res_rsp_dscp, tc_cfg->unres_rsp_dscp,
+			   tc_cfg->req_pcp, tc_cfg->rsp_pcp, tc_cfg->ocuset,
+			   tc_cfg->req_bc);
+	}
+	mutex_unlock(&hw->tc_lock);
+	seq_printf(s, "%18s%18s%15d%15d%15d%15d%8d%8d%7d%7d\n",
+		   "PCT", "N/A", -1, -1, -1, -1,
+		   hw->qos.pct_control_pcp, hw->qos.pct_control_pcp, -1, -1);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cass_telem.c b/drivers/net/ethernet/hpe/ss1/cass_telem.c
new file mode 100644
index 000000000000..af1838d9d0c3
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_telem.c
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020-2021,2024 Hewlett Packard Enterprise Development LP */
+
+/* Cassini Telemetry */
+
+#include <linux/iopoll.h>
+#include <linux/ktime.h>
+
+#include "cass_core.h"
+
+#define CASSINI_TELEMETRY_ITEM_TYPE_UNDEFINED	0
+#define CASSINI_TELEMETRY_ITEM_TYPE_COUNTER	1
+#define CASSINI_TELEMETRY_ITEM_TYPE_UGAUGE	2
+#define CASSINI_TELEMETRY_ITEM_TYPE_SGAUGE	3
+
+/* Telemetry item 0 is never defined. */
+#define C_TELEM_UNDEFINED	0
+
+struct telem_item {
+	u32 offset;
+	u8 lsb;
+	u8 numbits;
+	u8 type;
+};
+
+struct telem_info {
+	u64 total_num_items;
+	u64 valid_num_items;
+	const struct telem_item *items;
+};
+
+#include "cass_telem_tables.h"
+
+static struct telem_info c1 = {
+	.total_num_items = C1_TELEM_TOTAL,
+	.valid_num_items = C1_TELEM_VALID,
+	.items = c1_items,
+};
+
+static struct telem_info c2 = {
+	.total_num_items = C2_TELEM_TOTAL,
+	.valid_num_items = C2_TELEM_VALID,
+	.items = c2_items,
+};
+
+static bool telem_item_defined(const struct telem_info *info, u64 item)
+{
+	return item < info->total_num_items &&
+	       info->items[item].type != CASSINI_TELEMETRY_ITEM_TYPE_UNDEFINED;
+}
+
+static u64 telem_item_extract(const struct telem_item *item, u64 rawval)
+{
+	return (rawval >> item->lsb) & (~0ULL >> (64 - item->numbits));
+}
+
+/**
+ * cxi_telem_get_selected() - get values for supplied telemetry items
+ * @cdev: the device
+ * @items: array indicating which items to retrieve
+ * @data: array to hold the items's values
+ * @count: number of elements in each array (items and data)
+ *
+ * Retrieve the values for the requested telemetry items. Every item must
+ * be defined for this device.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_telem_get_selected(struct cxi_dev *cdev, const unsigned int *items,
+			   u64 *data, unsigned int count)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	const struct telem_info *info = hw->telemetry.info;
+	unsigned int i;
+
+	if (count == 0 || count > info->valid_num_items)
+		return -EINVAL;
+
+	for (i = 0; i < count; i++)
+		if (!telem_item_defined(info, items[i]))
+			return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		const struct telem_item *item = &info->items[items[i]];
+		u64 rawval;
+
+		cass_read(hw, item->offset, &rawval, sizeof(rawval));
+		data[i] = telem_item_extract(item, rawval);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_telem_get_selected);
+
+/**
+ * cxi_telem_read() - read telemetry items with timestamps
+ * @cdev: the device
+ * @items: item IDs to read, or NULL to read items 0 to @count - 1
+ * @values: receives the value of each item
+ * @timestamps: if not NULL, receives the wall clock time in nanoseconds
+ *              taken right after each item was read
+ * @count: number of entries in each array
+ *
+ * An item that is not defined for this device, including item 0, reads as
+ * zero with a zero timestamp. An item ID past the end of the device's item
+ * space is an error. Items that share a register are read once.
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+int cxi_telem_read(struct cxi_dev *cdev, const u64 *items, u64 *values,
+		   u64 *timestamps, unsigned int count)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	const struct telem_info *info = hw->telemetry.info;
+	bool have_raw = false;
+	u32 raw_offset = 0;
+	u64 rawval = 0;
+	u64 now = 0;
+	unsigned int i;
+
+	for (i = 0; i < count; i++)
+		if ((items ? items[i] : i) >= info->total_num_items)
+			return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		u64 id = items ? items[i] : i;
+		const struct telem_item *item = &info->items[id];
+
+		if (item->type == CASSINI_TELEMETRY_ITEM_TYPE_UNDEFINED) {
+			values[i] = 0;
+			if (timestamps)
+				timestamps[i] = 0;
+			continue;
+		}
+
+		if (!have_raw || raw_offset != item->offset) {
+			cass_read(hw, item->offset, &rawval, sizeof(rawval));
+			raw_offset = item->offset;
+			have_raw = true;
+			if (timestamps)
+				now = ktime_get_real_ns();
+		}
+
+		values[i] = telem_item_extract(item, rawval);
+		if (timestamps)
+			timestamps[i] = now;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_telem_read);
+
+/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
+
+/* Toggle all counter group enable and init bits. */
+static int telem_cntr_group_toggle(struct cass_dev *hw, bool enable, bool init)
+{
+	/*
+	 * While the c_*_cfg_event_cnts registers & unions are very
+	 * similar, there are two variants one with and one without
+	 * the warm_rst_disable field, and since each counter group
+	 * defines its own cfg reg & union and may theoretically change
+	 * without corresponding changes in the other groups cfg reg,
+	 * use each group cfg reg independently versus using a single
+	 * u64 (qw) for all.   Let the compiler determine if any
+	 * optimizations may be done.
+	 */
+
+	union c_mb_cfg_event_cnts	cfg_mb;
+	union c_pi_ipd_cfg_event_cnts	cfg_pi_ipd;
+	union c_cq_cfg_event_cnts	cfg_cq;
+	union c_lpe_cfg_event_cnts	cfg_lpe;
+	union c_hni_cfg_event_cnts	cfg_hni;
+
+	cfg_mb.qw	  = 0;
+	cfg_mb.enable	  = enable;
+	cfg_mb.init	  = init;
+
+	cfg_pi_ipd.qw	  = 0;
+	cfg_pi_ipd.enable = enable;
+	cfg_pi_ipd.init	  = init;
+
+	cfg_cq.qw	  = 0;
+	cfg_cq.enable	  = enable;
+	cfg_cq.init	  = init;
+
+	cfg_lpe.qw	  = 0;
+	cfg_lpe.enable	  = enable;
+	cfg_lpe.init	  = init;
+
+	cfg_hni.qw	  = 0;
+	cfg_hni.enable	  = enable;
+	cfg_hni.init	  = init;
+
+	cass_write(hw, C_MB_CFG_EVENT_CNTS,	&cfg_mb,     sizeof(cfg_mb));
+	cass_write(hw, C_PI_IPD_CFG_EVENT_CNTS, &cfg_pi_ipd, sizeof(cfg_pi_ipd));
+	cass_write(hw, C_CQ_CFG_EVENT_CNTS,	&cfg_cq,     sizeof(cfg_cq));
+	cass_write(hw, C_LPE_CFG_EVENT_CNTS,	&cfg_lpe,    sizeof(cfg_lpe));
+	cass_write(hw, C_HNI_CFG_EVENT_CNTS,	&cfg_hni,    sizeof(cfg_hni));
+
+	cass_flush_pci(hw);
+
+	if (!init)
+		return 0;
+
+	if (readq_poll_timeout(cass_csr(hw, C_MB_CFG_EVENT_CNTS),
+			       cfg_mb.qw, cfg_mb.init_done == 1, 1, 1000000)) {
+		cxidev_err(&hw->cdev,
+			   "Telemetry counter group reset failed: %x\n",
+			   C_MB_CFG_EVENT_CNTS);
+		return -1;
+	}
+
+	if (readq_poll_timeout(cass_csr(hw, C_PI_IPD_CFG_EVENT_CNTS),
+			       cfg_pi_ipd.qw,
+			       cfg_pi_ipd.init_done == 1, 1, 1000000)) {
+		cxidev_err(&hw->cdev,
+			   "Telemetry counter group reset failed: %x\n",
+			   C_PI_IPD_CFG_EVENT_CNTS);
+		return -1;
+	}
+
+	if (readq_poll_timeout(cass_csr(hw, C_CQ_CFG_EVENT_CNTS),
+			       cfg_cq.qw, cfg_cq.init_done == 1, 1, 1000000)) {
+		cxidev_err(&hw->cdev,
+			   "Telemetry counter group reset failed: %x\n",
+			   C_CQ_CFG_EVENT_CNTS);
+		return -1;
+	}
+
+	if (readq_poll_timeout(cass_csr(hw, C_LPE_CFG_EVENT_CNTS),
+			       cfg_lpe.qw, cfg_lpe.init_done == 1, 1, 1000000)) {
+		cxidev_err(&hw->cdev,
+			   "Telemetry counter group reset failed: %x\n",
+			   C_LPE_CFG_EVENT_CNTS);
+		return -1;
+	}
+
+	if (readq_poll_timeout(cass_csr(hw, C_HNI_CFG_EVENT_CNTS),
+			       cfg_hni.qw, cfg_hni.init_done == 1, 1, 1000000)) {
+		cxidev_err(&hw->cdev,
+			   "Telemetry counter group reset failed: %x\n",
+			   C_HNI_CFG_EVENT_CNTS);
+		return -1;
+	}
+
+	return 0;
+}
+
+/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
+
+int cass_telem_init(struct cass_dev *hw)
+{
+	int rc;
+
+	if (cass_version(hw, CASSINI_1)) {
+		cxidev_info(&hw->cdev, "telemetry for cassini1\n");
+		hw->telemetry.info = &c1;
+	} else if (cass_version(hw, CASSINI_2)) {
+		cxidev_info(&hw->cdev, "telemetry for cassini2\n");
+		hw->telemetry.info = &c2;
+	} else {
+		cxidev_err(&hw->cdev,
+			   "telemetry: unsupported cassini version = %x\n",
+			   hw->cdev.prop.cassini_version);
+		rc = -EOPNOTSUPP;
+		goto __cass_telem_init_err_ret_rc;
+	}
+
+	if (hw->cdev.is_physfn) {
+		rc = telem_cntr_group_toggle(hw, true, true);
+		if (rc != 0) {
+			cxidev_err(&hw->cdev,
+				   "telem_cntr_group_toggle failed with %d\n", rc);
+			/*
+			 * going to __cass_telem_init_err_cntr_group_toggle to
+			 * have driver try to write disable for the functionality.
+			 */
+			goto __cass_telem_init_err_cntr_group_toggle;
+		}
+	}
+
+	return 0;
+
+__cass_telem_init_err_cntr_group_toggle:
+	if (hw->cdev.is_physfn) {
+		/*
+		 * since the 'init parameter' is false, the following will not fail.
+		 */
+		(void)telem_cntr_group_toggle(hw, false, false);
+	}
+	hw->telemetry.info = NULL;
+
+__cass_telem_init_err_ret_rc:
+	return rc;
+}
+
+void cass_telem_fini(struct cass_dev *hw)
+{
+	if (hw->cdev.is_physfn) {
+		/*
+		 * since the 'init parameter' is false, the following will not fail.
+		 */
+		(void)telem_cntr_group_toggle(hw, false, false);
+	}
+	hw->telemetry.info = NULL;
+}
+
+/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
diff --git a/drivers/net/ethernet/hpe/ss1/cass_uc.c b/drivers/net/ethernet/hpe/ss1/cass_uc.c
new file mode 100644
index 000000000000..53dea4a25f82
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cass_uc.c
@@ -0,0 +1,1933 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019-2021 Hewlett Packard Enterprise Development LP */
+
+/* Communication with embedded µC
+ *
+ * The driver prepares a message with a command and signals the
+ * µC. When the µC has processed the command, it raises
+ * C_PI_ERR_FLG.UC_ATTENTION[0]. The callback the driver has
+ * registered for these bits signals a completion, and the response
+ * can be processed.
+ *
+ * C_PI_ERR_FLG.UC_ATTENTION[1] is used for asynchronous events, like
+ * cable status change.
+ *
+ * The uc_mbox_mutex protects the uc_req and uc_resp buffers, as well
+ * as the communication.
+ */
+
+#include <linux/workqueue.h>
+#include <linux/firmware.h>
+#include <linux/delay.h>
+#include <linux/etherdevice.h>
+#include <linux/iopoll.h>
+
+#include "cass_core.h"
+#include "cass_cable.h"
+#include "cass_ss1_debugfs.h"
+
+/* Reserved DMAC registers for communication.
+ * Range is [FIRST, FIRST+16)
+ */
+#define HOST_TO_UC_FIRST 992
+#define UC_TO_HOST_FIRST 1008
+
+/* When the driver sends several commands in a row, it is possible it
+ * processes a response and starts a new request before the error code
+ * has cleared the uc_attention bit. When that happens, the response
+ * from the uC won't raise a new uc_interrupt and the response will
+ * not be seen, leading to a timeout. Make sure the uC will actually
+ * be able to raise an interrupt before sending the next command.
+ */
+static int wait_for_uc(struct cass_dev *hw)
+{
+	union c_pi_err_flg err_flg;
+	void __iomem *csr;
+	int ret;
+
+	csr = cass_csr(hw, C_PI_ERR_FLG);
+	ret = readq_poll_timeout(csr, err_flg.qw, (err_flg.uc_attention & 1) == 0,
+				 1, 5 * MSEC_PER_SEC);
+
+	cxidev_WARN_ONCE(&hw->cdev, ret, "Timeout waiting for uc_attention to be ack'ed");
+
+	return ret;
+}
+
+/* Common command initialization */
+void uc_prepare_comm(struct cass_dev *hw)
+{
+	/* Clear the uC to host buffer (C_PI_CFG_DMAC_DESC[1008:1023]) */
+	memset(&hw->uc_req, 0, sizeof(hw->uc_req));
+	memset(&hw->uc_resp, 0, sizeof(hw->uc_resp));
+	cass_write(hw, C_PI_CFG_DMAC_DESC(UC_TO_HOST_FIRST),
+		   &hw->uc_resp, sizeof(hw->uc_resp));
+	reinit_completion(&hw->uc_attention0_comp);
+}
+
+/* Signal a new command is ready, and wait for the µC to raise
+ * UC_ATTENTION[0] of C_PI_ERR_FLAG.
+ *
+ * Return 0 if the response is valid, or a negative errno on error.
+ */
+int uc_wait_for_response(struct cass_dev *hw)
+{
+	static const union c_hni_uc_sbr_intr srb_intr = {
+		.send_sbr_dis = 1,
+		.intr = 1,
+	};
+	int rc;
+
+	rc = wait_for_uc(hw);
+	if (rc)
+		return rc;
+
+	hw->uc_req.type = CUC_TYPE_REQ;
+
+	/* Write the request and ring the doorbell */
+	cass_write(hw, C_PI_CFG_DMAC_DESC(HOST_TO_UC_FIRST),
+		   &hw->uc_req, sizeof(hw->uc_req));
+	cass_write(hw, C_HNI_UC_SBR_INTR, &srb_intr, sizeof(srb_intr));
+	cass_flush_pci(hw);
+
+	rc = wait_for_completion_interruptible_timeout(&hw->uc_attention0_comp,
+						       20 * HZ);
+	if (rc == 0)
+		return -ETIMEDOUT;
+	else if (rc < 0)
+		return rc;
+
+	/* Read the response */
+	cass_read(hw, C_PI_CFG_DMAC_DESC(UC_TO_HOST_FIRST),
+		  &hw->uc_resp, sizeof(hw->uc_resp));
+
+	switch (hw->uc_resp.type) {
+	case CUC_TYPE_RSP_SUCCESS:
+		rc = 0;
+		break;
+	case CUC_TYPE_RSP_ERROR: {
+		struct cuc_error_rsp_data *rsp_data =
+			(struct cuc_error_rsp_data *)hw->uc_resp.data;
+		rc = -rsp_data->error;
+		if (rc == 0) {
+			/* Be paranoid for now. Should not happen. */
+			cxidev_warn_once(&hw->cdev, "Got error code 0 from uC\n");
+			rc = -EIO;
+		}
+		break;
+	}
+	default:
+		/* Be paranoid for now. Should not happen. */
+		cxidev_warn_once(&hw->cdev, "Unexpected uC response type %u\n",
+				 hw->uc_resp.type);
+		rc = -EIO;
+	}
+
+	return rc;
+}
+
+/* Get the firmware version for the given target */
+static void uc_cmd_get_fw_version(struct cass_dev *hw, unsigned int fw_target)
+{
+	struct device *dev = &hw->cdev.pdev->dev;
+	struct cuc_get_firmware_version_req *req_data =
+		(struct cuc_get_firmware_version_req *)hw->uc_req.data;
+	int rc;
+
+	if (!hw->uc_present)
+		return;
+
+	if (fw_target >= ARRAY_SIZE(hw->fw_versions))
+		return;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_FIRMWARE_VERSION;
+	hw->uc_req.count = 1 + sizeof(*req_data);
+	req_data->nic = CUC_MAC_THIS_NIC;
+	req_data->fw_target = fw_target;
+	req_data->from_flash = 0;
+	req_data->slot = FW_SLOT_ACTIVE;
+
+	rc = uc_wait_for_response(hw);
+	if (rc) {
+		cxidev_err(&hw->cdev,
+			   "uC failed to return FW info for target %d: %d\n",
+			   fw_target, rc);
+		goto done;
+	}
+
+	if (hw->fw_versions[fw_target]) {
+		devm_kfree(dev, hw->fw_versions[fw_target]);
+		hw->fw_versions[fw_target] = NULL;
+	}
+
+	hw->fw_versions[fw_target] =
+		devm_kasprintf(dev, GFP_KERNEL, "%.*s",
+			       hw->uc_resp.count, hw->uc_resp.data);
+
+	/* Target 2 is the main firmware version. */
+	if (fw_target == 2 && hw->fw_versions[fw_target])
+		cxidev_info(&hw->cdev, "uC firmware version %s\n",
+			    hw->fw_versions[fw_target]);
+
+done:
+	mutex_unlock(&hw->uc_mbox_mutex);
+}
+
+/* Get the various uC firmware versions */
+static void uc_cmd_get_fw_versions(struct cass_dev *hw)
+{
+	uc_cmd_get_fw_version(hw, FW_UC_APPLICATION);
+	uc_cmd_get_fw_version(hw, FW_UC_BOOTLOADER);
+	uc_cmd_get_fw_version(hw, FW_QSPI_BLOB);
+	if (cass_version(hw, CASSINI_1))
+		uc_cmd_get_fw_version(hw, FW_OPROM);
+	uc_cmd_get_fw_version(hw, FW_CSR1);
+	uc_cmd_get_fw_version(hw, FW_CSR2);
+	uc_cmd_get_fw_version(hw, FW_SRDS);
+}
+
+/* Get the NIC ID */
+int uc_cmd_get_nic_id(struct cass_dev *hw)
+{
+	const struct cuc_get_nic_id_rsp *rsp_data =
+		(struct cuc_get_nic_id_rsp *)hw->uc_resp.data;
+	int rc;
+
+	if (!hw->uc_present)
+		return -ENOTSUPP;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_GET_NIC_ID;
+	hw->uc_req.count = 1;
+
+	rc = uc_wait_for_response(hw);
+	if (!rc)
+		hw->uc_nic = rsp_data->nic;
+	else
+		cxidev_err(&hw->cdev, "uC failed to return the NIC ID: %d\n", rc);
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return rc;
+}
+
+/* Get the MAC address */
+int uc_cmd_get_mac(struct cass_dev *hw)
+{
+	struct cuc_mac_req_data *req_data =
+		(struct cuc_mac_req_data *)hw->uc_req.data;
+	const struct cuc_mac_rsp_data *rsp_data =
+		(struct cuc_mac_rsp_data *)hw->uc_resp.data;
+	int rc;
+
+	if (!hw->uc_present)
+		return -ENOTSUPP;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_GET_MAC;
+	hw->uc_req.count = sizeof(struct cuc_mac_req_data) + 1;
+	req_data->nic = CUC_MAC_THIS_NIC;
+
+	rc = uc_wait_for_response(hw);
+	if (!rc) {
+		ether_addr_copy(hw->default_mac_addr, rsp_data->nic_mac);
+	} else {
+		if (rc == -ENOENT)
+			cxidev_err(&hw->cdev,
+				   "MAC address not yet programmed in uC\n");
+		else
+			cxidev_err(&hw->cdev,
+				   "uC failed to return the MAC info: %d\n",
+				   rc);
+	}
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return rc;
+}
+
+static void decode_fru_field_info(struct cass_dev *hw,
+				  const struct pldm_fru_field *fru_field)
+{
+	struct device *dev = &hw->cdev.pdev->dev;
+
+	if (fru_field->field_type == 0 ||
+	    fru_field->field_type > PLDM_FRU_FIELD_VENDOR_IANA) {
+		cxidev_info(&hw->cdev, "Unsupported FRU field type %u\n",
+			    fru_field->field_type);
+		return;
+	}
+
+	/* All supported fields are strings except two */
+	if (fru_field->field_type == PLDM_FRU_FIELD_MANUFACTURE_DATE) {
+		hw->fru_info[fru_field->field_type] = devm_kasprintf(
+			dev, GFP_KERNEL, "%04u:%02u:%02u:%02u:%02u:%02u",
+			*(u16 *)&fru_field->value[10], fru_field->value[9],
+			fru_field->value[8], fru_field->value[7],
+			fru_field->value[6], fru_field->value[5]);
+	} else if (fru_field->field_type == PLDM_FRU_FIELD_VENDOR_IANA) {
+		hw->fru_info[fru_field->field_type] = devm_kasprintf(
+			dev, GFP_KERNEL, "%x", *(u32 *)fru_field->value);
+	} else {
+		hw->fru_info[fru_field->field_type] = devm_kasprintf(
+			dev, GFP_KERNEL, "%.*s", fru_field->length,
+			fru_field->value);
+	}
+}
+
+static void decode_fru_info(struct cass_dev *hw)
+{
+	const struct pldm_fru_record *fru;
+	const struct pldm_fru_field *fru_field;
+	int len = hw->uc_resp.count - 1;
+	unsigned int fru_num;
+
+	if (len > CUC_DATA_BYTES) {
+		cxidev_err(&hw->cdev, "uC returned length too big\n");
+		return;
+	}
+
+	len -= sizeof(struct pldm_fru_record);
+	if (len < 0) {
+		cxidev_err(&hw->cdev, "uC returned invalid FRU length\n");
+		return;
+	}
+
+	fru = (struct pldm_fru_record *)hw->uc_resp.data;
+
+	if (fru->record_type != PLDM_FRU_RECORD_GENERAL) {
+		cxidev_err(&hw->cdev, "uC returned unknown record type %x\n",
+			   fru->record_type);
+		return;
+	}
+
+	fru_field = (const struct pldm_fru_field *)fru->field_data;
+	for (fru_num = 0; fru_num < fru->num_fields; fru_num++) {
+		len -= sizeof(struct pldm_fru_field);
+		if (len < 0) {
+			cxidev_err(&hw->cdev,
+				   "uC returned invalid FRU field header length\n");
+			return;
+		}
+		len -= fru_field->length;
+		if (len < 0) {
+			cxidev_err(&hw->cdev,
+				   "uC returned invalid FRU field length\n");
+			return;
+		}
+
+		decode_fru_field_info(hw, fru_field);
+
+		fru_field = (const struct pldm_fru_field *)
+			(((uintptr_t)(fru_field + 1)) + fru_field->length);
+	}
+}
+
+/* Get the FRU information */
+int uc_cmd_get_fru(struct cass_dev *hw)
+{
+	int rc;
+
+	if (HW_PLATFORM_Z1(hw)) {
+		/* Add needed info for libcxi to run. */
+		hw->fru_info[PLDM_FRU_FIELD_DESCRIPTION] =
+			devm_kasprintf(&hw->cdev.pdev->dev, GFP_KERNEL, "Z1");
+		return 0;
+	}
+
+	if (!hw->uc_present)
+		return -ENOTSUPP;
+
+	if (hw->fru_info_valid)
+		return 0;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_GET_FRU;
+	hw->uc_req.count = 1;
+
+	rc = uc_wait_for_response(hw);
+	if (!rc) {
+		hw->fru_info_valid = true;
+		decode_fru_info(hw);
+	} else {
+		cxidev_err(&hw->cdev,
+			   "uC failed to return the FRU info: %d\n", rc);
+	}
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+	return rc;
+}
+
+/* Read QSFP eeprom data for a given page */
+int cxi_get_qsfp_data(struct cxi_dev *cdev, u32 offset, u32 len, u32 page, u8 *data)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cuc_qsfp_read_req_data *req_data =
+		(struct cuc_qsfp_read_req_data *)hw->uc_req.data;
+	const struct cuc_qsfp_read_rsp_data *rsp_data =
+		(struct cuc_qsfp_read_rsp_data *)hw->uc_resp.data;
+	int ret_len = len;
+	int rc;
+
+	if (!hw->uc_present ||
+	    (hw->uc_platform != CUC_BOARD_TYPE_BRAZOS &&
+	     hw->uc_platform != CUC_BOARD_TYPE_KENNEBEC &&
+	     hw->uc_platform != CUC_BOARD_TYPE_SOUHEGAN &&
+	     !HW_PLATFORM_NETSIM(hw)))
+		return -ENOMEDIUM;
+
+	if (hw->uc_i2c_locked)
+		return -EBUSY;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	/* Read up to 128 bytes at a time, since the CUC command can
+	 * only return up to 253 bytes.
+	 */
+	while (len) {
+		u32 to_read = min_t(u32, len, 128);
+
+		uc_prepare_comm(hw);
+
+		hw->uc_req.cmd = CUC_CMD_QSFP_READ;
+		hw->uc_req.count = sizeof(struct cuc_qsfp_read_req_data) + 1;
+		req_data->nic = CUC_MAC_THIS_NIC;
+		req_data->page = page;
+		req_data->addr = offset;
+		req_data->count = to_read;
+
+		rc = uc_wait_for_response(hw);
+		if (!rc) {
+			memcpy(data, rsp_data, to_read);
+		} else {
+			mutex_unlock(&hw->uc_mbox_mutex);
+			cxidev_err(cdev,
+				   "uC failed to read the cable eeprom page %u offset %u length %u: %d\n",
+				   page, offset, to_read, rc);
+			return -EIO;
+		}
+
+		len -= to_read;
+		offset += to_read;
+		data += to_read;
+	}
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return ret_len;
+}
+EXPORT_SYMBOL(cxi_get_qsfp_data);
+
+/* Read the cable module information. Assume it's a SFF-8436 /
+ * SFF-8636 type, with 256-bytes eeprom pages.
+ */
+#define SFF_8436_STATUS_2_OFFSET           0x02
+#define     CMIS_PAGE_01_PRESENT           BIT(7)
+static void uc_update_cable_info(struct cass_dev *hw)
+{
+	int ret;
+
+	mutex_lock(&hw->qsfp_eeprom_lock);
+	hw->qsfp_eeprom_page_len = 0;
+	mutex_unlock(&hw->qsfp_eeprom_lock);
+
+	ret = cxi_get_qsfp_data(&hw->cdev, 0, ETH_MODULE_SFF_8436_LEN,
+				0, &hw->qsfp_eeprom_page0[0]);
+	if (ret != ETH_MODULE_SFF_8436_LEN)
+		return;
+
+	mutex_lock(&hw->qsfp_eeprom_lock);
+	hw->qsfp_eeprom_page_len = ETH_MODULE_SFF_8436_LEN;
+	mutex_unlock(&hw->qsfp_eeprom_lock);
+
+	if ((hw->qsfp_eeprom_page0[QSFP_IDENTIFIER_OFFSET] >= 0x1E) &&
+	    (hw->qsfp_eeprom_page0[QSFP_IDENTIFIER_OFFSET] <= 0x25)) {
+		if (((hw->qsfp_eeprom_page0[QSFP_REV_CMPL_OFFSET] & 0xF0) == 0x30) ||
+		    ((hw->qsfp_eeprom_page0[QSFP_REV_CMPL_OFFSET] & 0xF0) == 0x40) ||
+		    ((hw->qsfp_eeprom_page0[QSFP_REV_CMPL_OFFSET] & 0xF0) == 0x50)) {
+			if (hw->qsfp_eeprom_page0[SFF_8436_STATUS_2_OFFSET] & CMIS_PAGE_01_PRESENT) {
+				cxidev_dbg(&hw->cdev, "no eeprom page 1\n");
+				return;
+			}
+
+			ret = cxi_get_qsfp_data(&hw->cdev, 0, ETH_MODULE_SFF_8436_LEN,
+						1, &hw->qsfp_eeprom_page1[0]);
+			if (ret != ETH_MODULE_SFF_8436_LEN)
+				cxidev_dbg(&hw->cdev, "couldn't read eeprom page 1: %d\n", ret);
+		}
+	}
+}
+
+/* Write to the QSFP module - CUC_CMD_QSFP_WRITE */
+int uc_cmd_qsfp_write(struct cass_dev *hw, u8 page, u8 addr,
+		      const u8 *data, size_t data_len)
+{
+	struct cuc_qsfp_write_req_data *req_data =
+		(struct cuc_qsfp_write_req_data *)hw->uc_req.data;
+	int rc;
+
+	if (!hw->uc_present)
+		return -EIO;
+
+	if (hw->uc_i2c_locked)
+		return -EBUSY;
+
+	if (data_len > ETH_MODULE_SFF_8436_LEN)
+		return -EINVAL;
+
+	if (addr + data_len > ETH_MODULE_SFF_8436_LEN)
+		return -EINVAL;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	while (data_len) {
+		size_t to_write = data_len;
+		const size_t max_data_size =
+			CUC_DATA_BYTES - sizeof(struct cuc_qsfp_write_req_data);
+
+		/* If the data is too big, write 128 bytes, then the
+		 * remainder in a second request.
+		 */
+		if (to_write > max_data_size)
+			to_write = ETH_MODULE_SFF_8436_LEN / 2;
+
+		uc_prepare_comm(hw);
+
+		hw->uc_req.cmd = CUC_CMD_QSFP_WRITE;
+		hw->uc_req.count = sizeof(struct cuc_qsfp_write_req_data) +
+			to_write + 1;
+		req_data->nic = CUC_MAC_THIS_NIC;
+		req_data->page = page;
+		req_data->addr = addr;
+		req_data->count = to_write;
+		memcpy(req_data->data, data, to_write);
+
+		rc = uc_wait_for_response(hw);
+		if (rc) {
+			mutex_unlock(&hw->uc_mbox_mutex);
+
+			cxidev_err(&hw->cdev,
+				   "uC failed to write QSFP data: %d\n", rc);
+			return rc;
+		}
+
+		data += to_write;
+		data_len -= to_write;
+	}
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return 0;
+}
+
+/* Return the ISR */
+static u32 uc_cmd_get_intr_locked(struct cass_dev *hw)
+{
+	struct cuc_get_intr_req_data *req_data =
+		(struct cuc_get_intr_req_data *)hw->uc_req.data;
+	const struct cuc_get_intr_rsp_data *rsp_data =
+		(struct cuc_get_intr_rsp_data *)hw->uc_resp.data;
+	int rc;
+	u32 isr;
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_GET_INTR;
+	hw->uc_req.count = sizeof(*req_data) + 1;
+	req_data->nic = CUC_MAC_THIS_NIC;
+
+	rc = uc_wait_for_response(hw);
+	if (!rc)
+		isr = rsp_data->isr;
+	else
+		isr = 0;
+
+	return isr;
+}
+
+static u32 uc_cmd_get_intr(struct cass_dev *hw)
+{
+	u32 isr;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+	isr = uc_cmd_get_intr_locked(hw);
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return isr;
+}
+
+/* CUC_CMD_CLEAR_INTR */
+static void uc_cmd_clear_intr_locked(struct cass_dev *hw, u32 isr)
+{
+	struct cuc_clear_isr_req_data *req_data =
+		(struct cuc_clear_isr_req_data *)hw->uc_req.data;
+	int rc;
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_CLEAR_ISR;
+	hw->uc_req.count = sizeof(*req_data) + 1;
+
+	req_data->nic = CUC_MAC_THIS_NIC;
+	req_data->isr_clear_bits = isr;
+
+	rc = uc_wait_for_response(hw);
+	if (rc)
+		cxidev_err(&hw->cdev, "Failed to clear the uC interrupt: %d\n", rc);
+}
+
+static void uc_cmd_clear_intr(struct cass_dev *hw, u32 isr)
+{
+	mutex_lock(&hw->uc_mbox_mutex);
+	uc_cmd_clear_intr_locked(hw, isr);
+	mutex_unlock(&hw->uc_mbox_mutex);
+}
+
+/* CUC_CMD_UPDATE_IER */
+void uc_cmd_update_ier(struct cass_dev *hw, u32 set_bits, u32 clear_bits)
+{
+	struct cuc_update_ier_req_data *req_data =
+		(struct cuc_update_ier_req_data *)hw->uc_req.data;
+	int rc;
+
+	if (!hw->uc_present)
+		return;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_UPDATE_IER;
+	hw->uc_req.count = sizeof(*req_data) + 1;
+
+	req_data->nic = CUC_MAC_THIS_NIC;
+	req_data->ier_set_bits = set_bits;
+	req_data->ier_clear_bits = clear_bits;
+
+	rc = uc_wait_for_response(hw);
+	if (rc)
+		cxidev_err(&hw->cdev, "Failed to update the uC IER: %d\n", rc);
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+}
+
+void uc_cmd_set_link_leds(struct cass_dev *hw, enum casuc_led_states led_state)
+{
+	struct cuc_set_led_req *req_data =
+		(struct cuc_set_led_req *)hw->uc_req.data;
+	int rc;
+
+	if (!hw->uc_present)
+		return;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_SET_LED;
+	hw->uc_req.count = sizeof(*req_data) + 1;
+
+	req_data->nic = CUC_MAC_THIS_NIC;
+	req_data->led = LED_LINK_STATUS;
+	req_data->state = led_state;
+
+	rc = uc_wait_for_response(hw);
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	if (rc)
+		cxidev_err(&hw->cdev, "Failed to set the link LED to %d: %d\n",
+			   led_state, rc);
+}
+
+/**
+ * cxi_program_firmware()
+ *
+ * Flash the uC firmware, reboots it and wait until it's back up. It
+ * is expected that the whole procedure would not last more than 30
+ * seconds.
+ *
+ * @cdev: CXI device
+ * @fw: a firmware returned by request_firmware()
+ *
+ * Returns 0 on success, or a negative errno.
+ *
+ */
+int cxi_program_firmware(struct cxi_dev *cdev, const struct firmware *fw)
+{
+	struct cass_dev *hw = container_of(cdev, struct cass_dev, cdev);
+	struct cuc_firmware_update_start_req *req_start =
+		(struct cuc_firmware_update_start_req *)hw->uc_req.data;
+	struct cuc_firmware_update_download_req *req_download =
+		(struct cuc_firmware_update_download_req *)hw->uc_req.data;
+	struct cuc_firmware_update_status_rsp *status =
+		(struct cuc_firmware_update_status_rsp *)hw->uc_resp.data;
+	size_t len_left;
+	size_t to_send;
+	const u8 *data;
+	int rc;
+	ktime_t timeout;
+
+	if (!hw->uc_present) {
+		cxidev_info(cdev, "uC is not supported\n");
+		return -EIO;
+	}
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!cdev->is_physfn) {
+		cxidev_err(cdev, "Cannot flash Cassini firmware from a VF\n");
+		return -EINVAL;
+	}
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_FIRMWARE_UPDATE_START;
+	hw->uc_req.count = 1 + sizeof(*req_start);
+
+	req_start->nic = CUC_MAC_THIS_NIC;
+	req_start->size = fw->size;
+	req_start->slot = FW_SLOT_ACTIVE;
+
+	rc = uc_wait_for_response(hw);
+	if (rc) {
+		cxidev_err(cdev, "Cannot start firmware flashing: %d\n", rc);
+		goto done;
+	}
+
+	/* Upload the firmware by tiny chunks */
+	len_left = fw->size;
+	data = fw->data;
+	while (len_left) {
+		to_send = min_t(size_t, CUC_DATA_BYTES - sizeof(*req_download),
+				len_left);
+
+		uc_prepare_comm(hw);
+
+		hw->uc_req.cmd = CUC_CMD_FIRMWARE_UPDATE_DOWNLOAD;
+		hw->uc_req.count = 1 + sizeof(*req_download) + to_send;
+
+		memcpy(req_download->data, data, to_send);
+		len_left -= to_send;
+		data += to_send;
+
+		rc = uc_wait_for_response(hw);
+		if (rc) {
+			cxidev_err(cdev, "Cannot upload firmware to uC: %d\n",
+				   rc);
+			goto done;
+		}
+	}
+
+	/* Wait until idle. Flashing should not take more than 30
+	 * seconds. Set the timeout to 130 seconds.
+	 */
+	timeout = ktime_add_ms(ktime_get(), 130 * MSEC_PER_SEC);
+	while (1) {
+		uc_prepare_comm(hw);
+
+		hw->uc_req.cmd = CUC_CMD_FIRMWARE_UPDATE_STATUS;
+		hw->uc_req.count = 1;
+
+		rc = uc_wait_for_response(hw);
+		if (rc) {
+			cxidev_err(cdev,
+				   "Cannot get firmware status from uC: %d\n",
+				   rc);
+			goto done;
+		}
+
+		if (status->status & FWU_STATUS_IDLE) {
+			if (status->status != FWU_STATUS_SUCCESS) {
+				cxidev_err(cdev,
+					   "Firmware flashing failed: 0x%x\n",
+					   status->status);
+				rc = -EIO;
+				goto done;
+			} else {
+				cxidev_info(cdev,
+					    "Firmware flashing succeeded\n");
+				break;
+			}
+		}
+
+		if (ktime_after(ktime_get(), timeout)) {
+			cxidev_err(cdev,
+				   "uC took too long to flash the new firmware\n");
+			rc = -EIO;
+			goto done;
+		}
+
+		mdelay(100);
+	}
+
+	/* Clear the reset bit just in case */
+	uc_cmd_clear_intr_locked(hw, ATT1_UC_RESET);
+
+	/* Reset the uC */
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_RESET;
+	hw->uc_req.count = 1;
+
+	rc = uc_wait_for_response(hw);
+	if (rc) {
+		cxidev_err(cdev, "uC didn't want to reset after flashing: %d\n",
+			   rc);
+		rc = -EIO;
+		goto done;
+	}
+
+	/* Poll the uC until the reset bit is set. Reset should take
+	 * about 2 seconds, but may take as long as 90 seconds if the partner
+	 * node is flashing the other NIC. Set the timeout to 120 seconds.
+	 */
+	timeout = ktime_add_ms(ktime_get(), 120 * MSEC_PER_SEC);
+	while (1) {
+		u32 isr;
+
+		isr = uc_cmd_get_intr_locked(hw);
+
+		if (isr & ATT1_UC_RESET)
+			break;
+
+		if (ktime_after(ktime_get(), timeout)) {
+			rc = -ETIMEDOUT;
+			cxidev_err(cdev, "uC took too long to reset\n");
+			goto done;
+		}
+
+		mdelay(100);
+	}
+
+	rc = 0;
+
+done:
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	if (!rc)
+		uc_cmd_get_fw_versions(hw);
+
+	return rc;
+}
+EXPORT_SYMBOL(cxi_program_firmware);
+
+/* Called when one of the C_PI_ERR_FLG.UC_ATTENTION bits was set */
+static void uc_attention_cb(struct cass_dev *hw, unsigned int irq,
+			    bool is_ext, unsigned int bitn)
+{
+	if (bitn == C_PI_ERR_FLG__UC_ATTENTION_0)
+		complete(&hw->uc_attention0_comp);
+
+	if (bitn == C_PI_ERR_FLG__UC_ATTENTION_1)
+		queue_work(hw->uc_attn1_wq, &hw->uc_attn1_work);
+}
+
+static ssize_t show_fw_version(struct kobject *kobj, char *buf,
+			       unsigned int fw_target)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, uc_kobj);
+	int rc;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	if (hw->fw_versions[fw_target])
+		rc = scnprintf(buf, PAGE_SIZE, "%s\n",
+			       hw->fw_versions[fw_target]);
+	else
+		rc = 0;
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return rc;
+}
+
+#define FW_VERSION_ATTR(name, target_fw) \
+	static ssize_t name##_show(struct kobject *kobj, \
+				  struct kobj_attribute *kattr, char *buf) \
+	{								\
+		return show_fw_version(kobj, buf, target_fw);		\
+	}								\
+	static struct kobj_attribute dev_attr_##name = __ATTR_RO(name)
+
+FW_VERSION_ATTR(app_version, FW_UC_APPLICATION);
+FW_VERSION_ATTR(bootloader_version, FW_UC_BOOTLOADER);
+FW_VERSION_ATTR(qspi_blob_version, FW_QSPI_BLOB);
+FW_VERSION_ATTR(oprom_version, FW_OPROM);
+FW_VERSION_ATTR(csr1_version, FW_CSR1);
+FW_VERSION_ATTR(csr2_version, FW_CSR2);
+FW_VERSION_ATTR(srds_version, FW_SRDS);
+
+/* Reset the uC through sysfs. As a safety measure, the user must
+ * write '1789' to it.
+ */
+static ssize_t reset_store(struct kobject *kobj, struct kobj_attribute *attr,
+			   const char *buf, size_t len)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, uc_kobj);
+	int rc;
+	int value;
+
+	rc = kstrtoint(buf, 0, &value);
+	if (rc)
+		return rc;
+
+	if (value != 1789)
+		return -EINVAL;
+
+	if (!hw->uc_present)
+		return 0;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_RESET;
+	hw->uc_req.count = 1;
+
+	rc = uc_wait_for_response(hw);
+	if (rc)
+		cxidev_err(&hw->cdev, "uC didn't want to reset: %d\n", rc);
+	else
+		rc = len;
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return rc;
+}
+
+static struct kobj_attribute dev_attr_reset = __ATTR_WO(reset);
+
+static ssize_t timings_show(struct kobject *kobj,
+			    struct kobj_attribute *kattr, char *buf)
+{
+	struct cass_dev *hw =
+		container_of(kobj, struct cass_dev, uc_kobj);
+	const struct cuc_get_timings_rsp *rsp_data =
+		(struct cuc_get_timings_rsp *)hw->uc_resp.data;
+	int rc;
+	int i;
+
+	if (!hw->uc_present)
+		return -ENODATA;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_GET_TIMINGS;
+	hw->uc_req.count = 1;
+
+	rc = uc_wait_for_response(hw);
+	if (rc) {
+		cxidev_err(&hw->cdev, "uC didn't return its timings: %d\n", rc);
+	} else {
+		rc = 0;
+		for (i = 0; i < TIMING_NUM_ENTRIES; i++) {
+			rc += scnprintf(buf + rc, PAGE_SIZE - rc, "%llu ",
+					rsp_data->entries_us[i]);
+		}
+		rc += scnprintf(buf + rc, PAGE_SIZE - rc, "\n");
+	}
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return rc;
+}
+
+static struct kobj_attribute dev_attr_timings = __ATTR_RO(timings);
+
+static struct attribute *uc_attrs[] = {
+	&dev_attr_app_version.attr,
+	&dev_attr_bootloader_version.attr,
+	&dev_attr_qspi_blob_version.attr,
+	&dev_attr_oprom_version.attr,
+	&dev_attr_csr1_version.attr,
+	&dev_attr_csr2_version.attr,
+	&dev_attr_srds_version.attr,
+	&dev_attr_reset.attr,
+	&dev_attr_timings.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(uc);
+
+static struct kobj_type uc_sysfs_entries = {
+	.sysfs_ops      = &kobj_sysfs_ops,
+	.default_groups = uc_groups,
+};
+
+/* Retrieve a PDR given a record handle.
+ * Used for PDR iteration.
+ *
+ * The uC must be locked.
+ */
+static int pldm_get_pdr(struct cass_dev *hw, unsigned int record_handle)
+{
+	struct get_pdr_req *req_data =
+		(struct get_pdr_req *)hw->uc_req.data;
+	int rc;
+
+	if (!hw->uc_present)
+		return -ENOTSUPP;
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_PLDM;
+	hw->uc_req.count = sizeof(*req_data) + 1;
+
+	req_data->hdr.d = 0;
+	req_data->hdr.rq = 1;
+	req_data->hdr.pldm_type = PLDM_TYPE_PLATFORM_MONITORING_AND_CONTROL;
+	req_data->hdr.hdr_ver = 0;
+	req_data->hdr.pldm_command_code = PLDM_CMD_GET_PDR;
+	req_data->record_handle = record_handle;
+	req_data->data_transfer_handle = 0;
+	req_data->transfer_operation_flag = PLDM_XFER_OP_GET_FIRST_PART;
+	req_data->request_count = CUC_DATA_BYTES - sizeof(struct get_pdr_rsp);
+	req_data->record_change_number = 0;
+
+	rc = uc_wait_for_response(hw);
+
+	return rc;
+}
+
+/* Iterate through the PDR building an IDR tree of supported
+ * sensors.
+ */
+static void iterate_pdr(struct cass_dev *hw)
+{
+	unsigned int record_handle;
+	const struct get_pdr_rsp *rsp_data =
+		(struct get_pdr_rsp *)hw->uc_resp.data;
+	const struct pdr_hdr *pdr_hdr = (struct pdr_hdr *)rsp_data->record_data;
+	int rc;
+	struct pldm_sensor *sensor;
+	unsigned int count = 0;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	/* Get the numerical sensors first */
+	record_handle = 0;
+	do {
+		const struct numeric_sensor_pdr *pdr_sensor =
+			(struct numeric_sensor_pdr *)rsp_data->record_data;
+
+		rc = pldm_get_pdr(hw, record_handle);
+		if (rc)
+			break;
+
+		if (rsp_data->completion_code != PLDM_SUCCESS) {
+			cxidev_err(&hw->cdev,
+				   "Unexpected PLDM completion error: %d\n",
+				   rsp_data->completion_code);
+			break;
+		}
+
+		record_handle = rsp_data->next_record_handle;
+
+		if (pdr_hdr->pdr_type != PLDM_PDR_NUMERIC_SENSOR)
+			continue;
+
+		sensor = kzalloc(sizeof(struct pldm_sensor), GFP_KERNEL);
+		if (!sensor)
+			break;
+
+		sensor->hw = hw;
+		sensor->id = pdr_sensor->sensor_id;
+		sensor->num = *pdr_sensor;
+
+		idr_preload(GFP_KERNEL);
+		rc = idr_alloc(&hw->pldm_sensors, sensor,
+			       sensor->num.sensor_id, sensor->num.sensor_id + 1,
+			       GFP_NOWAIT);
+		idr_preload_end();
+
+		count++;
+	} while (record_handle != 0);
+
+	/* Then get their names */
+	record_handle = 0;
+	do {
+		const struct aux_name_pdr *pdr_name =
+			(struct aux_name_pdr *)rsp_data->record_data;
+		int i;
+
+		rc = pldm_get_pdr(hw, record_handle);
+		if (rc)
+			break;
+
+		if (rsp_data->completion_code != PLDM_SUCCESS) {
+			cxidev_err(&hw->cdev,
+				   "Unexpected PLDM completion error: %d\n",
+				   rsp_data->completion_code);
+			break;
+		}
+
+		record_handle = rsp_data->next_record_handle;
+
+		if (pdr_hdr->pdr_type != PLDM_PDR_SENSOR_AUXILIARY_NAMES)
+			continue;
+
+		sensor = idr_find(&hw->pldm_sensors, pdr_name->sensor_id);
+		if (!sensor)
+			continue;
+
+		if (pdr_name->name_string_count != 1) {
+			cxidev_err(&hw->cdev,
+				   "Unexpected number of strings: %d\n",
+				   pdr_name->name_string_count);
+			continue;
+		}
+
+		/* Name is in big endian UTF-16. Convert to ASCII. */
+		for (i = 0; i < AUX_NAME_MAX; i++) {
+			u16 c = be16_to_cpu((__force __be16)pdr_name->sensor_name[i]);
+
+			if (c == 0)
+				break;
+
+			if (c < ' ' || c > '~')
+				c = '.';
+
+			sensor->name[i] = c;
+		}
+		sensor->name[AUX_NAME_MAX - 1] = 0;
+	} while (record_handle != 0);
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	hw->pldm_sensors_count = count;
+}
+
+/* Read a PLDM sensor, given a sensor ID.
+ *
+ * uc_mbox_mutex must be held.
+ *
+ * Return 0 if the sensor was successfully read.
+ */
+static int pldm_read_sensor(struct cass_dev *hw, unsigned int id,
+			    struct pldm_sensor_reading *result)
+{
+	struct get_sensor_reading_req *req_data =
+		(struct get_sensor_reading_req *)hw->uc_req.data;
+	const struct get_sensor_reading_rsp *rsp_data =
+		(struct get_sensor_reading_rsp *)hw->uc_resp.data;
+	int rc;
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_PLDM;
+	hw->uc_req.count = sizeof(*req_data) + 1;
+
+	req_data->hdr.d = 0;
+	req_data->hdr.rq = 1;
+	req_data->hdr.pldm_type = PLDM_TYPE_PLATFORM_MONITORING_AND_CONTROL;
+	req_data->hdr.hdr_ver = 0;
+	req_data->hdr.pldm_command_code = PLDM_CMD_GET_SENSOR_READING;
+	req_data->sensor_id = id;
+	req_data->rearm_event_status = 0;
+
+	rc = uc_wait_for_response(hw);
+	if (rc)
+		goto out;
+
+	if (rsp_data->completion_code != PLDM_SUCCESS) {
+		rc = -EIO;
+		goto out;
+	}
+
+	result->operational_state = rsp_data->sensor_operational_state;
+	result->present_state = rsp_data->present_state;
+	result->previous_state = rsp_data->previous_state;
+	rc = 0;
+	switch (rsp_data->sensor_data_size) {
+	case PLDM_DATA_SIZE_UINT8:
+		result->present_reading = rsp_data->present_reading.value_UINT8;
+		break;
+	case PLDM_DATA_SIZE_SINT8:
+		result->present_reading = rsp_data->present_reading.value_SINT8;
+		break;
+	case PLDM_DATA_SIZE_UINT16:
+		result->present_reading = rsp_data->present_reading.value_UINT16;
+		break;
+	case PLDM_DATA_SIZE_SINT16:
+		result->present_reading = rsp_data->present_reading.value_SINT16;
+		break;
+	case PLDM_DATA_SIZE_UINT32:
+		result->present_reading = rsp_data->present_reading.value_UINT32;
+		break;
+	case PLDM_DATA_SIZE_SINT32:
+		result->present_reading = rsp_data->present_reading.value_SINT32;
+		break;
+	default:
+		rc = -EIO;
+	}
+
+out:
+	return rc;
+}
+
+int update_sensor(struct pldm_sensor *sensor,
+		  struct pldm_sensor_reading *result)
+{
+	struct cass_dev *hw = sensor->hw;
+	int rc;
+
+	// TODO: rate limit ?
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	rc = pldm_read_sensor(hw, sensor->id, result);
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return rc;
+}
+
+static void set_uc_platform(struct cass_dev *hw)
+{
+	const struct cuc_board_info_rsp *rsp_data =
+		(struct cuc_board_info_rsp *)hw->uc_resp.data;
+	u8 board_type;
+	int rc;
+	int resp_len;
+
+	if (HW_PLATFORM_Z1(hw)) {
+		if (!cass_version(hw, CASSINI_1))
+			hw->uc_platform = CUC_BOARD_TYPE_WASHINGTON;
+		else
+			hw->uc_platform = CUC_BOARD_TYPE_SAWTOOTH;
+		return;
+	}
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_BOARD_INFO;
+	hw->uc_req.count = 1;
+
+	rc = uc_wait_for_response(hw);
+	board_type = rsp_data->board_type;
+	resp_len = hw->uc_resp.count;
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	/* CUC_CMD_BOARD_INFO re-used the CUC_CMD_FW_VERSION command
+	 * number. To ensure that the response is indeed for the
+	 * CUC_CMD_BOARD_INFO command, also check the response size. A
+	 * CUC_CMD_FW_VERSION response would be at least 4 bytes.
+	 */
+	if (rc == 0 && resp_len == (1 + sizeof(struct cuc_board_info_rsp))) {
+		hw->uc_platform = board_type;
+
+		return;
+	}
+
+	/* Older firmwares do not support the BOARD_INFO command, and
+	 * FRU has to be parsed.
+	 */
+
+	if (!hw->fru_info[PLDM_FRU_FIELD_PART_NUMBER]) {
+		cxidev_err(&hw->cdev, "Failed to detect platform from uC!\n");
+		hw->uc_platform = CUC_BOARD_TYPE_UNKNOWN;
+	} else if (!strcmp(hw->fru_info[PLDM_FRU_FIELD_PART_NUMBER],
+			   PCA_SHASTA_SAWTOOTH_PASS_1_PN) ||
+		   !strcmp(hw->fru_info[PLDM_FRU_FIELD_PART_NUMBER],
+			   PCA_SHASTA_SAWTOOTH_PASS_2_PN) ||
+		   !strncmp(hw->fru_info[PLDM_FRU_FIELD_PART_NUMBER],
+			    PCA_SHASTA_SAWTOOTH_PASS_3_PN,
+			    strlen(PCA_SHASTA_SAWTOOTH_PASS_3_PN))) {
+		hw->uc_platform = CUC_BOARD_TYPE_SAWTOOTH;
+	} else if (!strcmp(hw->fru_info[PLDM_FRU_FIELD_PART_NUMBER],
+			   PCA_SHASTA_BRAZOS_PASS_1_PN) ||
+		   !strcmp(hw->fru_info[PLDM_FRU_FIELD_PART_NUMBER],
+			   PCA_SHASTA_BRAZOS_PASS_2_PN) ||
+		   !strcmp(hw->fru_info[PLDM_FRU_FIELD_PART_NUMBER],
+			   PCA_SHASTA_BRAZOS_PASS_3_PN) ||
+		   !strncmp(hw->fru_info[PLDM_FRU_FIELD_PART_NUMBER],
+			    PCA_SHASTA_BRAZOS_PASS_4_PN,
+			    strlen(PCA_SHASTA_BRAZOS_PASS_4_PN))) {
+		hw->uc_platform = CUC_BOARD_TYPE_BRAZOS;
+	} else {
+		hw->uc_platform = CUC_BOARD_TYPE_UNKNOWN;
+	};
+}
+
+static void check_sensor_values(struct cass_dev *hw)
+{
+	struct pldm_sensor *sensor;
+	struct pldm_sensor_reading result;
+	int id;
+	int rc;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	idr_for_each_entry(&hw->pldm_sensors, sensor, id) {
+		unsigned int thresh_mask;
+
+		rc = pldm_read_sensor(hw, id, &result);
+		if (rc)
+			continue;
+
+		if (result.operational_state != PLDM_OPSTATE_ENABLED)
+			continue;
+
+		thresh_mask = get_pldm_value(sensor, supported_thresholds);
+
+		if (((thresh_mask & PLDM_THRESHOLD_LOWER_FATAL_MASK) &&
+		     result.present_reading <= get_pldm_value(sensor, fatal_low)) ||
+		    ((thresh_mask & PLDM_THRESHOLD_UPPER_FATAL_MASK) &&
+		     result.present_reading >= get_pldm_value(sensor, fatal_high))) {
+			cxidev_err(&hw->cdev,
+				   "uC: ATT1_SENSOR_ALERT: sensor '%s' (%d) in fatal state: %lld not in [%lld..%lld]\n",
+				   sensor->name, id,
+				   result.present_reading,
+				   get_pldm_value(sensor, fatal_low),
+				   get_pldm_value(sensor, fatal_high));
+		} else if (((thresh_mask & PLDM_THRESHOLD_LOWER_CRITICAL_MASK) &&
+			  result.present_reading <= get_pldm_value(sensor, critical_low)) ||
+			 ((thresh_mask & PLDM_THRESHOLD_UPPER_CRITICAL_MASK) &&
+			  result.present_reading >= get_pldm_value(sensor, critical_high))) {
+			cxidev_warn(&hw->cdev,
+				    "uC: ATT1_SENSOR_ALERT: sensor '%s' (%d) in critical state: %lld not in [%lld..%lld]\n",
+				    sensor->name, id,
+				    result.present_reading,
+				    get_pldm_value(sensor, critical_low),
+				    get_pldm_value(sensor, critical_high));
+		} else if (((thresh_mask & PLDM_THRESHOLD_LOWER_WARNING_MASK) &&
+			  result.present_reading <= get_pldm_value(sensor, warning_low)) ||
+			 ((thresh_mask & PLDM_THRESHOLD_UPPER_WARNING_MASK) &&
+			  result.present_reading >= get_pldm_value(sensor, warning_high))) {
+			cxidev_warn(&hw->cdev,
+				    "uC: ATT1_SENSOR_ALERT: sensor '%s' (%d) in warning state: %lld not in [%lld..%lld]\n",
+				    sensor->name, id,
+				    result.present_reading,
+				    get_pldm_value(sensor, warning_low),
+				    get_pldm_value(sensor, warning_high));
+		}
+	}
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+}
+
+/* Called when the µC raised C_PI_ERR_FLG.UC_ATTENTION[1]. Retrieve
+ * the status register and act on the bits that are set.
+ */
+static void attn1_worker(struct work_struct *work)
+{
+	struct cass_dev *hw =
+		container_of(work, struct cass_dev, uc_attn1_work);
+	u32 isr;
+
+	/* Get the current interrupt status */
+	isr = uc_cmd_get_intr(hw);
+
+	if (isr & ATT1_UC_RESET)
+		cxidev_info(&hw->cdev, "uC: UC_RESET\n");
+
+	if (isr & ATT1_ASIC_PWR_UP_DONE)
+		cxidev_dbg(&hw->cdev, "uC: ASIC_PWR_UP_DONE\n");
+
+	if (isr & ATT1_ASIC_EPO_TEMPERATURE)
+		cxidev_notice(&hw->cdev, "uC: ASIC_EPO_TEMPERATURE\n");
+
+	/* The ATT1_QSFP_BAD_CABLE event happens every 5
+	 * seconds. Ignore all but the first one.
+	 */
+	if (isr & ATT1_QSFP_BAD_CABLE && !hw->qsfp_bad) {
+		cxidev_warn(&hw->cdev, "Bad cable present\n");
+		hw->qsfp_bad = true;
+	}
+
+	if (isr & ATT1_QSFP_INSERT) {
+		cxidev_info(&hw->cdev, "Cable inserted\n");
+		hw->qsfp_bad = false;
+		uc_update_cable_info(hw);
+		cass_cable_scan(hw);
+		cxi_send_async_event(&hw->cdev, CXI_EVENT_CABLE_INSERTED);
+		cass_phy_trigger_machine(hw);
+	}
+
+	if (isr & ATT1_QSFP_REMOVE) {
+		cxidev_info(&hw->cdev, "Cable removed\n");
+		hw->qsfp_bad = false;
+		mutex_lock(&hw->qsfp_eeprom_lock);
+		hw->qsfp_eeprom_page_len = 0;
+		mutex_unlock(&hw->qsfp_eeprom_lock);
+		cass_cable_scan(hw);
+		cxi_send_async_event(&hw->cdev, CXI_EVENT_CABLE_REMOVED);
+		cass_phy_trigger_machine(hw);
+	}
+
+	if (isr & ATT1_QSFP_EPO_TEMPERATURE) {
+		cxidev_crit(&hw->cdev, "uC: QSFP_EPO_TEMPERATURE\n");
+		hw->qsfp_over_temp = true;
+		cass_link_set_led(hw);
+	}
+
+	if (isr & ATT1_SENSOR_ALERT) {
+		cxidev_info(&hw->cdev, "uC: ATT1_SENSOR_ALERT\n");
+		check_sensor_values(hw);
+	}
+
+	uc_cmd_clear_intr(hw, isr);
+}
+
+/* Conversion table for unit between PLDM and HWMON */
+static const struct {
+	enum sensor_unit pldm_base_unit;
+	enum hwmon_sensor_types hwmon_type;
+	unsigned int hwmon_input;
+} pldm_sensor_to_hwmon[] = {
+	{ PLDM_UNIT_DEGREES_C, hwmon_temp, HWMON_T_INPUT | HWMON_T_LABEL, },
+	{ PLDM_UNIT_VOLTS, hwmon_in, HWMON_I_INPUT | HWMON_I_LABEL, },
+	{ PLDM_UNIT_AMPS, hwmon_curr, HWMON_C_INPUT | HWMON_C_LABEL, },
+	{ PLDM_UNIT_WATTS, hwmon_power, HWMON_P_INPUT | HWMON_P_LABEL, },
+};
+
+static umode_t cxi_hwmon_is_visible(const void *data,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int channel)
+{
+	return 0444;
+}
+
+static int cxi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			  u32 attr, int channel, long *val)
+{
+	struct cass_dev *hw = dev_get_drvdata(dev);
+	struct pldm_sensor_reading result;
+	struct pldm_sensor *sensor;
+	bool is_input = false;
+	bool found = false;
+	int id;
+	int rc;
+
+	idr_for_each_entry(&hw->pldm_sensors, sensor, id) {
+		if (sensor->hwmon.type == type &&
+		    sensor->hwmon.channel == channel) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found)
+		return -EINVAL;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			is_input = true;
+			break;
+		case hwmon_temp_max:
+			*val = get_pldm_value(sensor, warning_high);
+			break;
+		case hwmon_temp_crit:
+			*val = get_pldm_value(sensor, critical_high);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			is_input = true;
+			break;
+		case hwmon_in_min:
+			*val = get_pldm_value(sensor, warning_low);
+			break;
+		case hwmon_in_max:
+			*val = get_pldm_value(sensor, warning_high);
+			break;
+		case hwmon_in_lcrit:
+			*val = get_pldm_value(sensor, critical_low);
+			break;
+		case hwmon_in_crit:
+			*val = get_pldm_value(sensor, critical_high);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_input:
+			is_input = true;
+			break;
+		case hwmon_curr_max:
+			*val = get_pldm_value(sensor, warning_high);
+			break;
+		case hwmon_curr_crit:
+			*val = get_pldm_value(sensor, critical_high);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_input:
+			is_input = true;
+			break;
+		case hwmon_power_max:
+			*val = get_pldm_value(sensor, warning_high);
+			break;
+		case hwmon_power_crit:
+			*val = get_pldm_value(sensor, critical_high);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (is_input) {
+		rc = update_sensor(sensor, &result);
+		if (rc)
+			return rc;
+
+		if (result.operational_state == PLDM_OPSTATE_ENABLED)
+			*val = result.present_reading;
+		else
+			return -ENODATA;
+	}
+
+	*val *= sensor->hwmon.multiplier;
+
+	return 0;
+}
+
+static int cxi_hwmon_read_string(struct device *dev,
+				 enum hwmon_sensor_types type,
+				 u32 attr, int channel, const char **str)
+{
+	struct cass_dev *hw = dev_get_drvdata(dev);
+	struct pldm_sensor *sensor;
+	int id;
+
+	idr_for_each_entry(&hw->pldm_sensors, sensor, id) {
+		if (sensor->hwmon.type == type &&
+		    sensor->hwmon.channel == channel) {
+			*str = sensor->name;
+			return 0;
+		}
+	}
+
+	*str = "NOTFOUND";
+
+	return 0;
+}
+
+static const struct hwmon_ops cxi_hwmon_ops = {
+	.is_visible = cxi_hwmon_is_visible,
+	.read = cxi_hwmon_read,
+	.read_string = cxi_hwmon_read_string,
+};
+
+static const long pldm_multiplier[] = {
+	1000000000,		/* PLDM_MODIFIER_NANO */
+	100000000,
+	10000000,
+	1000000,		/* PLDM_MODIFIER_MICRO */
+	100000,
+	10000,
+	1000,			/* PLDM_MODIFIER_MILLI */
+	100,
+	10,			/* PLDM_MODIFIER_DECI */
+	1,			/* PLDM_MODIFIER_NONE */
+};
+
+static const unsigned int pldm_to_hwmon_temp[PLDM_THRESHOLD_COUNT] = {
+	[PLDM_THRESHOLD_UPPER_WARNING] = HWMON_T_MAX,
+	[PLDM_THRESHOLD_UPPER_CRITICAL] = HWMON_T_CRIT,
+};
+
+static const unsigned int pldm_to_hwmon_in[PLDM_THRESHOLD_COUNT] = {
+	[PLDM_THRESHOLD_UPPER_WARNING] = HWMON_I_MAX,
+	[PLDM_THRESHOLD_LOWER_WARNING] = HWMON_I_MIN,
+	[PLDM_THRESHOLD_LOWER_CRITICAL] = HWMON_I_LCRIT,
+	[PLDM_THRESHOLD_UPPER_CRITICAL] = HWMON_I_CRIT,
+};
+
+static const unsigned int pldm_to_hwmon_curr[PLDM_THRESHOLD_COUNT] = {
+	[PLDM_THRESHOLD_UPPER_WARNING] = HWMON_C_MAX,
+	[PLDM_THRESHOLD_UPPER_CRITICAL] = HWMON_C_CRIT,
+};
+
+static const unsigned int pldm_to_hwmon_power[PLDM_THRESHOLD_COUNT] = {
+	[PLDM_THRESHOLD_UPPER_WARNING] = HWMON_P_MAX,
+	[PLDM_THRESHOLD_UPPER_CRITICAL] = HWMON_P_CRIT,
+};
+
+static void create_sensors_intf(struct cass_dev *hw)
+{
+	unsigned int config_idx = 0;
+	unsigned int sensor_idx = 0;
+	unsigned int sensor_type;
+	unsigned int channel;
+
+	if (hw->pldm_sensors_count > CASS_MAX_SENSORS) {
+		cxidev_WARN_ONCE(&hw->cdev, true, "Too many sensors for hwmon\n");
+		return;
+	}
+
+	/* Enumerate all sensors that can be converted between PLDM
+	 * and HWMON, and build a HWMON device.
+	 */
+	for (sensor_type = 0; sensor_type < ARRAY_SIZE(pldm_sensor_to_hwmon);
+	     sensor_type++) {
+		struct pldm_sensor *sensor;
+		bool present = false;
+		int unit_modifier;
+		int id;
+
+		/* Find whether a sensor of that PLDM type is present */
+		idr_for_each_entry(&hw->pldm_sensors, sensor, id) {
+			if (sensor->num.base_unit !=
+			    pldm_sensor_to_hwmon[sensor_type].pldm_base_unit)
+				continue;
+
+			present = true;
+			break;
+		}
+
+		if (!present)
+			continue;
+
+		hw->hwmon.info[sensor_idx].type =
+			pldm_sensor_to_hwmon[sensor_type].hwmon_type;
+		hw->hwmon.info[sensor_idx].config =
+			(const u32 *)&hw->hwmon.config[config_idx];
+
+		/* Create the config for all sensors of that type */
+		channel = 0;
+		idr_for_each_entry(&hw->pldm_sensors, sensor, id) {
+			unsigned long thresh_mask;
+			unsigned int hwmon_input;
+			unsigned int bit;
+
+			if (sensor->num.base_unit !=
+			    pldm_sensor_to_hwmon[sensor_type].pldm_base_unit)
+				continue;
+
+			sensor->hwmon.type =
+				pldm_sensor_to_hwmon[sensor_type].hwmon_type;
+			sensor->hwmon.channel = channel;
+
+			/* Compute the multiplier to apply to convert
+			 * from PLDM value to hwmon, taking into
+			 * account both the pldm and hwmon
+			 * multipliers.
+			 */
+			unit_modifier = sensor->num.unit_modifier;
+			if (unit_modifier < PLDM_MODIFIER_NANO ||
+			    unit_modifier > PLDM_MODIFIER_NONE)
+				unit_modifier = PLDM_MODIFIER_NONE;
+
+			unit_modifier -= PLDM_MODIFIER_NANO;
+
+			hwmon_input = pldm_sensor_to_hwmon[sensor_type].hwmon_input;
+			thresh_mask = get_pldm_value(sensor, supported_thresholds);
+
+			switch (sensor->hwmon.type) {
+			case hwmon_temp:
+				sensor->hwmon.multiplier = 1000 /
+					pldm_multiplier[unit_modifier];
+
+				for_each_set_bit(bit, &thresh_mask, PLDM_THRESHOLD_COUNT)
+					hwmon_input |= pldm_to_hwmon_temp[bit];
+
+				break;
+			case hwmon_in:
+				sensor->hwmon.multiplier = 1000 /
+					pldm_multiplier[unit_modifier];
+
+				for_each_set_bit(bit, &thresh_mask, PLDM_THRESHOLD_COUNT)
+					hwmon_input |= pldm_to_hwmon_in[bit];
+
+				break;
+			case hwmon_curr:
+				sensor->hwmon.multiplier = 1000 /
+					pldm_multiplier[unit_modifier];
+
+				for_each_set_bit(bit, &thresh_mask, PLDM_THRESHOLD_COUNT)
+					hwmon_input |= pldm_to_hwmon_curr[bit];
+
+				break;
+			case hwmon_power:
+				sensor->hwmon.multiplier = 1000000 /
+					pldm_multiplier[unit_modifier];
+
+				for_each_set_bit(bit, &thresh_mask, PLDM_THRESHOLD_COUNT)
+					hwmon_input |= pldm_to_hwmon_power[bit];
+
+				break;
+			default:
+				sensor->hwmon.multiplier = 1;
+			}
+
+			hw->hwmon.config[config_idx] = hwmon_input;
+
+			config_idx++;
+			channel++;
+		};
+
+		config_idx++;		/* NUL terminator */
+
+		hw->hwmon.all_types[sensor_idx] = &hw->hwmon.info[sensor_idx];
+		sensor_idx++;
+	}
+
+	hw->hwmon.all_types[sensor_idx] = NULL;
+
+	hw->hwmon.chip_info.ops = &cxi_hwmon_ops;
+	hw->hwmon.chip_info.info = hw->hwmon.all_types;
+
+	hw->hwmon.dev = hwmon_device_register_with_info(&hw->cdev.pdev->dev,
+							hw->cdev.name,
+							hw,
+							&hw->hwmon.chip_info,
+							NULL);
+	if (IS_ERR(hw->hwmon.dev)) {
+		dev_err(&hw->cdev.pdev->dev,
+			"Failed to register sensors: %ld\n",
+			PTR_ERR(hw->hwmon.dev));
+		hw->hwmon.dev = NULL;
+	}
+}
+
+static int cass_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct cass_dev *hw = i2c_get_adapdata(adap);
+	int ret = 0;
+	int i;
+
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	for (i = 0; i < num; i++) {
+		struct i2c_msg *msg = &msgs[i];
+
+		uc_prepare_comm(hw);
+
+		if (msg->flags & I2C_M_RD) {
+			struct cuc_i2c_read_req *req_data =
+				(struct cuc_i2c_read_req *)hw->uc_req.data;
+
+			hw->uc_req.cmd = CUC_CMD_I2C_READ;
+			hw->uc_req.count = 1 + sizeof(*req_data);
+			req_data->bus = QSFP_I2C_BUS_REDIRECT;
+			req_data->addr = msg->addr;
+			req_data->count = msg->len;
+		} else {
+			struct cuc_i2c_write_req *req_data =
+				(struct cuc_i2c_write_req *)hw->uc_req.data;
+
+			hw->uc_req.cmd = CUC_CMD_I2C_WRITE;
+			hw->uc_req.count = 1 + sizeof(*req_data) + msg->len;
+			req_data->bus = QSFP_I2C_BUS_REDIRECT;
+			req_data->addr = msg->addr;
+			req_data->count = msg->len;
+			memcpy(req_data->buf, msg->buf, msg->len);
+		}
+
+		ret = uc_wait_for_response(hw);
+		if (ret) {
+			cxidev_err(&hw->cdev, "uC failed to perform i2c request\n");
+			goto out;
+		}
+
+		if (msg->flags & I2C_M_RD)
+			memcpy(msg->buf, hw->uc_resp.data, msg->len);
+	}
+
+out:
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	return ret ?: num;
+}
+
+static u32 cass_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_adapter_quirks uc_i2c_quirks = {
+	.max_read_len = CUC_DATA_BYTES - sizeof(struct cuc_i2c_read_req),
+	.max_write_len = CUC_DATA_BYTES - sizeof(struct cuc_i2c_write_req),
+};
+
+static const struct i2c_algorithm cass_i2c_algo = {
+	.master_xfer = cass_i2c_xfer,
+	.functionality = cass_i2c_func,
+};
+
+/* The i2c bus device whose sole purpose is to access the QSFP headshell. */
+static int uc_register_i2c(struct cass_dev *hw)
+{
+	int ret;
+
+	if (!hw->uc_present)
+		return 0;
+
+	if (hw->uc_platform != CUC_BOARD_TYPE_BRAZOS &&
+	    hw->uc_platform != CUC_BOARD_TYPE_KENNEBEC &&
+	    hw->uc_platform != CUC_BOARD_TYPE_SOUHEGAN &&
+	    !HW_PLATFORM_NETSIM(hw))
+		return 0;
+
+	hw->uc_i2c.owner = THIS_MODULE;
+	hw->uc_i2c.algo = &cass_i2c_algo;
+	hw->uc_i2c.timeout = msecs_to_jiffies(1000);
+	hw->uc_i2c.retries = 2;
+	hw->uc_i2c.quirks = &uc_i2c_quirks;
+	hw->uc_i2c.dev.parent = &hw->cdev.pdev->dev;
+	i2c_set_adapdata(&hw->uc_i2c, hw);
+
+	snprintf(hw->uc_i2c.name, sizeof(hw->uc_i2c.name), "%s headshell", hw->cdev.name);
+
+	ret = i2c_add_adapter(&hw->uc_i2c);
+	if (ret) {
+		hw->uc_i2c.algo = NULL;
+		return ret;
+	}
+
+	dev_dbg(&hw->cdev.pdev->dev, "Added i2c controller %d\n", hw->uc_i2c.nr);
+
+	return 0;
+}
+
+static void uc_unregister_i2c(struct cass_dev *hw)
+{
+	if (hw->uc_i2c.algo)
+		i2c_del_adapter(&hw->uc_i2c);
+}
+
+int cass_register_uc(struct cass_dev *hw)
+{
+	int rc;
+
+	mutex_init(&hw->uc_mbox_mutex);
+	init_completion(&hw->uc_attention0_comp);
+	INIT_WORK(&hw->uc_attn1_work, attn1_worker);
+	idr_init(&hw->pldm_sensors);
+
+	rc = cxi_dmac_desc_set_reserve(&hw->cdev, 32, HOST_TO_UC_FIRST, "uc");
+	if (rc < 0) {
+		cxidev_err(&hw->cdev, "Failed to reserve UC DMAC space\n");
+		return rc;
+	}
+	hw->uc_dmac_id = rc;
+
+	hw->uc_attn1_wq = alloc_workqueue("uc_attn1", WQ_UNBOUND, 1);
+	if (!hw->uc_attn1_wq) {
+		cxidev_err(&hw->cdev, "Failed to allocate UC attn1 workqueue\n");
+		rc = -ENOMEM;
+		goto free_dmac_id;
+	}
+
+	/* Create the uC sysfs entries */
+	rc = kobject_init_and_add(&hw->uc_kobj, &uc_sysfs_entries,
+				  &hw->cdev.pdev->dev.kobj,
+				  "uc");
+	if (rc < 0)
+		goto free_wq;
+
+	/* Register callback for C_PI_ERR_FLG.UC_ATTENTION bits */
+	hw->uc_err.irq = C_PI_IRQA_MSIX_INT;
+	hw->uc_err.is_ext = false;
+	hw->uc_err.err_flags.pi.uc_attention = 0b11;
+	hw->uc_err.cb = uc_attention_cb;
+	cxi_register_hw_errors(hw, &hw->uc_err);
+
+	/* Some test platforms do not have a uC */
+	mutex_lock(&hw->uc_mbox_mutex);
+
+	uc_prepare_comm(hw);
+
+	hw->uc_req.cmd = CUC_CMD_PING;
+	hw->uc_req.count = 1;
+
+	rc = uc_wait_for_response(hw);
+
+	hw->uc_present = rc == 0;
+
+	mutex_unlock(&hw->uc_mbox_mutex);
+
+	if (!hw->uc_present)
+		cxidev_err(&hw->cdev, "uC not detected: %d\n", rc);
+
+	uc_cmd_update_ier(hw, HOST_CLEARED_ATT1_INTERRUPTS, 0);
+
+	uc_cmd_get_fw_versions(hw);
+
+	/* Find all sensors, and check whether they are currently
+	 * reporting some error.
+	 */
+	iterate_pdr(hw);
+	check_sensor_values(hw);
+
+	create_sensors_intf(hw);
+
+	uc_cmd_get_fru(hw);
+
+	set_uc_platform(hw);
+
+	uc_update_cable_info(hw);
+
+	uc_register_i2c(hw);
+
+	return 0;
+
+free_wq:
+	kobject_put(&hw->uc_kobj);
+	destroy_workqueue(hw->uc_attn1_wq);
+
+free_dmac_id:
+	cxi_dmac_desc_set_free(&hw->cdev, hw->uc_dmac_id);
+
+	return rc;
+}
+
+void cass_unregister_uc(struct cass_dev *hw)
+{
+	struct pldm_sensor *sensor;
+	int id;
+
+	uc_cmd_update_ier(hw, 0, ATT1_ALL_INTERRUPTS);
+	uc_unregister_i2c(hw);
+	if (hw->hwmon.dev)
+		hwmon_device_unregister(hw->hwmon.dev);
+	kobject_put(&hw->uc_kobj);
+	cxi_dmac_desc_set_free(&hw->cdev, hw->uc_dmac_id);
+	destroy_workqueue(hw->uc_attn1_wq);
+	cxi_unregister_hw_errors(hw, &hw->uc_err);
+	idr_for_each_entry(&hw->pldm_sensors, sensor, id)
+		kfree(sensor);
+	idr_destroy(&hw->pldm_sensors);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.c b/drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.c
new file mode 100644
index 000000000000..183e11821ce7
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.c
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2020 Hewlett Packard Enterprise Development LP */
+
+/* Access Control Entry lists */
+
+#include "cass_core.h"
+#include "cxi_ac_entry_list.h"
+
+/* **************************************************************** */
+/* Access Control List operations                                   */
+/* **************************************************************** */
+struct cxi_ac_entry {
+	unsigned int       id;
+	enum cxi_ac_type   type;
+	union cxi_ac_data  data;
+};
+
+static const struct xa_limit ac_entry_id_limits  = AC_ENTRY_ID_LIMITS;
+static const uid_t  invalid_uid = (uid_t)-1;
+static const gid_t  invalid_gid = (gid_t)-1;
+static const unsigned int invalid_netns = (unsigned int)-1;
+
+static bool validate_ac_data(cxi_ac_typeset_t ac_type,
+			     const union cxi_ac_data *data)
+{
+	switch (ac_type) {
+	case CXI_AC_UID:
+		return (data->uid != invalid_uid);
+	case CXI_AC_GID:
+		return (data->gid != invalid_gid);
+	case CXI_AC_OPEN:
+		return true;
+	case CXI_AC_NETNS:
+		return (data->netns != invalid_netns);
+	default:
+		return false;
+	}
+}
+
+static int ac_entry_list_insert_entry(struct cxi_ac_entry_list *list,
+				      enum cxi_ac_type type,
+				      const union cxi_ac_data *data,
+				      unsigned int *ac_entry_id)
+{
+	struct cxi_ac_entry   *ac_entry;
+	int    ret;
+
+	ac_entry = kzalloc(sizeof(*ac_entry), AC_ENTRY_GFP_OPTS);
+	if (!ac_entry)
+		return -ENOMEM;
+
+	/* allocate an Id for this entry */
+
+	ret = xa_alloc(&list->id.xarray, &ac_entry->id, ac_entry,
+		       ac_entry_id_limits, AC_ENTRY_GFP_OPTS);
+
+	if (ret)
+		goto free_entry;
+
+	ac_entry->type = type;
+	ac_entry->data = *data;
+	*ac_entry_id   = ac_entry->id;
+
+	/* store the entry in the appropriate xarray */
+
+	switch (ac_entry->type) {
+	case CXI_AC_UID:
+		ret = xa_insert(&list->uid.xarray, ac_entry->data.uid,
+				ac_entry, AC_ENTRY_GFP_OPTS);
+		break;
+	case CXI_AC_GID:
+		ret = xa_insert(&list->gid.xarray, ac_entry->data.gid,
+				ac_entry, AC_ENTRY_GFP_OPTS);
+		break;
+	case CXI_AC_OPEN:
+		xa_lock(&list->id.xarray);
+		if (list->open_entry)
+			ret = -EBUSY;
+		else
+			list->open_entry = ac_entry;
+		xa_unlock(&list->id.xarray);
+		break;
+	case CXI_AC_NETNS:
+		ret = xa_insert(&list->netns.xarray, ac_entry->data.netns,
+				ac_entry, AC_ENTRY_GFP_OPTS);
+		break;
+	default:
+		ret = -EBADR;
+	}
+
+	if (!ret)
+		return 0;
+
+	/* if we failed, we need to deallocate the id */
+
+	xa_erase(&list->id.xarray, ac_entry->id);
+
+free_entry:
+	kfree(ac_entry);
+	return ret;
+}
+
+static int ac_entry_list_delete_entry(struct cxi_ac_entry_list *list,
+				      unsigned int ac_entry_id)
+{
+	struct cxi_ac_entry   *ac_entry;
+	int    ret;
+
+	ac_entry = xa_load(&list->id.xarray, ac_entry_id);
+	ret = xa_err(ac_entry);
+	if (ret)
+		return ret;
+	if (!ac_entry)
+		return -ENODATA;
+
+	switch (ac_entry->type) {
+	case CXI_AC_UID:
+		xa_erase(&list->uid.xarray, ac_entry->data.uid);
+		break;
+	case CXI_AC_GID:
+		xa_erase(&list->gid.xarray, ac_entry->data.gid);
+		break;
+	case CXI_AC_OPEN:
+		list->open_entry = NULL;
+		break;
+	case CXI_AC_NETNS:
+		xa_erase(&list->netns.xarray, ac_entry->data.netns);
+		break;
+	default:
+		ret = -EIO;
+		break;
+	}
+
+	xa_erase(&list->id.xarray, ac_entry_id);
+
+	kfree(ac_entry);
+	return ret;
+}
+
+/**
+ * ac_entry_list_iterate() - call a function on all entries in the list
+ *
+ * @list: list pointer
+ * @operator: function to call with each AC Entry and user_data
+ * @user_data: second argument to operator function
+ *
+ * Return: the first non-zero return value of 'operator' or 0.
+ */
+static int ac_entry_list_iterate(struct cxi_ac_entry_list *list,
+				 int (*operator)(struct cxi_ac_entry *ac_entry,
+						 void *user_data),
+				 void *user_data)
+{
+	struct cxi_ac_entry     *ac_entry;
+	unsigned long           index = ac_entry_id_limits.min;
+
+	xa_for_each(&list->id.xarray, index, ac_entry) {
+		int ret = operator(ac_entry, user_data);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * cxi_ac_entry_list_init() - initialize a list of AC Entries
+ *
+ * @list: address of list
+ */
+void cxi_ac_entry_list_init(struct cxi_ac_entry_list *list)
+{
+	xa_init_flags(&list->id.xarray, AC_ENTRY_ID_XARRAY_FLAGS);
+	xa_init_flags(&list->gid.xarray, AC_ENTRY_GID_XARRAY_FLAGS);
+	xa_init_flags(&list->uid.xarray, AC_ENTRY_UID_XARRAY_FLAGS);
+	xa_init_flags(&list->netns.xarray, AC_ENTRY_NETNS_XARRAY_FLAGS);
+}
+
+/**
+ * cxi_ac_entry_list_purge() - Remove all AC Entries from a list
+ *
+ * @list: address of list
+ */
+void cxi_ac_entry_list_purge(struct cxi_ac_entry_list *list)
+{
+	unsigned long          index = ac_entry_id_limits.min;
+	struct cxi_ac_entry    *ac_entry;
+
+	xa_for_each(&list->id.xarray, index, ac_entry) {
+		ac_entry_list_delete_entry(list, index);
+	}
+}
+
+/**
+ * cxi_ac_entry_list_destroy() - tear down a list of AC Entries.  The
+ *                               list infrastructure is destroyed.
+ *
+ * @list: pointer to list
+ */
+void cxi_ac_entry_list_destroy(struct cxi_ac_entry_list *list)
+{
+	cxi_ac_entry_list_purge(list);
+
+	xa_destroy(&list->id.xarray);
+	xa_destroy(&list->gid.xarray);
+	xa_destroy(&list->uid.xarray);
+	xa_destroy(&list->netns.xarray);
+}
+
+/**
+ * cxi_ac_entry_list_empty() - determine if any AC Entries are present
+ *
+ * @list: list pointer
+ *
+ * Return: true if no entries present, false otherwise
+ */
+bool cxi_ac_entry_list_empty(struct cxi_ac_entry_list *list)
+{
+	return xa_empty(&list->id.xarray);
+}
+
+/**
+ * cxi_ac_entry_list_insert() - allocate an id and add an AC Entry
+ *                              to the list
+ *
+ * @list: list pointer
+ * @ac_type: one of the cxi_ac_type enums
+ * @ac_data: pointer to cxi_ac_data struct
+ * @id: location to store new Id
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOMEM - unable to allocate memory
+ * * -EBUSY  - no free entries available
+ * * -EBADR  - invalid type or data
+ * * -EEXIST - entry with same data exists
+ */
+int cxi_ac_entry_list_insert(struct cxi_ac_entry_list *list,
+			     enum cxi_ac_type ac_type,
+			     const union cxi_ac_data *ac_data,
+			     unsigned int *id)
+{
+	int   ret;
+
+	if (!validate_ac_data(ac_type, ac_data))
+		return -EBADR;
+
+	ret = ac_entry_list_insert_entry(list, ac_type, ac_data, id);
+	switch (ret) {
+	case -EBUSY:   /* translate xarray EBUSY to EEXIST */
+		return -EEXIST;
+	default:
+		return ret;
+	}
+}
+
+/**
+ * cxi_ac_entry_list_delete() - remove an AC Entry from the
+ *                              list by Id
+ *
+ * @list: list pointer
+ * @id: desired AC Entry Id to remove
+ *
+ * Return:
+ * * 0        - success
+ * * -EBADR   - not found with given id
+ */
+int cxi_ac_entry_list_delete(struct cxi_ac_entry_list *list,
+			     unsigned int id)
+{
+	return ac_entry_list_delete_entry(list, id);
+}
+
+/**
+ * cxi_ac_entry_list_retrieve_by_id() - get AC type and data by id
+ *
+ * @list: list pointer
+ * @id: id of ac entry to retrieve
+ * @type: location to store type
+ * @data: location to store data
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - AC Entry with given id not found
+ */
+int cxi_ac_entry_list_retrieve_by_id(struct cxi_ac_entry_list *list,
+				     unsigned int id,
+				     enum cxi_ac_type *type,
+				     union cxi_ac_data *data)
+{
+	struct cxi_ac_entry   *ac_entry;
+
+	ac_entry = xa_load(&list->id.xarray, id);
+	if (!ac_entry)
+		return -EBADR;
+
+	switch (ac_entry->type) {
+	case CXI_AC_UID:
+		data->uid = ac_entry->data.uid;
+		break;
+	case CXI_AC_GID:
+		data->gid = ac_entry->data.gid;
+		break;
+	case CXI_AC_OPEN:
+		break;
+	default:
+		return -EIO;   /* yikes */
+	}
+	*type = ac_entry->type;
+	return 0;
+}
+
+/**
+ * cxi_ac_entry_list_retrieve_by_data() - get an AC Entry ID by type and
+ *                                        data value
+ *
+ * @list: list pointer
+ * @ac_type: type of entry
+ * @ac_data: uid/gid data
+ * @id: location to store id value
+ *
+ * Return:
+ * * 0        - success
+ * * -EBADR   - AC Entry with given type&data not found
+ * * -EINVAL  - invalid ac_type or data
+ */
+int
+cxi_ac_entry_list_retrieve_by_data(struct cxi_ac_entry_list *list,
+				   enum cxi_ac_type ac_type,
+				   const union cxi_ac_data *ac_data,
+				   unsigned int *id)
+{
+	struct cxi_ac_entry   *ac_entry = NULL;
+
+	if (!validate_ac_data(ac_type, ac_data))
+		return -EINVAL;
+
+	switch (ac_type) {
+	case CXI_AC_OPEN:
+		ac_entry = list->open_entry;
+		break;
+	case CXI_AC_UID:
+		ac_entry = xa_load(&list->uid.xarray, ac_data->uid);
+		break;
+	case CXI_AC_GID:
+		ac_entry = xa_load(&list->gid.xarray, ac_data->gid);
+		break;
+	case CXI_AC_NETNS:
+		/* Execute this block only when the user provided a netns AC type.
+		 * Maintains compatibility with older versions.
+		 */
+		if (!xa_empty(&list->netns.xarray))
+			ac_entry = xa_load(&list->netns.xarray, ac_data->netns);
+		break;
+	default:
+		break;
+	}
+
+	if (!ac_entry)
+		return -EBADR;
+
+	*id = ac_entry->id;
+	return 0;
+}
+
+/**
+ * cxi_ac_entry_list_retrieve_by_user() - get an access control entry Id
+ *           which covers the given uid/gid, if any.  There may be more than
+ *           one possible, the priority order is: UID, GID, OPEN.
+ *
+ * @list: the ac_entry_list to search
+ * @uid: user id
+ * @gid: group id
+ * @netns: The Network Namespace id
+ * @desired_types: one of more of the enum cxi_ac_type values (OR'd together)
+ * @id: location to store the id
+ *
+ * Return:
+ * * 0        - success
+ * * -EPERM   - no access control found for uid/gid
+ * * -EBADR   - no valid desired types specified
+ */
+int cxi_ac_entry_list_retrieve_by_user(struct cxi_ac_entry_list *list,
+				       uid_t uid,
+				       gid_t gid,
+				       unsigned int netns,
+				       cxi_ac_typeset_t desired_types,
+				       unsigned int *id)
+{
+	union cxi_ac_data           data = {};
+
+	if ((desired_types & CXI_AC_ANY) == 0)
+		return -EBADR;
+
+	if (desired_types & CXI_AC_UID) {
+		data.uid = uid;
+		if (!cxi_ac_entry_list_retrieve_by_data(list, CXI_AC_UID,
+							&data, id))
+			return 0;
+	}
+
+	if (desired_types & CXI_AC_GID) {
+		data.gid = gid;
+		if (!cxi_ac_entry_list_retrieve_by_data(list, CXI_AC_GID,
+							&data, id))
+			return 0;
+	}
+
+	if (desired_types & CXI_AC_NETNS) {
+		data.netns = netns;
+		if (!cxi_ac_entry_list_retrieve_by_data(list, CXI_AC_NETNS,
+							&data, id))
+			return 0;
+	}
+
+	if (desired_types & CXI_AC_OPEN) {
+		if (!cxi_ac_entry_list_retrieve_by_data(list, CXI_AC_OPEN,
+							&data, id))
+			return 0;
+	}
+
+	return -EPERM;
+}
+
+struct get_ids_data {
+	size_t         max_ids;
+	unsigned int   *ids;
+	size_t         num_ids;
+};
+
+static int get_ids_operator(struct cxi_ac_entry *ac_entry,
+			    void *user_data)
+{
+	struct get_ids_data   *data = user_data;
+
+	if (data->num_ids < data->max_ids) {
+		*data->ids = ac_entry->id;
+		data->ids++;
+	}
+
+	data->num_ids++;
+	return 0;
+}
+
+/**
+ * cxi_ac_entry_list_get_ids() - retrieve the ids of all entries in the list
+ *
+ * @list: the list pointer
+ * @max_ids: the size of the 'ids' array
+ * @ids: location to store ids
+ * @num_ids: location to store actual number of ids copied to list
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOSPC - max_ids is not large enough (num_ids holds required size)
+ */
+int cxi_ac_entry_list_get_ids(struct cxi_ac_entry_list *list,
+			      size_t max_ids,
+			      unsigned int *ids,
+			      size_t *num_ids)
+{
+	struct get_ids_data    data = {
+		.max_ids = max_ids,
+		.ids     = ids,
+		.num_ids = 0,
+	};
+	int    ret;
+
+	ret = ac_entry_list_iterate(list, get_ids_operator, &data);
+	if (ret)
+		return ret;
+
+	*num_ids = data.num_ids;
+
+	return (data.num_ids <= max_ids) ? 0 : -ENOSPC;
+}
+
+/**
+ * cxi_ac_entry_list_retrieve_netns() - Get an AC Entry of type netns
+ *
+ * @list: list pointer
+ * @ac_data: The first netns value found in the list
+ *
+ * Return:
+ * * 0        - success
+ * * -EINVAL  - No netns entry found
+ */
+int cxi_ac_entry_list_retrieve_netns(struct cxi_ac_entry_list *list,  union cxi_ac_data *ac_data)
+{
+	struct cxi_ac_entry *entry;
+	unsigned long index;
+
+	xa_for_each(&list->netns.xarray, index, entry) {
+		ac_data->netns = index;
+		return 0;
+	}
+	return -EINVAL;
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.c b/drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.c
new file mode 100644
index 000000000000..5f3977c494c4
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.c
@@ -0,0 +1,722 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Cassini QoS Profiles
+ * Copyright 2023 Hewlett Packard Enterprise Development LP
+ */
+#include "cass_core.h"
+
+#define SRB_MAX_SIZE 2048U
+
+/* Reserve half the SRB space to cover C2 expected bandwidth delay product. The
+ * remainder of the space should be split up between the RDMA traffic classes.
+ */
+#define SRB_SHARED_MAX (SRB_MAX_SIZE / 2)
+
+/* Since low-latency does not need to sustain bandwidth, reserve only a few
+ * MTU sized packets worth of SRB.
+ */
+#define LOW_LATENCY_SRB_RSVD 32U
+
+/* SRB Space Reserved for the Global Restricted BC - C1 Only */
+#define C1_SRB_GLOBAL_RES_BC_RSVD 39U
+
+/* SRB Space Available to Split Between other RDMA TCs */
+#define C1_SRB_RESERVED (SRB_MAX_SIZE - SRB_SHARED_MAX - C1_SRB_GLOBAL_RES_BC_RSVD - LOW_LATENCY_SRB_RSVD)
+#define C2_SRB_RESERVED (SRB_MAX_SIZE - SRB_SHARED_MAX - LOW_LATENCY_SRB_RSVD)
+
+struct qos_profile profiles[CXI_QOS_NUM_PROF] = {
+	/* HPC Profile */
+	[CXI_QOS_HPC] = {
+		/* Shared with low latency */
+		.pct_control_pcp = 5,
+		.untagged_eth_pcp = 6, /* Shared with Eth1 */
+		.tcs_active = {
+			[CXI_TC_DEDICATED_ACCESS] = true,
+			[CXI_TC_LOW_LATENCY] = true,
+			[CXI_TC_BULK_DATA] = true,
+			[CXI_TC_BEST_EFFORT] = true,
+
+			[CXI_ETH_SHARED] = true,
+			[CXI_ETH_TC1] = true,
+		},
+		.tcs = {
+			[CXI_TC_DEDICATED_ACCESS] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 6,
+					.rsp_pcp = 7,
+					.res_rsp_dscp = 13,
+					.unres_rsp_dscp = 15,
+					.res_req_dscp = 12,
+					.unres_req_dscp = 14,
+					.hrp_res_req_dscp = -1,
+					.coll_leaf_res_req_dscp = -1,
+					.restricted_unres_req_dscp = -1,
+				},
+				.ixe_settings = {
+					.fq_count = 10,
+				},
+				.lpe_settings = {
+					.fq_count = 8,
+				},
+				.pct_settings = {
+					.trs_rsvd = 64,
+					.mst_rsvd = 64,
+					.tct_rsvd = 256,
+				},
+				.oxe_settings = {
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.pbuf_rsvd = 39,
+					.assured_percent = 50,
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(4 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.leaf_response_priority = 1,
+					.branch_priority = 1,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 8,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 128,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_LOW_LATENCY] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 4,
+					.rsp_pcp = 5,
+					.res_rsp_dscp = 9,
+					.unres_rsp_dscp = 11,
+					.res_req_dscp = 8,
+					.unres_req_dscp = 10,
+					.hrp_res_req_dscp = -1,
+					.coll_leaf_res_req_dscp = -1,
+					.restricted_unres_req_dscp = -1,
+				},
+				.ixe_settings = {
+					.fq_count = 2,
+				},
+				.lpe_settings = {
+
+					.fq_count = 2,
+				},
+				.pct_settings = {
+					.trs_rsvd = 64,
+					.mst_rsvd = 64,
+					.tct_rsvd = 256,
+				},
+				.oxe_settings = {
+					.spt_rsvd = 64,
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.srb_rsvd = LOW_LATENCY_SRB_RSVD,
+					.pbuf_rsvd = 13,
+					.assured_percent = 15,
+					.ceiling_percent = 30,
+					.bucket_limit = DIV_ROUND_UP(4 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 7,
+					.leaf_response_priority = 6,
+					.branch_priority = 6,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 2,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 128,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_BULK_DATA] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 2,
+					.rsp_pcp = 3,
+					.res_rsp_dscp = 5,
+					.unres_rsp_dscp = 7,
+					.res_req_dscp = 4,
+					.unres_req_dscp = 6,
+					.hrp_res_req_dscp = -1,
+					.coll_leaf_res_req_dscp = -1,
+					.restricted_unres_req_dscp = -1,
+				},
+				.ixe_settings = {
+					.fq_count = 4,
+				},
+				.lpe_settings = {
+					.fq_count = 2,
+				},
+				.pct_settings = {
+					.trs_rsvd = 32,
+					.mst_rsvd = 32,
+					.tct_rsvd = 128,
+				},
+				.oxe_settings = {
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.pbuf_rsvd = 39,
+					.assured_percent = 15,
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.leaf_response_priority = 1,
+					.branch_priority = 1,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 4,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 64,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_BEST_EFFORT] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 0,
+					.rsp_pcp = 1,
+					.res_rsp_dscp = 1,
+					.unres_rsp_dscp = 3,
+					.res_req_dscp = 0,
+					.unres_req_dscp = 2,
+					.hrp_res_req_dscp = 50,
+					.coll_leaf_res_req_dscp = 52,
+					.restricted_unres_req_dscp = 30,
+				},
+				.ixe_settings = {
+					.fq_count = 8,
+				},
+				.lpe_settings = {
+					.fq_count = 4,
+				},
+				.pct_settings = {
+					.trs_rsvd = 4,
+					.mst_rsvd = 4,
+					.tct_rsvd = 16,
+				},
+				.oxe_settings = {
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.pbuf_rsvd = 13,
+					.assured_percent = 10,
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.leaf_response_priority = 1,
+					.branch_priority = 1,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 8,
+					.static_fq_count = 16,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 17,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_ETH] = {
+				.oxe_settings = {
+					.spt_rsvd = 30,
+					.pbuf_rsvd = DIV_ROUND_UP(ETHERNET_MAX_FRAME_SIZE, 256),
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 2,
+					.static_fq_count = 2,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = DIV_ROUND_UP(ETHERNET_MAX_FRAME_SIZE, 128),
+					.mfs = ETHERNET_MAX_FRAME_SIZE,
+				},
+
+			},
+			[CXI_ETH_SHARED] = {
+				.oxe_settings = {
+					.assured_percent = 10,
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * ETHERNET_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 1,
+					.branch_priority = 1,
+					.mfs_index = 1,
+				},
+			},
+			[CXI_ETH_TC1] = {
+				.eth_settings = {
+					.pcp =  6,
+				},
+				.oxe_settings = {
+					.assured_percent = 10,
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * ETHERNET_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 1,
+					.branch_priority = 1,
+					.mfs_index = 1,
+				},
+
+			},
+		},
+	},
+	[CXI_QOS_LL_BE_BD_ET] = {
+		.pct_control_pcp = 7,
+		.untagged_eth_pcp = 6, /* Shared with Eth1 */
+		.tcs_active = {
+			[CXI_TC_LOW_LATENCY] = true,
+			[CXI_TC_BULK_DATA] = true,
+			[CXI_TC_BEST_EFFORT] = true,
+
+			[CXI_ETH_SHARED] = true,
+			[CXI_ETH_TC1] = true,
+		},
+		.tcs = {
+			[CXI_TC_LOW_LATENCY] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 4,
+					.rsp_pcp = 5,
+					.res_rsp_dscp = 9,
+					.unres_rsp_dscp = 11,
+					.res_req_dscp = 8,
+					.unres_req_dscp = 10,
+					.hrp_res_req_dscp = -1,
+					.coll_leaf_res_req_dscp = 52,
+					.restricted_unres_req_dscp = -1,
+				},
+				.ixe_settings = {
+					.fq_count = 2,
+				},
+				.lpe_settings = {
+
+					.fq_count = 2,
+				},
+				.pct_settings = {
+					.trs_rsvd = 64,
+					.mst_rsvd = 64,
+					.tct_rsvd = 256,
+				},
+				.oxe_settings = {
+					.spt_rsvd = 64,
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.srb_rsvd = LOW_LATENCY_SRB_RSVD,
+					.pbuf_rsvd = 13,
+					.assured_percent = 2,
+					.ceiling_percent = 5,
+					.bucket_limit = DIV_ROUND_UP(4 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 7,
+					.leaf_response_priority = 6,
+					.branch_priority = 6,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 2,
+					.static_fq_count = 4,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 128,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_BULK_DATA] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 2,
+					.rsp_pcp = 3,
+					.res_rsp_dscp = 5,
+					.unres_rsp_dscp = 7,
+					.res_req_dscp = 4,
+					.unres_req_dscp = 6,
+					.hrp_res_req_dscp = -1,
+					.coll_leaf_res_req_dscp = -1,
+					.restricted_unres_req_dscp = -1,
+				},
+				.ixe_settings = {
+					.fq_count = 4,
+				},
+				.lpe_settings = {
+					.fq_count = 2,
+				},
+				.pct_settings = {
+					.trs_rsvd = 32,
+					.mst_rsvd = 32,
+					.tct_rsvd = 128,
+				},
+				.oxe_settings = {
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.pbuf_rsvd = 39,
+					.assured_percent = 10, /* Fabric: 20 */
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.leaf_response_priority = 1,
+					.branch_priority = 1,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 4,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 64,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_BEST_EFFORT] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 0,
+					.rsp_pcp = 1,
+					.res_rsp_dscp = 1,
+					.unres_rsp_dscp = 3,
+					.res_req_dscp = 0,
+					.unres_req_dscp = 2,
+					.hrp_res_req_dscp = 50,
+					.coll_leaf_res_req_dscp = -1,
+					.restricted_unres_req_dscp = 30,
+				},
+				.ixe_settings = {
+					.fq_count = 8,
+				},
+				.lpe_settings = {
+					.fq_count = 4,
+				},
+				.pct_settings = {
+					.trs_rsvd = 4,
+					.mst_rsvd = 4,
+					.tct_rsvd = 16,
+				},
+				.oxe_settings = {
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.pbuf_rsvd = 13,
+					.assured_percent = 10, /* Fabric: 50 */
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.leaf_response_priority = 1,
+					.branch_priority = 1,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 8,
+					.static_fq_count = 16,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 17,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_ETH] = {
+				.oxe_settings = {
+					.spt_rsvd = 30,
+					.pbuf_rsvd = DIV_ROUND_UP(ETHERNET_MAX_FRAME_SIZE, 256),
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 2,
+					.static_fq_count = 2,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = DIV_ROUND_UP(ETHERNET_MAX_FRAME_SIZE, 128),
+					.mfs = ETHERNET_MAX_FRAME_SIZE,
+				},
+
+			},
+			[CXI_ETH_SHARED] = {
+				.oxe_settings = {
+					.assured_percent = 0,
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * ETHERNET_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.branch_priority = 1,
+					.mfs_index = 1,
+				},
+			},
+			[CXI_ETH_TC1] = {
+				.eth_settings = {
+					.pcp =  6,
+				},
+				.oxe_settings = {
+					.assured_percent = 10, /* Fabric: 20 */
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * ETHERNET_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.branch_priority = 1,
+					.mfs_index = 1,
+				},
+
+			},
+		},
+	},
+	[CXI_QOS_LL_BE_BD_ET1_ET2] = {
+		.pct_control_pcp = 7,
+		.untagged_eth_pcp = 2, /* Shared with Eth2 */
+		.tcs_active = {
+			[CXI_TC_LOW_LATENCY] = true,
+			[CXI_TC_BULK_DATA] = true,
+			[CXI_TC_BEST_EFFORT] = true,
+
+			[CXI_ETH_SHARED] = true,
+			[CXI_ETH_TC1] = true,
+			[CXI_ETH_TC2] = true,
+		},
+		.tcs = {
+			[CXI_TC_LOW_LATENCY] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 4,
+					.rsp_pcp = 5,
+					.res_rsp_dscp = 40,
+					.unres_rsp_dscp = 41,
+					.res_req_dscp = 32,
+					.unres_req_dscp = 33,
+					.hrp_res_req_dscp = -1,
+					.coll_leaf_res_req_dscp = 52,
+					.restricted_unres_req_dscp = -1,
+				},
+				.ixe_settings = {
+					.fq_count = 2,
+				},
+				.lpe_settings = {
+
+					.fq_count = 2,
+				},
+				.pct_settings = {
+					.trs_rsvd = 64,
+					.mst_rsvd = 64,
+					.tct_rsvd = 256,
+				},
+				.oxe_settings = {
+					.spt_rsvd = 64,
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.srb_rsvd = LOW_LATENCY_SRB_RSVD,
+					.pbuf_rsvd = 13,
+					.assured_percent = 2,
+					.ceiling_percent = 5,
+					.bucket_limit = DIV_ROUND_UP(4 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 7,
+					.leaf_response_priority = 6,
+					.branch_priority = 6,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 2,
+					.static_fq_count = 4,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 128,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_BULK_DATA] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 2,
+					.rsp_pcp = 3,
+					.res_rsp_dscp = 24,
+					.unres_rsp_dscp = 26,
+					.res_req_dscp = 16,
+					.unres_req_dscp = 18,
+					.hrp_res_req_dscp = -1,
+					.coll_leaf_res_req_dscp = -1,
+					.restricted_unres_req_dscp = -1,
+				},
+				.ixe_settings = {
+					.fq_count = 4,
+				},
+				.lpe_settings = {
+					.fq_count = 2,
+				},
+				.pct_settings = {
+					.trs_rsvd = 32,
+					.mst_rsvd = 32,
+					.tct_rsvd = 128,
+				},
+				.oxe_settings = {
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.pbuf_rsvd = 39,
+					.assured_percent = 10, /* Fabric: 20 */
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.leaf_response_priority = 1,
+					.branch_priority = 1,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 4,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 64,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_BEST_EFFORT] = {
+				.dscp_pcp_settings = {
+					.req_pcp = 0,
+					.rsp_pcp = 1,
+					.res_rsp_dscp = 1,
+					.unres_rsp_dscp = 3,
+					.res_req_dscp = 0,
+					.unres_req_dscp = 2,
+					.hrp_res_req_dscp = 7,
+					.coll_leaf_res_req_dscp = -1,
+					.restricted_unres_req_dscp = 30,
+				},
+				.ixe_settings = {
+					.fq_count = 8,
+				},
+				.lpe_settings = {
+					.fq_count = 4,
+				},
+				.pct_settings = {
+					.trs_rsvd = 4,
+					.mst_rsvd = 4,
+					.tct_rsvd = 16,
+				},
+				.oxe_settings = {
+					.smt_rsvd = 4,
+					.sct_rsvd = 4,
+					.pbuf_rsvd = 13,
+					.assured_percent = 10, /* Fabric: 40 */
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * PORTALS_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.leaf_response_priority = 1,
+					.branch_priority = 1,
+					.mfs_index = 0,
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 8,
+					.static_fq_count = 16,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = 17,
+					.mfs = PORTALS_MAX_FRAME_SIZE,
+				},
+			},
+			[CXI_TC_ETH] = {
+				.oxe_settings = {
+					.spt_rsvd = 30,
+					.pbuf_rsvd = DIV_ROUND_UP(ETHERNET_MAX_FRAME_SIZE, 256),
+				},
+				.cq_settings = {
+					.dynamic_fq_count = 2,
+					.static_fq_count = 2,
+					.fq_buf_reserved = 32,
+					.pfq_high_thresh = 64,
+				},
+				.hni_settings = {
+					.pbuf_rsvd = DIV_ROUND_UP(ETHERNET_MAX_FRAME_SIZE, 128),
+					.mfs = ETHERNET_MAX_FRAME_SIZE,
+				},
+
+			},
+			[CXI_ETH_SHARED] = {
+				.oxe_settings = {
+					.assured_percent = 0,
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * ETHERNET_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.branch_priority = 1,
+					.mfs_index = 1,
+				},
+			},
+			[CXI_ETH_TC1] = {
+				.eth_settings = {
+					.pcp =  6,
+				},
+				.oxe_settings = {
+					.assured_percent = 10, /* Fabric: 25 */
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * ETHERNET_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.branch_priority = 1,
+					.mfs_index = 1,
+				},
+
+			},
+			[CXI_ETH_TC2] = {
+				.eth_settings = {
+					.pcp =  2,
+				},
+				.oxe_settings = {
+					.assured_percent = 10, /* Fabric: 13 */
+					.ceiling_percent = 100,
+					.bucket_limit = DIV_ROUND_UP(2 * ETHERNET_MAX_FRAME_SIZE, 1024),
+					.leaf_request_priority = 2,
+					.branch_priority = 1,
+					.mfs_index = 1,
+				},
+
+			},
+
+		},
+	}
+
+};
+
+/* Handle any non hardcoded QoS limits.
+ * Sharing SRB space for example depends on the number of RDMA TCs
+ * that need to sustain max bandwidth and whether or not a C1/C2 dev is in use.
+ */
+void cxi_qos_calculate_limits(struct qos_profile *qos, bool is_c2)
+{
+	unsigned int tc;
+	unsigned int num_active_tcs = 0;
+	unsigned int srb_rsvd;
+
+	/* Count active TCs that need dynamically calculated SRB.
+	 * LOW_LATENCY has an explicit srb_rsvd value and should not be
+	 * counted or overwritten.
+	 */
+	for (tc = 0; tc < CXI_TC_MAX; tc++) {
+		if (!qos->tcs_active[tc])
+			continue;
+		if (tc == CXI_TC_LOW_LATENCY)
+			continue;
+		num_active_tcs++;
+	}
+
+	/* Each active TC needs to sustain max bandwidth.
+	 * Divide up the non-shared srb space between them.
+	 */
+	if (is_c2)
+		srb_rsvd = C2_SRB_RESERVED / num_active_tcs;
+	else
+		srb_rsvd = C1_SRB_RESERVED / num_active_tcs;
+
+	for (tc = 0; tc < CXI_TC_MAX; tc++) {
+		if (!qos->tcs_active[tc])
+			continue;
+
+		/* Skip LOW_LATENCY TC - it has an explicit srb_rsvd value set
+		 * in the QoS profile.
+		 */
+		if (tc == CXI_TC_LOW_LATENCY)
+			continue;
+
+		qos->tcs[tc].oxe_settings.srb_rsvd = srb_rsvd;
+	}
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_rgroup.c b/drivers/net/ethernet/hpe/ss1/cxi_rgroup.c
new file mode 100644
index 000000000000..fe0e19ab4875
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_rgroup.c
@@ -0,0 +1,1791 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+/* Resource Groups */
+
+#include "cass_core.h"
+#include <linux/sched.h>
+#include <linux/nsproxy.h>
+#include <net/net_namespace.h>
+
+/**
+ * get_cass_dev() - type-safe function to get Cassini device pointer
+ *                  from cxi_dev
+ *
+ * @dev: cxi_dev pointer
+ *
+ * Return: containing Cassini device pointer
+ */
+static struct cass_dev *get_cass_dev(struct cxi_dev *dev)
+{
+	return container_of(dev, struct cass_dev, cdev);
+}
+
+/* **************************************************************** */
+/* Rgroup list operations                                           */
+/* **************************************************************** */
+
+static struct xa_limit   rgroup_id_limits = RGROUP_ID_LIMITS;
+
+/**
+ * cxi_dev_lock_rgroup_list() - take the device lock for rgroups
+ *
+ * @hw: Cassini device
+ */
+void cxi_dev_lock_rgroup_list(struct cass_dev *hw)
+	__acquires(&hw->rgroup_list.xarray.xa_lock)
+{
+	xa_lock_nested(&hw->rgroup_list.xarray, SINGLE_DEPTH_NESTING);
+}
+
+/**
+ * cxi_dev_unlock_rgroup_list() - release the device lock for rgroups
+ *
+ * @hw: Cassini device
+ */
+void cxi_dev_unlock_rgroup_list(struct cass_dev *hw)
+	__releases(&hw->rgroup_list.xarray.xa_lock)
+{
+	xa_unlock(&hw->rgroup_list.xarray);
+}
+
+/**
+ * rgroup_list_insert_rgroup() - Insert Resource Group
+ *                                   into device list
+ *
+ * @list: rgroup list pointer
+ * @rgroup: address of rgroup
+ * @id: location to store ID if successful
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOMEM - memory could not be allocated
+ * * -EBUSY  - no free entries available
+ */
+static int rgroup_list_insert_rgroup(struct cxi_rgroup_list *list,
+				     struct cxi_rgroup *rgroup,
+				     unsigned int *id)
+{
+	if (*id)
+		return xa_insert(&list->xarray, *id, rgroup, RGROUP_GFP_OPTS);
+
+	return xa_alloc(&list->xarray, id, rgroup,
+			rgroup_id_limits, RGROUP_GFP_OPTS);
+}
+
+/**
+ * rgroup_list_retrieve_rgroup() - Get Resource Group pointer from list
+ *                                 by id
+ *
+ * @list: rgroup list pointer
+ * @id: desired id
+ * @rgroup: location to store address of rgroup
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - rgroup with desired id not found
+ */
+static int rgroup_list_retrieve_rgroup(struct cxi_rgroup_list *list,
+				       unsigned int id,
+				       struct cxi_rgroup **rgroup)
+{
+	struct cxi_rgroup   *found_rgroup;
+	int    ret;
+
+	found_rgroup = xa_load(&list->xarray, id);
+
+	if (!found_rgroup)
+		return -EBADR;
+
+	ret = xa_err(found_rgroup);
+	if (ret)
+		return ret;
+
+	*rgroup = found_rgroup;
+	return 0;
+}
+
+/**
+ * rgroup_list_remove_rgroup() - delete rgroup from device list
+ *
+ * @list: rgroup list pointer
+ * @rgroup: rgroup pointer
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - rgroup not in device list
+ */
+static int rgroup_list_remove_rgroup(struct cxi_rgroup_list *list,
+				     struct cxi_rgroup *rgroup)
+	__must_hold(&list->xarray.xa_lock)
+{
+	struct cxi_rgroup   *old_value = __xa_erase(&list->xarray, rgroup->id);
+
+	return (old_value == rgroup) ? 0 : -EBADR;
+}
+
+/**
+ * rgroup_list_iterate() - Call a function on each rgroup in the list
+ *
+ * @list: rgroup list pointer
+ * @operator: the function to call
+ * @user_data: second argument to operator function
+ *
+ * Note: iteration stops on non-zero return from operator()
+ *
+ * Return: first non-zero return value of operator or 0
+ */
+static int rgroup_list_iterate(struct cxi_rgroup_list *list,
+			       int (*operator)(struct cxi_rgroup *rgroup,
+					       void *user_data),
+			       void *user_data)
+{
+	struct cxi_rgroup   *rgroup;
+	unsigned long       index = rgroup_id_limits.min;
+
+	xa_for_each(&list->xarray, index, rgroup) {
+		int ret = (*operator)(rgroup, user_data);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/* **************************************************************** */
+/* Resource Entry operations                                        */
+/* **************************************************************** */
+
+static struct xa_limit  resource_entry_id_limits = RESOURCE_ENTRY_ID_LIMITS;
+
+/**
+ * resource_entry_list_init() - configure the list of resource entries
+ *
+ * @list: list pointer
+ */
+static void resource_entry_list_init(struct cxi_resource_entry_list *list)
+{
+	xa_init_flags(&list->xarray, RESOURCE_ENTRY_XARRAY_FLAGS);
+}
+
+/**
+ * resource_entry_list_lock() - lock the list
+ *
+ * @list: list pointer
+ */
+static void resource_entry_list_lock(struct cxi_resource_entry_list *list)
+	__acquires(&list->xarray.xa_lock)
+{
+	xa_lock(&list->xarray);
+}
+
+/**
+ * resource_entry_list_unlock() - unlock the list
+ *
+ * @list: list pointer
+ */
+static void resource_entry_list_unlock(struct cxi_resource_entry_list *list)
+	__releases(&list->xarray.xa_lock)
+{
+	xa_unlock(&list->xarray);
+}
+
+/**
+ * resource_entry_list_destroy() - remove all resource entries and free
+ *                                 list
+ *
+ * @rgroup: rgroup pointer
+ */
+static void resource_entry_list_destroy(struct cxi_rgroup *rgroup)
+{
+	struct cxi_resource_entry *resource_entry;
+	unsigned long index = resource_entry_id_limits.min;
+	struct cxi_resource_entry_list *list = &rgroup->resource_entry_list;
+
+	resource_entry_list_lock(list);
+
+	xa_for_each(&list->xarray, index, resource_entry) {
+		cass_rgroup_remove_resource(rgroup, resource_entry);
+		__xa_erase(&list->xarray, resource_entry->type);
+		kfree(resource_entry);
+	}
+
+	resource_entry_list_unlock(list);
+
+	xa_destroy(&list->xarray);
+}
+
+/**
+ * resource_entry_list_retrieve_resource_entry() - Get the Resource Entry
+ *          pointer for a given type from the list, if it exists.
+ *
+ * @list: the list pointer
+ * @type: the type to retrieve
+ * @resource_entry: location to store Resource Entry pointer
+ *
+ * Return:
+ * * 0      - success
+ * * -EBADR  - No Resource Entry with given type found
+ */
+static int
+resource_entry_list_retrieve_resource_entry(struct cxi_resource_entry_list *list,
+					    enum cxi_resource_type type,
+					    struct cxi_resource_entry **resource_entry)
+{
+	*resource_entry = xa_load(&list->xarray, type);
+
+	return (*resource_entry) ? 0 : -EBADR;
+}
+
+/**
+ * resource_entry_list_iterate() - call a function for each entry in the list
+ *
+ * @list: the list pointer
+ * @operator: function to call for each list element
+ * @user_data: second argument to operator function
+ *
+ * Note: iteration is discontinued with a non-zero return from 'operator'.
+ *
+ * Return: first non-zero return from operator or 0.
+ */
+static int
+resource_entry_list_iterate(struct cxi_resource_entry_list *list,
+			    int (*operator)(struct cxi_resource_entry *entry,
+					    void *user_data),
+			    void *user_data)
+{
+	struct cxi_resource_entry   *resource_entry;
+	unsigned long               index = resource_entry_id_limits.min;
+
+	xa_for_each(&list->xarray, index, resource_entry) {
+		int ret = (*operator)(resource_entry, user_data);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * validate_resource_type() - test type and limits for acceptable values
+ *
+ * @type: resource type to validate
+ *
+ * Return: true if recognized type value, false otherwise.
+ */
+static bool validate_resource_type(unsigned int type)
+{
+	switch (type) {
+	case CXI_RESOURCE_PTLTE:
+	case CXI_RESOURCE_TXQ:
+	case CXI_RESOURCE_TGQ:
+	case CXI_RESOURCE_EQ:
+	case CXI_RESOURCE_CT:
+	case CXI_RESOURCE_PE0_LE:
+	case CXI_RESOURCE_PE1_LE:
+	case CXI_RESOURCE_PE2_LE:
+	case CXI_RESOURCE_PE3_LE:
+	case CXI_RESOURCE_TLE:
+	case CXI_RESOURCE_AC:
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
+static bool validate_resource_limits(const struct cass_dev *hw,
+				     unsigned int type,
+				     const struct cxi_resource_limits *limits)
+{
+	if (!validate_resource_type(type))
+		return false;
+
+	/* TODO: actually validate limits based on type */
+
+	return true;
+}
+
+static bool validate_resource_entry(const struct cxi_resource_entry *entry)
+{
+	return validate_resource_limits(entry->rgroup->hw,
+					entry->type,
+					&entry->limits);
+}
+
+/**
+ * resource_entry_list_add_resource_entry() - add a resource entry to the list
+ *
+ * @list: resource entry list
+ * @entry: pointer to entry to add
+ *
+ * Return:
+ * * 0        - success
+ * * -EEXIST - resource with given type already exists
+ * * -ENOMEM - allocation error
+ */
+static int
+resource_entry_list_add_resource_entry(struct cxi_resource_entry_list *list,
+				       struct cxi_resource_entry *entry)
+{
+	int     ret;
+
+	if (!validate_resource_entry(entry))
+		return -EINVAL;
+
+	ret = xa_insert(&list->xarray, entry->type, entry,
+			RESOURCE_ENTRY_GFP_OPTS);
+
+	switch (ret) {
+	case -EBUSY:
+		return -EEXIST;
+	default:
+		return ret;
+	}
+}
+
+/**
+ * resource_entry_list_delete_resource_entry() - remove a resource entry
+ *                                               from the list
+ *
+ * @list: pointer to list
+ * @resource_entry: pointer to resource entry
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - resource entry not found in list
+ */
+static int
+resource_entry_list_delete_resource_entry(struct cxi_resource_entry_list *list,
+					  struct cxi_resource_entry *resource_entry)
+	__must_hold(&list->xarray.xa_lock)
+{
+	struct cxi_resource_entry    *old;
+	int    ret;
+
+	/* It's possible for the entry to change before the lock
+	 * was taken.  So we need to make sure we delete
+	 * the right one.
+	 */
+
+	old = __xa_erase(&list->xarray, resource_entry->type);
+
+	ret = (old == resource_entry) ? 0 : -EBADR;
+
+	if (ret) {
+		/* If it's changed, we erased the wrong entry, so
+		 * put it back.
+		 */
+		__xa_store(&list->xarray, old->type, old,
+			   RESOURCE_ENTRY_GFP_OPTS);
+	}
+
+	return ret;
+}
+
+/* **************************************************************** */
+/* Rgroup operations                                                */
+/* **************************************************************** */
+
+/**
+ * validate_rgroup_attr() - test attributes for useability
+ *
+ * @dev: CXI device pointer
+ * @attr: pointer to attributes
+ *
+ * Return:
+ * * 0        - success
+ */
+static int validate_rgroup_attr(const struct cxi_dev *dev,
+				const struct cxi_rgroup_attr *attr)
+{
+	/* TODO: really validate attributes */
+
+	return 0;
+}
+
+/**
+ * rgroup_init() - initialize a newly created rgroup
+ *
+ * @dev: CXI device that rgroup belongs to
+ * @rgroup: rgroup pointer
+ * @attr: desired attributes for rgroup
+ *
+ * Return:
+ * * 0       - success
+ * * -EINVAL - invalid dev, rgroup or attr pointer
+ */
+static void rgroup_init(struct cxi_dev *dev,
+			struct cxi_rgroup *rgroup,
+			const struct cxi_rgroup_attr *attr)
+{
+	int i;
+
+	for (i = 0; i < C_PE_COUNT; i++)
+		rgroup->pools.le_pool_id[i] = -1;
+
+	rgroup->pools.tle_pool_id = -1;
+	rgroup->attr.lnis_per_rgid = CXI_DEFAULT_LNIS_PER_RGID;
+
+	if (attr)
+		rgroup->attr = *attr;
+
+	rgroup->hw = get_cass_dev(dev);
+	rgroup->state.enabled = false;
+	refcount_set(&rgroup->state.refcount, 1);
+	resource_entry_list_init(&rgroup->resource_entry_list);
+	cxi_ac_entry_list_init(&rgroup->ac_entry_list);
+}
+
+static int resource_busy(struct cxi_resource_entry *entry,
+			 void *user_data)
+{
+	return (entry->limits.in_use) ? -EBUSY : 0;
+}
+
+/**
+ * rgroup_busy() - determine if any rgroup resources are allocated
+ *
+ * @rgroup: pointer to rgroup
+ *
+ * Return:
+ * * true  - rgroup has resources allocated for it
+ * * false - no resources associated with rgroup
+ */
+static bool rgroup_busy(struct cxi_rgroup *rgroup)
+{
+	return resource_entry_list_iterate(&rgroup->resource_entry_list,
+					   resource_busy, NULL);
+}
+
+/**
+ * find_rgroup_inc_refcount() - retrieve rgroup from device by id
+ *
+ * @dev: CXI device pointer
+ * @id: id of desired Resource Group
+ * @rgroup: location to store rgroup pointer
+ *
+ * Return:
+ * * 0       - success
+ * * -EINVAL - invalid hw or rgroup pointers
+ * * -EBADR  - rgroup with given id not found
+ *
+ * Note: returns rgroup which may be in the process of being
+ * torn down, ie, released.
+ *
+ * Use cxi_dev_find_rgroup_inc_refcount() to get only active rgroups.
+ */
+static int find_rgroup_inc_refcount(struct cxi_dev *dev,
+				    unsigned int id,
+				    struct cxi_rgroup **rgroup)
+{
+	struct cass_dev         *hw          = get_cass_dev(dev);
+	struct cxi_rgroup       *found_rgroup;
+	int    ret = 0;
+
+	cxi_dev_lock_rgroup_list(hw);
+
+	ret = rgroup_list_retrieve_rgroup(&hw->rgroup_list, id, &found_rgroup);
+	if (ret)
+		goto unlock_return;
+
+	if (!refcount_inc_not_zero(&found_rgroup->state.refcount)) {
+		ret = -EBADR;
+		goto unlock_return;
+	}
+
+	*rgroup = found_rgroup;
+
+unlock_return:
+	cxi_dev_unlock_rgroup_list(hw);
+	return ret;
+}
+
+/**
+ * rgroup_destroy() - remove resources associated with rgroup and
+ *                    free memory
+ *
+ * @rgroup: pointer to rgroup
+ */
+static void rgroup_destroy(struct cxi_rgroup *rgroup)
+{
+	cxi_ac_entry_list_destroy(&rgroup->ac_entry_list);
+	resource_entry_list_destroy(rgroup);
+	refcount_dec(&rgroup->hw->refcount);
+	kfree(rgroup);
+}
+
+/**
+ * rgroup_dec_refcount_and_destroy() - release reference to rgroup
+ *
+ * @rgroup: pointer to rgroup
+ *
+ * Return:
+ * * 0       - success
+ * * -EBUSY  - refcount decremented, resources still exist on rgroup
+ * * -EBADR  - rgroup no longer in device list
+ *
+ * Most users will want to use cxi_rgroup_dec_refcount().
+ */
+static int rgroup_dec_refcount_and_destroy(struct cxi_rgroup *rgroup)
+{
+	struct cass_dev   *hw = rgroup->hw;
+	bool   outstanding_refs;
+	int    ret = 0;
+
+	cxi_dev_lock_rgroup_list(hw);
+
+	outstanding_refs = !refcount_dec_and_test(&rgroup->state.refcount);
+
+	if (outstanding_refs || rgroup_busy(rgroup)) {
+		ret = -EBUSY;
+		goto unlock_return;
+	}
+
+	ret = rgroup_list_remove_rgroup(&hw->rgroup_list, rgroup);
+	if (!ret)
+		rgroup_destroy(rgroup);
+
+unlock_return:
+	cxi_dev_unlock_rgroup_list(hw);
+	return ret;
+}
+
+/* **************************************************************** */
+/* Rgroup API                                                       */
+/* **************************************************************** */
+
+/**
+ * cxi_rgroup_is_enabled() - Report Resource group is enabled.
+ *
+ * @rgroup: resource group pointer
+ *
+ * Return:
+ * * true    - Is enabled
+ * * false   - Is disabled
+ */
+bool cxi_rgroup_is_enabled(struct cxi_rgroup *rgroup)
+{
+	return rgroup->state.enabled;
+}
+
+/**
+ * cxi_rgroup_enable() - Mark a Resource group as enabled.
+ *
+ * @rgroup: resource group pointer
+ */
+void cxi_rgroup_enable(struct cxi_rgroup *rgroup)
+{
+	cxi_dev_lock_rgroup_list(rgroup->hw);
+
+	rgroup->state.enabled = true;
+
+	cxi_dev_unlock_rgroup_list(rgroup->hw);
+}
+EXPORT_SYMBOL(cxi_rgroup_enable);
+
+/**
+ * cxi_rgroup_disable() - Mark a Resource group as disabled.
+ *
+ * @rgroup: resource group pointer
+ */
+void cxi_rgroup_disable(struct cxi_rgroup *rgroup)
+{
+	cxi_dev_lock_rgroup_list(rgroup->hw);
+
+	rgroup->state.enabled = false;
+
+	cxi_dev_unlock_rgroup_list(rgroup->hw);
+}
+EXPORT_SYMBOL(cxi_rgroup_disable);
+
+/**
+ * cxi_rgroup_id() - Get the rgroup id
+ *
+ * @rgroup: resource group pointer
+ *
+ * Return: ID of rgroup
+ */
+unsigned int cxi_rgroup_id(const struct cxi_rgroup *rgroup)
+{
+	return rgroup->id;
+}
+EXPORT_SYMBOL(cxi_rgroup_id);
+
+/**
+ * cxi_rgroup_name() - Get the rgroup name
+ *
+ * @rgroup: resource group pointer
+ */
+char *cxi_rgroup_name(struct cxi_rgroup *rgroup)
+{
+	return rgroup->attr.name;
+}
+EXPORT_SYMBOL(cxi_rgroup_name);
+
+/**
+ * cxi_rgroup_le_pool_id() - Get the rgroup le_pool_id at index
+ *
+ * @rgroup: resource group pointer
+ * @index: pool array index
+ *
+ * Return: LE pool id value
+ */
+int cxi_rgroup_le_pool_id(const struct cxi_rgroup *rgroup, int index)
+{
+	return rgroup->pools.le_pool_id[index];
+}
+
+/**
+ * cxi_rgroup_tle_pool_id() - Get the rgroup tle_pool_id
+ *
+ * @rgroup: resource group pointer
+ *
+ * Return: TLE pool id value
+ */
+int cxi_rgroup_tle_pool_id(const struct cxi_rgroup *rgroup)
+{
+	return rgroup->pools.tle_pool_id;
+}
+
+/**
+ * cxi_rgroup_cntr_pool_id() - Get the rgroup cntr_pool_id attribute
+ *
+ * @rgroup: resource group pointer
+ *
+ * Return: cntr_pool_id value
+ */
+unsigned int cxi_rgroup_cntr_pool_id(const struct cxi_rgroup *rgroup)
+{
+	return rgroup->attr.cntr_pool_id;
+}
+
+/**
+ * cxi_rgroup_system_service() - Get the rgroup system_service attribute
+ *
+ * @rgroup: resource group pointer
+ *
+ * Return: system_service value
+ */
+bool cxi_rgroup_system_service(const struct cxi_rgroup *rgroup)
+{
+	return rgroup->attr.system_service;
+}
+
+/**
+ * cxi_rgroup_lnis_per_rgid() - Get the rgroup lnis_per_rgid
+ *
+ * @rgroup: resource group pointer
+ *
+ * Return: the lnis_per_rgid value
+ */
+unsigned int cxi_rgroup_lnis_per_rgid(const struct cxi_rgroup *rgroup)
+{
+	return rgroup->attr.lnis_per_rgid;
+}
+
+/**
+ * cxi_rgroup_refcount() - Get the rgroup refcount
+ *
+ * @rgroup: resource group pointer
+ *
+ * Return: the refcount value
+ */
+int cxi_rgroup_refcount(const struct cxi_rgroup *rgroup)
+{
+	return refcount_read(&rgroup->state.refcount);
+}
+
+/**
+ * cxi_rgroup_set_lnis_per_rgid_compat() - Set the rgroup lnis_per_rgid
+ *
+ * For compatibility with the "old" service api, don't check if rgroup
+ * is enabled.
+ *
+ * @rgroup: resource group pointer
+ * @lnis_per_rgid: Value to set
+ */
+void cxi_rgroup_set_lnis_per_rgid_compat(struct cxi_rgroup *rgroup,
+					 int lnis_per_rgid)
+{
+	rgroup->attr.lnis_per_rgid = lnis_per_rgid;
+}
+
+/**
+ * cxi_rgroup_set_lnis_per_rgid() - Set the rgroup lnis_per_rgid
+ *
+ * @rgroup: resource group pointer
+ * @lnis_per_rgid: Value to set
+ *
+ * Return: 0 - success, -EBUSY if not enabled
+ */
+int cxi_rgroup_set_lnis_per_rgid(struct cxi_rgroup *rgroup, int lnis_per_rgid)
+{
+	if (cxi_rgroup_is_enabled(rgroup))
+		return -EBUSY;
+
+	cxi_rgroup_set_lnis_per_rgid_compat(rgroup, lnis_per_rgid);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rgroup_set_lnis_per_rgid);
+
+/**
+ * cxi_rgroup_set_cntr_pool_id() - Set the rgroup cntr_pool_id
+ *
+ * @rgroup: resource group pointer
+ * @cntr_pool_id: Value to set
+ *
+ * Return: 0 - success, -EBUSY if not enabled
+ */
+int cxi_rgroup_set_cntr_pool_id(struct cxi_rgroup *rgroup, int cntr_pool_id)
+{
+	if (cxi_rgroup_is_enabled(rgroup))
+		return -EBUSY;
+
+	rgroup->attr.cntr_pool_id = cntr_pool_id;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rgroup_set_cntr_pool_id);
+
+/**
+ * cxi_rgroup_set_system_service() - Set the rgroup system_service
+ *
+ * @rgroup: resource group pointer
+ * @system_service: Value to set
+ *
+ * Return: 0 - success, -EBUSY if not enabled
+ */
+int cxi_rgroup_set_system_service(struct cxi_rgroup *rgroup, bool system_service)
+{
+	if (cxi_rgroup_is_enabled(rgroup))
+		return -EBUSY;
+
+	rgroup->attr.system_service = system_service;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rgroup_set_system_service);
+
+/**
+ * cxi_rgroup_set_name() - Set the rgroup name
+ *
+ * @rgroup: resource group pointer
+ * @name: name string
+ *
+ * Return: 0 - success, -EBUSY if not enabled
+ */
+int cxi_rgroup_set_name(struct cxi_rgroup *rgroup, char *name)
+{
+	if (cxi_rgroup_is_enabled(rgroup))
+		return -EBUSY;
+
+	strscpy(rgroup->attr.name, name, ARRAY_SIZE(rgroup->attr.name));
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rgroup_set_name);
+
+/**
+ * cxi_rgroup_get_info() - retrieve the attr and state of a resource group
+ *
+ * @rgroup: rgroup pointer
+ * @attr: location to store attributes
+ * @state: location to store state
+ *
+ * Note: attr and/or state may be NULL.
+ */
+void cxi_rgroup_get_info(struct cxi_rgroup *rgroup,
+			 struct cxi_rgroup_attr *attr,
+			 struct cxi_rgroup_state *state)
+{
+	if (attr) {
+		attr->id = rgroup->id;
+		attr->cntr_pool_id   = rgroup->attr.cntr_pool_id;
+		attr->system_service = rgroup->attr.system_service;
+		strscpy(attr->name, rgroup->attr.name, ARRAY_SIZE(attr->name));
+	}
+
+	if (state) {
+		state->enabled  = rgroup->state.enabled;
+		state->refcount = rgroup->state.refcount;
+	}
+}
+EXPORT_SYMBOL(cxi_rgroup_get_info);
+
+/**
+ * cxi_rgroup_valid_user() - Verify user is has permission to use rgroup
+ *
+ * @rgroup: resource group pointer
+ *
+ * Return:
+ * * true if user has permission
+ */
+bool cxi_rgroup_valid_user(struct cxi_rgroup *rgroup)
+{
+	unsigned int ac_entry_id;
+	unsigned int netns = CURRENT_NETNS_ID();
+	uid_t uid = __kuid_val(current_euid());
+	gid_t gid = __kgid_val(current_egid());
+
+	return !cxi_rgroup_get_ac_entry_by_user(rgroup, uid, gid, netns,
+						CXI_AC_ANY, &ac_entry_id);
+}
+
+/**
+ * cxi_rgroup_add_resource() - add a resource to this resource group
+ *
+ * @rgroup: resource group pointer
+ * @type: resource type to add
+ * @limits: parameters of the resource
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOMEM - unable to allocate memory for resources
+ * * -EEXIST - resource already exists within group
+ * * -EBUSY  - rgroup is enabled
+ * * -ENOSPC - No space to add resource
+ * * -EBADR  - Failed to allocate an LE or TLE pool
+ */
+int cxi_rgroup_add_resource(struct cxi_rgroup *rgroup,
+			    enum cxi_resource_type type,
+			    const struct cxi_resource_limits *limits)
+{
+	struct cxi_resource_entry_list   *list = &rgroup->resource_entry_list;
+	struct cxi_resource_entry        *resource_entry;
+	int    ret;
+
+	if (cxi_rgroup_is_enabled(rgroup))
+		return -EBUSY;
+
+	if (!validate_resource_limits(rgroup->hw, type, limits))
+		return -EINVAL;
+
+	/* Allocate a new one */
+	resource_entry = kzalloc(sizeof(*resource_entry),
+				 RESOURCE_ENTRY_GFP_OPTS);
+	if (!resource_entry)
+		return -ENOMEM;
+
+	resource_entry->rgroup = rgroup;
+	resource_entry->type   = type;
+	resource_entry->limits = *limits;
+	resource_entry->limits.in_use = 0;
+
+	/* Try to insert into the list */
+	ret = resource_entry_list_add_resource_entry(list, resource_entry);
+	if (ret) {
+		kfree(resource_entry);
+		return ret;
+	}
+
+	ret = cass_rgroup_add_resource(rgroup, resource_entry);
+	if (!ret)
+		return 0;
+
+	resource_entry_list_lock(list);
+	resource_entry_list_delete_resource_entry(list, resource_entry);
+	resource_entry_list_unlock(list);
+	kfree(resource_entry);
+
+	return ret;
+}
+EXPORT_SYMBOL(cxi_rgroup_add_resource);
+
+void cxi_rgroup_free_resource(struct cxi_rgroup *rgroup,
+			      enum cxi_resource_type type)
+{
+	int rc;
+	struct cxi_resource_entry *entry;
+
+	rc = cxi_rgroup_get_resource_entry(rgroup, type, &entry);
+	if (rc) {
+		pr_warn("Failed to get resource_entry rc:%d\n", rc);
+		return;
+	}
+
+	cass_free_resource(rgroup, entry);
+}
+
+int cxi_rgroup_alloc_resource(struct cxi_rgroup *rgroup,
+			      enum cxi_resource_type type)
+{
+	int rc;
+	struct cxi_resource_entry *entry;
+
+	if (!cxi_rgroup_is_enabled(rgroup))
+		return -EKEYREVOKED;
+
+	rc = cxi_rgroup_get_resource_entry(rgroup, type, &entry);
+	if (rc) {
+		pr_debug("Failed to get resource_entry rc:%d\n", rc);
+		return rc;
+	}
+
+	return cass_alloc_resource(rgroup, entry);
+}
+
+/**
+ * cxi_rgroup_delete_resource() - remove a resource from a group
+ *
+ * @rgroup: resource group pointer
+ * @type: resource type to remove
+ *
+ * Return:
+ * * 0        - success
+ * * -EBUSY   - resource group unavailable
+ * * -ENODATA - resource does not exist within group
+ */
+int cxi_rgroup_delete_resource(struct cxi_rgroup *rgroup,
+			       enum cxi_resource_type type)
+{
+	struct cxi_resource_entry_list  *list = &rgroup->resource_entry_list;
+	struct cxi_resource_entry       *resource_entry;
+	int    ret;
+
+	if (cxi_rgroup_is_enabled(rgroup))
+		return -EBUSY;
+
+	resource_entry_list_lock(list);
+
+	ret = resource_entry_list_retrieve_resource_entry(list, type,
+							  &resource_entry);
+	if (ret || !resource_entry) {
+		ret = -ENODATA;
+		goto unlock_return;
+	}
+
+	ret = cass_rgroup_remove_resource(rgroup, resource_entry);
+	if (ret)
+		goto unlock_return;
+
+	resource_entry_list_delete_resource_entry(list, resource_entry);
+	kfree(resource_entry);
+
+unlock_return:
+	resource_entry_list_unlock(list);
+	return ret;
+}
+EXPORT_SYMBOL(cxi_rgroup_delete_resource);
+
+/**
+ * cxi_rgroup_get_resource_entry() - retrieve a resource entry
+ *
+ * @rgroup: resource group pointer
+ * @type: resource type to retrieve parameters for
+ * @entry: the resource entry
+ *
+ * Returns:
+ * 0: success
+ * * -EINVAL  - bad rgroup pointer
+ * * -EINVAL  - invalid limits value
+ * * -ENOENT  - resource not found within group
+ */
+int cxi_rgroup_get_resource_entry(struct cxi_rgroup *rgroup,
+				  enum cxi_resource_type type,
+				  struct cxi_resource_entry **entry)
+{
+	struct cxi_resource_entry_list *list = &rgroup->resource_entry_list;
+
+	return resource_entry_list_retrieve_resource_entry(list, type, entry);
+}
+
+/**
+ * cxi_rgroup_get_resource() - retrieve limits for a resource
+ *                             The TLE in_use needs to be read from hw.
+ *
+ * @rgroup: resource group pointer
+ * @type: resource type to retrieve parameters for
+ * @limits: location to store resource parameters
+ *
+ * Return:
+ * 0: success
+ * * -ENODATA - resource not found within group
+ */
+int cxi_rgroup_get_resource(struct cxi_rgroup *rgroup,
+			    enum cxi_resource_type type,
+			    struct cxi_resource_limits *limits)
+{
+	struct cxi_resource_entry  *resource_entry;
+	int    ret;
+
+	ret = resource_entry_list_retrieve_resource_entry(&rgroup->resource_entry_list,
+							  type, &resource_entry);
+
+	if (ret || !resource_entry)
+		return -ENODATA;
+
+	if (type == CXI_RESOURCE_TLE)
+		cass_get_tle_in_use(rgroup, resource_entry);
+
+	*limits = resource_entry->limits;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rgroup_get_resource);
+
+struct resource_types_data {
+	size_t         max_types;
+	unsigned int   *types;
+	size_t         num_types;
+};
+
+static int get_types_operator(struct cxi_resource_entry *resource_entry,
+			      void *user_data)
+{
+	struct resource_types_data    *data = user_data;
+
+	if (data->num_types < data->max_types) {
+		*data->types = resource_entry->type;
+		data->types++;
+	}
+
+	data->num_types++;
+	return 0;
+}
+
+/**
+ * cxi_rgroup_get_resource_types() - Retrieve list of resource within a group
+ *
+ * @rgroup: resource group pointer
+ * @max_resources: size of the resource_types array
+ * @resource_types: User allocated array to store type values
+ * @num_resources: On success, number of valid entries in resource_types array
+ * On -ENOSPC, value of max_resources needed to retrieve all values
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOSPC - max_resources is not large enough
+ */
+int cxi_rgroup_get_resource_types(struct cxi_rgroup *rgroup,
+				  size_t max_resources,
+				  enum cxi_resource_type *resource_types,
+				  size_t *num_resources)
+{
+	struct resource_types_data  data = {
+		.max_types = max_resources,
+		.types     = resource_types,
+		.num_types = 0,
+	};
+	int    ret = resource_entry_list_iterate(&rgroup->resource_entry_list,
+						 get_types_operator, &data);
+
+	if (ret)
+		return ret;
+
+	*num_resources = data.num_types;
+	return (*num_resources > max_resources) ? -ENOSPC : 0;
+}
+EXPORT_SYMBOL(cxi_rgroup_get_resource_types);
+
+/**
+ * cxi_rgroup_add_ac_entry() - Add access control entry to resource group
+ *
+ * @rgroup: resource group pointer
+ * @type: type of the access control entry
+ * @data: access control parameters
+ * @ac_entry_id: location to store id of access control entry
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - invalid type value
+ * * -ENOMEM - unable to allocate memory for request
+ * * -EEXIST - access control entry already exists
+ * * -EBUSY  - rgroup is enabled
+ */
+int cxi_rgroup_add_ac_entry(struct cxi_rgroup *rgroup,
+			    enum cxi_ac_type type,
+			    const union cxi_ac_data *data,
+			    unsigned int *ac_entry_id)
+{
+	if (cxi_rgroup_is_enabled(rgroup))
+		return -EBUSY;
+
+	return cxi_ac_entry_list_insert(&rgroup->ac_entry_list,
+					type, data, ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_rgroup_add_ac_entry);
+
+/**
+ * cxi_rgroup_update_ac_entry() - Add a new AC type to resource group
+ *
+ * The new AC type can be added only when rgroup is not enabled
+ *
+ * @rgroup: resource group pointer
+ * @type: type of the access control entry
+ * @data: access control parameters
+ * @ac_entry_id: location to store id of access control entry
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - invalid type value
+ * * -ENOMEM - unable to allocate memory for request
+ * * -EEXIST - access control entry already exists
+ * * -EBUSY  - rgroup is enabled
+ */
+int cxi_rgroup_update_ac_entry(struct cxi_rgroup *rgroup,
+			       enum cxi_ac_type type,
+			       const union cxi_ac_data *data,
+			       unsigned int *ac_entry_id)
+{
+	if (cxi_rgroup_is_enabled(rgroup))
+		return -EBUSY;
+
+	return cxi_ac_entry_list_insert(&rgroup->ac_entry_list,
+					type, data, ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_rgroup_update_ac_entry);
+
+/**
+ * cxi_rgroup_delete_ac_entry() - remove an access control entry from a
+ * resource group
+ *
+ * @rgroup: resource group pointer
+ * @ac_entry_id: id of the access control entry
+ *
+ * Return:
+ * * 0        - success
+ * * -ENODATA - access control entry does not exist
+ * * -EBUSY  - rgroup is enabled
+ */
+int cxi_rgroup_delete_ac_entry(struct cxi_rgroup *rgroup,
+			       unsigned int ac_entry_id)
+{
+	if (cxi_rgroup_is_enabled(rgroup))
+		return -EBUSY;
+
+	return cxi_ac_entry_list_delete(&rgroup->ac_entry_list,
+					ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_rgroup_delete_ac_entry);
+
+/**
+ * cxi_rgroup_get_ac_entry_ids() - retrieve all the access control ids for a
+ * resource group
+ *
+ * @rgroup: resource group pointer
+ * @max_ids: size of the 'ids' array
+ * @ids: User allocated array for storage of access control ids
+ * @num_ids: On success, number of valid id values in the array 'ids'.
+ * On -ENOSPC: value of max_ids required to retrieve all the values.
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOSPC - max_ids is not large enough
+ */
+int cxi_rgroup_get_ac_entry_ids(struct cxi_rgroup *rgroup,
+				size_t max_ids,
+				unsigned int *ids,
+				size_t *num_ids)
+{
+	return cxi_ac_entry_list_get_ids(&rgroup->ac_entry_list,
+					 max_ids, ids, num_ids);
+}
+EXPORT_SYMBOL(cxi_rgroup_get_ac_entry_ids);
+
+/**
+ * cxi_rgroup_get_ac_entry_data() - get the data parameters from
+ *                                  an ac_entry in the resource group
+ *
+ * @rgroup: resource group pointer
+ * @ac_entry_id: id of the access control entry to retrieve
+ * @ac_type: location to store type of entry
+ * @ac_data: location to store access control data
+ *
+ * Return:
+ * * 0        - success
+ * * -ENODATA - access control entry not found
+ */
+int cxi_rgroup_get_ac_entry_data(struct cxi_rgroup *rgroup,
+				 unsigned int ac_entry_id,
+				 enum cxi_ac_type *ac_type,
+				 union cxi_ac_data *ac_data)
+{
+	return cxi_ac_entry_list_retrieve_by_id(&rgroup->ac_entry_list,
+						ac_entry_id, ac_type, ac_data);
+}
+EXPORT_SYMBOL(cxi_rgroup_get_ac_entry_data);
+
+/**
+ * cxi_rgroup_get_ac_entry_id_by_data() - get the id of an ac entry if it exists
+ *                                        in the resource group
+ *
+ * @rgroup: resource group pointer
+ * @ac_type: the type of the entry
+ * @ac_data: the data (uid/gid) of the entry
+ * @ac_entry_id: location to store Id value
+ *
+ * Return:
+ * * 0        - success
+ * * -ENODATA - access control entry not found
+ */
+int cxi_rgroup_get_ac_entry_id_by_data(struct cxi_rgroup *rgroup,
+				       enum cxi_ac_type ac_type,
+				       const union cxi_ac_data *ac_data,
+				       unsigned int *ac_entry_id)
+{
+	return cxi_ac_entry_list_retrieve_by_data(&rgroup->ac_entry_list,
+						  ac_type, ac_data,
+						  ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_rgroup_get_ac_entry_id_by_data);
+
+/**
+ * cxi_rgroup_get_ac_entry_by_user() - get an access control entry which covers the
+ *                                     given uid/gid, if any.  There may be more than
+ *                                     one possible, the priority order is:
+ *                                     OPEN, GID, UID.
+ *
+ * @rgroup: resource group pointer
+ * @uid: user id
+ * @gid: group id
+ * @netns: The Network namespace id
+ * @desired_types: bitset of types to search
+ * @ac_entry_id: location to store the id
+ *
+ * Return:
+ * * 0        - success
+ * * -ENODATA - access control entry not found
+ */
+int cxi_rgroup_get_ac_entry_by_user(struct cxi_rgroup *rgroup,
+				    uid_t uid,
+				    gid_t gid,
+				    unsigned int netns,
+				    cxi_ac_typeset_t desired_types,
+				    unsigned int *ac_entry_id)
+{
+	return cxi_ac_entry_list_retrieve_by_user(&rgroup->ac_entry_list,
+						  uid, gid, netns,
+						  desired_types, ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_rgroup_get_ac_entry_by_user);
+
+/**
+ * cxi_rgroup_inc_refcount() - take a reference to an rgroup
+ *
+ * @rgroup: rgroup pointer
+ */
+void cxi_rgroup_inc_refcount(struct cxi_rgroup *rgroup)
+{
+	refcount_inc(&rgroup->state.refcount);
+}
+
+/**
+ * cxi_rgroup_dec_refcount() - release reference to rgroup
+ *
+ * @rgroup: pointer to rgroup
+ *
+ * Return:
+ * * 0       - success
+ * * -EINVAL - invalid rgroup pointer
+ */
+int cxi_rgroup_dec_refcount(struct cxi_rgroup *rgroup)
+{
+	int    ret = rgroup_dec_refcount_and_destroy(rgroup);
+
+	switch (ret) {
+	case 0:
+	case -EBUSY:
+		return 0;
+	default:
+		return ret;
+	}
+}
+EXPORT_SYMBOL(cxi_rgroup_dec_refcount);
+
+/**
+ * cxi_rgroup_ac_entry_list_destroy() - destroy the rgroup ac_entry_list
+ *
+ * @rgroup: pointer to rgroup
+ */
+void cxi_rgroup_ac_entry_list_destroy(struct cxi_rgroup *rgroup)
+{
+	cxi_ac_entry_list_destroy(&rgroup->ac_entry_list);
+}
+
+/* **************************************************************** */
+/* Device level Rgroup operations                                   */
+/* **************************************************************** */
+
+/**
+ * cxi_dev_rgroup_init() - initialize CXI device rgroup entities
+ *
+ * @dev: CXI device pointer
+ */
+void cxi_dev_rgroup_init(struct cxi_dev *dev)
+{
+	struct cass_dev    *hw = get_cass_dev(dev);
+
+	xa_init_flags(&hw->rgroup_list.xarray, RGROUP_XARRAY_FLAGS);
+}
+
+/**
+ * cxi_dev_rgroup_fini() - destroy rgroup entities in Cassini device
+ *
+ * @dev: cxi device pointer
+ */
+void cxi_dev_rgroup_fini(struct cxi_dev *dev)
+{
+	struct cass_dev    *hw = get_cass_dev(dev);
+	struct cxi_rgroup  *rgroup;
+	unsigned long id;
+
+	cxi_dev_lock_rgroup_list(hw);
+
+	for_each_rgroup(id, rgroup)
+		rgroup_destroy(rgroup);
+
+	cxi_dev_unlock_rgroup_list(hw);
+
+	xa_destroy(&hw->rgroup_list.xarray);
+}
+
+/**
+ * cxi_dev_alloc_rgroup() - Allocate a resource group
+ *
+ * @dev: Cassini Device
+ * @attr: Attributes of the Resource Group Requested
+ *
+ * Return: rgroup object on success. Else, negative errno value.
+ */
+struct cxi_rgroup *cxi_dev_alloc_rgroup(struct cxi_dev *dev,
+					const struct cxi_rgroup_attr *attr)
+{
+	struct cass_dev *hw = get_cass_dev(dev);
+	struct cxi_rgroup *rgroup;
+	int    ret;
+	unsigned int id = attr ? attr->id : 0;
+
+	ret = validate_rgroup_attr(dev, attr);
+	if (ret)
+		return ERR_PTR(ret);
+
+	rgroup = kzalloc(sizeof(struct cxi_rgroup), GFP_KERNEL);
+	if (!rgroup)
+		return ERR_PTR(-ENOMEM);
+
+	ret = rgroup_list_insert_rgroup(&hw->rgroup_list, rgroup, &id);
+	if (ret)
+		goto free_rgroup;
+	rgroup->id = id;
+
+	rgroup_init(dev, rgroup, attr);
+	refcount_inc(&hw->refcount);
+
+	return rgroup;
+
+free_rgroup:
+	kfree(rgroup);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(cxi_dev_alloc_rgroup);
+
+/**
+ * cxi_dev_find_rgroup_inc_refcount() - retrieve rgroup from device by id
+ *
+ * @dev: CXI device pointer
+ * @id: id of desired Resource Group
+ * @rgroup: location to store rgroup pointer
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - rgroup with given id not found
+ */
+int cxi_dev_find_rgroup_inc_refcount(struct cxi_dev *dev,
+				     unsigned int id,
+				     struct cxi_rgroup **rgroup)
+{
+	struct cxi_rgroup   *found_rgroup;
+	int    ret;
+
+	ret = find_rgroup_inc_refcount(dev, id, &found_rgroup);
+	if (ret)
+		return ret;
+
+	*rgroup = found_rgroup;
+	return 0;
+}
+EXPORT_SYMBOL(cxi_dev_find_rgroup_inc_refcount);
+
+struct rgroup_id_data {
+	size_t         max_ids;
+	unsigned int   *ids;
+	size_t         num_ids;
+};
+
+static int rgroup_id_operator(struct cxi_rgroup *rgroup,
+			      void *user_data)
+{
+	struct rgroup_id_data    *data = user_data;
+
+	if (data->num_ids < data->max_ids) {
+		*data->ids = rgroup->id;
+		data->ids++;
+	}
+	data->num_ids++;
+	return 0;
+}
+
+/**
+ * cxi_dev_get_rgroup_count() - Count the number of valid rgroups associated
+ * with a given device.
+ *
+ * @dev: Cassini Device
+ * Return: number of valid rgroups.
+ */
+unsigned int cxi_dev_get_rgroup_count(struct cxi_dev *dev)
+{
+	struct cxi_rgroup *rgroup;
+	unsigned long index = rgroup_id_limits.min;
+	unsigned int count = 0;
+	struct cass_dev *hw = get_cass_dev(dev);
+
+	for_each_rgroup(index, rgroup)
+		count++;
+
+	return count;
+}
+EXPORT_SYMBOL(cxi_dev_get_rgroup_count);
+
+/**
+ * cxi_dev_get_rgroup_ids() - Retrieve the rgroup ids associated
+ * with a given device.
+ *
+ * @dev: Cassini Device
+ * @max_ids: the size of the rgroup_ids array
+ * @rgroup_ids: User allocated array to store id values
+ * @num_ids: On success, the number of valid ids in the rgroup_ids
+ * array.  On -ENOSPC, the value of max_ids needed to retrieve all
+ * the ids.
+ *
+ * Return: 0 on success.
+ * -ENOSPC: max_ids is not large enough
+ */
+int cxi_dev_get_rgroup_ids(struct cxi_dev *dev,
+			   size_t max_ids,
+			   unsigned int *rgroup_ids,
+			   size_t *num_ids)
+{
+	struct rgroup_id_data    data = {
+		.max_ids = max_ids,
+		.ids     = rgroup_ids,
+		.num_ids = 0,
+	};
+	struct cass_dev     *hw = get_cass_dev(dev);
+	int    ret;
+
+	ret = rgroup_list_iterate(&hw->rgroup_list,
+				  rgroup_id_operator,
+				  &data);
+	if (ret)
+		return ret;
+
+	*num_ids = data.num_ids;
+	return (data.num_ids > max_ids) ? -ENOSPC : 0;
+}
+EXPORT_SYMBOL(cxi_dev_get_rgroup_ids);
+
+/**
+ * cxi_dev_rgroup_get_resource() - Retrieve resource data from an rgroup
+ *
+ * @dev: CXI Device
+ * @rgroup_id: ID of Resource Group
+ * @resource_type: which resource to retrieve
+ * @limits: location to store resource data
+ *
+ * Return:
+ * * 0         - success
+ * * -EBADR    - no such rgroup_id
+ * * -EINVAL   - bad resource type or limits
+ * * -ENODATA  - resource did not exist
+ */
+int cxi_dev_rgroup_get_resource(struct cxi_dev *dev,
+				unsigned int rgroup_id,
+				enum cxi_resource_type resource_type,
+				struct cxi_resource_limits *limits)
+{
+	struct cxi_rgroup   *rgroup;
+	int    ret;
+
+	ret = find_rgroup_inc_refcount(dev, rgroup_id, &rgroup);
+	if (ret)
+		return ret;
+
+	ret = cxi_rgroup_get_resource(rgroup, resource_type, limits);
+
+	cxi_rgroup_dec_refcount(rgroup);
+	return ret;
+}
+EXPORT_SYMBOL(cxi_dev_rgroup_get_resource);
+
+/**
+ * cxi_dev_rgroup_get_resource_types() - Retrieve the list of resource types
+ *                                       associated with an rgroup
+ *
+ * @dev: CXI Device
+ * @rgroup_id: ID of Resource Group
+ * @max_types: size of resource_types array
+ * @resource_types: location to place resource types
+ * @num_types: actual number of valid types in resource_types on success
+ *
+ * Return:
+ * * 0         - success
+ * * -EBADR    - no such rgroup_id
+ * * -ENOSPC   - max_types is not large enough.  num_types hold required value.
+ */
+int cxi_dev_rgroup_get_resource_types(struct cxi_dev *dev,
+				      unsigned int rgroup_id,
+				      size_t max_types,
+				      enum cxi_resource_type *resource_types,
+				      size_t *num_types)
+{
+	struct cxi_rgroup   *rgroup;
+	int    ret;
+
+	ret = find_rgroup_inc_refcount(dev, rgroup_id, &rgroup);
+	if (ret)
+		return ret;
+
+	ret = cxi_rgroup_get_resource_types(rgroup,
+					    max_types,
+					    resource_types,
+					    num_types);
+
+	cxi_rgroup_dec_refcount(rgroup);
+	return ret;
+}
+EXPORT_SYMBOL(cxi_dev_rgroup_get_resource_types);
+
+/**
+ * cxi_dev_rgroup_delete_ac_entry() - Remove an Access Control Entry
+ *                                    from an rgroup
+ *
+ * @dev: CXI Device
+ * @rgroup_id: ID of Resource Group
+ * @ac_entry_id: ID of AC Entry
+ *
+ * Return:
+ * * 0         - success
+ * * -EBADR    - no such rgroup_id
+ * * -ENODATA  - entry did not exist
+ */
+int cxi_dev_rgroup_delete_ac_entry(struct cxi_dev *dev,
+				   unsigned int rgroup_id,
+				   unsigned int ac_entry_id)
+{
+	struct cxi_rgroup   *rgroup;
+	int    ret;
+
+	ret = find_rgroup_inc_refcount(dev, rgroup_id, &rgroup);
+	if (ret)
+		return ret;
+
+	ret = cxi_rgroup_delete_ac_entry(rgroup, ac_entry_id);
+
+	cxi_rgroup_dec_refcount(rgroup);
+	return ret;
+}
+EXPORT_SYMBOL(cxi_dev_rgroup_delete_ac_entry);
+
+/**
+ * cxi_dev_rgroup_get_ac_entry_ids() - Retrieve the list of Access Control
+ *                                     Entry ids from a rgroup
+ *
+ * @dev: CXI Device
+ * @rgroup_id: ID of Resource Group
+ * @max_ids: size of the ac_entry_ids array
+ * @ac_entry_ids: location to store ids
+ * @num_ids: number of valid ids in ac_entry_ids on success
+ *
+ * Return:
+ * * 0         - success
+ * * -EBADR    - no such rgroup_id
+ * * -ENOSPC   - max_ids is not large enough, num_ids holds required size
+ */
+int cxi_dev_rgroup_get_ac_entry_ids(struct cxi_dev *dev,
+				    unsigned int rgroup_id,
+				    size_t max_ids,
+				    unsigned int *ac_entry_ids,
+				    size_t *num_ids)
+{
+	struct cxi_rgroup  *rgroup;
+	int    ret;
+
+	ret = find_rgroup_inc_refcount(dev, rgroup_id, &rgroup);
+	if (ret)
+		return ret;
+
+	ret = cxi_rgroup_get_ac_entry_ids(rgroup, max_ids,
+					  ac_entry_ids, num_ids);
+
+	cxi_rgroup_dec_refcount(rgroup);
+	return ret;
+}
+EXPORT_SYMBOL(cxi_dev_rgroup_get_ac_entry_ids);
+
+/**
+ * cxi_dev_rgroup_get_ac_entry_data() - Retrieve an Access Control
+ *                                      Entry from a rgroup
+ *
+ * @dev: CXI Device
+ * @rgroup_id: ID of Resource Group
+ * @ac_entry_id: which Access Control entry to retrieve
+ * @ac_type: location to store type
+ * @ac_data: location to store data
+ *
+ * Return:
+ * * 0         - success
+ * * -EBADR    - no such rgroup_id
+ * * -ENODATA  - ac_entry_id not found
+ */
+int cxi_dev_rgroup_get_ac_entry_data(struct cxi_dev *dev,
+				     unsigned int rgroup_id,
+				     unsigned int ac_entry_id,
+				     enum cxi_ac_type *ac_type,
+				     union cxi_ac_data *ac_data)
+{
+	struct cxi_rgroup   *rgroup;
+	int    ret;
+
+	ret = find_rgroup_inc_refcount(dev, rgroup_id, &rgroup);
+	if (ret)
+		return ret;
+
+	ret = cxi_rgroup_get_ac_entry_data(rgroup, ac_entry_id,
+					   ac_type, ac_data);
+
+	cxi_rgroup_dec_refcount(rgroup);
+	return ret;
+}
+EXPORT_SYMBOL(cxi_dev_rgroup_get_ac_entry_data);
+
+/**
+ * cxi_dev_rgroup_get_ac_entry_id_by_data() - Retrieve the Access Control
+ *                                            Entry id corresponding to
+ *                                            given AC data
+ *
+ * @dev: CXI Device
+ * @rgroup_id: ID of Resource Group
+ * @ac_type: which type to retrieve
+ * @ac_data: which data to look for
+ * @ac_entry_id: location to store AC Entry ID
+ *
+ * Return:
+ * * 0         - success
+ * * -EBADR    - no such rgroup_id
+ * * -ENODATA  - No entry found with type and data
+ */
+int cxi_dev_rgroup_get_ac_entry_id_by_data(struct cxi_dev *dev,
+					   unsigned int rgroup_id,
+					   enum cxi_ac_type ac_type,
+					   union cxi_ac_data *ac_data,
+					   unsigned int *ac_entry_id)
+{
+	struct cxi_rgroup    *rgroup;
+	int    ret;
+
+	ret = find_rgroup_inc_refcount(dev, rgroup_id, &rgroup);
+	if (ret)
+		return ret;
+
+	ret = cxi_rgroup_get_ac_entry_id_by_data(rgroup, ac_type,
+						 ac_data, ac_entry_id);
+
+	cxi_rgroup_dec_refcount(rgroup);
+	return ret;
+}
+EXPORT_SYMBOL(cxi_dev_rgroup_get_ac_entry_id_by_data);
+
+/**
+ * cxi_dev_rgroup_get_ac_entry_id_by_user() - Retrieve the Access Control
+ *                                            Entry id corresponding to
+ *                                            given uid or gid
+ *
+ * @dev: CXI Device
+ * @rgroup_id: ID of Resource Group
+ * @uid: user id to match
+ * @gid: group id to match
+ * @netns: The network namespace id
+ * @desired_types: which type of AC Entry to search
+ * @ac_entry_id: location to store AC Entry ID if found
+ *
+ * Return:
+ * * 0         - success
+ * * -EBADR    - no such rgroup_id
+ * * -ENODATA  - No entry found of desired type
+ */
+int cxi_dev_rgroup_get_ac_entry_id_by_user(struct cxi_dev *dev,
+					   unsigned int rgroup_id,
+					   uid_t uid,
+					   gid_t gid,
+					   unsigned int netns,
+					   cxi_ac_typeset_t desired_types,
+					   unsigned int *ac_entry_id)
+{
+	struct cxi_rgroup    *rgroup;
+	int    ret;
+
+	ret = find_rgroup_inc_refcount(dev, rgroup_id, &rgroup);
+	if (ret)
+		return ret;
+
+	ret = cxi_rgroup_get_ac_entry_by_user(rgroup, uid, gid, netns,
+					      desired_types,
+					      ac_entry_id);
+
+	cxi_rgroup_dec_refcount(rgroup);
+	return ret;
+}
+EXPORT_SYMBOL(cxi_dev_rgroup_get_ac_entry_id_by_user);
+
+void cxi_rgroup_print_ac_entry_info(struct cxi_rgroup *rgroup,
+				    struct seq_file *s)
+{
+	int i;
+	int rc;
+	size_t num_ids;
+	size_t max_ids;
+	unsigned int *ac_entry_ids = NULL;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+
+	rc = cxi_rgroup_get_ac_entry_ids(rgroup, 0, ac_entry_ids, &num_ids);
+	if (rc && rc != -ENOSPC)
+		goto done;
+
+	ac_entry_ids = kmalloc_array(num_ids, sizeof(*ac_entry_ids),
+				     GFP_ATOMIC);
+	if (!ac_entry_ids) {
+		rc = -ENOMEM;
+		goto done;
+	}
+
+	rc = cxi_rgroup_get_ac_entry_ids(rgroup, num_ids, ac_entry_ids,
+					 &max_ids);
+	if (rc)
+		goto freemem;
+
+	seq_puts(s, "  AC-entries: ");
+	for (i = 0; i < num_ids; i++) {
+		rc = cxi_rgroup_get_ac_entry_data(rgroup, ac_entry_ids[i],
+						  &ac_type, &ac_data);
+		if (rc)
+			break;
+
+		seq_printf(s, "ID:%d type:%s uid/gid:%d%s",
+			   ac_entry_ids[i], AC_TYPE(ac_type),
+			   ac_type == CXI_AC_OPEN ? 0 : ac_data.uid,
+			   i < (num_ids - 1) ? ", " : "");
+	}
+	seq_puts(s, "\n");
+
+freemem:
+	kfree(ac_entry_ids);
+done:
+	if (rc)
+		seq_puts(s, "\n");
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_rx_profile.c b/drivers/net/ethernet/hpe/ss1/cxi_rx_profile.c
new file mode 100644
index 000000000000..939f523930b2
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_rx_profile.c
@@ -0,0 +1,833 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2024 Hewlett Packard Enterprise Development LP */
+
+/* RX Profile Implementation */
+
+#include "cass_core.h"
+#include "cxi_rxtx_profile.h"
+#include "cxi_rxtx_profile_list.h"
+
+#define RX_PROFILE_GFP_OPTS  (GFP_KERNEL)
+
+static struct cass_dev *get_cass_dev(struct cxi_dev *dev)
+{
+	return container_of(dev, struct cass_dev, cdev);
+}
+
+static void rx_profile_init(struct cxi_rx_profile *rx_profile,
+			    struct cass_dev *hw,
+			    const struct cxi_rx_attr *rx_attr)
+{
+	cxi_rxtx_profile_init(&rx_profile->profile_common,
+			      hw, &rx_attr->vni_attr);
+
+	/* TODO: extract additional parameters */
+}
+
+static void cxi_rx_profile_update_pid_table_locked(
+					struct cxi_rx_profile *rx_profile,
+					int pid, int nbits, bool set)
+{
+	struct cass_dev *hw = get_cass_dev(rx_profile->config.device);
+	int index;
+
+	for (index = pid; index < pid + nbits; index++) {
+		if (set) {
+			if (!test_and_set_bit(index, rx_profile->config.pid_table))
+				hw->pid_usecount[index]++;
+		} else if (test_and_clear_bit(index, rx_profile->config.pid_table)) {
+			hw->pid_usecount[index]--;
+		}
+	}
+}
+
+/**
+ * cxi_rx_profile_update_pid_table() - Set/clear pids from rx profile pid_table
+ *
+ * @rx_profile: RX profile object
+ * @pid: Pid to allocate
+ * @nbits: Number of entries to clear
+ * @set: Set or clear
+ */
+void cxi_rx_profile_update_pid_table(struct cxi_rx_profile *rx_profile, int pid,
+				     int nbits, bool set)
+{
+	struct cass_dev *hw = get_cass_dev(rx_profile->config.device);
+
+	spin_lock(&hw->pid_pool_lock);
+	spin_lock(&rx_profile->config.pid_lock);
+	cxi_rx_profile_update_pid_table_locked(rx_profile, pid, nbits, set);
+	spin_unlock(&rx_profile->config.pid_lock);
+	spin_unlock(&hw->pid_pool_lock);
+}
+
+/**
+ * cxi_rx_profile_andnot_pid_table() - Update rx profile pid_table based on
+ *                                     pids table.
+ *
+ * @pids: pids object
+ * @len: Number of entries to clear.
+ */
+void cxi_rx_profile_andnot_pid_table(struct cxi_reserved_pids *pids,
+				     int len)
+{
+	struct cxi_rx_profile *rx_profile = pids->rx_profile;
+	struct cass_dev *hw = get_cass_dev(rx_profile->config.device);
+	unsigned long pid;
+
+	spin_lock(&hw->pid_pool_lock);
+	spin_lock(&rx_profile->config.pid_lock);
+	for_each_set_bit(pid, pids->table, len)
+		cxi_rx_profile_update_pid_table_locked(rx_profile, pid, 1, false);
+	spin_unlock(&rx_profile->config.pid_lock);
+	spin_unlock(&hw->pid_pool_lock);
+}
+
+/* Return true if the PID is reserved to the LNI. If so, mark the PID as
+ * "allocated" and do some house-keeping.
+ */
+static bool pid_reserved(struct cxi_lni_priv *lni_priv, unsigned int vni,
+			 unsigned int pid)
+{
+	bool match;
+	bool rc = false;
+	struct cxi_reserved_pids *pids;
+	struct cxi_rxtx_vni_attr vni_attr = {.match = vni};
+
+	spin_lock(&lni_priv->res_lock);
+
+	list_for_each_entry(pids, &lni_priv->reserved_pids, entry) {
+		match = vni_overlap(&vni_attr,
+				    &pids->rx_profile->profile_common.vni_attr);
+
+		if (match && test_and_clear_bit(pid, pids->table)) {
+			if (bitmap_empty(pids->table,
+					 lni_priv->dev->prop.pid_count)) {
+				list_del(&pids->entry);
+				cxi_rx_profile_dec_refcount(lni_priv->dev,
+							    pids->rx_profile);
+				kfree(pids);
+			}
+
+			rc = true;
+			break;
+		}
+	}
+
+	spin_unlock(&lni_priv->res_lock);
+
+	return rc;
+}
+
+/**
+ * cxi_rx_profile_alloc_pid() - Allocate or reserve a domain pid
+ *
+ * @lni_priv: the Logical Network Interface
+ * @rx_profile: RX profile object
+ * @pid: Pid to allocate
+ * @vni: Match criteria to find rx profile when finding a reserved pid
+ * @count: size of pid range
+ * @reserve: flag indicates reserving a pid range
+ *
+ * Return:
+ * * new_pid on success
+ * * -ENOSPC, -EEXIST
+ */
+int cxi_rx_profile_alloc_pid(struct cxi_lni_priv *lni_priv,
+			     struct cxi_rx_profile *rx_profile,
+			     int pid, int vni, int count, bool reserve)
+{
+	unsigned long *pid_table = rx_profile->config.pid_table;
+	struct cxi_dev *dev = lni_priv->dev;
+	struct cass_dev *hw = get_cass_dev(dev);
+	int start = (pid == C_PID_ANY) ? 0 : pid;
+	int new_pid = pid;
+	int offset;
+
+	if (!count || count > lni_priv->dev->prop.pid_count)
+		return -EINVAL;
+
+	spin_lock(&hw->pid_pool_lock);
+	spin_lock(&rx_profile->config.pid_lock);
+
+retry:
+	if (reserve || pid == C_PID_ANY) {
+		new_pid = bitmap_find_next_zero_area(pid_table,
+						     dev->prop.pid_count,
+						     start, count, 0);
+		if (pid == C_PID_ANY) {
+			if (new_pid + count > dev->prop.pid_count) {
+				new_pid = -ENOSPC;
+				goto unlock;
+			}
+		} else {
+			if (new_pid >= (pid + count)) {
+				new_pid = -EEXIST;
+				goto unlock;
+			}
+		}
+	} else {
+		if (test_bit(new_pid, pid_table) &&
+		    !pid_reserved(lni_priv, vni, new_pid)) {
+			new_pid = -EEXIST;
+			goto unlock;
+		}
+	}
+	for (offset = 0; offset < count; offset++) {
+		if (!test_bit(new_pid + offset, hw->leased_pids))
+			continue;
+		if (pid != C_PID_ANY &&
+		    test_bit(new_pid + offset, lni_priv->leased_pids))
+			continue;
+		if (pid == C_PID_ANY) {
+			start = new_pid + offset + 1;
+			goto retry;
+		}
+		new_pid = -EEXIST;
+		goto unlock;
+	}
+
+	cxi_rx_profile_update_pid_table_locked(rx_profile, new_pid, count,
+					       true);
+
+unlock:
+	spin_unlock(&rx_profile->config.pid_lock);
+	spin_unlock(&hw->pid_pool_lock);
+
+	return new_pid;
+}
+
+/**
+ * cxi_rx_profile_enable() - Enable a Profile
+ *
+ * @dev: Cassini Device
+ * @rx_profile: Profile to be enabled.
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOSPC
+ */
+int cxi_rx_profile_enable(struct cxi_dev *dev,
+			  struct cxi_rx_profile *rx_profile)
+{
+	int index;
+	struct cass_dev *hw = get_cass_dev(dev);
+	struct cxi_rxtx_vni_attr *attr;
+
+	if (!rx_profile)
+		return -EINVAL;
+
+	if (cxi_rx_profile_is_enabled(rx_profile))
+		return 0;
+
+	attr = &rx_profile->profile_common.vni_attr;
+
+	if (zero_vni(attr)) {
+		pr_debug("Cannot enable profile with invalid VNI\n");
+		return -EINVAL;
+	}
+
+	index = ida_alloc_range(&hw->rmu_index_table, 0,
+				C_RMU_CFG_VNI_LIST_ENTRIES - 1, GFP_KERNEL);
+	if (index < 0)
+		return index;
+
+	cass_config_matching_vni_list(hw, index, attr->match, attr->ignore);
+
+	rx_profile->profile_common.state.enable = true;
+	rx_profile->config.rmu_index = index;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rx_profile_enable);
+
+/**
+ * cxi_rx_profile_disable() - Disable a Profile
+ *
+ * @dev: Cassini Device
+ * @rx_profile: Profile to be disabled.
+ */
+void cxi_rx_profile_disable(struct cxi_dev *dev,
+			    struct cxi_rx_profile *rx_profile)
+{
+	struct cass_dev *hw = get_cass_dev(dev);
+
+	if (!rx_profile)
+		return;
+
+	if (!cxi_rx_profile_is_enabled(rx_profile))
+		return;
+
+	ida_free(&hw->rmu_index_table, rx_profile->config.rmu_index);
+	cass_invalidate_vni_list(hw, rx_profile->config.rmu_index);
+
+	rx_profile->profile_common.state.enable = false;
+}
+EXPORT_SYMBOL(cxi_rx_profile_disable);
+
+/**
+ * cxi_rx_profile_is_enabled() - Report RX profile is enabled
+ *
+ * @rx_profile: Profile object
+ */
+bool cxi_rx_profile_is_enabled(const struct cxi_rx_profile *rx_profile)
+{
+	if (!rx_profile)
+		return false;
+
+	return rx_profile->profile_common.state.enable;
+}
+EXPORT_SYMBOL(cxi_rx_profile_is_enabled);
+
+/**
+ * cxi_dev_set_rx_profile_attr() - Set the RX profile attributes
+ *
+ * @dev: Cassini Device
+ * @rx_profile: RX profile to update
+ * @rx_attr: Attributes of the RX Profile
+ *
+ * Return: 0 on success, or a negative errno value.
+ */
+int cxi_dev_set_rx_profile_attr(struct cxi_dev *dev,
+				struct cxi_rx_profile *rx_profile,
+				const struct cxi_rx_attr *rx_attr)
+{
+	struct cass_dev *hw = get_cass_dev(dev);
+
+	if (rx_profile->profile_common.state.enable)
+		return -EBUSY;
+
+	if (!vni_well_formed(&rx_attr->vni_attr)) {
+		pr_debug("VNI not well formed match:%d ignore:%d\n",
+			 rx_attr->vni_attr.match, rx_attr->vni_attr.ignore);
+		return -EINVAL;
+	}
+
+	if (!unique_vni_space(hw, &hw->rx_profile_list, &rx_attr->vni_attr)) {
+		pr_debug("VNI not unique match:%d ignore:%d\n",
+			 rx_attr->vni_attr.match, rx_attr->vni_attr.ignore);
+		return -EINVAL;
+	}
+
+	rx_profile->profile_common.vni_attr.match = rx_attr->vni_attr.match;
+	rx_profile->profile_common.vni_attr.ignore = rx_attr->vni_attr.ignore;
+
+	if (!rx_attr->vni_attr.name[0])
+		strscpy(rx_profile->profile_common.vni_attr.name,
+			rx_attr->vni_attr.name,
+			ARRAY_SIZE(rx_attr->vni_attr.name));
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_dev_set_rx_profile_attr);
+
+/**
+ * cxi_dev_alloc_rx_profile() - Allocate a RX Profile
+ *
+ * @dev: Cassini Device
+ * @rx_attr: Attributes of the RX Profile
+ *
+ * Return: rx_profile ptr on success, or a negative errno value.
+ */
+struct cxi_rx_profile *cxi_dev_alloc_rx_profile(struct cxi_dev *dev,
+						const struct cxi_rx_attr *rx_attr)
+{
+	int                    ret = 0;
+	struct cass_dev        *hw = get_cass_dev(dev);
+	struct cxi_rx_profile  *rx_profile;
+
+	if (!zero_vni(&rx_attr->vni_attr) &&
+	    !vni_well_formed(&rx_attr->vni_attr))
+		return ERR_PTR(-EDOM);
+
+	/* Allocate memory */
+	rx_profile = kzalloc(sizeof(*rx_profile), RX_PROFILE_GFP_OPTS);
+	if (!rx_profile)
+		return ERR_PTR(-ENOMEM);
+
+	/* initialize common profile and cassini config members */
+	rx_profile_init(rx_profile, hw, rx_attr);
+	cass_rx_profile_init(hw, rx_profile);
+
+	cxi_rxtx_profile_list_lock(&hw->rx_profile_list);
+
+	/* Configfs needs to allocate a profile without attributes which
+	 * will be updated later.
+	 */
+	if (!zero_vni(&rx_attr->vni_attr)) {
+		ret = cxi_rxtx_profile_list_iterate(&hw->rx_profile_list,
+						    vni_overlap_test,
+						    &rx_profile->profile_common);
+		if (ret)
+			goto unlock_free_return;
+	}
+
+	/* Insert into device list if unique */
+	ret = cxi_rxtx_profile_list_insert(&hw->rx_profile_list,
+					   &rx_profile->profile_common,
+					   &rx_profile->profile_common.id);
+
+	cxi_rxtx_profile_list_unlock(&hw->rx_profile_list);
+
+	if (ret)
+		goto free_return;
+
+	refcount_inc(&hw->refcount);
+
+	return rx_profile;
+
+unlock_free_return:
+
+	cxi_rxtx_profile_list_unlock(&hw->rx_profile_list);
+
+free_return:
+	kfree(rx_profile);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(cxi_dev_alloc_rx_profile);
+
+/**
+ * cxi_dev_find_rx_profile() - Get RX profile containing a vni
+ *
+ * @dev: Cassini Device
+ * @vni: Match criteria to find rx profile
+ *
+ * Return: rx_profile ptr on success or NULL
+ */
+struct cxi_rx_profile *cxi_dev_find_rx_profile(struct cxi_dev *dev,
+					       u16 vni)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_rxtx_profile_list *list = &hw->rx_profile_list;
+	struct cxi_rx_profile *rx_profile = NULL;
+	struct cxi_rxtx_profile *profile;
+	unsigned long index = list->limits->min;
+	uid_t uid = __kuid_val(current_euid());
+	gid_t gid = __kgid_val(current_egid());
+	unsigned int netns = CURRENT_NETNS_ID();
+	unsigned int ac_entry_id;
+	int rc;
+
+	cxi_rxtx_profile_list_lock(list);
+	xa_for_each(&list->xarray, index, profile) {
+		if (!profile->state.enable)
+			continue;
+
+		if ((vni & ~profile->vni_attr.ignore) == profile->vni_attr.match) {
+			rx_profile = container_of(profile,
+						  struct cxi_rx_profile,
+						  profile_common);
+
+			rc = cxi_rxtx_profile_get_ac_entry_id_by_user(
+						&rx_profile->profile_common,
+						uid, gid, netns, CXI_AC_ANY,
+						&ac_entry_id);
+			if (!rc) {
+				refcount_inc(&profile->state.refcount);
+				break;
+			}
+
+			rx_profile = ERR_PTR(rc);
+		}
+	}
+
+	cxi_rxtx_profile_list_unlock(list);
+
+	return rx_profile;
+}
+
+/**
+ * cxi_dev_get_rx_profile - Get an RX profile
+ *
+ * For a given VNI check if an RX profile is already allocated
+ * and return it.
+ * For kernel users (i.e. kcxi), allocate one if not found, add
+ * an AC entry, set the TCs and enable the profile.
+ *
+ * @dev: Cassini Device
+ * @vni: VNI to find
+ *
+ * Return: rx_profile ptr on success, or a negative errno value.
+ */
+struct cxi_rx_profile *cxi_dev_get_rx_profile(struct cxi_dev *dev,
+					      unsigned int vni)
+{
+	int rc;
+	unsigned int ac_entry_id;
+	struct cass_dev *hw = get_cass_dev(dev);
+	struct cxi_rx_profile *rx_profile;
+	unsigned int netns = CURRENT_NETNS_ID();
+	struct cxi_rx_attr rx_attr = {
+		.vni_attr = {
+			.match = vni,
+			.ignore = 0
+		}
+	};
+
+	mutex_lock(&hw->rx_profile_get_lock);
+	rx_profile = cxi_dev_find_rx_profile(dev, vni);
+	if (rx_profile)
+		goto done;
+
+	/* For a non-root user, just report no entry found.*/
+	if (__kuid_val(current_euid())) {
+		rx_profile = ERR_PTR(-ENOENT);
+		goto done;
+	}
+
+	rx_profile = cxi_dev_alloc_rx_profile(dev, &rx_attr);
+	if (IS_ERR(rx_profile))
+		goto done;
+
+	rc = cxi_rx_profile_add_ac_entry(rx_profile, CXI_AC_UID,
+					 __kuid_val(current_euid()), 0,
+					 netns, &ac_entry_id);
+	if (rc) {
+		rx_profile = ERR_PTR(rc);
+		goto done;
+	}
+
+	rc = cxi_rx_profile_enable(dev, rx_profile);
+	if (rc)
+		rx_profile = ERR_PTR(rc);
+
+done:
+	mutex_unlock(&hw->rx_profile_get_lock);
+
+	return rx_profile;
+}
+EXPORT_SYMBOL(cxi_dev_get_rx_profile);
+
+/**
+ * cxi_rx_profile_dec_refcount() - Decrement refcount and cleanup
+ *                                 if last reference
+ *
+ * @dev: Cassini device pointer
+ * @rx_profile: pointer to Profile
+ *
+ */
+int cxi_rx_profile_dec_refcount(struct cxi_dev *dev,
+				struct cxi_rx_profile *rx_profile)
+{
+	struct cass_dev *hw = get_cass_dev(dev);
+	int    ret;
+
+	if (!rx_profile)
+		return 0;
+
+	ret = refcount_dec_and_test(&rx_profile->profile_common.state.refcount);
+	if (!ret)
+		return -EBUSY;
+
+	cxi_rx_profile_disable(dev, rx_profile);
+	cxi_rx_profile_remove_ac_entries(rx_profile);
+	refcount_dec(&hw->refcount);
+	cxi_rxtx_profile_list_remove(&hw->rx_profile_list,
+				     rx_profile->profile_common.id);
+
+	kfree(rx_profile);
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rx_profile_dec_refcount);
+
+/**
+ * cxi_rx_profile_get_info() - Retrieve the attributes and state associated
+ *                             with this Profile
+ *
+ * @dev: Cassini Device
+ * @rx_profile: RX Profile
+ * @rx_attr: location to place attributes
+ * @state: location to put state
+ *
+ * Note: rx_attr and/or state may be NULL.  If both are NULL,
+ * this return value indicates whether the Profile exists
+ * with the given Id value.
+ *
+ * Return:
+ * * 0      - success
+ * * -EBADR - rx_profile_id unknown
+ */
+int cxi_rx_profile_get_info(struct cxi_dev *dev,
+			    struct cxi_rx_profile *rx_profile,
+			    struct cxi_rx_attr *rx_attr,
+			    struct cxi_rxtx_profile_state *state)
+{
+	cxi_rxtx_profile_get_info(&rx_profile->profile_common,
+				  (rx_attr) ? &rx_attr->vni_attr : NULL,
+				  state);
+
+	/* TODO: other rx_attr values */
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_rx_profile_get_info);
+
+static void print_rx_profile_ac_entry_info(struct cxi_rx_profile *rx_profile,
+					   struct seq_file *s)
+{
+	int i;
+	int rc;
+	size_t num_ids;
+	size_t max_ids;
+	unsigned int *ac_entry_ids = NULL;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+
+	rc = cxi_rx_profile_get_ac_entry_ids(rx_profile, 0, ac_entry_ids,
+					     &num_ids);
+	if (rc && rc != -ENOSPC)
+		goto done;
+
+	ac_entry_ids = kmalloc_array(num_ids, sizeof(*ac_entry_ids),
+				     GFP_ATOMIC);
+	if (!ac_entry_ids) {
+		rc = -ENOMEM;
+		goto done;
+	}
+
+	rc = cxi_rx_profile_get_ac_entry_ids(rx_profile, num_ids, ac_entry_ids,
+					     &max_ids);
+	if (rc)
+		goto freemem;
+
+	seq_puts(s, "        AC-entries: ");
+	for (i = 0; i < num_ids; i++) {
+		rc = cxi_rx_profile_get_ac_entry_data(rx_profile,
+						      ac_entry_ids[i],
+						      &ac_type, &ac_data);
+		if (rc)
+			break;
+
+		seq_printf(s, "ID:%d type:%s uid/gid:%d%s",
+			   ac_entry_ids[i], AC_TYPE(ac_type),
+			   ac_type == CXI_AC_OPEN ? 0 : ac_data.uid,
+			   i < (num_ids - 1) ? ", " : "");
+	}
+	seq_puts(s, "\n");
+
+freemem:
+	kfree(ac_entry_ids);
+done:
+	if (rc)
+		seq_puts(s, "\n");
+}
+
+static void print_profile(struct cxi_rx_profile *rx_profile, struct seq_file *s)
+{
+	struct cxi_rxtx_vni_attr vni_attr;
+	struct cxi_rxtx_profile_state state;
+	struct cxi_rxtx_profile *profile = &rx_profile->profile_common;
+
+	cxi_rxtx_profile_get_info(profile, &vni_attr, &state);
+	seq_printf(s, "  ID:%-2d Name:%s VNI:match:%u ignore:%u State:%s refcount:%d\n",
+		   profile->id,
+		   vni_attr.name[0] ? vni_attr.name : "none",
+		   vni_attr.match, vni_attr.ignore,
+		   state.enable ? "enabled" : "disabled",
+		   refcount_read(&state.refcount));
+
+	print_rx_profile_ac_entry_info(rx_profile, s);
+}
+
+/**
+ * cxi_rx_profile_print() - Print the RX profile info
+ *
+ * @s: file ptr
+ *
+ */
+void cxi_rx_profile_print(struct seq_file *s)
+{
+	struct cass_dev *hw = s->private;
+	struct cxi_rxtx_profile_list *list = &hw->rx_profile_list;
+	struct cxi_rx_profile *rx_profile;
+	struct cxi_rxtx_profile *profile;
+	unsigned long index;
+
+	seq_puts(s, "\nRX profiles:\n");
+
+	cxi_rxtx_profile_list_lock(list);
+
+	xa_for_each(&list->xarray, index, profile) {
+		rx_profile = container_of(profile, struct cxi_rx_profile,
+					  profile_common);
+		print_profile(rx_profile, s);
+	}
+
+	cxi_rxtx_profile_list_unlock(list);
+}
+
+/**
+ * cxi_rx_profile_remove_ac_entry() - disable access control to a Profile
+ *                                    by access control id.
+ *
+ * @rx_profile: pointer to Profile
+ * @ac_entry_id: id of AC entry
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - ac entry id unknown
+ */
+int cxi_rx_profile_remove_ac_entry(struct cxi_rx_profile *rx_profile,
+				   unsigned int ac_entry_id)
+{
+	return cxi_rxtx_profile_remove_ac_entry(&rx_profile->profile_common,
+						ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_rx_profile_remove_ac_entry);
+
+/**
+ * cxi_rx_profile_get_ac_entry_ids() - get the list of AC entry ids
+ *                                     associated with a Profile
+ *
+ * @rx_profile: pointer to Profile
+ * @max_ids: size of the ac_entry_ids array
+ * @ac_entry_ids: location to store ids
+ * @num_ids: number of valid ids in ac_entry_ids array on success
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOSPC - max_ids is not large enough.  num_ids holds value required.
+ */
+int cxi_rx_profile_get_ac_entry_ids(struct cxi_rx_profile *rx_profile,
+				    size_t max_ids,
+				    unsigned int *ac_entry_ids,
+				    size_t *num_ids)
+{
+	return cxi_rxtx_profile_get_ac_entry_ids(&rx_profile->profile_common,
+						 max_ids, ac_entry_ids, num_ids);
+}
+EXPORT_SYMBOL(cxi_rx_profile_get_ac_entry_ids);
+
+/**
+ * cxi_rx_profile_get_ac_entry_data() - retrieve the type and data for a
+ *                                      AC entry associated with a Profile
+ *
+ * @rx_profile: pointer to Profile
+ * @ac_entry_id: id of AC entry
+ * @ac_type: location to store AC entry type
+ * @ac_data: location to store AC data
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - AC entry id unknown
+ */
+int cxi_rx_profile_get_ac_entry_data(struct cxi_rx_profile *rx_profile,
+				     unsigned int ac_entry_id,
+				     enum cxi_ac_type *ac_type,
+				     union cxi_ac_data *ac_data)
+{
+	return cxi_rxtx_profile_get_ac_entry_data(&rx_profile->profile_common,
+						  ac_entry_id, ac_type, ac_data);
+}
+EXPORT_SYMBOL(cxi_rx_profile_get_ac_entry_data);
+
+/**
+ * cxi_rx_profile_get_ac_entry_id_by_data() - get the AC entry id associated
+ *                                            with a given VNI entry type and data
+ *
+ * @rx_profile: pointer to Profile
+ * @ac_type: type of AC entry to look for
+ * @ac_data: AC entry data to look for
+ * @ac_entry_id: location to store AC entry id on success
+ *
+ * Return:
+ * * 0        - success
+ * * -ENODATA - AC entry with given type&data not found
+ * * -EBADR   - invalid ac_type
+ */
+int cxi_rx_profile_get_ac_entry_id_by_data(struct cxi_rx_profile *rx_profile,
+					   enum cxi_ac_type ac_type,
+					   const union cxi_ac_data *ac_data,
+					   unsigned int *ac_entry_id)
+{
+	return cxi_rxtx_profile_get_ac_entry_id_by_data(&rx_profile->profile_common,
+							ac_type, ac_data, ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_rx_profile_get_ac_entry_id_by_data);
+
+/**
+ * cxi_rx_profile_get_ac_entry_id_by_user() - retrieve the AC entry associated
+ *                                            with a Profile by user and group
+ *
+ * @rx_profile: pointer to Profile
+ * @uid: user id
+ * @gid: group id
+ * @netns: The Network namespace id
+ * @desired_types: list of enum cxi_ac_type values OR'd together
+ * @ac_entry_id: location to store AC entry id on success
+ *
+ * Return:
+ * * 0       - success
+ * * -EPERM  - no AC entries found for given uid and gid
+ *
+ * Note: multiple AC entries may apply.  The priority of return is
+ * CXI_AC_UID, CXI_AC_GID, CXI_AC_OPEN.
+ */
+int cxi_rx_profile_get_ac_entry_id_by_user(struct cxi_rx_profile *rx_profile,
+					   uid_t uid,
+					   gid_t gid,
+					   unsigned int netns,
+					   cxi_ac_typeset_t desired_types,
+					   unsigned int *ac_entry_id)
+{
+	return cxi_rxtx_profile_get_ac_entry_id_by_user(&rx_profile->profile_common,
+							uid, gid, netns, desired_types,
+							ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_rx_profile_get_ac_entry_id_by_user);
+
+/**
+ * cxi_rx_profile_add_ac_entry() - add an Access Control entry to
+ *                                 an existing Profile
+ *
+ * @rx_profile: RX profile to add AC Entry
+ * @type: type of AC Entry to add
+ * @uid: UID for AC Entry
+ * @gid: GID for AC Entry
+ * @netns: The Network Namespace id
+ * @ac_entry_id: Location to store resulting id
+ *
+ * Return:
+ * * 0       - success
+ * * -EEXIST - AC Entry already exists
+ */
+int cxi_rx_profile_add_ac_entry(struct cxi_rx_profile *rx_profile,
+				enum cxi_ac_type type, uid_t uid, gid_t gid,
+				unsigned int netns, unsigned int *ac_entry_id)
+{
+	union cxi_ac_data data = {};
+
+	switch (type) {
+	case CXI_AC_UID:
+		data.uid = uid;
+		break;
+	case CXI_AC_GID:
+		data.gid = gid;
+		break;
+	case CXI_AC_OPEN:
+		break;
+	case CXI_AC_NETNS:
+		data.netns = netns;
+		break;
+	default:
+		return -EDOM;
+	}
+
+	return cxi_rxtx_profile_add_ac_entry(&rx_profile->profile_common,
+					     type, &data, ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_rx_profile_add_ac_entry);
+
+/**
+ * cxi_rx_profile_remove_ac_entries() - remove Access Control entries
+ *                                      from profile
+ *
+ * @rx_profile: RX profile from which to remove AC entries
+ */
+void cxi_rx_profile_remove_ac_entries(struct cxi_rx_profile *rx_profile)
+{
+	if (!rx_profile)
+		return;
+
+	cxi_ac_entry_list_destroy(&rx_profile->profile_common.ac_entry_list);
+}
diff --git a/drivers/net/ethernet/hpe/ss1/cxi_tx_profile.c b/drivers/net/ethernet/hpe/ss1/cxi_tx_profile.c
new file mode 100644
index 000000000000..4037c389a77d
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/cxi_tx_profile.c
@@ -0,0 +1,819 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2024 Hewlett Packard Enterprise Development LP */
+
+/* TX Profile Implementation */
+
+#include "cass_core.h"
+#include "cxi_rxtx_profile.h"
+#include "cxi_rxtx_profile_list.h"
+
+#define TX_PROFILE_GFP_OPTS  (GFP_KERNEL)
+
+static struct cass_dev *get_cass_dev(struct cxi_dev *dev)
+{
+	return container_of(dev, struct cass_dev, cdev);
+}
+
+/* initialize common profile and cassini config members */
+static void cass_dev_init_tx_profile(struct cass_dev *hw,
+				     struct cxi_tx_profile *tx_profile,
+				     const struct cxi_tx_attr *tx_attr)
+{
+	cxi_rxtx_profile_init(&tx_profile->profile_common,
+			      hw, &tx_attr->vni_attr);
+	cass_tx_profile_init(hw, tx_profile);
+}
+
+void cxi_dev_init_eth_tx_profile(struct cass_dev *hw)
+{
+	struct cxi_tx_attr tx_attr = {};
+
+	cass_dev_init_tx_profile(hw, &hw->eth_tx_profile, &tx_attr);
+	refcount_inc(&hw->refcount);
+}
+EXPORT_SYMBOL(cxi_dev_init_eth_tx_profile);
+
+/**
+ * cxi_tx_profile_list_destroy() - remove all Profile references from
+ *                                 the TX profile list and free the
+ *                                 underlying resources.
+ *
+ * Take the cp_lock so that the cass_cp_table can be iterated
+ * over to disable the CPs associated with each TX profile.
+ *
+ * @hw: Cassini Device ptr
+ */
+void cxi_tx_profile_list_destroy(struct cass_dev *hw)
+{
+	struct cxi_rxtx_profile *profile;
+	struct cxi_rxtx_profile_list *list = &hw->tx_profile_list;
+	unsigned long index = list->limits->min;
+
+	cass_cp_lock(hw);
+	xa_lock(&list->xarray);
+
+	xa_for_each(&list->xarray, index, profile) {
+		__xa_erase(&list->xarray, index);
+
+		refcount_dec(&profile->state.refcount);
+		cxi_tx_profile_dec_refcount(&hw->cdev,
+					    co_tx_profile(profile),
+					    false);
+	}
+
+	xa_unlock(&list->xarray);
+	cass_cp_unlock(hw);
+
+	xa_destroy(&list->xarray);
+}
+
+/**
+ * cxi_dev_alloc_tx_profile() - Allocate a TX Profile
+ *
+ * @dev: Cassini Device
+ * @tx_attr: TX attributes for the Profile
+ *
+ * Return: tx_profile ptr on success, or a negative errno value.
+ */
+struct cxi_tx_profile *cxi_dev_alloc_tx_profile(struct cxi_dev *dev,
+						const struct cxi_tx_attr *tx_attr)
+{
+	int                    ret = 0;
+	struct cass_dev        *hw = get_cass_dev(dev);
+	struct cxi_tx_profile  *tx_profile;
+
+	if (!zero_vni(&tx_attr->vni_attr) &&
+	    !vni_well_formed(&tx_attr->vni_attr))
+		return ERR_PTR(-EDOM);
+
+	/* Allocate memory */
+	tx_profile = kzalloc(sizeof(*tx_profile), TX_PROFILE_GFP_OPTS);
+	if (!tx_profile)
+		return ERR_PTR(-ENOMEM);
+
+	cass_dev_init_tx_profile(hw, tx_profile, tx_attr);
+
+	cxi_rxtx_profile_list_lock(&hw->tx_profile_list);
+
+	/* make sure the VNI space is unique */
+	ret = cxi_rxtx_profile_list_iterate(&hw->tx_profile_list,
+					    vni_overlap_test,
+					    &tx_profile->profile_common);
+	if (ret)
+		goto unlock_free_return;
+
+	/* Insert into device list if unique */
+	ret = cxi_rxtx_profile_list_insert(&hw->tx_profile_list,
+					   &tx_profile->profile_common,
+					   &tx_profile->profile_common.id);
+
+	cxi_rxtx_profile_list_unlock(&hw->tx_profile_list);
+
+	if (ret)
+		goto free_return;
+
+	refcount_inc(&hw->refcount);
+
+	return tx_profile;
+
+unlock_free_return:
+	cxi_rxtx_profile_list_unlock(&hw->tx_profile_list);
+
+free_return:
+	kfree(tx_profile);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(cxi_dev_alloc_tx_profile);
+
+/**
+ * cxi_dev_find_tx_profile() - Find the TX profile containing a vni
+ *
+ * @dev: Cassini Device
+ * @vni: Match criteria to find TX profile
+ *
+ * Return: tx_profile ptr on success or NULL
+ */
+struct cxi_tx_profile *cxi_dev_find_tx_profile(struct cxi_dev *dev,
+					       u16 vni)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+	struct cxi_rxtx_profile_list *list = &hw->tx_profile_list;
+	struct cxi_tx_profile *tx_profile = NULL;
+	struct cxi_rxtx_profile *profile;
+	unsigned int netns = CURRENT_NETNS_ID();
+	unsigned long index = list->limits->min;
+	uid_t uid = __kuid_val(current_euid());
+	gid_t gid = __kgid_val(current_egid());
+	unsigned int ac_entry_id;
+	int rc;
+
+	cxi_rxtx_profile_list_lock(list);
+
+	xa_for_each(&list->xarray, index, profile) {
+		if (!profile->state.enable)
+			continue;
+
+		if ((vni & ~profile->vni_attr.ignore) == profile->vni_attr.match) {
+			tx_profile = container_of(profile,
+						  struct cxi_tx_profile,
+						  profile_common);
+
+			rc = cxi_rxtx_profile_get_ac_entry_id_by_user(
+						&tx_profile->profile_common,
+						uid, gid, netns, CXI_AC_ANY,
+						&ac_entry_id);
+			if (!rc) {
+				refcount_inc(&profile->state.refcount);
+				break;
+			}
+
+			tx_profile = ERR_PTR(rc);
+		}
+	}
+
+	cxi_rxtx_profile_list_unlock(list);
+
+	return tx_profile;
+}
+
+/**
+ * cxi_dev_get_tx_profile - Get a TX profile
+ *
+ * Check if one is already allocated and return it.
+ * For kernel users (i.e. kcxi), allocate one if not found, add
+ * an AC entry, set the TCs and enable the profile.
+ *
+ * @dev: Cassini Device
+ * @vni: VNI to find
+ *
+ * Return: tx_profile ptr on success, or a negative errno value.
+ */
+struct cxi_tx_profile *cxi_dev_get_tx_profile(struct cxi_dev *dev,
+					      unsigned int vni)
+{
+	int i;
+	int rc;
+	unsigned int ac_entry_id;
+	struct cass_dev *hw = get_cass_dev(dev);
+	struct cxi_tx_profile *tx_profile;
+	unsigned int netns;
+	struct cxi_tx_attr tx_attr = {
+		.vni_attr = {
+			.match = vni,
+			.ignore = 0
+		}
+	};
+
+	mutex_lock(&hw->tx_profile_get_lock);
+
+	tx_profile = cxi_dev_find_tx_profile(dev, vni);
+	if (tx_profile)
+		goto done;
+
+	/* For a non-root user, just report no entry found.*/
+	if (__kuid_val(current_euid())) {
+		tx_profile = ERR_PTR(-ENOENT);
+		goto done;
+	}
+
+	tx_profile = cxi_dev_alloc_tx_profile(dev, &tx_attr);
+	if (IS_ERR(tx_profile))
+		goto done;
+
+	netns = CURRENT_NETNS_ID();
+	rc = cxi_tx_profile_add_ac_entry(tx_profile, CXI_AC_UID,
+					 __kuid_val(current_euid()), 0,
+					 netns, &ac_entry_id);
+	if (rc) {
+		tx_profile = ERR_PTR(rc);
+		goto done;
+	}
+
+	/* For backward compatibility to the old service api,
+	 * enable all the TCs.
+	 */
+	for (i = CXI_TC_DEDICATED_ACCESS; i <= CXI_TC_BEST_EFFORT; i++)
+		cxi_tx_profile_set_tc(tx_profile, i, true);
+
+	rc = cxi_tx_profile_enable(dev, tx_profile);
+	if (rc)
+		tx_profile = ERR_PTR(rc);
+
+done:
+	mutex_unlock(&hw->tx_profile_get_lock);
+
+	return tx_profile;
+}
+EXPORT_SYMBOL(cxi_dev_get_tx_profile);
+
+/**
+ * cxi_tx_profile_valid_tc() - Check if a TC is valid for this TX profile
+ *
+ * @tx_profile: Profile to check against
+ * @tc: Traffic Class
+ *
+ * Return:
+ * * true if valid
+ */
+bool cxi_tx_profile_valid_tc(struct cxi_tx_profile *tx_profile, unsigned int tc)
+{
+	if (tc >= CXI_TC_MAX)
+		return false;
+
+	return test_bit(tc, tx_profile->config.tc_table);
+}
+
+/**
+ * cxi_dev_set_tx_profile_attr() - Set the TX profile attributes
+ *
+ * @dev: Cassini Device
+ * @tx_profile: TX profile to update
+ * @tx_attr: Attributes of the TX Profile
+ *
+ * Return: 0 on success, or a negative errno value.
+ */
+int cxi_dev_set_tx_profile_attr(struct cxi_dev *dev,
+				struct cxi_tx_profile *tx_profile,
+				const struct cxi_tx_attr *tx_attr)
+{
+	struct cass_dev *hw = get_cass_dev(dev);
+
+	if (tx_profile->profile_common.state.enable)
+		return -EBUSY;
+
+	if (!vni_well_formed(&tx_attr->vni_attr)) {
+		pr_debug("VNI not well formed match:%d ignore:%d\n",
+			 tx_attr->vni_attr.match, tx_attr->vni_attr.ignore);
+		return -EINVAL;
+	}
+
+	if (!unique_vni_space(hw, &hw->tx_profile_list, &tx_attr->vni_attr)) {
+		pr_debug("VNI not unique match:%d ignore:%d\n",
+			 tx_attr->vni_attr.match, tx_attr->vni_attr.ignore);
+		return -EINVAL;
+	}
+
+	tx_profile->profile_common.vni_attr.match = tx_attr->vni_attr.match;
+	tx_profile->profile_common.vni_attr.ignore = tx_attr->vni_attr.ignore;
+
+	if (!tx_attr->vni_attr.name[0])
+		strscpy(tx_profile->profile_common.vni_attr.name,
+			tx_attr->vni_attr.name,
+			ARRAY_SIZE(tx_attr->vni_attr.name));
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_dev_set_tx_profile_attr);
+
+/**
+ * cxi_tx_profile_enable() - Enable a Profile
+ *
+ * @dev: Cassini Device
+ * @tx_profile: Profile to be enabled.
+ *
+ * Return:
+ * * 0       - success
+ */
+int cxi_tx_profile_enable(struct cxi_dev *dev,
+			  struct cxi_tx_profile *tx_profile)
+{
+	if (!tx_profile)
+		return -EINVAL;
+
+	if (cxi_tx_profile_is_enabled(tx_profile))
+		return 0;
+
+	if (zero_vni(&tx_profile->profile_common.vni_attr)) {
+		pr_debug("Cannot enable profile with invalid VNI\n");
+		return -EINVAL;
+	}
+
+	// TODO: more hw setup here?
+	tx_profile->profile_common.state.enable = true;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_tx_profile_enable);
+
+/**
+ * cxi_tx_profile_disable() - Disable a Profile
+ *
+ * @dev: Cassini Device
+ * @tx_profile: Profile to be disabled.
+ */
+void cxi_tx_profile_disable(struct cxi_dev *dev,
+			    struct cxi_tx_profile *tx_profile)
+{
+	if (!tx_profile)
+		return;
+
+	if (!cxi_tx_profile_is_enabled(tx_profile))
+		return;
+
+	tx_profile->profile_common.state.enable = false;
+	cass_clear_cps(tx_profile);
+}
+EXPORT_SYMBOL(cxi_tx_profile_disable);
+
+/**
+ * cxi_tx_profile_is_enabled() - Report TX profile is enabled
+ *
+ * @tx_profile: Profile object
+ */
+bool cxi_tx_profile_is_enabled(const struct cxi_tx_profile *tx_profile)
+{
+	if (!tx_profile)
+		return false;
+
+	return tx_profile->profile_common.state.enable;
+}
+EXPORT_SYMBOL(cxi_tx_profile_is_enabled);
+
+/**
+ * cxi_tx_profile_dec_refcount() - Decrement refcount and cleanup
+ *                                 if last reference
+ *
+ * @dev: Cassini device pointer
+ * @tx_profile: pointer to Profile
+ * @list_remove: don't remove from tx_profile_list
+ *
+ */
+int cxi_tx_profile_dec_refcount(struct cxi_dev *dev,
+				struct cxi_tx_profile *tx_profile,
+				bool list_remove)
+{
+	struct cass_dev *hw = get_cass_dev(dev);
+	int    ret;
+
+	if (!tx_profile)
+		return 0;
+
+	ret = refcount_dec_and_test(&tx_profile->profile_common.state.refcount);
+	if (!ret)
+		return -EBUSY;
+
+	cxi_tx_profile_disable(dev, tx_profile);
+	cxi_tx_profile_remove_ac_entries(tx_profile);
+
+	refcount_dec(&hw->refcount);
+
+	if (list_remove)
+		cxi_rxtx_profile_list_remove(&hw->tx_profile_list,
+					     tx_profile->profile_common.id);
+
+	kfree(tx_profile);
+	return 0;
+}
+EXPORT_SYMBOL(cxi_tx_profile_dec_refcount);
+
+/**
+ * cxi_dev_get_eth_tx_profile() - Get ethernet TX profile
+ *
+ * @dev: Cassini Device
+ *
+ * Return: tx_profile ethernet ptr
+ */
+struct cxi_tx_profile *cxi_dev_get_eth_tx_profile(struct cxi_dev *dev)
+{
+	struct cass_dev *hw = container_of(dev, struct cass_dev, cdev);
+
+	refcount_inc(&hw->eth_tx_profile.profile_common.state.refcount);
+	return &hw->eth_tx_profile;
+}
+
+/**
+ * cxi_eth_tx_profile_cleanup() - Clean up the TX profile for ethernet
+ *
+ * @hw: the device
+ */
+void cxi_eth_tx_profile_cleanup(struct cass_dev *hw)
+{
+	cxi_tx_profile_disable(&hw->cdev, &hw->eth_tx_profile);
+	refcount_dec(&hw->refcount);
+}
+EXPORT_SYMBOL(cxi_eth_tx_profile_cleanup);
+
+/**
+ * cxi_tx_profile_get_info() - Retrieve the attributes and state associated
+ *                             with this Profile
+ *
+ * @dev: Cassini Device
+ * @tx_profile: the Profile
+ * @tx_attr: location to place attributes
+ * @state: location to put state
+ *
+ * Note: vni_attr and/or state may be NULL.  If both are NULL,
+ * this return value indicates whether the Profile exists
+ * with the given Id value.
+ *
+ * Return:
+ * * 0      - success
+ * * -ENOENT - No tx_profile
+ * * -EBADR - tx_profile_id unknown
+ */
+int cxi_tx_profile_get_info(struct cxi_dev *dev,
+			    struct cxi_tx_profile *tx_profile,
+			    struct cxi_tx_attr *tx_attr,
+			    struct cxi_rxtx_profile_state *state)
+{
+	if (!tx_profile)
+		return -ENOENT;
+
+	cxi_rxtx_profile_get_info(&tx_profile->profile_common,
+				  &tx_attr->vni_attr, state);
+
+	/* TODO: gather other TX attributes */
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_tx_profile_get_info);
+
+/**
+ * cxi_tx_profile_set_tc() - Set/clear a traffic class in the TX profile
+ *
+ * @tx_profile: pointer to Profile
+ * @tc: traffic class to add/clear
+ * @set: operation - set true / clear false
+ *
+ * Return:
+ * * 0       - success
+ * * -EINVAL - tc outside of allowed range
+ */
+int cxi_tx_profile_set_tc(struct cxi_tx_profile *tx_profile, int tc, bool set)
+{
+	if (tc < CXI_TC_DEDICATED_ACCESS || tc > CXI_TC_MAX)
+		return -EINVAL;
+
+	spin_lock(&tx_profile->config.lock);
+
+	if (set)
+		set_bit(tc, tx_profile->config.tc_table);
+	else
+		clear_bit(tc, tx_profile->config.tc_table);
+
+	spin_unlock(&tx_profile->config.lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_tx_profile_set_tc);
+
+static void print_tx_profile_ac_entry_info(struct cxi_tx_profile *tx_profile,
+					   struct seq_file *s)
+{
+	int i;
+	int rc;
+	size_t num_ids;
+	size_t max_ids;
+	unsigned int *ac_entry_ids = NULL;
+	enum cxi_ac_type ac_type;
+	union cxi_ac_data ac_data;
+
+	rc = cxi_tx_profile_get_ac_entry_ids(tx_profile, 0, ac_entry_ids,
+					     &num_ids);
+	if (rc && rc != -ENOSPC)
+		goto done;
+
+	ac_entry_ids = kmalloc_array(num_ids, sizeof(*ac_entry_ids),
+				     GFP_ATOMIC);
+	if (!ac_entry_ids) {
+		rc = -ENOMEM;
+		goto done;
+	}
+
+	rc = cxi_tx_profile_get_ac_entry_ids(tx_profile, num_ids, ac_entry_ids,
+					     &max_ids);
+	if (rc)
+		goto freemem;
+
+	seq_puts(s, "        AC-entries: ");
+	for (i = 0; i < num_ids; i++) {
+		rc = cxi_tx_profile_get_ac_entry_data(tx_profile,
+						      ac_entry_ids[i],
+						      &ac_type, &ac_data);
+		if (rc)
+			break;
+
+		seq_printf(s, "ID:%d type:%s uid/gid:%d%s",
+			   ac_entry_ids[i], AC_TYPE(ac_type),
+			   ac_type == CXI_AC_OPEN ? 0 : ac_data.uid,
+			   i < (num_ids - 1) ? ", " : "");
+	}
+
+freemem:
+	kfree(ac_entry_ids);
+done:
+	if (rc)
+		seq_puts(s, "\n");
+}
+
+static void print_profile(struct cxi_tx_profile *tx_profile, struct seq_file *s)
+{
+	struct cxi_rxtx_vni_attr vni_attr;
+	struct cxi_rxtx_profile_state state;
+	struct cxi_rxtx_profile *profile = &tx_profile->profile_common;
+
+	cxi_rxtx_profile_get_info(profile, &vni_attr, &state);
+	seq_printf(s, "  ID:%-2d Name:%s VNI:match:%u ignore:%u State:%s refcount:%d Exclusive-CP:%d\n",
+		   profile->id,
+		   vni_attr.name[0] ? vni_attr.name : "none",
+		   vni_attr.match, vni_attr.ignore,
+		   state.enable ? "enabled" : "disabled",
+		   refcount_read(&state.refcount),
+		   tx_profile->config.exclusive_cp);
+
+	print_tx_profile_ac_entry_info(tx_profile, s);
+}
+
+/**
+ * cxi_tx_profile_print() - Print the TX profile info
+ *
+ * @s: file ptr
+ *
+ */
+void cxi_tx_profile_print(struct seq_file *s)
+{
+	struct cass_dev *hw = s->private;
+	struct cxi_rxtx_profile_list *list = &hw->tx_profile_list;
+	struct cxi_tx_profile *tx_profile;
+	struct cxi_rxtx_profile *profile;
+	unsigned long index;
+	int tcs;
+	int i;
+
+	seq_puts(s, "\nTX profiles:\n");
+
+	cxi_rxtx_profile_list_lock(list);
+
+	xa_for_each(&list->xarray, index, profile) {
+		tx_profile = container_of(profile, struct cxi_tx_profile,
+					  profile_common);
+		print_profile(tx_profile, s);
+
+		seq_puts(s, "\n        TCs:");
+		for (i = 0, tcs = 0; i < CXI_TC_MAX; i++) {
+			if (test_bit(i, tx_profile->config.tc_table)) {
+				seq_printf(s, "%s%s", tcs ? ", " : "",
+					   cxi_tc_strs[i]);
+				tcs++;
+			}
+		}
+
+		seq_puts(s, "\n");
+	}
+
+	cxi_rxtx_profile_list_unlock(list);
+}
+
+/**
+ * cxi_tx_profile_remove_ac_entry() - disable access control to a Profile
+ *                                    by access control id.
+ *
+ * @tx_profile: pointer to Profile
+ * @ac_entry_id: id of AC entry
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - ac entry id unknown
+ */
+int cxi_tx_profile_remove_ac_entry(struct cxi_tx_profile *tx_profile,
+				   unsigned int ac_entry_id)
+{
+	return cxi_rxtx_profile_remove_ac_entry(&tx_profile->profile_common,
+						ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_tx_profile_remove_ac_entry);
+
+/**
+ * cxi_tx_profile_get_ac_entry_ids() - get the list of AC entry ids
+ *                                     associated with a Profile
+ *
+ * @tx_profile: pointer to Profile
+ * @max_ids: size of the ac_entry_ids array
+ * @ac_entry_ids: location to store ids
+ * @num_ids: number of valid ids in ac_entry_ids array on success
+ *
+ * Return:
+ * * 0       - success
+ * * -ENOSPC - max_ids is not large enough.  num_ids holds value required.
+ */
+int cxi_tx_profile_get_ac_entry_ids(struct cxi_tx_profile *tx_profile,
+				    size_t max_ids,
+				    unsigned int *ac_entry_ids,
+				    size_t *num_ids)
+{
+	return cxi_rxtx_profile_get_ac_entry_ids(&tx_profile->profile_common,
+						 max_ids, ac_entry_ids, num_ids);
+}
+EXPORT_SYMBOL(cxi_tx_profile_get_ac_entry_ids);
+
+/**
+ * cxi_tx_profile_get_ac_entry_data() - retrieve the type and data for a
+ *                                      AC entry associated with a Profile
+ *
+ * @tx_profile: pointer to Profile
+ * @ac_entry_id: id of AC entry
+ * @ac_type: location to store AC entry type
+ * @ac_data: location to store AC data
+ *
+ * Return:
+ * * 0       - success
+ * * -EBADR  - AC entry id unknown
+ */
+int cxi_tx_profile_get_ac_entry_data(struct cxi_tx_profile *tx_profile,
+				     unsigned int ac_entry_id,
+				     enum cxi_ac_type *ac_type,
+				     union cxi_ac_data *ac_data)
+{
+	return cxi_rxtx_profile_get_ac_entry_data(&tx_profile->profile_common,
+						  ac_entry_id, ac_type, ac_data);
+}
+EXPORT_SYMBOL(cxi_tx_profile_get_ac_entry_data);
+
+/**
+ * cxi_tx_profile_get_ac_entry_id_by_data() - get the AC entry id associated
+ *                                            with a given VNI entry type and data
+ *
+ * @tx_profile: pointer to Profile
+ * @ac_type: type of AC entry to look for
+ * @ac_data: AC entry data to look for
+ * @ac_entry_id: location to store AC entry id on success
+ *
+ * Return:
+ * * 0        - success
+ * * -ENODATA - AC entry with given type&data not found
+ * * -EBADR   - invalid ac_type
+ */
+int cxi_tx_profile_get_ac_entry_id_by_data(struct cxi_tx_profile *tx_profile,
+					   enum cxi_ac_type ac_type,
+					   const union cxi_ac_data *ac_data,
+					   unsigned int *ac_entry_id)
+{
+	return cxi_rxtx_profile_get_ac_entry_id_by_data(&tx_profile->profile_common,
+							ac_type, ac_data, ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_tx_profile_get_ac_entry_id_by_data);
+
+/**
+ * cxi_tx_profile_get_ac_entry_id_by_user() - retrieve the AC entry associated
+ *                                            with a Profile by user and group
+ *
+ * @tx_profile: pointer to Profile
+ * @uid: user id
+ * @gid: group id
+ * @netns: The Network Namespace id
+ * @desired_types: OR'd list of enum cxi_ac_type values
+ * @ac_entry_id: location to store AC entry id on success
+ *
+ * Return:
+ * * 0       - success
+ * * -EPERM  - no AC entries found for given uid and gid
+ * * -EBADR  - invalid desired_types
+ *
+ * Note: multiple AC entries may apply.  The priority of return is
+ * CXI_AC_UID, CXI_AC_GID, CXI_AC_OPEN.
+ */
+int cxi_tx_profile_get_ac_entry_id_by_user(struct cxi_tx_profile *tx_profile,
+					   uid_t uid,
+					   gid_t gid,
+					   unsigned int netns,
+					   cxi_ac_typeset_t desired_types,
+					   unsigned int *ac_entry_id)
+{
+	return cxi_rxtx_profile_get_ac_entry_id_by_user(&tx_profile->profile_common,
+							uid, gid, netns, desired_types,
+							ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_tx_profile_get_ac_entry_id_by_user);
+
+/**
+ * cxi_tx_profile_add_ac_entry() - add an Access Control entry to
+ *                                 an existing Profile
+ *
+ * @tx_profile: TX profile to add AC Entry
+ * @type: type of AC Entry to add
+ * @uid: UID for AC Entry
+ * @gid: GID for AC Entry
+ * @netns: The Network Namespace id
+ * @ac_entry_id: Location to store resulting id
+ *
+ * Return:
+ * * 0       - success
+ * * -EEXIST - AC Entry already exists
+ */
+int cxi_tx_profile_add_ac_entry(struct cxi_tx_profile *tx_profile,
+				enum cxi_ac_type type, uid_t uid, gid_t gid,
+				unsigned int netns, unsigned int *ac_entry_id)
+{
+	union cxi_ac_data data = {};
+
+	switch (type) {
+	case CXI_AC_UID:
+		data.uid = uid;
+		break;
+	case CXI_AC_GID:
+		data.gid = gid;
+		break;
+	case CXI_AC_OPEN:
+		break;
+	case CXI_AC_NETNS:
+		data.netns = netns;
+		break;
+	default:
+		return -EDOM;
+	}
+
+	return cxi_rxtx_profile_add_ac_entry(&tx_profile->profile_common,
+					     type, &data, ac_entry_id);
+}
+EXPORT_SYMBOL(cxi_tx_profile_add_ac_entry);
+
+/**
+ * cxi_tx_profile_remove_ac_entries() - remove Access Control entries
+ *                                          from profile
+ *
+ * @tx_profile: TX profile from which to remove AC entries
+ */
+void cxi_tx_profile_remove_ac_entries(struct cxi_tx_profile *tx_profile)
+{
+	if (!tx_profile)
+		return;
+
+	cxi_ac_entry_list_destroy(&tx_profile->profile_common.ac_entry_list);
+}
+EXPORT_SYMBOL(cxi_tx_profile_remove_ac_entries);
+
+/**
+ * cxi_tx_profile_exclusive_cp() - Get tx_profile exclusive CP value
+ *
+ * @tx_profile: pointer to Profile
+ *
+ * Return: exclusive_cp value
+ */
+bool cxi_tx_profile_exclusive_cp(struct cxi_tx_profile *tx_profile)
+{
+	if (!tx_profile)
+		return false;
+
+	return tx_profile->config.exclusive_cp;
+}
+EXPORT_SYMBOL(cxi_tx_profile_exclusive_cp);
+
+/**
+ * cxi_tx_profile_set_exclusive_cp() - Set tx_profile exclusive CP value
+ *
+ * @tx_profile: pointer to Profile
+ * @exclusive_cp: Value to set
+ *
+ * Return: 0 - success, -EBUSY if not enabled
+ */
+int cxi_tx_profile_set_exclusive_cp(struct cxi_tx_profile *tx_profile,
+				    bool exclusive_cp)
+{
+	if (cxi_tx_profile_is_enabled(tx_profile))
+		return -EBUSY;
+
+	tx_profile->config.exclusive_cp = exclusive_cp;
+
+	return 0;
+}
+EXPORT_SYMBOL(cxi_tx_profile_set_exclusive_cp);

-- 
2.56.0

