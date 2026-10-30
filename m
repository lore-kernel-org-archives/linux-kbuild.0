Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394048;
	b=SV1F4oeOqy6eJcT/A6/nAwEgF2vo46yBf/kpfugmoGTZxDLmLh+3Zts/riN8JcryuL9e
	 QD5EPY7OP6YLUzE9r9f9R0Zll5K2LCxo9wi4WGKPqTIPzQrMP5ZK91SLl8TkiUO3c11DF
	 UJSVP5HDPEho5eOI91Q4MYcQJF8P3yICFgbZiAjyGO18B3h1DfofCrLFqmGBkypAX3tUQ
	 2xWrHXr8EFW5/u5+pTXKHjEkDOalNQSfAxIg8/Dr/BUP9VHp01pVr8CrpVzgNOlHaZ3xY
	 UFp9LiJ8mwdvC4MKX7RZRpcaRTtTGQ7IzIv/b81SOfZJMKnc7u3IZ/gSPhMajGQ9gpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394048;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LaQqsRxqcz+0ebZE3xpaGXcAgVY7WNkjDdvOMKyIq+E=;
	b=FMQL62HniXI3MwTuhEiW1fgI/TXEBLz9Uh2dx05HiD6+SRtKCt2uvDiq91oBA+nv/SXm
	 mwFgA8VTh59rwIwdCDfbWy9KNp/rMYpbpS6Q3AoX9gOHhgQmoGM7AfJl/CVrZEptKJEOy
	 PkV7reb1X7VSwmwgoMr6PfW+Vnr2w6or3C+Z+iF/av5WR+Kz8ohFYS/Ywbbffwbi51Pc6
	 kyxKLYKphDyTUrQp8CUvLYqXWFbetHA4m3wgX8Y5w9T5N84eYxQ6qVAtqYme2ORkSjvjf
	 BSPxXykIixw5kKRCLXHwKT/m/YiOPpkKWAP+URH7oLTaUU5vrNZcG/tWUJV9PkNKwBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=V7X1yLad;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D087606A31C;
	Fri, 30 Oct 2026 21:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D087606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=V7X1yLad
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvYWD1038185;
	Fri, 30 Oct 2026 21:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=La
	QqsRxqcz+0ebZE3xpaGXcAgVY7WNkjDdvOMKyIq+E=; b=V7X1yLadI9Vmpg1BIB
	rNsrD3kAEBsr5PBBH3c5YOYjoyerJ5ikXoz+DCTyWg0s5qNHSEWHpLzLmZSEAXQQ
	I/zcAtbN1u66fvYsKNKYqnlYVjfuBSBu4Bye1QPk/C1x8yW3qi2fD2g+h9waO8XX
	TPmGwat8qVnO2irlWdw3FfR4Jr7g/zrKK2V91+bv1EWHYki0PoExsqTGWIOG59my
	kEUBdLbYXhDMAtxMNOAl8R3qPFe4GtOCX/rsbR3rxTmyPzyz+sg902NPZTzFBGPD
	NzykCDWq44Z8tNwIgq2lFELezzk8hW4ETFxa0bcXiMyoPejqvaKtLbqS28/Oz6Gs
	zRIw==
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmx98uj0n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:10 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 22E03147B1;
	Fri, 30 Oct 2026 21:00:10 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:09 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:09 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:00:09 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqPjeyB7zDhePo2EUCTGQXhvq09roaKkojYuKS9p3Rk3bw5Jk8tXQUeOJwgzJAfdRQ3kvD0LR2yLjWwaHArelqt2pS0ISjKIPNRtCu28YkYRrzb+eBv7Vedjn9yQ969B6dnl7GNrfQ8pVKgtzGrfQwFS4AdlUzorJHUCMoi5UpvjM/gSCIFm6No6323val34Ele96qAGxKexDWBAR7H2Iylq5sKdFTkolVeJXgZnD6vuGrVhHBJMIDJX6uYmgs9QJGFxDk27mgozLqYvwOO6WB4GNPpOn707xa/0FhfyGDQpN+waDyFSbDG/HQ0Ms5nBqLk+XbvybxHd3kKV0fQbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaQqsRxqcz+0ebZE3xpaGXcAgVY7WNkjDdvOMKyIq+E=;
 b=BdfuRjszQqAnDyiIDZa9nrOKYwkCvWg+Z6stER9BR0sRbCT9rcr1n+sVGs+NjaGghJYnARdKNegZkZo4rmxvQWHQMm04UBF2evnHPdnXzHVbM7qfRUeOZjY2OAjts6vwE+yOUpgjbzZl6fDoO37VSJhyhBak2mW+rZfeW7ppMpnD0Nh3v7pBgl92dpnCyMLRzrJpz+65+LW8oSC8l7J0AxTSTzEBQ29DzQ9d24v40xuLTh70Ypdq7t9vEUYoeCII/KWK2WeFIeamS4D7DSDc7yWHM+9LucoT/vzrQ7COTXn4VR6njO/vp9FuH1xENa62IBtRiQv+AbZLvAPcPJjbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:06 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:06 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:01 -0700
Subject: [PATCH 05/23] net: hpe: sbl: add the PML link layer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-5-8c2c391cc283@hpe.com>
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
X-ClientProxiedBy: BN9PR03CA0507.namprd03.prod.outlook.com
 (2603:10b6:408:130::32) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: e9cbdb66-affd-4db4-ade6-08df36c8c619
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|18092099006|22082099003|3023799007|921020|56012099006|5023799004|261021121427099003|261028144727099003|261026121527099003|10067099003|261026140227099003|261022075727099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 4IBgnVkHaniSClcrG9PD46qz1OJ96EAgpjfPzwXVtNAycSkiGa+HLRZ+dPzDdoaIAlfCUa2V4TrGjLefHL8tpPtzc5UuIP8jlj3tY1DhjpyLBoxd/NyTU5Ifyvpq7CbmwQkALXHxRQDPZpAYSfHp57lUImprP1YgxwMHwSW+hrpBXsCDUpzgRRd//EyxriaW8HSiRWxibSvnGLS1RWJ8JGFSl1tH80WSarMuzZycw8sOoXKKo+G3M/SkgbDRqvm1m9SBjcb63P51hSzSSeb8UJFHGXbq9GTXK4yzlbOFdWW0LQSMCMeK5CrPrcuT4bCsqB4FGwr9ltZJls9bNNgeNakGVyFBY4ceHp4sv2UFdIiRW+r0m0v5XsWKNV17hXIAa9faXWoE57Kbv/KFAG6VYSgy+CnklYbaxm4rqSBSMv5GKoU61voHR3eO3Bz7snC2u660zmgu+kylvZN+zu0VDvmjRtYe4D1iDLy/ZbYw7IwFYFl+PmO53ClYEwERQ9937W5ZfuBcM5K6aPv4eWeYtLIgR9fl+UGGfgg63C+l+qu2uRG6rQ7GJsXbemRkl3xWz+HUk7IP4y/M1faYTvReD2T6vBxLukn24rWmR2z+PApCOqpxojjMU4W1qsFHpsGAJ10Xt8RkKORCKJfgE8X3YqBdjHcXWtoOaK3xUGXPyx5J+4Oi8DTnGSGv2MTqUBDVD/3OQGEqzdoKfVhuMk4D9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(18092099006)(22082099003)(3023799007)(921020)(56012099006)(5023799004)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(261026140227099003)(261022075727099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjNrNDl3Y0xpZ0RuS0JBbTRQdTdIS29VaWZLYXgxaXg5bGcxK2IrczdsaFJC?=
 =?utf-8?B?ZWZDU2FXbU43N2sycG83c1d4cmYxZ1JCT0ZpT25lenlFUjBRaE5PRnozOFNy?=
 =?utf-8?B?RWRMUFMvMlBiNEUyOEQ2SmF4bWRSSEN2ZnJ3WFJMV1FsRU9hNHY4RzNtcGtN?=
 =?utf-8?B?SE9QdWhFaFN0ZVRHc3AyYkNrRW1zeS9vTDFLSXFvOG1ZN0EzaWxDNU8yaFRV?=
 =?utf-8?B?amJLOUs3T0c4T1I0R0VKTWdweXBzaDd5alNxWTVaNHRCWDM5UThyU3BlYm1P?=
 =?utf-8?B?QW9GcG9xMUxiVkpQcGhrcW1nTXVtU29rTjlQS1N5SmhsdzZYMkI5dE94RVk0?=
 =?utf-8?B?d3VXMFFOd0RjRzRpOW1wdFNJQU5SM1J6TlBIZ0hKOEYrQ0ZVaVVlUkhJa1cw?=
 =?utf-8?B?SlVUbVdBbXdiVEQ3RWV5QWxONTlxdjE3eHVsTmliMUFkUG5yZllXRmkxM2FF?=
 =?utf-8?B?c3kwcTBVYzhHVEpyRmdJSjBmQk9XN1p5bnFLbHM4UVVNN084ZXhoTmo5ZnI2?=
 =?utf-8?B?dTE0bU4xTlQ2QnFub0Y3V291dDFsNkhBbmloSGk2RSs2L0FyalVmc1RFdXJ2?=
 =?utf-8?B?eVQzMUUwVGdpUlVQK0JiRHBkUUU4L0FiTTF6RXE4YytVT2lIRzNrMHZubGVr?=
 =?utf-8?B?RmxPNTllSGQ4NU8vQ2Iwb1dIV1d1MUNuZzRYUHdXZDBRSWVLOVZ1THZKUWs0?=
 =?utf-8?B?K2Y4Qm41N3g2ZzFwUWdkY0ZkSHRidlZsdU9rUjlJVUpXUTZtc1FQUVFzc3k1?=
 =?utf-8?B?RXl6WjUySGNJRmZXRkErQ2twd0I0ajJFUmM2MWgyTVZBNzdPNWZKM1VzOVBq?=
 =?utf-8?B?akRuR2wvSzhlM2lURFlZQ1U2QUpXelozSU1NamxHdXNGeklicVQrS3FYdHhw?=
 =?utf-8?B?T21UeDUxMFRUUnB4SHNvbFRrTzdlVCtpem13bXppdE5uMElGd3ZvRlBrZ3dv?=
 =?utf-8?B?eHJUckhNTFQ1c2tUSnVDYlJSVFd1MVBvaHd0RU9EaGR2OFAzVmo1VE5HT3NC?=
 =?utf-8?B?SU50Nm0ySjRpNy9mZVJtVURRRlkycXBWWEk5TjdCZGlUUFhodWEzbTl0dGtX?=
 =?utf-8?B?eldVamZQb3pjT0pTYU53bXdVVHRvSUdrODVla09NTXpTc28xMERUOG5OR1VC?=
 =?utf-8?B?VXAvMFk1eTFMZ1BPWmt1bmtMeTFHUHo4VlhQbkxZb3pKK1NFZ1pmL3Z6UDJD?=
 =?utf-8?B?MkxpZm1QZUtwUzhmNTd3Z1IwNExLMElkZFQwWnNWUHhWZlM3SGFVS29oMkNn?=
 =?utf-8?B?VEowelRhRGhkWUVldnJOT1lPa2lvTW9PMm5ldEVLMXRVZlMwUktiaXVFZ0xZ?=
 =?utf-8?B?VlNGc1BPZ3FjRE1tc2V2Nm5HSGV1SEhvVHFLNTlLTE4vUjhMRU56bTdRaVpZ?=
 =?utf-8?B?VStDeHZ6am9uang2UlZ2ZnlZckZKL0c1NDQrcHpzYUVISnI2YmxhL1o1QWV3?=
 =?utf-8?B?ZUtRVkZzMVlwdnBVQ2dsQUZCQ282amdrSUp2TzFnWEt2TG1qTUYwelR4UWxr?=
 =?utf-8?B?T1kwcHF4YVVQL1BXOFdpNWhWSXRucGtpd3ZUNDR5SHNYVlZaekVzQXg5SFVp?=
 =?utf-8?B?c3NPdTRTWFYzVVprL052OWtxUk9MSW94d2xmaFM1SVRDUmdhMXFzYStWUWoy?=
 =?utf-8?B?bkM3Y0FTUzFGWXJTbzdrU2hIcHVNWTdHbERhdWU3c0laUHdQSENSblExT0dG?=
 =?utf-8?B?UGl5ejMzU3hNYWhjemo2MjM1WXM2YmdxUFByMXhWMjVPZkVTb1hMc3JYZURr?=
 =?utf-8?B?RlVqNXF6dFBOWDVGcWpwMlZyWm9Ga2w2SExWMFhRQXVsMFpQckV6aWdQcFZE?=
 =?utf-8?B?M3lOaDFhQWFJaUJicnMveEFUSFlNZzVEdjdZWnFhdi8wYitBR1VTRExNQUpW?=
 =?utf-8?B?b1FKeUJyYzIwOC85TmtVNHFOaTBRYUluMXBUYm00bGZoOUxhbHhiUzlsYkpB?=
 =?utf-8?B?SzloOHVUd1B5WWdSditCQXVJUkE1NUxBMFBxNTE5aGxEK1VPdXp6NUZ2cmFt?=
 =?utf-8?B?akZCQ2dPcTNjSzR5Q2JSUlpYV3cwQUQyZVhIeXczbllmT0tKNDUrTVNwU0s4?=
 =?utf-8?B?NWNxc2ZTUEdjQlduOEcyRWlvUG5NdG5aTnVna2lERmN4c0V1UGdNOGxveHFj?=
 =?utf-8?B?eElaUEREN1VYZHkwejRxRGdFVkUzQjRGR0ljRUhNSWJsdzJPZG4zbXdvaEtZ?=
 =?utf-8?B?Q09mVnNYaU9JUmNLdmtaTDZqb01VNVlvQmozU2RWcU9JUGIzMlFjLzY1bWdp?=
 =?utf-8?B?VUpQNlhBbk56U2NnNUxFMzNlZUpMOTVpbTJ6NHZ5MGQvNldIQXBnN2ZCV05E?=
 =?utf-8?B?Uzk0WlZFMnhDYW9ycVFXUFFIWXZ2NktGNlRxK2NrdmNPYmJYcEQ2Zz09?=
X-Exchange-RoutingPolicyChecked: hM+JdayHJhrJ6/vgWHgBN2g5T/Bth8N3OAlCZXvDcbmFoEURztwallGWSvfQMQPTntsPm1EfNUmfZcUUAFD5m8oeyAK8BHlB8oN+ZCKIMTjBHgiRaytng4zyKjDdTker+w4dicMBJW4nW92rFTf1ighK/jPwQWyZD8A34vHaw0rrJhofrs+d+oMbnyyhcU0d9Ht01RPOH2nZgN+La8/xm7+CZJ/Up+TrIYaboBGKk+AKx4AWkkciFSbFNCZGg7202QV6W7Il+Dp9s11YhZq7yOtaAnqanBNHN5pJQjowtFpya7nZu+h8LRz+TySzBy4fguros9y9F3qhTRV1+iZ6PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cbdb66-affd-4db4-ade6-08df36c8c619
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:06.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NLxAYfZn+Ijs033f4OHnroXQbMda3Qv5qsnCmTn89hHLS0cUyI1pKBjnk5cutu9szOfH83rOprpDhH+sCddAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=QOf91QLL c=1 sm=1 tr=0 ts=6ae5055b cx=c_pps
 a=5jkVtQsCUlC8zk5UhkBgHg==:117 a=5jkVtQsCUlC8zk5UhkBgHg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=3haJ9R1Aw3gUfsUHDaCR:22 a=MvuuwTCpAAAA:8 a=7Is5PNyc-Z3HrKzonxwA:9
 a=7J2o5t3KS26tSaJB:21 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MCCJWv9_q2eqxGD0i9yuku0oufNsQn4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXw55rdD2ZwhOh
 saaI78bJMLJV/nu+h/Rl5GxLcdrzOXkiP78xozDeUVTO6jNifz3xsxvWNCkVzbjRqgzpP0trf5j
 EgAUAfBQ5jltne69clYgey/bguOkRuSVRHR3rw6XPsindRWUL4XuGW0/E5ybUWQSdQEFRutLKSn
 cPvdE5SvVgBC8unE5Psc+1zGsaUjJ8cismTd1REMnxeX3yg+7+8Xj9Q+MCI/t8Otwmdgvx3xbsE
 BA0jk/UxAK0TXcmuL6kbnBnq1fKH20mYu6IP2snXZgPBD4RKlcJTH5jf6Bt/uUaTszm5BeTkUjJ
 +I/onq/pfR8roDezGqpfbObxnOtQcI9JHCRljCn1riw4BWM9l2vpyN0RJQDIu4dnPhTMsDSYpHK
 qpu3SykeIabKGPmMthLXI6ukHawfNq+9fF6jlYXAJ6LZiN9klo49+AtrFp8xfyNVsEEi1N4L0SE
 Er8qoliqZHpvMd8GQEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX5LBm0ctMYya0
 Sx6BAOZsVTKPa5LZ4N3jPUfNc7i3CZklYtiNDasXbWkNV94DvtYLhCI8LEnNCNT8u6SiORWHUtl
 5gMfHz8u96kQSCuVyldspHvdgBE/nGM=
X-Proofpoint-ORIG-GUID: MCCJWv9_q2eqxGD0i9yuku0oufNsQn4A
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the PML (physical media layer) code: MAC, PCS and LLR (link level
retry) configuration and the SerDes operation hooks.  The *_nic files
hold the parts that only apply to the NIC; the base files are shared
with the switch variant of this block.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (33), LONG_LINE_COMMENT (7), TYPO_SPELLING (2)
- CHECK: BRACES (20), PARENTHESIS_ALIGNMENT (8), UNNECESSARY_PARENTHESES
  (7), OPEN_ENDED_LINE (2)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sbl/sbl_pml.c           |  787 ++++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_pml_llr.c       |  736 +++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_pml_llr_nic.c   |   34 +
 drivers/net/ethernet/hpe/sbl/sbl_pml_mac.c       |  220 +++++
 drivers/net/ethernet/hpe/sbl/sbl_pml_pcs.c       | 1085 ++++++++++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_pml_pcs_nic.c   |   53 ++
 drivers/net/ethernet/hpe/sbl/sbl_pml_serdes_op.c |  145 +++
 7 files changed, 3060 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml.c b/drivers/net/ethernet/hpe/sbl/sbl_pml.c
new file mode 100644
index 000000000000..367c3184fb79
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_pml.c
@@ -0,0 +1,787 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2023 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/sched.h>
+#include <linux/jiffies.h>
+#include <linux/init.h>
+#include <linux/timer.h>
+
+#include <linux/hpe/sbl/sbl_kconfig.h>
+#include <linux/hpe/sbl/sbl.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_internal.h"
+#include "sbl_serdes_fn.h"
+
+/* Bring-up PML block of a link */
+int sbl_pml_start(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int err;
+
+	sbl_dev_dbg(sbl->dev, "%d: pml bring-up starting", port_num);
+
+	/* serdes must be up */
+	if (link->sstate != SBL_SERDES_STATUS_RUNNING) {
+		sbl_dev_err(sbl->dev, "%d: pml serdes not running", port_num);
+		err = -ENOLINK;
+		goto out_err;
+	}
+
+	/* pcs must be sending am so link partner can tune */
+	if (!(READ_ONCE(link->link_info) & SBL_LINK_INFO_PCS_TX_AM)) {
+		sbl_dev_err(sbl->dev, "%d: pml pcs not tx am", port_num);
+		err = -ENODATA;
+		goto out_err;
+	}
+
+	/* make sure we have time left */
+	 sbl_start_timeout_ensure_remaining(sbl, port_num,
+					    SBL_PML_MIN_START_TIME);
+
+	/* make sure am locking is enabled */
+	if (!(READ_ONCE(link->link_info) & SBL_LINK_INFO_PCS_ALIGN_EN))
+		sbl_pml_pcs_enable_alignment(sbl, port_num);
+
+	err = sbl_pml_mac_config(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "%d: pml mac config failed [%d]", port_num, err);
+		goto out_err;
+	}
+
+	sbl_pml_llr_config(sbl, port_num);
+
+	/* keep trying to get the PML block up until
+	 * we succeed, timeout or have a fatal error
+	 */
+	while (true) {
+
+		/* wait for the pcs to come up  */
+		err = sbl_pml_pcs_wait(sbl, port_num);
+		switch (err) {
+		case 0:
+			/* good - carry on with mac */
+			break;
+		case -ECANCELED:
+			sbl_dev_dbg(sbl->dev, "%d: pml pcs wait cancelled", port_num);
+			goto out_err;
+		case -ETIMEDOUT:
+			sbl_dev_dbg(sbl->dev, "%d: pml pcs wait timeout", port_num);
+			goto out_err_invalidate;
+		default:
+			sbl_dev_dbg(sbl->dev, "%d: pml pcs wait failed [%d]", port_num, err);
+			goto out_err_invalidate;
+		}
+
+		sbl_pml_pcs_enable_auto_lane_degrade(sbl, port_num);
+
+		/* start mac */
+		sbl_pml_mac_start(sbl, port_num);
+
+		/* start llr */
+		err = sbl_pml_llr_start(sbl, port_num);
+		switch (err) {
+		case 0:
+			/* all good */
+			goto out_done;
+		case -ECANCELED:
+			sbl_dev_dbg(sbl->dev, "%d: pml llr start cancelled", port_num);
+			goto out_err;
+		case -ETIMEDOUT:
+			sbl_dev_dbg(sbl->dev, "%d: pml llr start timeout", port_num);
+			goto out_err;
+		default:
+			sbl_dev_dbg(sbl->dev, "%d: pml llr start failed [%d]", port_num, err);
+			goto out_err;
+		}
+	};
+
+out_done:
+	/* clear any PML errors which might have been set during startup */
+	sbl_pml_err_flgs_clear_all(sbl, port_num);
+
+	/* pml block is up */
+	sbl_dev_dbg(sbl->dev, "%d: pml bring-up done (up)", port_num);
+	return 0;
+
+out_err_invalidate:
+	if (link->dfe_tune_count == SBL_DFE_USED_SAVED_PARAMS) {
+		/* either the link partner is not starting or the saved params could be bad -
+		 * we cannot (currently) determine which so destroy the saved params
+		 * just in case
+		 */
+		sbl_dev_dbg(sbl->dev, "%d: pml bring-up - invalidating tuning params", port_num);
+		sbl_serdes_invalidate_tuning_params(sbl, port_num);
+	}
+out_err:
+	sbl_pml_mac_stop(sbl, port_num);
+	if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_CLEANUP))
+		sbl_pml_pcs_disable_alignment(sbl, port_num);
+	sbl_dev_dbg(sbl->dev, "%d: pml bring-up failed [%d]", port_num, err);
+	return err;
+}
+
+/* Take down the PML block of a link */
+int sbl_pml_link_down(struct sbl_inst *sbl, int port_num)
+{
+	sbl_dev_dbg(sbl->dev, "%d: pml bring-down starting\n", port_num);
+
+	sbl_pml_recovery_cancel(sbl, port_num);
+
+	/* stop everything in order */
+	sbl_pml_llr_stop(sbl, port_num);
+	sbl_pml_mac_stop(sbl, port_num);
+	sbl_pml_pcs_stop(sbl, port_num);
+
+	/* clear pml errors */
+	sbl_pml_err_flgs_clear_all(sbl, port_num);
+
+	sbl_dev_dbg(sbl->dev, "%d: pml bring-down done (down)\n", port_num);
+	return 0;
+}
+
+/* function to reset the major PML cfg regs to their default values
+ *
+ * It would seem that the default for the llr down behaviour is
+ * SBL_LLR_LINK_DOWN_BLOCK this should be SBL_LLR_LINK_DOWN_DISCARD;
+ */
+void sbl_pml_set_defaults(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	u64 llr_link_down_behavior;
+
+	/* pcs */
+	if (link->sstate != SBL_SERDES_STATUS_DOWN) {
+		/* default is to not tx am.
+		 * we should not do this because it can break optical headshells
+		 */
+		sbl_dev_warn(sbl->dev, "%d: pcs reset while serdes is running\n", port_num);
+	}
+
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_OFFSET,
+		    SBL_PML_CFG_PCS_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_OFFSET,
+		    SBL_PML_CFG_PCS_AUTONEG_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_TIMERS_OFFSET,
+		    SBL_PML_CFG_PCS_AUTONEG_TIMERS_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_BASE_PAGE_OFFSET,
+		    SBL_PML_CFG_PCS_AUTONEG_BASE_PAGE_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_OFFSET,
+		    SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_AMS_OFFSET,
+		    SBL_PML_CFG_PCS_AMS_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_TX_PCS_OFFSET,
+		    SBL_PML_CFG_TX_PCS_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET,
+		    SBL_PML_CFG_RX_PCS_DFLT);
+
+	sbl_write64(sbl, base | SBL_PML_DBG_PCS_OFFSET, SBL_PML_DBG_PCS_DFLT);
+
+	/* pcs: we need special AMs for 200GHz mode */
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_AMS_OFFSET,
+		    SBL_PML_CFG_RX_PCS_AMS_SET(SBL_PCS_200_UM_MATCH_MSK,
+					       SBL_PCS_200_CM_MATCH_MSK));
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_CM_OFFSET,
+		    SBL_PCS_200_CM);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_UM_OFFSET(0), SBL_PCS_200_UM0);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_UM_OFFSET(1), SBL_PCS_200_UM1);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_UM_OFFSET(2), SBL_PCS_200_UM2);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_UM_OFFSET(3), SBL_PCS_200_UM3);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_UM_OFFSET(4), SBL_PCS_200_UM4);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_UM_OFFSET(5), SBL_PCS_200_UM5);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_UM_OFFSET(6), SBL_PCS_200_UM6);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_UM_OFFSET(7), SBL_PCS_200_UM7);
+
+	/* assert we have destroyed any previous pcs config */
+	link->pcs_config = false;
+
+	/* mac */
+	sbl_write64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET,
+		    SBL_PML_CFG_TX_MAC_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET,
+		    SBL_PML_CFG_RX_MAC_DFLT);
+
+	/* llr */
+	val64 = SBL_PML_CFG_LLR_DFLT;
+	llr_link_down_behavior = sbl_pml_llr_link_down_behaviour(sbl, port_num);
+	val64 = SBL_PML_CFG_LLR_LINK_DOWN_BEHAVIOR_UPDATE(val64,
+							  llr_link_down_behavior);
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_OFFSET, val64);
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET,
+		    SBL_PML_CFG_LLR_SM_DFLT);
+
+	/* read to flush everything */
+	sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);
+}
+
+/* interrupt support
+ *
+ * we only have one handler
+ */
+int sbl_pml_install_intr_handler(struct sbl_inst *sbl, int port_num, u64 err_flags)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	if (link->intr_err_flgs) {
+		sbl_dev_err(sbl->dev, "intr %d: handler already registered\n", port_num);
+		return -EALREADY;
+	}
+	link->intr_err_flgs = err_flags;
+
+	return (*sbl->ops.sbl_pml_install_intr_handler)(sbl->accessor, port_num, err_flags);
+}
+
+int sbl_pml_enable_intr_handler(struct sbl_inst *sbl, int port_num, u64 err_flags)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	if (!link->intr_err_flgs) {
+		sbl_dev_warn(sbl->dev, "intr %d: no handler registered for enable\n", port_num);
+		return 0;
+	}
+
+	if ((err_flags & ~link->intr_err_flgs) || !(err_flags & link->intr_err_flgs)) {
+		sbl_dev_err(sbl->dev, "intr %d: cannot enable flags 0x%llx, 0x%llx\n", port_num,
+			    err_flags, link->intr_err_flgs);
+		return -EINVAL;
+	}
+
+	return (*sbl->ops.sbl_pml_enable_intr_handler)(sbl->accessor, port_num, err_flags);
+}
+
+int sbl_pml_disable_intr_handler(struct sbl_inst *sbl, int port_num, u64 err_flags)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	if (!link->intr_err_flgs) {
+		sbl_dev_warn(sbl->dev, "intr %d: no handler registered for disable\n", port_num);
+		return 0;
+	}
+
+	if ((err_flags & ~link->intr_err_flgs) || !(err_flags & link->intr_err_flgs)) {
+		sbl_dev_err(sbl->dev, "intr %d: cannot disable flags 0x%llx, 0x%llx\n", port_num,
+			    err_flags, link->intr_err_flgs);
+		return -EINVAL;
+	}
+
+	return (*sbl->ops.sbl_pml_disable_intr_handler)(sbl->accessor, port_num, err_flags);
+}
+
+int sbl_pml_remove_intr_handler(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int err;
+
+	if (!link->intr_err_flgs) {
+		sbl_dev_warn(sbl->dev, "intr %d: no handler registered to remove\n", port_num);
+		return 0;
+	}
+
+	err =  (*sbl->ops.sbl_pml_remove_intr_handler)(sbl->accessor, port_num,
+			link->intr_err_flgs);
+	if (!err)
+		link->intr_err_flgs = 0;
+
+	return err;
+}
+
+/* Error flags
+ *
+ * TODO: inline?
+ */
+bool sbl_pml_err_flgs_test(struct sbl_inst *sbl, int port_num, u64 err_flgs)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_ERR_FLG_OFFSET);
+
+	return val64 & err_flgs;
+}
+
+void sbl_pml_err_flgs_clear(struct sbl_inst *sbl, int port_num, u64 err_flgs)
+{
+	u32 base = SBL_PML_BASE(port_num);
+
+	sbl_write64(sbl, base | SBL_PML_ERR_CLR_OFFSET, err_flgs);
+}
+
+void sbl_pml_err_flgs_clear_all(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 err_flgs;
+
+	err_flgs = sbl_read64(sbl, base | SBL_PML_ERR_FLG_OFFSET);
+	sbl_write64(sbl, base | SBL_PML_ERR_CLR_OFFSET, err_flgs);
+}
+
+static bool sbl_pml_recovery_ignore_down_origin_fault(enum sbl_link_down_origin down_origin)
+{
+	switch (down_origin) {
+	case SBL_LINK_DOWN_ORIGIN_LINK_DOWN:
+	case SBL_LINK_DOWN_ORIGIN_LOCAL_FAULT:
+	case SBL_LINK_DOWN_ORIGIN_REMOTE_FAULT:
+	case SBL_LINK_DOWN_ORIGIN_ALIGN:
+	case SBL_LINK_DOWN_ORIGIN_HISER:
+	case SBL_LINK_DOWN_ORIGIN_LLR_MAX:
+		return true;
+	default:
+		return false;
+	}
+}
+
+void sbl_pml_link_down_async_alert(struct sbl_inst *sbl, int port_num,
+				   enum sbl_link_down_origin down_origin)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	u64 err_flags;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET);
+	if (SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(val64) < SBL_LLR_REPLAY_CT_MAX_UNLIMITED)
+		err_flags = SBL_PML_FAULT_ERR_FLAGS;
+	else
+		err_flags = SBL_PML_REC_FAULT_ERR_FLAGS;
+
+	/* going down or in recovery state, so don't need more intrs */
+	sbl_pml_disable_intr_handler(sbl, port_num, err_flags);
+
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_CLEANUP)) {
+		/* set state to error and signal no cleanup with the error number */
+		link->blstate = SBL_BASE_LINK_STATUS_ERROR;
+		link->blerr = -ECONNABORTED;
+	}
+
+	sbl_async_alert(sbl, port_num, SBL_ASYNC_ALERT_LINK_DOWN,
+			(void *)(uintptr_t)down_origin, 0);
+}
+
+static void sbl_pml_recovery_origin_counter_update(struct sbl_inst *sbl, int port_num,
+						   enum sbl_link_down_origin origin)
+{
+	switch (origin) {
+	case SBL_LINK_DOWN_ORIGIN_LINK_DOWN:
+		sbl_link_counters_incr(sbl, port_num, pml_recovery_origin_bl_ldown);
+		break;
+	case SBL_LINK_DOWN_ORIGIN_LOCAL_FAULT:
+		sbl_link_counters_incr(sbl, port_num, pml_recovery_origin_bl_lfault);
+		break;
+	case SBL_LINK_DOWN_ORIGIN_REMOTE_FAULT:
+		sbl_link_counters_incr(sbl, port_num, pml_recovery_origin_bl_rfault);
+		break;
+	case SBL_LINK_DOWN_ORIGIN_ALIGN:
+		sbl_link_counters_incr(sbl, port_num, pml_recovery_origin_bl_align);
+		break;
+	case SBL_LINK_DOWN_ORIGIN_HISER:
+		sbl_link_counters_incr(sbl, port_num, pml_recovery_origin_bl_hiser);
+		break;
+	case SBL_LINK_DOWN_ORIGIN_LLR_MAX:
+		sbl_link_counters_incr(sbl, port_num, pml_recovery_origin_bl_llr);
+		break;
+	default:
+		sbl_dev_warn(sbl->dev, "%d: pml recovery origin (%d) with no counter",
+			     port_num, origin);
+		break;
+	}
+}
+
+/* PML recovery is limited by the combined amount of time spent in one or more
+ * recovery attempts over a window, rather than by a count. This approximates
+ * bandwidth loss. For example, 60 ms per second in PML recovery corresponds
+ * to a roughly %6 loss of bandwidth.
+ *
+ * After each successful recovery, the duration is subtracted from the
+ * remaining time budgeted for the window. The rate test fails if the remaining
+ * time is insufficient for another attempt.
+ */
+static bool sbl_pml_recovery_rate_test(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u64 window_end = link->pml_recovery.rl_window_start + msecs_to_jiffies(link->blattr.pml_recovery.rl_window_size);
+
+	/* reset if not started or window has elapsed */
+	if (!link->pml_recovery.rl_window_start ||
+	    link->pml_recovery.init_jiffies > window_end) {
+		link->pml_recovery.rl_window_start = link->pml_recovery.init_jiffies;
+		link->pml_recovery.rl_time_remaining = link->blattr.pml_recovery.rl_max_duration;
+		return true;
+	}
+
+	if (link->pml_recovery.rl_time_remaining < SBL_PML_REC_POLL_INTERVAL)
+		return false;
+
+	return true;
+}
+
+static void sbl_pml_recovery_monitor_fallback_timer(struct timer_list *t)
+{
+	struct sbl_pml_recovery *pml_recovery = container_of(t, struct sbl_pml_recovery, timer);
+	struct sbl_inst *sbl;
+	struct sbl_link *link;
+	int port_num;
+	enum sbl_link_down_origin down_origin;
+	u32 elapsed;
+	u32 rl_total_time;
+	unsigned long timeout;
+	unsigned long irq_flags;
+
+	if (!pml_recovery || !pml_recovery->sbl)
+		return;
+
+	spin_lock_irqsave(&pml_recovery->lock, irq_flags);
+	if (!pml_recovery->enabled || !pml_recovery->started) {
+		spin_unlock_irqrestore(&pml_recovery->lock, irq_flags);
+		return;
+	}
+	spin_unlock_irqrestore(&pml_recovery->lock, irq_flags);
+
+	sbl = pml_recovery->sbl;
+	port_num = pml_recovery->port_num;
+	down_origin = pml_recovery->down_origin;
+	link = sbl->link + port_num;
+	timeout = pml_recovery->init_jiffies + msecs_to_jiffies(pml_recovery->timeout);
+	elapsed = jiffies_to_msecs(jiffies - link->pml_recovery.init_jiffies);
+	link->pml_recovery.rl_time_remaining -=
+		jiffies_to_msecs(jiffies -
+				 link->pml_recovery.last_poll_jiffies);
+	link->pml_recovery.last_poll_jiffies  = jiffies;
+
+	if (sbl_pml_recovery_no_faults(sbl, port_num)) {
+		sbl_dev_info(sbl->dev, "%d: PML recovered successfully in %ums", port_num, elapsed);
+		sbl_link_counters_incr(sbl, port_num, pml_recovery_successes);
+		sbl_pml_recovery_origin_counter_update(sbl, port_num, down_origin);
+		sbl_link_counters_incr(sbl, port_num, (elapsed < SBL_PML_REC_HISTOGRAM_MAX) ?
+				      (pml_recovery_histogram_0_9ms + elapsed / 10) :
+				       pml_recovery_histogram_high);
+		goto out;
+	} else if (time_is_before_eq_jiffies(timeout)) {
+		sbl_dev_info(sbl->dev, "%d: PML recovery monitor timed out (%ums)", port_num, elapsed);
+		goto out_fail;
+	} else if (!sbl_pml_recovery_rate_test(sbl, port_num)) {
+		rl_total_time = link->blattr.pml_recovery.rl_max_duration - link->pml_recovery.rl_time_remaining;
+		sbl_dev_err(sbl->dev, "%d: PML recovery rate exceeded (%ums/%ums) after %ums", port_num, rl_total_time,
+			    link->blattr.pml_recovery.rl_window_size, elapsed);
+		sbl_link_counters_incr(sbl, port_num, pml_recovery_rate_exceeded);
+		goto out_fail;
+	}
+
+	/* start timer for next poll */
+	spin_lock_irqsave(&pml_recovery->lock, irq_flags);
+	if (pml_recovery->enabled)
+		mod_timer(&pml_recovery->timer,
+			  jiffies + msecs_to_jiffies(SBL_PML_REC_POLL_INTERVAL));
+	spin_unlock_irqrestore(&pml_recovery->lock, irq_flags);
+	return;
+
+out_fail:
+	sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
+
+out:
+	spin_lock_irqsave(&link->fec_discard_lock, irq_flags);
+	link->fec_discard_time = jiffies;
+	link->fec_discard_type = SBL_FEC_DISCARD_TYPE_PML_REC_END;
+	spin_unlock_irqrestore(&link->fec_discard_lock, irq_flags);
+	spin_lock_irqsave(&pml_recovery->lock, irq_flags);
+	pml_recovery->started = false;
+	spin_unlock_irqrestore(&pml_recovery->lock, irq_flags);
+}
+
+void sbl_pml_recovery_init(struct sbl_pml_recovery *recovery)
+{
+	spin_lock_init(&recovery->lock);
+	recovery->enabled = false;
+	timer_setup(&recovery->timer, sbl_pml_recovery_monitor_fallback_timer,
+		    TIMER_IRQSAFE);
+}
+
+/* Allow recovery once the fault monitor is about to deliver PML faults */
+void sbl_pml_recovery_enable(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_pml_recovery *recovery = &sbl->link[port_num].pml_recovery;
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&recovery->lock, irq_flags);
+	recovery->enabled = true;
+	spin_unlock_irqrestore(&recovery->lock, irq_flags);
+}
+
+static void sbl_pml_recovery_monitor(struct sbl_inst *sbl, int port_num,
+				     enum sbl_link_down_origin down_origin)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct sbl_pml_recovery *recovery = &link->pml_recovery;
+	u32 rl_total_time;
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&recovery->lock, irq_flags);
+	if (!recovery->enabled || recovery->started) {
+		spin_unlock_irqrestore(&recovery->lock, irq_flags);
+		return;
+	}
+
+	recovery->started = true;
+	recovery->init_jiffies = jiffies;
+	recovery->last_poll_jiffies = recovery->init_jiffies;
+	recovery->sbl = sbl;
+	recovery->port_num = port_num;
+	recovery->down_origin = down_origin;
+	recovery->timeout = link->blattr.pml_recovery.timeout;
+
+	if (!sbl_pml_recovery_rate_test(sbl, port_num)) {
+		rl_total_time = link->blattr.pml_recovery.rl_max_duration -
+				recovery->rl_time_remaining;
+		recovery->started = false;
+		spin_unlock_irqrestore(&recovery->lock, irq_flags);
+		sbl_dev_err(sbl->dev, "%d: PML recovery rate exceeded (%ums/%ums)", port_num,
+			    rl_total_time, link->blattr.pml_recovery.rl_window_size);
+		sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
+		sbl_link_counters_incr(sbl, port_num, pml_recovery_rate_exceeded);
+		return;
+	}
+	sbl_link_counters_incr(sbl, port_num, pml_recovery_attempts);
+
+	spin_lock(&link->fec_discard_lock);
+	link->fec_discard_time = recovery->init_jiffies;
+	link->fec_discard_type = SBL_FEC_DISCARD_TYPE_PML_REC_START;
+	spin_unlock(&link->fec_discard_lock);
+
+	/* cancel cannot slip between restarting alignment and arming the poll */
+	sbl_pml_pcs_disable_alignment(sbl, port_num);
+	sbl_pml_pcs_enable_alignment(sbl, port_num);
+	mod_timer(&recovery->timer,
+		  jiffies + msecs_to_jiffies(SBL_PML_REC_POLL_INTERVAL));
+	spin_unlock_irqrestore(&recovery->lock, irq_flags);
+
+	sbl_dev_info(sbl->dev, "%d: PML recovery started - %s", port_num,
+		     sbl_down_origin_str(down_origin));
+}
+
+void sbl_pml_recovery_cancel(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct sbl_pml_recovery *recovery = &link->pml_recovery;
+	unsigned long irq_flags;
+	bool was_started;
+	u32 elapsed;
+
+	spin_lock_irqsave(&recovery->lock, irq_flags);
+	recovery->enabled = false;
+	spin_unlock_irqrestore(&recovery->lock, irq_flags);
+
+	/* with the gate closed neither the handler nor the timer can rearm */
+	timer_delete_sync(&recovery->timer);
+
+	spin_lock_irqsave(&recovery->lock, irq_flags);
+	was_started = recovery->started;
+	recovery->started = false;
+	spin_unlock_irqrestore(&recovery->lock, irq_flags);
+
+	if (!was_started)
+		return;
+
+	elapsed = jiffies_to_msecs(jiffies - recovery->init_jiffies);
+	spin_lock_irqsave(&link->fec_discard_lock, irq_flags);
+	link->fec_discard_time = jiffies;
+	link->fec_discard_type = SBL_FEC_DISCARD_TYPE_PML_REC_END;
+	spin_unlock_irqrestore(&link->fec_discard_lock, irq_flags);
+
+	sbl_dev_info(sbl->dev, "%d: PML recovery canceled (%ums)", port_num, elapsed);
+}
+
+/**
+ * sbl_pml_hdlr() - local interrupt handler called by surrounding framework
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @data: Value is NULL in all cases
+ *
+ * This function does the following operations: Reads PML error-flag
+ * registers, extracts PCS-lane degradation information for both TX
+ * and RX paths and issues warning alerts when failure conditions are
+ * met. If auto negotiation error flags are raised, the function disables
+ * further PML interrupts. It also logs critical error when all lanes
+ * are reported down, link faults. It also checks possible case of
+ * down origin and alert the clients.
+ *
+ * Context: Interrupt
+ *
+ * Return: 0 on success
+ */
+int sbl_pml_hdlr(struct sbl_inst *sbl, int port_num, void *data)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 raised_flgs;
+	u64 sts_pcs_lane_degrade_reg;
+	enum sbl_link_down_origin down_origin = SBL_LINK_DOWN_ORIGIN_UNKNOWN;
+	char pcs_state_str[SBL_PCS_STATE_STR_LEN];
+	u64 val64;
+	struct lane_degrade degrade_data;
+	enum sbl_async_alert_type alert = SBL_ASYNC_ALERT_INVALID;
+	int result;
+	unsigned long irq_flags;
+
+	raised_flgs = sbl_read64(sbl, base | SBL_PML_ERR_FLG_OFFSET) & link->intr_err_flgs;
+
+	if (!raised_flgs)
+		return 0;
+
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_TRACE_PML_INT)) {
+		sbl_dev_info(sbl->dev,
+			     "%d: pml hdlr (%lld %lld hs%lld mr%lld ld%lld) in 0x%llx",
+			port_num,
+			SBL_PML_ERR_FLG_AUTONEG_PAGE_RECEIVED_GET(raised_flgs),
+			SBL_PML_ERR_FLG_AUTONEG_COMPLETE_GET(raised_flgs),
+			SBL_PML_ERR_FLG_PCS_HI_SER_GET(raised_flgs),
+			SBL_PML_ERR_FLG_LLR_REPLAY_AT_MAX_GET(raised_flgs),
+			SBL_PML_ERR_FLG_PCS_LINK_DOWN_GET(raised_flgs),
+			link->intr_err_flgs);
+	}
+
+	sts_pcs_lane_degrade_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_LANE_DEGRADE_OFFSET);
+	degrade_data.tx = SBL_PML_STS_PCS_LANE_DEGRADE_LP_PLS_AVAILABLE_GET(sts_pcs_lane_degrade_reg);
+	degrade_data.rx = SBL_PML_STS_PCS_LANE_DEGRADE_RX_PLS_AVAILABLE_GET(sts_pcs_lane_degrade_reg);
+	if (SBL_PML_ERR_FLG_PCS_RX_DEGRADE_GET(raised_flgs) && degrade_data.tx && degrade_data.rx) {
+		spin_lock_irqsave(&link->fec_discard_lock, irq_flags);
+		link->fec_discard_time = jiffies;
+		link->fec_discard_type = SBL_FEC_DISCARD_TYPE_RX_DEGRADE;
+		spin_unlock_irqrestore(&link->fec_discard_lock, irq_flags);
+		sbl_dev_warn(sbl->dev, "%d: RX side Degraded -> TX Lanes Available: 0x%llx - RX Lanes Available: 0x%llx",
+			     port_num, degrade_data.tx, degrade_data.rx);
+		sbl_async_alert(sbl, port_num, SBL_ASYNC_ALERT_RX_DEGRADE,
+				&degrade_data, sizeof(degrade_data));
+	}
+
+	if (SBL_PML_ERR_FLG_PCS_TX_DEGRADE_GET(raised_flgs) && degrade_data.tx && degrade_data.rx) {
+		sbl_dev_warn(sbl->dev, "%d: TX side Degraded -> TX Lanes Available: 0x%llx - RX Lanes Available: 0x%llx",
+			     port_num, degrade_data.tx, degrade_data.rx);
+		sbl_async_alert(sbl, port_num, SBL_ASYNC_ALERT_TX_DEGRADE,
+				&degrade_data, sizeof(degrade_data));
+	}
+
+	result = SBL_PML_ERR_FLG_PCS_TX_DEGRADE_FAILURE_GET(raised_flgs);
+
+	if (result) {
+		alert = SBL_ASYNC_ALERT_TX_DEGRADE_FAILURE;
+		sbl_async_alert(sbl, port_num, alert, NULL, 0);
+	}
+
+	result = SBL_PML_ERR_FLG_PCS_RX_DEGRADE_FAILURE_GET(raised_flgs);
+
+	if (result) {
+		alert = SBL_ASYNC_ALERT_RX_DEGRADE_FAILURE;
+		sbl_async_alert(sbl, port_num, alert, NULL, 0);
+	}
+
+	if (alert != SBL_ASYNC_ALERT_INVALID) {
+		/* if Auto Lane Degrade is enabled, we will print this message regardless of whether
+		 * the link went down because of lane degrade failure or not
+		 */
+		sbl_dev_err(sbl->dev, "%d: pml hdlr - link going down - all lanes down [%d]", port_num, alert);
+		down_origin = SBL_LINK_DOWN_ORIGIN_DEGRADE_FAILURE;
+	}
+
+	/* autoneg err flags */
+	if (raised_flgs & SBL_AUTONEG_ERR_FLGS) {
+		sbl_pml_disable_intr_handler(sbl, port_num, SBL_AUTONEG_ERR_FLGS);
+		complete(&link->an_hw_change);
+	}
+
+	/* link faults */
+	if (SBL_PML_ERR_FLG_PCS_HI_SER_GET(raised_flgs)) {
+		if (sbl_debug_option(sbl, port_num, SBL_DEBUG_IGNORE_HISER)) {
+			sbl_dev_warn(sbl->dev, "%d: pml hdlr - hiser - ignored", port_num);
+		} else {
+			sbl_dev_dbg(sbl->dev, "%d: pml hdlr - hiser", port_num);
+			down_origin = SBL_LINK_DOWN_ORIGIN_HISER;
+		}
+	}
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET);
+	if (SBL_PML_ERR_FLG_LLR_REPLAY_AT_MAX_GET(raised_flgs) &&
+	    SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(val64) < SBL_LLR_REPLAY_CT_MAX_UNLIMITED) {
+		sbl_dev_dbg(sbl->dev, "%d: pml hdlr - max llr replay", port_num);
+		down_origin = SBL_LINK_DOWN_ORIGIN_LLR_MAX;
+	}
+
+	if (SBL_PML_ERR_FLG_PCS_LINK_DOWN_GET(raised_flgs)) {
+		val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_OFFSET);
+
+		if (sbl_debug_option(sbl, port_num, SBL_DEBUG_TRACE_PML_INT)) {
+			sbl_dev_info(sbl->dev, "%d: pml hdlr - link down (%s)", port_num,
+				     sbl_pml_pcs_state_str(sbl, port_num, pcs_state_str,
+							   SBL_PCS_STATE_STR_LEN));
+		}
+
+		if (!SBL_PML_STS_RX_PCS_ALIGN_STATUS_GET(val64)) {
+			if (sbl_debug_option(sbl, port_num, SBL_DEBUG_IGNORE_ALIGN)) {
+				sbl_dev_warn(sbl->dev, "%d: pml hdlr - align - ignored", port_num);
+			} else {
+				sbl_dev_dbg(sbl->dev, "%d: pml hdlr - align", port_num);
+				down_origin = SBL_LINK_DOWN_ORIGIN_ALIGN;
+			}
+		} else if (SBL_PML_STS_RX_PCS_LOCAL_FAULT_GET(val64)) {
+			sbl_dev_dbg(sbl->dev, "%d: pml hdlr - local fault", port_num);
+			down_origin = SBL_LINK_DOWN_ORIGIN_LOCAL_FAULT;
+		} else if (SBL_PML_STS_RX_PCS_FAULT_GET(val64)) {
+			if (link->blattr.options & SBL_DISABLE_PML_RECOVERY ||
+			    sbl_debug_option(sbl, port_num, SBL_DEBUG_REMOTE_FAULT_RECOVERY)) {
+				sbl_dev_dbg(sbl->dev, "%d: pml hdlr - remote fault", port_num);
+				down_origin = SBL_LINK_DOWN_ORIGIN_REMOTE_FAULT;
+			} else {
+				sbl_dev_dbg(sbl->dev, "%d: pml hdlr - remote fault - ignored", port_num);
+			}
+		} else {
+			sbl_dev_dbg(sbl->dev, "%d: pml hdlr - link down", port_num);
+			down_origin = SBL_LINK_DOWN_ORIGIN_LINK_DOWN;
+		}
+	}
+
+	if (down_origin != SBL_LINK_DOWN_ORIGIN_UNKNOWN) {
+		if (!(link->blattr.options & SBL_DISABLE_PML_RECOVERY) && !link->is_degraded) {
+			if (sbl_pml_recovery_ignore_down_origin_fault(down_origin)) {
+				sbl_dev_dbg(sbl->dev, "%d: PML recovery, pml hdlr fault(%d) is ignored", port_num, down_origin);
+				sbl_pml_recovery_monitor(sbl, port_num, down_origin);
+
+			} else
+				sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
+		} else {
+			sbl_dev_info(sbl->dev, "%d: PML recovery is disabled", port_num);
+			sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
+		}
+	}
+
+	sbl_write64(sbl, base | SBL_PML_ERR_CLR_OFFSET, raised_flgs);
+	sbl_read64(sbl, base | SBL_PML_ERR_CLR_OFFSET);  /* flush */
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_pml_hdlr);
+
+/**
+ * sbl_pml_recovery_log_link_down() - Print pcs status when link down
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Print PCS receive path status and eye heights signal when
+ * reporting link down reason
+ */
+void sbl_pml_recovery_log_link_down(struct sbl_inst *sbl, int port_num)
+{
+	if (!sbl_pml_recovery_no_faults(sbl, port_num)) {
+		sbl_pml_recovery_log_pcs_status(sbl, port_num);
+		sbl_log_port_eye_heights(sbl, port_num);
+	}
+}
+EXPORT_SYMBOL(sbl_pml_recovery_log_link_down);
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml_llr.c b/drivers/net/ethernet/hpe/sbl/sbl_pml_llr.c
new file mode 100644
index 000000000000..a190f6890b4e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_pml_llr.c
@@ -0,0 +1,736 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/sched.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_an.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_internal.h"
+
+static int sbl_pml_llr_ready_wait(struct sbl_inst *sbl, int port_num)
+{
+	int err = -1;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR ready wait", port_num);
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_LLR_WAIT);
+
+	while (sbl_pml_llr_get_state(sbl, port_num) != SBL_PML_LLR_STATE_ADVANCE) {
+
+		if (sbl_start_timeout(sbl, port_num)) {
+			sbl_dev_err(sbl->dev, "%d: LLR ready wait timeout", port_num);
+			err = -ETIMEDOUT;
+			goto out;
+		}
+
+		if (sbl_base_link_start_cancelled(sbl, port_num)) {
+			sbl_dev_err(sbl->dev, "%d: LLR ready wait cancelled", port_num);
+			err = -ECANCELED;
+			goto out;
+		}
+
+		/* should be relatively well synchronised by this point */
+		usleep_range(5000, 6000);
+	}
+
+	err = 0;
+
+out:
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_WAIT);
+	return err;
+}
+
+/* calculate the loop time
+ *
+ * try to make a number of measurements or timeout/cancelled
+ */
+static int sbl_pml_llr_measure_loop_time_ns(struct sbl_inst *sbl, int port_num,
+					    u64 *llr_loop_time)
+{
+	struct sbl_link *link;
+	u32              base;
+	u64              min_loop_time;
+	u64              max_loop_time;
+	int              x;
+	u64              val64;
+	u64              time64;
+	int              err;
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_LLR_MEASURE);
+
+	link = sbl->link + port_num;
+	base = SBL_PML_BASE(port_num);
+
+	min_loop_time  = SBL_PML_LLR_MIN_LOOP_TIME;
+	max_loop_time  = SBL_PML_LLR_MAX_LOOP_TIME;
+	*llr_loop_time = SBL_PML_LLR_MAX_LOOP_TIME;
+	time64         = 0ULL;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR measure loop time (len = %s)(media = %s)",
+		    port_num, sbl_link_len_str(link->mattr.len),
+		    sbl_link_media_str(link->mattr.media));
+
+	/* calc loop time bounds */
+	if (link->mattr.len != SBL_LINK_LEN_INVALID) {
+		err = sbl_media_calc_loop_time(sbl, port_num, &min_loop_time);
+		if (err) {
+			sbl_dev_err(sbl->dev, "%d: LLR measure calc loop time failed [%d]", port_num, err);
+			goto out;
+		}
+		/* arbitrary range for max */
+		max_loop_time = min_loop_time + 100 /* ns */;
+	}
+	sbl_dev_dbg(sbl->dev, "%d: LLR measure loop time bounds: min = %lldns, max = %lldns",
+		    port_num, min_loop_time, max_loop_time);
+
+	/* measure loop time */
+	for (x = 0; x < SBL_PML_LLR_TIMING_LOOPS; ++x) {
+
+		if (sbl_start_timeout(sbl, port_num)) {
+			sbl_dev_err(sbl->dev, "%d: LLR measure loop time timeout", port_num);
+			err = -ETIMEDOUT;
+			goto out;
+		}
+
+		if (sbl_base_link_start_cancelled(sbl, port_num)) {
+			sbl_dev_err(sbl->dev, "%d: LLR measure loop time cancelled", port_num);
+			err = -ECANCELED;
+			goto out;
+		}
+
+		/* start a measurement */
+		sbl_write64(sbl, base | SBL_PML_STS_LLR_LOOP_TIME_OFFSET, 0ULL);
+		sbl_read64(sbl, base | SBL_PML_STS_LLR_LOOP_TIME_OFFSET);  /* flush */
+		/* give the measurement time to complete */
+		udelay(SBL_PML_LLR_TIMING_MEASURE_DELAY);
+		/* read the measurement */
+		val64 = sbl_read64(sbl, base | SBL_PML_STS_LLR_LOOP_TIME_OFFSET);
+
+		time64 = SBL_PML_STS_LLR_LOOP_TIME_LOOP_TIME_GET(val64); /* ns */
+		sbl_dev_dbg(sbl->dev, "%d: LLR measure time = %lldns (%d)", port_num, time64, x);
+
+		/* if we didn't get a valid time, then wait to retry */
+		if (!time64)
+			msleep(SBL_PML_LLR_TIMING_RETRY_DELAY);
+
+		/* if we did get a valid time, then check it here */
+		else if ((time64 >= min_loop_time) && (time64 <= max_loop_time)) {
+			/* save the fastest time here */
+			if (time64 < *llr_loop_time)
+				*llr_loop_time = time64;
+		}
+	}
+
+	/* check result here */
+	if (*llr_loop_time == SBL_PML_LLR_MAX_LOOP_TIME) {
+		if (sbl_debug_option(sbl, port_num, SBL_DEBUG_ALLOW_LOOP_TIME_FAIL)) {
+			sbl_dev_err(sbl->dev, "%d: LLR measure loop time failed (min = %lld, max = %lld, last = %lld)",
+				    port_num, min_loop_time, max_loop_time, time64);
+			err = -ENODATA;
+			goto out;
+		}
+		/* set to max calculated loop time */
+		*llr_loop_time = max_loop_time;
+	}
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR measure loop time = %lldns", port_num, *llr_loop_time);
+	err = 0;
+
+out:
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_MEASURE);
+	return err;
+}
+
+/*   calculate the required size of the llr buffer
+ *
+ *   we will use the measured loop time not cable length as we dont
+ *   always have that.
+ *
+ *   TODO: link degrade & mfs
+ */
+static void sbl_pml_llr_calculate_capacity(struct sbl_inst *sbl, int port_num,
+					   u64 *max_data, u64 *max_seq)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	u64 bytes_per_ns = 25;
+	u64 bytes_per_frame = sbl_frame_size(sbl, port_num);
+	u64 cap_data_max;
+	u64 cap_seq_max;
+	u64 calc;
+
+	switch (link->link_mode) {
+	case SBL_LINK_MODE_BS_200G:
+		bytes_per_ns = 25;  /* 25000us */
+		break;
+	case SBL_LINK_MODE_BJ_100G:
+	case SBL_LINK_MODE_CD_100G:
+		bytes_per_ns = 13;  /* 12500us */
+		break;
+	case SBL_LINK_MODE_CD_50G:
+		bytes_per_ns =  7;  /*  6250us */
+		break;
+	}
+
+	sbl_llr_max_data_get(sbl, port_num, &cap_data_max, &cap_seq_max);
+
+	calc = (link->llr_loop_time * bytes_per_ns) + (bytes_per_frame * SBL_PML_LLR_NUM_FRAMES);
+
+	/* units 48 byte quanta */
+	*max_data = DIV_ROUND_UP(calc, 48);
+	if (*max_data > cap_data_max) {
+		sbl_dev_dbg(sbl->dev,
+			    "%d: LLR max data cap 0x%llx out of bounds, setting to 0x%llx",
+			port_num, *max_data, cap_data_max);
+		*max_data = cap_data_max;
+	}
+
+	/* units 32 byte frame size */
+	*max_seq  = DIV_ROUND_UP(calc, 32);
+	if (*max_seq > cap_seq_max) {
+		sbl_dev_dbg(sbl->dev,
+			    "%d: LLR max seq cap 0x%llx out of bounds, setting to 0x%llx",
+			port_num, *max_seq, cap_seq_max);
+		*max_seq = cap_seq_max;
+	}
+
+	sbl_dev_dbg(sbl->dev,
+		    "%d: LLR cap: data = 0x%llx, seq = 0x%llx",
+		port_num, *max_data, *max_seq);
+}
+
+/* enable llr timing measurements */
+static void sbl_pml_llr_enable_loop_timing(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR enable loop timing", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);
+	val64 = SBL_PML_CFG_LLR_ENABLE_LOOP_TIMING_UPDATE(val64, 1ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);  /* flush */
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_LLR_LOOP);
+}
+
+/* disable llr timing measurements */
+static void sbl_pml_llr_disable_loop_timing(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR disable loop timing", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);
+	val64 = SBL_PML_CFG_LLR_ENABLE_LOOP_TIMING_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);  /* flush */
+
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_LOOP);
+}
+
+/* set LLR mode */
+static void sbl_pml_llr_mode_set(struct sbl_inst *sbl, int port_num, u32 llr_mode)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR mode set (%d)", port_num, llr_mode);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);
+	switch (llr_mode) {
+	case SBL_LLR_MODE_OFF:
+		val64 = SBL_PML_CFG_LLR_LLR_MODE_UPDATE(val64, 0ULL);
+		break;
+	case SBL_LLR_MODE_MONITOR:
+		val64 = SBL_PML_CFG_LLR_LLR_MODE_UPDATE(val64, 1ULL);
+		break;
+	case SBL_LLR_MODE_ON:
+		val64 = SBL_PML_CFG_LLR_LLR_MODE_UPDATE(val64, 2ULL);
+		break;
+	default:
+		sbl_dev_dbg(sbl->dev, "%d: LLR mode invalid (%d)", port_num, llr_mode);
+		return;
+	}
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);  /* flush */
+}
+
+/* LLR detect */
+static int sbl_pml_llr_detect(struct sbl_inst *sbl, int port_num, u32 *llr_mode)
+{
+	u32           base       = SBL_PML_BASE(port_num);
+	u64           val64      = 0;
+	u64           time64     = 0;
+	unsigned long last_jiffy = jiffies + msecs_to_jiffies(SBL_PML_LLR_DETECT_TIMEOUT);
+	int           err        = -1;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR detect", port_num);
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_LLR_DETECT);
+
+	/* OFF unless we detect a loop */
+	*llr_mode = SBL_LLR_MODE_OFF;
+
+	sbl_write64(sbl, (base | SBL_PML_STS_LLR_LOOP_TIME_OFFSET), 0ULL);
+	sbl_read64(sbl, (base | SBL_PML_STS_LLR_LOOP_TIME_OFFSET));  /* flush */
+	do {
+
+		if (sbl_start_timeout(sbl, port_num)) {
+			err = -ETIMEDOUT;
+			goto out;
+		}
+
+		if (sbl_base_link_start_cancelled(sbl, port_num)) {
+			err = -ECANCELED;
+			goto out;
+		}
+
+		msleep(SBL_PML_LLR_DETECT_DELAY);
+
+		val64 = sbl_read64(sbl, (base | SBL_PML_STS_LLR_LOOP_TIME_OFFSET));
+		time64 = SBL_PML_STS_LLR_LOOP_TIME_LOOP_TIME_GET(val64);                 /* ns */
+		sbl_dev_dbg(sbl->dev, "%d: LLR time = %lldns", port_num, time64);
+
+		if (time64) {
+			/* loop detected */
+			if ((time64 < SBL_PML_LLR_MIN_LOOP_TIME) || (time64 > SBL_PML_LLR_MAX_LOOP_TIME)) {
+				sbl_dev_warn(sbl->dev, "%d: LLR time out of bounds (%lldns)", port_num, time64);
+				continue;
+			}
+			*llr_mode = SBL_LLR_MODE_ON;
+			err = 0;
+			goto out;
+		}
+
+	} while (time_before(jiffies, last_jiffy));
+
+out:
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_DETECT);
+	return err;
+}
+
+/* get LLR mode */
+static int sbl_pml_llr_mode_get(struct sbl_inst *sbl, int port_num, u32 *llr_mode)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int               err = -1;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR mode get (%d)", port_num, link->blattr.llr_mode);
+
+	switch (link->blattr.llr_mode) {
+
+	case SBL_LLR_MODE_MONITOR:
+		sbl_dev_dbg(sbl->dev, "%d: LLR mode monitor", port_num);
+		*llr_mode = SBL_LLR_MODE_MONITOR;
+		return 0;
+
+	case SBL_LLR_MODE_ON:
+		sbl_dev_dbg(sbl->dev, "%d: LLR mode on", port_num);
+		goto out_on;
+
+	case SBL_LLR_MODE_AUTO:
+		/* check fabric link here */
+		if (link->blattr.options & SBL_OPT_FABRIC_LINK) {
+			sbl_dev_dbg(sbl->dev, "%d: LLR mode on fabric", port_num);
+			goto out_on;
+		}
+		/* check ether link here */
+		if (!(link->blattr.options & SBL_OPT_ENABLE_ETHER_LLR))
+			goto out_off;
+		/* check AN options here */
+		if (link->an_options & AN_OPT_LLR) {
+			if (link->an_options & AN_OPT_ETHER_LLR) {
+				if (link->an_options & AN_OPT_HPC_WITH_LLR) {
+					link->llr_options |= SBL_PML_LLR_OPTION_HPC_WIH_LLR;
+					link->ifg_config = SBL_IFG_CONFIG_HPC;
+					sbl_dev_dbg(sbl->dev, "%d: LLR mode on with HPC from AN", port_num);
+					goto out_on;
+				}
+				sbl_dev_dbg(sbl->dev, "%d: LLR mode on without HPC from AN", port_num);
+				goto out_on;
+			}
+			goto out_off;
+		}
+		/* do loop detect here */
+		err = sbl_pml_llr_detect(sbl, port_num, &(link->llr_mode));
+		switch (err) {
+		case 0:
+			if (link->llr_mode == SBL_LLR_MODE_OFF)
+				goto out_off;
+			if (link->blattr.options & SBL_OPT_ENABLE_IFG_HPC_WITH_LLR) {
+				link->llr_options |= SBL_PML_LLR_OPTION_HPC_WIH_LLR;
+				link->ifg_config = SBL_IFG_CONFIG_HPC;
+				sbl_dev_dbg(sbl->dev, "%d: LLR mode on with HPC from LOOP", port_num);
+				goto out_on;
+			}
+			sbl_dev_dbg(sbl->dev, "%d: LLR mode on without HPC from LOOP", port_num);
+			goto out_on;
+		case -ECANCELED:
+			sbl_dev_dbg(sbl->dev, "%d: LLR detect cancelled", port_num);
+			goto out_err;
+		case -ETIMEDOUT:
+			sbl_dev_dbg(sbl->dev, "%d: LLR detect timed out", port_num);
+			goto out_err;
+		default:
+			goto out_off;
+		}
+		goto out_off;
+
+	case SBL_LLR_MODE_OFF:
+		goto out_off;
+
+	default:
+		sbl_dev_err(sbl->dev, "%d: LLR invalid mode [%d]", port_num, link->blattr.llr_mode);
+		err = -EBADRQC;
+		goto out_err;
+	}
+
+out_off:
+	sbl_dev_dbg(sbl->dev, "%d: LLR mode off", port_num);
+	*llr_mode = SBL_LLR_MODE_OFF;
+	return 0;
+
+out_on:
+	*llr_mode = SBL_LLR_MODE_ON;
+	return 0;
+
+out_err:
+	*llr_mode = SBL_LLR_MODE_OFF;
+	return err;
+}
+
+/* configure */
+void sbl_pml_llr_config(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR config", port_num);
+
+	/* init to original requested */
+	link->llr_mode = link->blattr.llr_mode;
+
+	/* config */
+	sbl_write64(sbl, base | SBL_PML_STS_LLR_MAX_USAGE_OFFSET, 0ULL);
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);
+	val64 = SBL_PML_CFG_LLR_LLR_MODE_UPDATE(val64, 0ULL);  /* LLR OFF */
+	val64 = SBL_PML_CFG_LLR_PREAMBLE_SEQ_CHECK_UPDATE(val64, 1ULL);
+	val64 = SBL_PML_CFG_LLR_ACK_NACK_ERR_CHECK_UPDATE(val64, 1ULL);
+	val64 = SBL_PML_CFG_LLR_FILTER_LOSSLESS_WHEN_OFF_UPDATE(val64, 1ULL);
+	val64 = SBL_PML_CFG_LLR_FILTER_CTL_FRAMES_UPDATE(val64, 1ULL);
+	val64 = SBL_PML_CFG_LLR_SIZE_UPDATE(val64, 3ULL);
+	val64 = SBL_PML_CFG_LLR_ENABLE_LOOP_TIMING_UPDATE(val64, 0ULL);  /* loop timing off */
+	val64 = SBL_PML_CFG_LLR_LINK_DOWN_BEHAVIOR_UPDATE(val64,
+				 sbl_pml_llr_link_down_behaviour(sbl,
+								 port_num));
+	val64 = SBL_PML_CFG_LLR_MAC_IF_CREDITS_UPDATE(val64,
+						      SBL_PML_CFG_LLR_MAC_IF_CREDITS_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_OFFSET, val64);
+
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_CF_SMAC_OFFSET,
+		    SBL_PML_CFG_LLR_CF_SMAC_DFLT);
+
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_CF_ETYPE_OFFSET,
+		    SBL_PML_CFG_LLR_CF_ETYPE_DFLT);
+
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET,
+		    SBL_PML_CFG_LLR_SM_DFLT);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_CF_RATES_OFFSET);
+	val64 = SBL_PML_CFG_LLR_CF_RATES_LOOP_TIMING_PERIOD_UPDATE(val64, SBL_PML_LLR_TIMING_PERIOD);
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_CF_RATES_OFFSET, val64);
+
+	sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);  /* flush */
+}
+
+/* start */
+int sbl_pml_llr_start(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 llr_max_data;
+	u64 llr_max_seq;
+	u64 val64;
+	u64 recovery_timeout_ns;
+	int err = -1;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR start", port_num);
+
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_DISABLED);
+
+	sbl_pml_llr_enable_loop_timing(sbl, port_num);
+
+	/* get mode here */
+	err = sbl_pml_llr_mode_get(sbl, port_num, &(link->llr_mode));
+	if (err) {
+		sbl_dev_err(sbl->dev, "%d: LLR get mode failed [%d]", port_num, err);
+		goto out_err;
+	}
+
+	/* if LLR is OFF then nothing to do here */
+	if (link->llr_mode == SBL_LLR_MODE_OFF)
+		goto out;
+
+	/* set HPC if needed */
+	if (link->llr_options & SBL_PML_LLR_OPTION_HPC_WIH_LLR)
+		sbl_pml_mac_hpc_set(sbl, port_num);
+
+	/* start ordered sets */
+	sbl_pml_pcs_ordered_sets(sbl, port_num, true);
+
+	/* measure llr loop time if we don't have it already */
+	if (!link->llr_loop_time) {
+		err = sbl_pml_llr_measure_loop_time_ns(sbl, port_num, &link->llr_loop_time);
+		if (err) {
+			sbl_dev_err(sbl->dev, "%d: LLR loop measurement failed [%d]", port_num, err);
+			goto out_err;
+		}
+	}
+
+	/* set max replay time from loop-back time */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET);
+	if (link->blattr.options & SBL_DISABLE_PML_RECOVERY)
+		val64 = SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_UPDATE(val64, SBL_DFLT_REPLAY_CT_MAX);
+	else
+		val64 = SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_UPDATE(val64, SBL_LLR_REPLAY_CT_MAX_UNLIMITED);
+	val64 = SBL_PML_CFG_LLR_SM_REPLAY_TIMER_MAX_UPDATE(val64,
+							   3 * link->llr_loop_time + 500);
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET);  /* flush */
+
+	/* capacity configuration */
+	if (link->blattr.options & SBL_OPT_FABRIC_LINK) {
+		/* these can be set to their defaults for fabric links */
+		sbl_write64(sbl, base | SBL_PML_CFG_LLR_CAPACITY_OFFSET,
+			    SBL_PML_CFG_LLR_CAPACITY_DFLT);
+		sbl_read64(sbl, base | SBL_PML_CFG_LLR_CAPACITY_OFFSET);  /* flush */
+	} else {
+		sbl_pml_llr_calculate_capacity(sbl, port_num, &llr_max_data, &llr_max_seq);
+		val64 = SBL_PML_CFG_LLR_CAPACITY_MAX_DATA_SET(llr_max_data) |
+			SBL_PML_CFG_LLR_CAPACITY_MAX_SEQ_SET(llr_max_seq);
+		sbl_write64(sbl, base | SBL_PML_CFG_LLR_CAPACITY_OFFSET, val64);
+		sbl_read64(sbl, base | SBL_PML_CFG_LLR_CAPACITY_OFFSET);  /* flush */
+	}
+
+	/* set max data age timer & link down timer */
+	if (link->blattr.options & SBL_DISABLE_PML_RECOVERY)
+		sbl_write64(sbl, base | SBL_PML_CFG_LLR_TIMEOUTS_OFFSET,
+			    SBL_PML_CFG_LLR_TIMEOUTS_DFLT);
+	else {
+		recovery_timeout_ns = ((u64)link->blattr.pml_recovery.timeout +
+			SBL_PML_REC_LLR_TIMEOUT_OFFSET) * NSEC_PER_MSEC;
+		if (recovery_timeout_ns > U32_MAX) {
+			err = -ERANGE;
+			goto out_err;
+		}
+		val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_TIMEOUTS_OFFSET);
+		val64 = SBL_PML_CFG_LLR_TIMEOUTS_DATA_AGE_TIMER_MAX_UPDATE(val64,
+			recovery_timeout_ns);
+		val64 = SBL_PML_CFG_LLR_TIMEOUTS_PCS_LINK_DN_TIMER_MAX_UPDATE(val64,
+			recovery_timeout_ns);
+		sbl_write64(sbl, base | SBL_PML_CFG_LLR_TIMEOUTS_OFFSET, val64);
+	}
+	sbl_read64(sbl, base | SBL_PML_CFG_LLR_TIMEOUTS_OFFSET);  /* flush */
+
+	/* clear all the llr related error flags */
+	sbl_pml_err_flgs_clear(sbl, port_num, SBL_PML_ALL_LLR_ERR_FLGS);
+
+	/* set required mode */
+	sbl_pml_llr_mode_set(sbl, port_num, link->llr_mode);
+
+	/* wait for llr to start */
+	err = sbl_pml_llr_ready_wait(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "%d: LLR ready wait failed [%d]", port_num, err);
+		goto out_err;
+	}
+
+	/* success */
+	sbl_dev_dbg(sbl->dev, "%d: LLR running", port_num);
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_LLR_RUN);
+
+out:
+	sbl_pml_llr_disable_loop_timing(sbl, port_num);
+	return 0;
+
+out_err:
+	sbl_pml_llr_disable_loop_timing(sbl, port_num);
+	sbl_pml_llr_stop(sbl, port_num);
+	return err;
+}
+
+/**
+ * sbl_pml_llr_get_state() - Get pml llr state
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Return: state value
+ */
+u32 sbl_pml_llr_get_state(struct sbl_inst *sbl, int port_num)
+{
+	u32 base  = SBL_PML_BASE(port_num);
+	u64 val64 = sbl_read64(sbl, base | SBL_PML_STS_LLR_OFFSET);
+
+	switch (SBL_PML_STS_LLR_LLR_STATE_GET(val64)) {
+	case 0: /* OFF */
+		return SBL_PML_LLR_STATE_OFF;
+	case 1: /* INIT */
+		return SBL_PML_LLR_STATE_INIT;
+	case 2: /* ADVANCE */
+		return SBL_PML_LLR_STATE_ADVANCE;
+	case 3: /* HALT */
+		return SBL_PML_LLR_STATE_HALT;
+	case 4: /* REPLAY */
+		return SBL_PML_LLR_STATE_REPLAY;
+	case 5: /* DISCARD */
+		return SBL_PML_LLR_STATE_DISCARD;
+	case 6: /* MONITOR */
+		return SBL_PML_LLR_STATE_MONITOR;
+	default:
+		return SBL_PML_LLR_STATE_UNKNOWN;
+	}
+}
+EXPORT_SYMBOL(sbl_pml_llr_get_state);
+
+/**
+ * sbl_pml_llr_stop() - Stop pml llr functionality
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Configure various pml llr registers to stop functionality
+ */
+void sbl_pml_llr_stop(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR stop", port_num);
+
+	link->llr_mode = SBL_LLR_MODE_OFF;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);
+	val64 = SBL_PML_CFG_LLR_LLR_MODE_UPDATE(val64, 0LL);  /* LLR OFF */
+	val64 = SBL_PML_CFG_LLR_FILTER_LOSSLESS_WHEN_OFF_UPDATE(val64, 1ULL);
+	val64 = SBL_PML_CFG_LLR_FILTER_CTL_FRAMES_UPDATE(val64, 0ULL);
+	val64 = SBL_PML_CFG_LLR_ENABLE_LOOP_TIMING_UPDATE(val64, 0ULL);
+	val64 = SBL_PML_CFG_LLR_LINK_DOWN_BEHAVIOR_UPDATE(val64,
+				 sbl_pml_llr_link_down_behaviour(sbl,
+								 port_num));
+	val64 = SBL_PML_CFG_LLR_MAC_IF_CREDITS_UPDATE(val64,
+						      SBL_PML_CFG_LLR_MAC_IF_CREDITS_DFLT);
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);  /* flush */
+
+	sbl_pml_pcs_ordered_sets(sbl, port_num, false);
+
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_RUN);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_DISABLED);
+}
+EXPORT_SYMBOL(sbl_pml_llr_stop);
+
+/**
+ * sbl_pml_llr_disable() - Disable pml llr
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function disables the LLR feature by updating the LLR
+ * mode configuration register. Also updates the link info to reflect
+ * disabled state and clear active status.
+ */
+void sbl_pml_llr_disable(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR disable", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);
+	val64 = SBL_PML_CFG_LLR_LLR_MODE_UPDATE(val64, 0ULL); /* LLR OFF */
+	sbl_write64(sbl, base | SBL_PML_CFG_LLR_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);  /* flush */
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_LLR_DISABLED);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_RUN);
+}
+EXPORT_SYMBOL(sbl_pml_llr_disable);
+
+/**
+ * sbl_pml_llr_enable() - Enable pml llr
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Sets the LLR mode based on the link configuration to
+ * enable the LLR feature.
+ */
+void sbl_pml_llr_enable(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR enable", port_num);
+
+	sbl_pml_llr_mode_set(sbl, port_num, link->llr_mode);
+}
+EXPORT_SYMBOL(sbl_pml_llr_enable);
+
+/**
+ * sbl_pml_llr_check_is_ready() - check llr state
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @timeout_ms: Value
+ *
+ * Check matching LLR state in invervals, if state
+ * matches then return else sleep in intervals untill timeout.
+ *
+ * Context: Sleep in intervals based on condition
+ *
+ * Return: true on success
+ */
+bool sbl_pml_llr_check_is_ready(struct sbl_inst *sbl, int port_num, unsigned int timeout_ms)
+{
+	unsigned long to_jiffy = jiffies + msecs_to_jiffies(timeout_ms);
+
+	sbl_dev_dbg(sbl->dev, "%d: LLR check is ready", port_num);
+
+	do {
+		if (sbl_pml_llr_get_state(sbl, port_num) == SBL_PML_LLR_STATE_ADVANCE)
+			return true;
+		usleep_range(5000, 6000);
+	} while (time_before(jiffies, to_jiffy));
+
+	return false;
+}
+EXPORT_SYMBOL(sbl_pml_llr_check_is_ready);
+
+/* behaviour when the link is down
+ * TODO - revisit with cassini and/or faster restart
+ */
+u64 sbl_pml_llr_link_down_behaviour(struct sbl_inst *sbl,
+				    int port_num)
+{
+	if (sbl_is_fabric_link(sbl, port_num)) {
+		/*   fabric link should really be BLOCK, but only if the pcs
+		 *   can recover quickly. Currently it can't - pcs failure means
+		 *   going right back to tuning the serdes.
+		 */
+		return 0ULL;
+	}
+
+	return 0ULL;
+}
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml_llr_nic.c b/drivers/net/ethernet/hpe/sbl/sbl_pml_llr_nic.c
new file mode 100644
index 000000000000..d154a2f25c6e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_pml_llr_nic.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/sched.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_an.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_internal.h"
+
+int sbl_frame_size(struct sbl_inst *sbl, int port_num)
+{
+	u64 bytes_per_frame = 9216;
+
+	return bytes_per_frame;
+}
+
+void sbl_llr_max_data_get(struct sbl_inst *sbl, int port_num,
+			  u64 *cap_data_max, u64 *cap_seq_max)
+{
+	*cap_data_max = sbl_llr_edge_cap_data_max_get();
+	*cap_seq_max  = sbl_llr_edge_cap_seq_max_get();
+}
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml_mac.c b/drivers/net/ethernet/hpe/sbl/sbl_pml_mac.c
new file mode 100644
index 000000000000..782bfc26451e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_pml_mac.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2021 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/sched.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_internal.h"
+
+/* get mode */
+static void sbl_pml_mac_get_mode(struct sbl_inst *sbl, int port_num, u64 *ifg_mode, u64 *ifg_adjustment)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: MAC get mode", port_num);
+
+	/* start with what was requested */
+	link->ifg_config = link->blattr.ifg_config;
+
+	/* check BL options */
+	if (link->blattr.options & SBL_OPT_ENABLE_IFG_CONFIG) {
+		/* set using IFG config */
+		switch (link->ifg_config) {
+		case SBL_IFG_CONFIG_HPC:
+			*ifg_mode       = 0;
+			*ifg_adjustment = 3;
+			break;
+		case SBL_IFG_CONFIG_IEEE_200G:
+			*ifg_mode       = 1;
+			*ifg_adjustment = 0;
+			break;
+		case SBL_IFG_CONFIG_IEEE_100G:
+			*ifg_mode       = 1;
+			*ifg_adjustment = 1;
+			break;
+		case SBL_IFG_CONFIG_IEEE_50G:
+		default:
+			*ifg_mode       = 1;
+			*ifg_adjustment = 2;
+			break;
+		}
+	} else if (link->blattr.options & SBL_OPT_FABRIC_LINK) {
+		/* set fabric link */
+		*ifg_mode       = 0;
+		*ifg_adjustment = 3;
+	} else {
+		/* set ether link */
+		switch (link->link_mode) {
+		case SBL_LINK_MODE_BS_200G:
+			*ifg_mode       = 1;
+			*ifg_adjustment = 0;
+			break;
+		case SBL_LINK_MODE_BJ_100G:
+			*ifg_mode       = 1;
+			*ifg_adjustment = 1;
+			break;
+		case SBL_LINK_MODE_CD_100G:
+			*ifg_mode       = 1;
+			*ifg_adjustment = 1;
+			break;
+		case SBL_LINK_MODE_CD_50G:
+		default:
+			*ifg_mode       = 1;
+			*ifg_adjustment = 2;
+			break;
+		}
+	}
+}
+
+/* configure */
+int sbl_pml_mac_config(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 ifg_mode       = 0;
+	u64 ifg_adjustment = 0;
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: MAC config", port_num);
+
+	sbl_pml_mac_get_mode(sbl, port_num, &ifg_mode, &ifg_adjustment);
+
+	/* tx mac config */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET);
+	val64 = SBL_PML_CFG_TX_MAC_PCS_CREDITS_UPDATE(val64,
+						      SBL_PML_CFG_TX_MAC_PCS_CREDITS_DFLT);
+	val64 = SBL_PML_CFG_TX_MAC_IFG_MODE_UPDATE(val64, ifg_mode);
+	val64 = SBL_PML_CFG_TX_MAC_IEEE_IFG_ADJUSTMENT_UPDATE(val64, ifg_adjustment);
+	/* Short preamble is always 0 for now. See Rosetta ERRATA-2594 */
+	val64 = SBL_PML_CFG_TX_MAC_SHORT_PREAMBLE_UPDATE(val64, 0ULL);
+	val64 = SBL_PML_CFG_TX_MAC_MAC_OPERATIONAL_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET);  /* flush */
+
+	/* rx mac config */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET);
+	val64 = SBL_PML_CFG_RX_MAC_SHORT_PREAMBLE_UPDATE(val64, 0ULL);
+	val64 = SBL_PML_CFG_RX_MAC_FILTER_ILLEGAL_SIZE_UPDATE(val64, 1ULL);
+	val64 = SBL_PML_CFG_RX_MAC_MAC_OPERATIONAL_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET);  /* flush */
+
+	return 0;
+}
+
+/**
+ * sbl_pml_mac_start() - Start mac
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Configure various MAC registers to start tx/rx mac
+ * and clear if any errors
+ */
+void sbl_pml_mac_start(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: MAC start", port_num);
+
+	/* tx mac start */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET);
+	val64 = SBL_PML_CFG_TX_MAC_MAC_OPERATIONAL_UPDATE(val64, 1ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET);  /* flush */
+
+	/* rx mac start */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET);
+	val64 = SBL_PML_CFG_RX_MAC_MAC_OPERATIONAL_UPDATE(val64, 1ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET);  /* flush */
+
+	/* clear any errors */
+	val64 = SBL_PML_ERR_FLG_MAC_TX_DP_ERR_SET(1ULL) |
+		SBL_PML_ERR_FLG_MAC_RX_DP_ERR_SET(1ULL);
+	sbl_write64(sbl, base | SBL_PML_ERR_CLR_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_ERR_CLR_OFFSET);  /* flush */
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_MAC_OP);
+
+}
+EXPORT_SYMBOL(sbl_pml_mac_start);
+
+/**
+ * sbl_pml_mac_stop() - Stop mac
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Configure various MAC registers to off tx/rx mac
+ */
+void sbl_pml_mac_stop(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: MAC stop", port_num);
+
+	/* rx mac off */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET);
+	val64 = SBL_PML_CFG_RX_MAC_MAC_OPERATIONAL_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET);  /* flush */
+
+	/* tx mac off */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET);
+	val64 = SBL_PML_CFG_TX_MAC_MAC_OPERATIONAL_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET);  /* flush */
+
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_MAC_OP);
+}
+EXPORT_SYMBOL(sbl_pml_mac_stop);
+
+/* get the current hw status */
+void sbl_pml_mac_hw_status(struct sbl_inst *sbl, int port_num, bool *tx_op, bool *rx_op,
+			   u32 *ifg_mode, u32 *ifg_adjustment)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: MAC status", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_TX_MAC_OFFSET);
+	if (tx_op)
+		*tx_op = SBL_PML_CFG_TX_MAC_MAC_OPERATIONAL_GET(val64);
+	if (ifg_mode)
+		*ifg_mode = SBL_PML_CFG_TX_MAC_IFG_MODE_GET(val64);
+	if (ifg_adjustment)
+		*ifg_adjustment = SBL_PML_CFG_TX_MAC_IEEE_IFG_ADJUSTMENT_GET(val64);
+	if (rx_op) {
+		val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_MAC_OFFSET);
+		*rx_op = SBL_PML_CFG_RX_MAC_MAC_OPERATIONAL_GET(val64);
+	}
+}
+
+/* HPC IFG set */
+void sbl_pml_mac_hpc_set(struct sbl_inst *sbl, int port_num)
+{
+	u32 base  = SBL_PML_BASE(port_num);
+	u64 val64 = 0;
+
+	sbl_dev_dbg(sbl->dev, "%d: MAC HPC set", port_num);
+
+	val64 = sbl_read64(sbl, (base | SBL_PML_CFG_TX_MAC_OFFSET));
+	val64 = SBL_PML_CFG_TX_MAC_IFG_MODE_UPDATE(val64, 0ULL); /* HPC */
+	val64 = SBL_PML_CFG_TX_MAC_IEEE_IFG_ADJUSTMENT_UPDATE(val64, 3ULL); /* no adjustment */
+	sbl_write64(sbl, (base | SBL_PML_CFG_TX_MAC_OFFSET), val64);
+	sbl_read64(sbl, (base | SBL_PML_CFG_TX_MAC_OFFSET));  /* flush */
+}
+
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml_pcs.c b/drivers/net/ethernet/hpe/sbl/sbl_pml_pcs.c
new file mode 100644
index 000000000000..81484e177394
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_pml_pcs.c
@@ -0,0 +1,1085 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019,2022-2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/sched.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_serdes_map.h"
+#include "sbl_internal.h"
+#include "sbl_serdes_fn.h"
+
+/* Function to find the lanes that data will be arriving on and
+ * setup the correct active lanes to align and active fec lanes.
+ */
+static int sbl_pml_pcs_determine_active_lanes(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct serdes_info *serdes =  sbl->switch_info->ports[port_num].serdes;
+	int i;
+
+	sbl_dev_dbg(sbl->dev, "%d: pcs config lanes", port_num);
+
+	switch (link->link_mode) {
+	case SBL_LINK_MODE_BS_200G:
+		/* 4 lanes of 50Gbps - 8 internal 25Gbps fec lanes
+		 * setup directly
+		 */
+		link->active_rx_lanes  = 0xf;    /* all */
+		link->active_fec_lanes = 0xff;   /* all */
+		break;
+	case SBL_LINK_MODE_BJ_100G:
+		/* 4 lanes of 25Gbps - 4 internal 25Gbps lanes
+		 * setup directly
+		 */
+		link->active_rx_lanes  = 0xf;    /* all */
+		link->active_fec_lanes = 0xf;    /* special case */
+		break;
+	case SBL_LINK_MODE_CD_100G:
+		/* 2 lanes of 50Gbps - 4 internal 25Gbps lanes
+		 * locate incoming lanes 0 and 1
+		 */
+		link->active_rx_lanes  = 0;
+		link->active_fec_lanes = 0;
+		if (link->loopback_mode == SBL_LOOPBACK_MODE_LOCAL) {
+			/* we will receive on the tx lanes we went out on */
+			for (i = 0; i < SBL_SERDES_LANES_PER_PORT; ++i) {
+				if (serdes[i].tx_lane_source < 2) {
+					link->active_rx_lanes  |= 0x1 << i;
+					link->active_fec_lanes |= 0x3 << 2 * i;
+				}
+			}
+		} else {
+			/* we will receive on the rx lanes */
+			for (i = 0; i < SBL_SERDES_LANES_PER_PORT; ++i) {
+				if (serdes[i].rx_lane_source < 2) {
+					link->active_rx_lanes  |= 0x1 << i;
+					link->active_fec_lanes |= 0x3 << 2 * i;
+				}
+			}
+		}
+		break;
+	case SBL_LINK_MODE_CD_50G:
+		/* 1 lanes of 50Gbps - 2 internal 25Gbps lanes
+		 * locate incoming lane 0
+		 */
+		if (link->loopback_mode == SBL_LOOPBACK_MODE_LOCAL) {
+			/* we will receive on the lane 0 we went out on */
+			for (i = 0; i < SBL_SERDES_LANES_PER_PORT; ++i) {
+				if (serdes[i].tx_lane_source == 0) {
+					link->active_rx_lanes  = 0x1 << i;
+					link->active_fec_lanes = 0x3 << 2 * i;
+					break;
+				}
+			}
+		} else {
+			/* we will receive on the rx lane */
+			for (i = 0; i < SBL_SERDES_LANES_PER_PORT; ++i) {
+				if (serdes[i].rx_lane_source == 0) {
+					link->active_rx_lanes  = 0x1 << i;
+					link->active_fec_lanes = 0x3 << 2 * i;
+				}
+			}
+		}
+		break;
+	default:
+		sbl_dev_err(sbl->dev, "%d: pcs bad link_mode (%d)", port_num, link->link_mode);
+		return -EBADRQC;
+	}
+
+	return 0;
+}
+
+/* helper state functions */
+static bool sbl_pml_pcs_locked(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	struct sbl_link *link = sbl->link + port_num;
+	u64 locked_lanes;
+	u64 val64;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_OFFSET);
+	locked_lanes = SBL_PML_STS_RX_PCS_AM_LOCK_GET(val64);
+
+	return (locked_lanes == link->active_fec_lanes);
+}
+
+static void sbl_pml_pcs_start_lock(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: pml bring-up start am lock\n", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+	val64 = SBL_PML_CFG_RX_PCS_ENABLE_LOCK_UPDATE(val64, 1ULL);
+	val64 = SBL_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(val64, link->active_rx_lanes);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+}
+
+static void sbl_pml_pcs_stop_lock(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: pml bring-up stop am lock\n", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+	val64 = SBL_PML_CFG_RX_PCS_ENABLE_LOCK_UPDATE(val64, 0ULL);
+	val64 = SBL_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+}
+
+/* wait for the pcs to become aligned */
+static int sbl_pml_pcs_alignment_wait(struct sbl_inst *sbl, int port_num)
+{
+	unsigned long start_jiffy;
+	int elapsed;
+	int err = 0;
+
+	sbl_dev_dbg(sbl->dev, "%d: pml pcs alignment wait\n", port_num);
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_PCS_A_WAIT);
+
+	 /*   poll for all lanes to get bitlock
+	  *
+	  *   This might be a very long time as the other end obviously needs to
+	  *   be coming up at the same time. So start eagerly checking and then back off.
+	  *
+	  *   If we are getting a high serdes error rate or bad eyes then we can never
+	  *   meaningfully lock so bail with an error and the serdes will be retuned.
+	  *
+	  *   Occasionally the pcs seems to get stuck and some lanes never come up.
+	  *   Restarting locking seems to clear this.
+	  */
+restart:
+	start_jiffy = jiffies;
+	while (!sbl_pml_pcs_locked(sbl, port_num)) {
+
+		if (sbl_start_timeout(sbl, port_num)) {
+			sbl_dev_dbg(sbl->dev, "%d: pcs lock wait timeout\n",
+				    port_num);
+			err = -ETIMEDOUT;
+			goto out;
+		}
+
+		if (sbl_base_link_start_cancelled(sbl, port_num)) {
+			sbl_dev_dbg(sbl->dev, "%d: pcs lock wait cancelled\n",
+				    port_num);
+			err = -ECANCELED;
+			goto out;
+		}
+
+		elapsed = jiffies_to_msecs(jiffies - start_jiffy);
+		if (elapsed > 1000) {
+
+			/* if we have a high serdes error, we will never align  */
+			if (sbl_pml_pcs_high_serdes_error(sbl, port_num)) {
+				sbl_dev_warn(sbl->dev, "%d: pcs lock high serdes error detected\n", port_num);
+				err = -EADV;
+				goto out;
+			}
+
+			/* Ensure the serdes is still good (eyes stay open)  */
+			err = sbl_port_check_eyes(sbl, port_num);
+			if (err) {
+				sbl_dev_warn(sbl->dev, "%d: pcs lock some eyes have gone bad", port_num);
+				goto out;
+			}
+
+			/* restart locking in case it's locked up */
+			sbl_pml_pcs_stop_lock(sbl, port_num);
+			sbl_pml_pcs_start_lock(sbl, port_num);
+
+			msleep(SBL_PML_PCS_ALIGN_SLOW_POLL_DELAY);
+		} else if (elapsed > 50)
+			msleep(100);
+		else
+			usleep_range(10000, 11000);
+	}
+
+	/* poll for lane alignment */
+	start_jiffy = jiffies;
+
+	while (!sbl_pml_pcs_aligned(sbl, port_num)) {
+
+		if (sbl_start_timeout(sbl, port_num)) {
+			sbl_dev_dbg(sbl->dev, "%d: pcs align wait timeout\n",
+				    port_num);
+			err = -ETIMEDOUT;
+			goto out;
+		}
+
+		if (sbl_base_link_start_cancelled(sbl, port_num)) {
+			sbl_dev_dbg(sbl->dev, "%d: pcs align wait cancelled\n",
+				    port_num);
+			err = -ECANCELED;
+			goto out;
+		}
+
+		/* if we lose lock restart trying to lock again  */
+		if (!sbl_pml_pcs_locked(sbl, port_num)) {
+			sbl_dev_warn(sbl->dev, "%d: pcs align - lost lock\n", port_num);
+			goto restart;
+		}
+
+		elapsed = jiffies_to_msecs(jiffies - start_jiffy);
+		if (elapsed > SBL_PML_PCS_ALIGN_TIMEOUT) {
+
+			/* we should have got alignment by now
+			 * give up, restart locking and try again
+			 */
+			sbl_pml_pcs_stop_lock(sbl, port_num);
+			sbl_pml_pcs_start_lock(sbl, port_num);
+			goto restart;
+		} else if (elapsed > 50)
+			msleep(100);
+		else
+			usleep_range(10000, 11000);
+	}
+
+out:
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_A_WAIT);
+
+	return err;
+}
+
+static bool sbl_pml_pcs_no_faults(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 faults;
+	u64 val64;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_OFFSET);
+	faults = SBL_PML_STS_RX_PCS_FAULT_GET(val64) | SBL_PML_STS_RX_PCS_LOCAL_FAULT_GET(val64);
+
+	return (faults == 0ULL);
+}
+
+/* wait for pcs faults to clear
+ *
+ * we wait for fault to stay clear as it is momentarily set sometimes
+ */
+static int sbl_pml_pcs_fault_clear_wait(struct sbl_inst *sbl, int port_num)
+{
+	unsigned long start_jiffy = jiffies;
+	int no_fault_count = 0;
+	int elapsed;
+	int err;
+
+	sbl_dev_dbg(sbl->dev, "%d: pml pcs fault clear wait\n", port_num);
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_PCS_F_WAIT);
+
+	while (true) {
+
+		/* check for timeout */
+		if (sbl_start_timeout(sbl, port_num)) {
+			sbl_dev_dbg(sbl->dev, "%d: pml fault clear wait timeout\n",
+				    port_num);
+			err = -ETIMEDOUT;
+			goto out;
+		}
+
+		if (sbl_base_link_start_cancelled(sbl, port_num)) {
+			sbl_dev_dbg(sbl->dev, "%d: pml fault clear wait cancelled\n",
+				    port_num);
+			err = -ECANCELED;
+			goto out;
+		}
+
+		/* check we are still aligned */
+		if (!sbl_pml_pcs_aligned(sbl, port_num)) {
+			sbl_dev_dbg(sbl->dev, "%d: pml fault clear wait lost alignment\n",
+				    port_num);
+			err = -ENOLCK;
+			goto out;
+		}
+
+		/* check for no fault
+		 * we need multiple good tests to be sure it is up
+		 */
+		if (sbl_pml_pcs_no_faults(sbl, port_num)) {
+			++no_fault_count;
+			if (no_fault_count == SBL_PML_REQUIRED_NO_FAULT_COUNT) {
+				/* done */
+				err = 0;
+				goto out;
+			} else {
+				/* poll fast and check again */
+				start_jiffy = jiffies;
+			}
+		} else
+			no_fault_count = 0;
+
+		/* wait with backoff */
+		elapsed = jiffies_to_msecs(jiffies - start_jiffy);
+		if (elapsed > 5000)
+			msleep(1000);
+		else if (elapsed > 100)
+			msleep(100);
+		else
+			usleep_range(10000, 11000);
+	}
+
+out:
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_F_WAIT);
+
+	return err;
+}
+
+/* PCS configuration */
+static int sbl_pml_pcs_config(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	int err;
+	u64 en_lane_degrade_reg;
+
+	sbl_dev_dbg(sbl->dev, "%d: pcs config", port_num);
+
+	/* work out all the lane config and store in link db */
+	err = sbl_pml_pcs_determine_active_lanes(sbl, port_num);
+	if (err) {
+		sbl_dev_dbg(sbl->dev, "%d: pcs config lanes failed [%d]", port_num, err);
+		return err;
+	}
+
+	/* pcs must be off for setting  */
+	sbl_pml_pcs_stop(sbl, port_num);
+
+	/* clear out the previous active lanes and disable lock */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+	val64 = SBL_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(val64, 0ULL);
+	val64 = SBL_PML_CFG_RX_PCS_ENABLE_LOCK_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+
+	/* rapid alignment is broken so disable */
+	val64 = sbl_read64(sbl, base | SBL_PML_DBG_PCS_OFFSET);
+	val64 = SBL_PML_DBG_PCS_ENABLE_RAPID_ALIGNMENT_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_DBG_PCS_OFFSET, val64);
+
+	/* pcs config */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	switch (link->link_mode) {
+	case SBL_LINK_MODE_BS_200G:
+		val64 = SBL_PML_CFG_PCS_PCS_MODE_UPDATE(val64, 0ULL);
+		break;
+	case SBL_LINK_MODE_BJ_100G:
+		val64 = SBL_PML_CFG_PCS_PCS_MODE_UPDATE(val64, 1ULL);
+		break;
+	case SBL_LINK_MODE_CD_100G:
+		val64 = SBL_PML_CFG_PCS_PCS_MODE_UPDATE(val64, 2ULL);
+		break;
+	case SBL_LINK_MODE_CD_50G:
+		val64 = SBL_PML_CFG_PCS_PCS_MODE_UPDATE(val64, 3ULL);
+		break;
+	default:
+		sbl_dev_dbg(sbl->dev, "%d: pcs link mode invalid (%d)", port_num, link->link_mode);
+		return -EBADRQC;
+	}
+	val64 = SBL_PML_CFG_PCS_ENABLE_AUTO_NEG_UPDATE(val64, 0ULL);
+	if ((link->blattr.options & SBL_OPT_LANE_DEGRADE) &&
+	    (link->link_mode == SBL_LINK_MODE_BS_200G))
+		val64 = SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_UPDATE(val64, 1ULL);
+	else
+		val64 = SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_UPDATE(val64, 0ULL);
+
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_OFFSET, val64);
+
+	/* pcs tx  */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_TX_PCS_OFFSET);
+	val64 = SBL_PML_CFG_TX_PCS_ENABLE_CTL_OS_UPDATE(val64, 0ULL);
+	val64 = SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL_UPDATE(val64,
+							  SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL_DFLT);
+	val64 = SBL_PML_CFG_TX_PCS_GEARBOX_CREDITS_UPDATE(val64,
+							  SBL_PML_CFG_TX_PCS_GEARBOX_CREDITS_DFLT);
+	val64 = SBL_PML_CFG_TX_PCS_LANE_0_SOURCE_UPDATE(val64,
+		 sbl->switch_info->ports[port_num].serdes[0].tx_lane_source);
+	val64 = SBL_PML_CFG_TX_PCS_LANE_1_SOURCE_UPDATE(val64,
+		 sbl->switch_info->ports[port_num].serdes[1].tx_lane_source);
+	val64 = SBL_PML_CFG_TX_PCS_LANE_2_SOURCE_UPDATE(val64,
+		 sbl->switch_info->ports[port_num].serdes[2].tx_lane_source);
+	val64 = SBL_PML_CFG_TX_PCS_LANE_3_SOURCE_UPDATE(val64,
+		 sbl->switch_info->ports[port_num].serdes[3].tx_lane_source);
+	sbl_write64(sbl, base | SBL_PML_CFG_TX_PCS_OFFSET, val64);
+
+	/* pcs rx */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+	switch (link->blattr.fec_mode) {
+	case SBL_RS_MODE_OFF:
+		val64 = SBL_PML_CFG_RX_PCS_RS_MODE_UPDATE(val64, 0ULL);
+		break;
+	case SBL_RS_MODE_OFF_SYN:
+		val64 = SBL_PML_CFG_RX_PCS_RS_MODE_UPDATE(val64, 1ULL);
+		break;
+	case SBL_RS_MODE_OFF_CHK:
+		val64 = SBL_PML_CFG_RX_PCS_RS_MODE_UPDATE(val64, 2ULL);
+		break;
+	case SBL_RS_MODE_ON_SYN_MRK:
+		val64 = SBL_PML_CFG_RX_PCS_RS_MODE_UPDATE(val64, 3ULL);
+		break;
+	case SBL_RS_MODE_ON_CHK_SYN_MRK:
+		val64 = SBL_PML_CFG_RX_PCS_RS_MODE_UPDATE(val64, 4ULL);
+		break;
+	case SBL_RS_MODE_ON:
+		val64 = SBL_PML_CFG_RX_PCS_RS_MODE_UPDATE(val64, 5ULL);
+		break;
+	default:
+		sbl_dev_dbg(sbl->dev, "%d: pcs fec mode invalid (%d)", port_num, link->blattr.fec_mode);
+		return -EBADRQC;
+	}
+	val64 = SBL_PML_CFG_RX_PCS_ENABLE_CTL_OS_UPDATE(val64, 0ULL);                   /* ordered sets off */
+	val64 = SBL_PML_CFG_RX_PCS_HEALTH_BAD_SENSITIVITY_UPDATE(val64, 4ULL);          /* less sensitive */
+	val64 = SBL_PML_CFG_RX_PCS_ENABLE_RX_SM_UPDATE(val64,                           /* state machine */
+			(link->blattr.options & SBL_OPT_FABRIC_LINK) ? 0ULL : 1ULL);
+	en_lane_degrade_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	/* If we disable the following CSR, Auto Lane Degrade is enabled and
+	 * there is a concern regarding handling of short burst errors
+	 */
+	if (SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_GET(en_lane_degrade_reg))
+		val64 = SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(val64, 0ULL);     /* restart on 3 bad RS codewords - 0 with autodegrade enabled */
+	else
+		val64 = SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(val64, 1ULL);     /* restart on 3 bad RS codewords - 1 with autodegrade disabled */
+	val64 = SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_UPDATE(val64,                /* restart on 5 bad AMs */
+			(link->link_mode == SBL_LINK_MODE_BS_200G) ? 1ULL : 0ULL);
+	val64 = SBL_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(val64, link->active_rx_lanes);
+	val64 = SBL_PML_CFG_RX_PCS_ENABLE_LOCK_UPDATE(val64, 0ULL);                     /* pcs disable lock  (really enable alignment process) */
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, val64);
+
+	link->pcs_config = true;
+
+	return 0;
+}
+
+/* Enables auto lane degrading in the hardware.
+ *
+ * This function can also be called if the AM_LOCK is observed on some lanes
+ * but not all and the timeout has expired. This will allow auto lane degrade
+ * feature to be used when not all lanes are available at the initial link
+ * bringup.
+ */
+void sbl_pml_pcs_enable_auto_lane_degrade(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64, en_lane_degrade_reg;
+	unsigned long timeout;
+	int err = 0;
+
+	en_lane_degrade_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	if (SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_GET(en_lane_degrade_reg)) {
+		timeout = jiffies + usecs_to_jiffies(HM_TIMEOUT);
+		while (!sbl_pml_rx_pls_available(sbl, port_num)) {
+			if (time_after(jiffies, timeout)) {
+				sbl_dev_dbg(sbl->dev, "%d: timeout for rx pls available\n", port_num);
+				err = -ETIMEDOUT;
+				goto out;
+			}
+		}
+		timeout = jiffies + usecs_to_jiffies(HM_TIMEOUT);
+		while (!sbl_pml_lp_pls_available(sbl, port_num)) {
+			if (time_after(jiffies, timeout)) {
+				sbl_dev_dbg(sbl->dev, "%d: timeout for lp pls available\n", port_num);
+				err = -ETIMEDOUT;
+				goto out;
+			}
+		}
+
+		val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+		val64 = SBL_PML_CFG_RX_PCS_ALLOW_AUTO_DEGRADE_UPDATE(val64, 1ULL);
+		sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, val64);
+
+		val64 = sbl_read64(sbl, base | SBL_PML_CFG_TX_PCS_OFFSET);
+		val64 = SBL_PML_CFG_TX_PCS_ALLOW_AUTO_DEGRADE_UPDATE(val64, 1ULL);
+		sbl_write64(sbl, base | SBL_PML_CFG_TX_PCS_OFFSET, val64);
+		sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET); /* flush */
+		sbl_dev_dbg(sbl->dev, "auto lane degrade is enabled");
+	}
+out:
+	if (err) {
+		sbl_dev_err(sbl->dev, "%d: auto lane degrade is not enabled", port_num);
+		en_lane_degrade_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+		en_lane_degrade_reg = SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_UPDATE(en_lane_degrade_reg, 0ULL);
+		sbl_write64(sbl, base | SBL_PML_CFG_PCS_OFFSET, en_lane_degrade_reg);
+
+		val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+		val64 = SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(val64, 1ULL);
+		sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, val64);
+		sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET); /* flush */
+		sbl_dev_dbg(sbl->dev, "Restart lock on bad CWS set back to 1 since couldn't enable ALD\n");
+	}
+}
+
+bool sbl_pml_rx_pls_available(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	u64 sts_pcs_lane_degrade_reg;
+
+	sts_pcs_lane_degrade_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_LANE_DEGRADE_OFFSET);
+	val64 = SBL_PML_STS_PCS_LANE_DEGRADE_RX_PLS_AVAILABLE_GET(sts_pcs_lane_degrade_reg);
+
+	return (val64 == MAX_PLS_AVAILABLE);
+}
+
+bool sbl_pml_lp_pls_available(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	u64 sts_pcs_lane_degrade_reg;
+
+	sts_pcs_lane_degrade_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_LANE_DEGRADE_OFFSET);
+	val64 = SBL_PML_STS_PCS_LANE_DEGRADE_LP_PLS_AVAILABLE_GET(sts_pcs_lane_degrade_reg);
+
+	return (val64 == MAX_PLS_AVAILABLE);
+}
+
+/* PCS start-up */
+void sbl_pml_pcs_start(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	u32 val32;
+
+	sbl_dev_dbg(sbl->dev, "%d: pcs start", port_num);
+
+	/* we need updated AMs for 200GHz mode */
+	val32 = SBL_PML_CFG_PCS_AMS_DFLT;
+	if (link->link_mode == SBL_LINK_MODE_BS_200G)
+		val32 = SBL_PML_CFG_PCS_AMS_USE_PROGRAMMABLE_AMS_UPDATE(
+				val32, 1ULL);
+	else
+		val32 = SBL_PML_CFG_PCS_AMS_USE_PROGRAMMABLE_AMS_UPDATE(
+				val32, 0ULL);
+	sbl_write32(sbl, base | SBL_PML_CFG_PCS_AMS_OFFSET, val32);
+
+	/* start pcs */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	val64 = SBL_PML_CFG_PCS_PCS_ENABLE_UPDATE(val64, 1ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET); /* flush */
+
+	/* record if we are trying to align */
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+	if (SBL_PML_CFG_RX_PCS_ENABLE_LOCK_GET(val64))
+		sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_PCS_ALIGN_EN);
+	else
+		sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_ALIGN_EN);
+}
+
+void sbl_pml_pcs_enable_alignment(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: pcs enable alignment", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+	val64 = SBL_PML_CFG_RX_PCS_ENABLE_LOCK_UPDATE(val64, 1ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, val64);
+
+	/* alignment process is underway */
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_PCS_ALIGN_EN);
+}
+
+void sbl_pml_pcs_disable_alignment(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: pcs disable alignment", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+	val64 = SBL_PML_CFG_RX_PCS_ENABLE_LOCK_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, val64);
+
+	/* alignment process is stopped */
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_ALIGN_EN);
+}
+
+/* remote fault.
+ *
+ * there is a debug reg we can use to send remote fault to our link partner
+ */
+void sbl_pml_pcs_set_tx_rf(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: pcs set tx rf", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_DBG_PCS_OFFSET);
+	val64 = SBL_PML_DBG_PCS_FORCE_TX_DATA_UPDATE(val64, 1ULL);
+	val64 = SBL_PML_DBG_PCS_FORCE_TX_DATA_RF_UPDATE(val64, 1ULL);
+	sbl_write64(sbl, base | SBL_PML_DBG_PCS_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_DBG_PCS_OFFSET);
+
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_PCS_TX_RF);
+}
+
+void sbl_pml_pcs_clear_tx_rf(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	sbl_dev_dbg(sbl->dev, "%d: pcs clear tx rf", port_num);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_DBG_PCS_OFFSET);
+	val64 = SBL_PML_DBG_PCS_FORCE_TX_DATA_UPDATE(val64, 0ULL);
+	val64 = SBL_PML_DBG_PCS_FORCE_TX_DATA_RF_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_DBG_PCS_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_DBG_PCS_OFFSET);
+
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_TX_RF);
+}
+
+/*   wait for the pcs to come up
+ *
+ *   i.e for it to be locked and aligned and faults to have cleared
+ *
+ *
+ */
+int sbl_pml_pcs_wait(struct sbl_inst *sbl, int port_num)
+{
+	char pcs_state_str[SBL_PCS_STATE_STR_LEN];
+	int err;
+
+	sbl_dev_dbg(sbl->dev, "%d: pcs wait", port_num);
+
+	/* start locking */
+	sbl_pml_pcs_start_lock(sbl, port_num);
+
+	/* clear forcing remote fault.
+	 * (it will continue to be set until PCS is actually ready)
+	 */
+	sbl_pml_pcs_clear_tx_rf(sbl, port_num);
+
+	/* keep trying to bring the pcs up until we timeout */
+	while (true) {
+
+		/* wait for alignment */
+		err = sbl_pml_pcs_alignment_wait(sbl, port_num);
+		switch (err) {
+		case 0:
+			break;
+
+		case -ETIMEDOUT:
+			/* out of time, dump state and give up  */
+			sbl_dev_err(sbl->dev, "%d: pcs_wait alignment timeout (%s)\n", port_num,
+				    sbl_pml_pcs_state_str(sbl, port_num, pcs_state_str,
+							  SBL_PCS_STATE_STR_LEN));
+			goto out;
+
+		case -ECANCELED:
+			sbl_dev_dbg(sbl->dev, "%d: pcs_wait alignment failed [%d]\n", port_num, err);
+			goto out;
+
+		default:
+			/* something unexpected */
+			sbl_dev_err(sbl->dev, "%d: pcs_wait alignment failed [%d]\n", port_num, err);
+			goto out;
+		}
+
+		/* wait for faults to clear */
+		err = sbl_pml_pcs_fault_clear_wait(sbl, port_num);
+		switch (err) {
+
+		case 0:
+			goto out;
+
+		case -ENOLCK:
+			/* alignment lost - try to align again  */
+			sbl_dev_warn(sbl->dev, "%d: pcs_wait alignment lost - restart (%s)\n", port_num,
+				     sbl_pml_pcs_state_str(sbl, port_num, pcs_state_str,
+							   SBL_PCS_STATE_STR_LEN));
+			continue;
+
+		case -ETIMEDOUT:
+			sbl_dev_err(sbl->dev, "%d: pcs_wait fault clear timeout (%s)\n", port_num,
+				    sbl_pml_pcs_state_str(sbl, port_num, pcs_state_str,
+							  SBL_PCS_STATE_STR_LEN));
+			goto out;
+
+		case -ECANCELED:
+			sbl_dev_dbg(sbl->dev, "%d: pcs_wait fault clear cancelled\n", port_num);
+			goto out;
+
+		default:
+			/* something unexpected */
+			sbl_dev_err(sbl->dev, "%d: pcs_wait fault clear failed [%d]\n", port_num, err);
+			goto out;
+		}
+	}
+
+out:
+	/* drop all stage info */
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_ALIGN_EN);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_A_WAIT);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_F_WAIT);
+
+	if (err)
+		return err;
+
+	/* clear all the PCS related error flags */
+	sbl_pml_err_flgs_clear(sbl, port_num, SBL_PML_ALL_PCS_ERR_FLGS);
+
+	/* note pcs is up */
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_TX_AM);
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_PCS_UP);
+
+	return 0;
+}
+
+char *sbl_pml_pcs_state_str(struct sbl_inst *sbl, int port_num, char *buf, int len)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	if (!buf || !len)
+		return "";
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_OFFSET);
+	snprintf(buf, len, "lk %llx/%.2x, a%lld f%lld lf%lld hs%lld",
+		 SBL_PML_STS_RX_PCS_AM_LOCK_GET(val64),
+			link->active_fec_lanes,
+			SBL_PML_STS_RX_PCS_ALIGN_STATUS_GET(val64),
+			SBL_PML_STS_RX_PCS_FAULT_GET(val64),
+			SBL_PML_STS_RX_PCS_LOCAL_FAULT_GET(val64),
+			SBL_PML_STS_RX_PCS_HI_SER_GET(val64));
+	return buf;
+}
+
+/**
+ * sbl_pml_pcs_recovery_enable() - Enable PCS recovery
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Context: Process context, Acquires lock and release
+ * pcs_recovery_lock <spin_lock>
+ */
+void sbl_pml_pcs_recovery_enable(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+
+	link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: PCS recovery enable", port_num);
+
+	spin_lock(&link->pcs_recovery_lock);
+	link->pcs_recovery_flag = true;
+	spin_unlock(&link->pcs_recovery_lock);
+}
+EXPORT_SYMBOL(sbl_pml_pcs_recovery_enable);
+
+/**
+ * sbl_pml_pcs_recovery_disable() - Disable PCS recovery
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Context: Process context, Acquires lock and release
+ * pcs_recovery_lock <spin_lock>
+ */
+void sbl_pml_pcs_recovery_disable(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+
+	link = sbl->link + port_num;
+
+	sbl_dev_dbg(sbl->dev, "%d: PCS recovery disable", port_num);
+
+	spin_lock(&link->pcs_recovery_lock);
+	link->pcs_recovery_flag = false;
+	spin_unlock(&link->pcs_recovery_lock);
+}
+EXPORT_SYMBOL(sbl_pml_pcs_recovery_disable);
+
+/**
+ * sbl_pml_pcs_aligned() - Check pcs align status
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Return: status of pcs align
+ */
+bool sbl_pml_pcs_aligned(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_OFFSET);
+
+	return (SBL_PML_STS_RX_PCS_ALIGN_STATUS_GET(val64) == 1);
+}
+EXPORT_SYMBOL(sbl_pml_pcs_aligned);
+
+bool sbl_pml_pcs_high_serdes_error(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_OFFSET);
+	return SBL_PML_STS_RX_PCS_HI_SER_GET(val64);
+}
+
+bool sbl_pml_pcs_up(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	if (!sbl->is_hw)
+		return true;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_OFFSET);
+
+	return SBL_PML_STS_RX_PCS_ALIGN_STATUS_GET(val64) &&
+			!SBL_PML_STS_RX_PCS_FAULT_GET(val64) &&
+			!SBL_PML_STS_RX_PCS_LOCAL_FAULT_GET(val64) &&
+			!SBL_PML_STS_RX_PCS_HI_SER_GET(val64);
+}
+
+bool sbl_pml_recovery_no_faults(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	struct sbl_link *link = sbl->link + port_num;
+	u64 val64;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_OFFSET);
+
+	sbl_dev_dbg(sbl->dev, "%d:sbl_pml_recovery fault info val=0x%llx aml=0x%llx fecl:0x%x",
+		    port_num, val64, SBL_PML_STS_RX_PCS_AM_LOCK_GET(val64), link->active_fec_lanes);
+
+	return SBL_PML_STS_RX_PCS_ALIGN_STATUS_GET(val64) &&
+			!SBL_PML_STS_RX_PCS_FAULT_GET(val64) &&
+			!SBL_PML_STS_RX_PCS_LOCAL_FAULT_GET(val64) &&
+			!SBL_PML_STS_RX_PCS_HI_SER_GET(val64) &&
+			(SBL_PML_STS_RX_PCS_AM_LOCK_GET(val64) == link->active_fec_lanes);
+}
+
+void sbl_pml_recovery_log_pcs_status(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_DESKEW_DEPTHS_OFFSET);
+	sbl_dev_info(sbl->dev, "%d: SBL_PML_STS_RX_PCS_DESKEW_DEPTHS_OFFSET = 0x%llx",
+		     port_num, val64);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_AM_MATCH_OFFSET);
+	sbl_dev_info(sbl->dev, "%d: SBL_PML_STS_RX_PCS_AM_MATCH_OFFSET = 0x%llx",
+		     port_num, val64);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_FECL_SOURCES_OFFSET);
+	sbl_dev_info(sbl->dev, "%d: SBL_PML_STS_RX_PCS_FECL_SOURCES_OFFSET = 0x%llx",
+		     port_num, val64);
+}
+
+/* stop the pcs */
+void sbl_pml_pcs_stop(struct sbl_inst *sbl, int port_num)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	struct sbl_link *link = sbl->link + port_num;
+	u64 val64;
+
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_KEEP_SERDES_UP)) {
+		sbl_dev_err(sbl->dev, "%d: KEEP SERDES UP", port_num);
+		return;
+	}
+
+	sbl_dev_dbg(sbl->dev, "%d: pml pcs stop\n", port_num);
+
+	if ((link->sstate != SBL_SERDES_STATUS_DOWN) &&
+	    (link->mattr.media == SBL_LINK_MEDIA_OPTICAL)) {
+		sbl_dev_err(sbl->dev, "%d: not stopping pcs because serdes is running",
+			    port_num);
+		return;
+	}
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+	val64 = SBL_PML_CFG_PCS_PCS_ENABLE_UPDATE(val64, 0ULL);
+	sbl_write64(sbl, base | SBL_PML_CFG_PCS_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET); /* flush */
+
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_TX_AM);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_ALIGN_EN);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_A_WAIT);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_F_WAIT);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_UP);
+}
+
+/* enable/disable pcs sending ordered sets */
+void sbl_pml_pcs_ordered_sets(struct sbl_inst *sbl,
+			      int port_num, int enable)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	u64 state = (enable) ? 1ULL : 0ULL;
+
+	sbl_dev_dbg(sbl->dev, "%d: pml pcs ordered sets - %s\n", port_num,
+		    (enable) ? "start" : "stop");
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET);
+	val64 = SBL_PML_CFG_RX_PCS_ENABLE_CTL_OS_UPDATE(val64, state);
+	sbl_write64(sbl, base | SBL_PML_CFG_RX_PCS_OFFSET, val64);
+
+	val64 = sbl_read64(sbl, base | SBL_PML_CFG_TX_PCS_OFFSET);
+	val64 = SBL_PML_CFG_TX_PCS_ENABLE_CTL_OS_UPDATE(val64, state);
+	sbl_write64(sbl, base | SBL_PML_CFG_TX_PCS_OFFSET, val64);
+
+	/* pci flush */
+	sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+
+	if (enable)
+		sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_OS);
+	else
+		sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_OS);
+}
+
+/*   Start/Stop sending am.
+ *
+ *   Start: configures and starts the PCS and then immediately disables the alignment
+ *   locking process
+ *
+ *   Stop: just switched off the PCS
+ */
+int  sbl_pml_pcs_am_start(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	link = sbl->link + port_num;
+
+	if (!(link->blstate & (SBL_BASE_LINK_STATUS_STARTING | SBL_BASE_LINK_STATUS_STARTING))) {
+		sbl_dev_err(sbl->dev, "pcs_am_start %d: wrong state (%s)\n", port_num,
+			    sbl_link_state_str(link->blstate));
+		return -ENAVAIL;
+	}
+
+	/* configuring will stop the pcs
+	 * this might perturb link partner when tuning so report we do this
+	 */
+	if (READ_ONCE(link->link_info) & SBL_LINK_INFO_PCS_TX_AM)
+		sbl_dev_dbg(sbl->dev, "%d pcs_am_start: tx am restart\n", port_num);
+
+	err = sbl_pml_pcs_config(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "pcs_config %d: failed [%d]\n", port_num, err);
+		return err;
+	}
+
+	/* send remote fault to the link partner */
+	sbl_pml_pcs_set_tx_rf(sbl, port_num);
+
+	/* start the pcs - which will start it sending AM */
+	sbl_pml_pcs_start(sbl, port_num);
+
+	/* if pcs is running it will be sending AMs */
+	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_PCS_TX_AM);
+
+	/* but definitely not doing any of this yet */
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_ANEG);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_A_WAIT);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_F_WAIT);
+	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_UP);
+
+	return 0;
+}
+
+#ifdef CONFIG_SYSFS
+/**
+ * sbl_pml_pcs_sysfs_sprint() - Format serdes info into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * This function checks the pcs_config flag and based on that
+ * it will format serdes info string into buffer.
+ *
+ * Context: Process context, Acquires lock and release
+ * link->lock <spin_lock>
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_pml_pcs_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	char state_str[SBL_PCS_STATE_STR_LEN];
+	int s = 0;
+
+	spin_lock(&link->lock);
+	if (link->pcs_config) {
+		s += scnprintf(buf + s, size - s, "pcs:  %s (%d %d %d %d) rx %x %s\n",
+				sbl_link_mode_str(link->link_mode),
+				sbl->switch_info->ports[port_num].serdes[0].tx_lane_source,
+				sbl->switch_info->ports[port_num].serdes[1].tx_lane_source,
+				sbl->switch_info->ports[port_num].serdes[2].tx_lane_source,
+				sbl->switch_info->ports[port_num].serdes[3].tx_lane_source,
+				link->active_rx_lanes,
+				sbl_pml_pcs_state_str(sbl, port_num, state_str, SBL_PCS_STATE_STR_LEN));
+	}
+	spin_unlock(&link->lock);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_pml_pcs_sysfs_sprint);
+
+/**
+ * sbl_pml_pcs_lane_degrade_sysfs_sprint() - Formats PCS ALD,TX/RX lane degrade into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * This function formats PCS ALD/(TX/RX) lane degrade string into buffer
+ * based on the flag 'pcs_config'.
+ *
+ * Context: Process context, Acquires lock and release
+ * link->lock <spin_lock>
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_pml_pcs_lane_degrade_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int s = 0;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 sts_pcs_lane_degrade_reg = sbl_read64(sbl, base | SBL_PML_STS_PCS_LANE_DEGRADE_OFFSET);
+	u64 cfg_pcs_reg = sbl_read64(sbl, base | SBL_PML_CFG_PCS_OFFSET);
+
+	spin_lock(&link->lock);
+	if (link->pcs_config) {
+		s += scnprintf(buf + s, size - s, "ALD: %lld - TX: 0x%llx - RX: 0x%llx\n",
+				SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_GET(cfg_pcs_reg),
+				SBL_PML_STS_PCS_LANE_DEGRADE_LP_PLS_AVAILABLE_GET(sts_pcs_lane_degrade_reg),
+				SBL_PML_STS_PCS_LANE_DEGRADE_RX_PLS_AVAILABLE_GET(sts_pcs_lane_degrade_reg));
+	}
+	spin_unlock(&link->lock);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_pml_pcs_lane_degrade_sysfs_sprint);
+#endif
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml_pcs_nic.c b/drivers/net/ethernet/hpe/sbl/sbl_pml_pcs_nic.c
new file mode 100644
index 000000000000..220039733053
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_pml_pcs_nic.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/sched.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_serdes_map.h"
+#include "sbl_internal.h"
+#include "sbl_serdes_fn.h"
+
+#ifdef CONFIG_SYSFS
+/**
+ * sbl_pml_pcs_speed_sysfs_sprint() - Report PCS mode into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * Based on PCS config, this function writes the link mode into
+ * the provided buffer
+ *
+ * Context: Process context, Acquires lock and release link->lock <spin_lock>
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_pml_pcs_speed_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int s = 0;
+
+	spin_lock(&link->lock);
+	if (link->pcs_config)
+		s += scnprintf(buf + s, size - s, "%s", sbl_link_mode_str(link->link_mode));
+	else
+		s += scnprintf(buf + s, size - s, "NA");
+	spin_unlock(&link->lock);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_pml_pcs_speed_sysfs_sprint);
+#endif
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml_serdes_op.c b/drivers/net/ethernet/hpe/sbl/sbl_pml_serdes_op.c
new file mode 100644
index 000000000000..4ade8b13b398
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_pml_serdes_op.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2019-2023,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_serdes.h"
+#include "sbl_internal.h"
+
+static inline bool sbl_pml_serdes_op_busy(struct sbl_inst *sbl, int port_num)
+{
+	u64 val64;
+
+	val64 = sbl_read64(sbl, SBL_PML_BASE(port_num) |
+			SBL_PML_SERDES_CORE_INTERRUPT_OFFSET);
+	return SBL_PML_SERDES_CORE_INTERRUPT_DO_CORE_INTERRUPT_GET(val64);
+}
+
+/**
+ * sbl_pml_serdes_op() - Perform a serdes interrupt configuration
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @serdes_sel: Value
+ * @op: Read serdes version
+ * @data: Set to zero
+ * @result: Pass this value to caller
+ * @timeout: Time set used for polling
+ * @flags: Used to set US/MSec delay
+ *
+ * This function validates the instance and port number, picks
+ * polling interval from the provided flags and executes SERDES
+ * core interrupt configuration. It polls the completion or timeout
+ * for this operation and returns success or negative on failure
+ *
+ * Context: May sleep based on access to serdes
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_pml_serdes_op(struct sbl_inst *sbl, int port_num, u64 serdes_sel,
+		      u64 op, u64 data, u16 *result, int timeout,
+		      unsigned int flags)
+{
+	struct sbl_link *link;
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+	int delay;
+	int poll_interval;
+	unsigned long last_jiffy;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "serdes op, p%ds%lld, %lld, %lld, %d 0x%x\n",
+		    port_num, serdes_sel, op, data, timeout, flags);
+
+	if (!result)
+		return -EINVAL;
+
+	/* cannot wait infinitely */
+	if (timeout <= 0)
+		return -EINVAL;
+
+	/* a polling interval is mandatory */
+	poll_interval = sbl_flags_get_poll_interval_from_flags(flags);
+	if (!poll_interval)
+		return -EINVAL;
+
+	delay = sbl_flags_get_delay_from_flags(flags);
+
+	link = sbl->link + port_num;
+	err = mutex_lock_interruptible(&link->serdes_mtx);
+	if (err)
+		return -ERESTARTSYS;
+
+	if (sbl_pml_serdes_op_busy(sbl, port_num)) {
+		mutex_unlock(&link->serdes_mtx);
+		return -EBUSY;
+	}
+
+	/* start the operation  */
+	val64 = SBL_PML_SERDES_CORE_INTERRUPT_SET(serdes_sel, 1ULL, op, data);
+	sbl_write64(sbl, base | SBL_PML_SERDES_CORE_INTERRUPT_OFFSET, val64);
+	sbl_read64(sbl, base | SBL_PML_SERDES_CORE_INTERRUPT_OFFSET); /* flush */
+
+	if (delay)
+		udelay(delay);
+
+	/* poll for completion or timeout */
+	last_jiffy = jiffies + msecs_to_jiffies(timeout) + 1;
+	while (sbl_pml_serdes_op_busy(sbl, port_num)) {
+		if (time_is_before_jiffies(last_jiffy)) {
+			mutex_unlock(&link->serdes_mtx);
+			return -ETIMEDOUT;
+		}
+		msleep(poll_interval);
+	}
+
+	/* get the result */
+	val64 = sbl_read64(sbl, base | SBL_PML_SERDES_CORE_INTERRUPT_OFFSET);
+	*result = SBL_PML_SERDES_CORE_INTERRUPT_CORE_INTERRUPT_DATA_GET(val64);
+
+	mutex_unlock(&link->serdes_mtx);
+	return 0;
+}
+EXPORT_SYMBOL(sbl_pml_serdes_op);
+
+/**
+ * sbl_pml_serdes_op_timing() - serdes core interrupt access timings
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @capture: Value to capture the interrupt delay
+ * @clear: Value to clear interrupt delay
+ * @set: Value to set interrupt delay
+ *
+ * Return: 0 on success
+ */
+int sbl_pml_serdes_op_timing(struct sbl_inst *sbl, int port_num, u64 capture,
+			     u64 clear, u64 set)
+{
+	u32 base = SBL_PML_BASE(port_num);
+	u64 val64;
+
+	val64 = SBL_PML_CFG_SERDES_CORE_INTERRUPT_CAPTURE_INTERRUPT_DATA_DELAY_SET(capture) |
+		SBL_PML_CFG_SERDES_CORE_INTERRUPT_CLEAR_INTERRUPT_DELAY_SET(clear) |
+		SBL_PML_CFG_SERDES_CORE_INTERRUPT_SET_INTERRUPT_DELAY_SET(set);
+
+	sbl_write64(sbl, base | SBL_PML_CFG_SERDES_CORE_INTERRUPT_OFFSET,
+		    val64);
+	return 0;
+}
+EXPORT_SYMBOL(sbl_pml_serdes_op_timing);

-- 
2.56.0

