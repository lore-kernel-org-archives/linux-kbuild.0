Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394017;
	b=PNnRkYf+hSfP4iYjxNinSAb5oBm1lZ1e5WQBqzpjMUPduLwREZSNqSPMkZUaaAtAyY7h
	 efxMC9xxk/ZwhpQGKUj6BRl8VxFQq1anILBdyk7D3ENeLxoBE2Hb20kU/54vTCo48RI1C
	 +fM83wGdKYsk1hqqTZiSN4++ubdCuwIVWGErZH2ivIynfkaq/AEFvxKdzUUpPlOfu79ht
	 cr9zgCViHGQqCLDI2okN4BBgycBLubWpH3sHUgBj4ELrLH3S25/6IRUTqweK91RTbLils
	 SN7vYEGWJV1nMQQf6pGBhtf8TA8XMoXi20Cl4PfKXp0gKrBDqaEXCSR9QMnzFpqcDSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:Subject:Date:Message-Id:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 CC:X-Mailer:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5yJ23SQ3Hpf2sNYtkftA3642cR1DYIVHm4CiZmSil74=;
	b=pRVIeYYkJ5c21X6Wf2kVQm2J9TKssxT9M8eS+w0hDA3vHCtEWaPi7Vbh1xpTRZvdDHaY
	 Ian5oaTiXg2VhVoj7hGEP2VZKQw0Pqm1MNsZyya4g84Q4PAKjq7kJvsfKW+xHlO/EhWiP
	 VPJcY4vZ6OETBelaB0Q705XhEYhqcpOVDG+ArKK26UOfSivYt9zySqirUl39X+RWJbXaD
	 boA15/alwyw25oz4hz1beg5Qq8S3RoXXRs6M5QMItBCeZh4K7BEdamFsSI8LZ5D14y84g
	 MnEwfptHp0LFD+8H1RYDOBY3ke4sJpi6e6TAk9TV4B6UdVGHS55E7LbJe/55M//rv+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ZUQcc9PT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38667606A31F;
	Fri, 30 Oct 2026 21:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38667606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ZUQcc9PT
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UJVsdU3466438;
	Fri, 30 Oct 2026 20:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=5yJ23SQ3Hpf2sNYtkftA3642
	cR1DYIVHm4CiZmSil74=; b=ZUQcc9PTjD1zMymZ+5ECYTFS1bVMAUfMwsyXEtlu
	m4/oW5RnmR0JEBRzgTLobMT1RIAGkMQjtOWZy0iFfMY6dwYdW4QzraVD7uS2q6ZA
	NuUAvZtHvCLryrU0yiRRKA/jFZkFniFLaTS1WMQloR4rcuotnJPq/rsGHE0KdJfC
	DbkeR2JduWV8j6nbQuDdusVOZSAa3hazNxULmQAuiGywMOrWHhkpBPbdhbk4YZC4
	7wscFtzM+7GUMYgKSHxE2DN62XIZKzCbBV6GK7cRKpPrdUeg3rPDv3loKAOft5O4
	k5XpgzR1KeS7MTPMeOqmjBLalFnkFG9MmyEuJTl5Ax5gXg==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmw2jvkc4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 20:59:51 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 0816B800EE5;
	Fri, 30 Oct 2026 20:59:50 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 08:59:50 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 08:59:50 -1200
Received: from CY3PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 20:59:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkeAqIqal39bMo9dDOV0g4B+Q8DM/jUvG1TnVhYifm1+SDu6h6HWr7SejZL12CfzcwiRnEmUa0LO+BmO9+UKZgaB7joIwpd8Byr/9zkRFWFY+ZKA5xqxm+5wAGrVUJ7jL1UzqLf8SYO+pdR/0nzQXMT8xT8983N4QeAudrwViF4SYk5JykgA2AIO3EbVyPD8clDxgECIP0AjhRSbNA5mrPWRr5EoA3kJSnY6YTWAIrn3DXzLvDpm7QeBQ+8BC/nuPUfEVyC7JZhv4wDMAgoPc20VyVCryAQJI/FiErzCXfwgSVZ+9ya9tbDag25LuvZgOCjWprYXsOOoKtsx7LECYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yJ23SQ3Hpf2sNYtkftA3642cR1DYIVHm4CiZmSil74=;
 b=bR/vwZUrl3gi40hlou/+kp+KP2axttolE1FfIiB00lfteHfKhyTyRkDxfDa4k5t3tmBO53NaWjEB/vUHuNFsAywt5HxaB8Vih6bsUulOAgFe656VRp4t2cbEBk+RP9emjMZ/Yz8aQUsq0sZJH6pfYRA7YnpbXk0VH5hkXQw0pRnFEJ4KRMIQVhD2TTzLQr9V2Kj0Qs1fxX/Im/ui1kY5FrVpXA+gD/3a9f62+nTHxld95n59mq03SvYzveA+I02w13vpO3GESNkwUnq7nFVC/K2s08iJtg0+8UmqXbnsnrfYwl0A5099mNWeKGG+M6+VcLInMwiGL6TCD+BkkNkx0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by LV3PR84MB3767.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 20:59:46 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 20:59:46 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Subject: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
Date: Fri, 30 Oct 2026 13:58:56 -0700
Message-Id: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yWMwQqDMBAFf0X27EKMxKK/UjzY5FW3YCxZK4L47
 43tcWBmDlIkgVJXHJSwicoSM1RlQX4a4giWkJmssU1lbMt+F45YAzbWz2MWvQpubrVx9eCCcaD
 cvhOesv++9/7P2X7Br9eMzvMLJ6WixHkAAAA=
X-Change-ID: 20261029-cxi-netdev-submission-673053a5d05e
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
        Iraimani P <iraimani.pavadai@hpe.com>,
        "Mamila Santosh" <santosh-kumar.mamila@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: DS0PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:8:191::9) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|LV3PR84MB3767:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a86fcbc-9406-4ed7-fa5a-08df36c8baad
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021135927099003|261021121427099003|261009223027099003|261026121527099003|261026140227099003|10067099003|56012099006|5023799004|6133799003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: Pl7hy8Jy2ID+lIr5bloIgb6PH3fFNHTwazorhbROzfbQlEa6yiuhnEgr1H3zymA2APUusFB8I57icDpn1y2pmegxky0ZVR9v78jP5B0mJ0qdTZd3YcaT75/ID2xmMkd7M4aDyT5Fid54I9k11F2mmxpVOBfBuciZjL6j6bGvQzU3oZBbdgdmuR4hDGYu4muDATQVSaGFgWPljPX45aUZTagT2jvoMj0qTWTlw8SOpKqRln7bF7ASq+TxcDUVE8ItbOyPIsd0/gKva6T67z9L2l8FYkcfGEDQz9Vmd0fKNGNoNQ4oyp5h4/iBGz/W1A7lc7ivbtooFNBFJD5/bhstvyMkGj0P9z+4niqJX16vhqkPkBpcvGkTLWDDn7YeiOOpLs07a4tR4BS5Wi1MYvTF3mYPBC7nF2fKxvMn6qW9HNh23Lh4fnFceXPiQSy/Io8MyAcSIHXdl6Jd6EfiZ12BdTxMsTdCmjHndJs4/mNBdrmmPMTNzvp/prCcj3GZ0vJsncWcbA0kTvx3HUGJ04hC6pXMZdAkyNeapbMOREUtONXO1GfsaMy4by9Cz1ieaaw3khIgdTxBoLqcUf2H/ThgPTGnnlRnqLps+9Qwo3BKPiL75VP1SoPMhxbridxa1x8FA6MFMvcvk65ggFln7E6pxQZULF93wKaXuGn920+T0ZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021135927099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(56012099006)(5023799004)(6133799003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnJwWEZZRGVpdy9JMC8vZ0xtQ0Q2ME1EQkFFbTMxSkgxV3BOWXlhR2hjc3lM?=
 =?utf-8?B?eGNjYmVpRXZjTW5EL2diVkE5VEk4czFoZ3dYV0xSeFdLaUoxbjFXbXpvaHBK?=
 =?utf-8?B?eFVhQ0ZOMTd1VUtUR3F6aEo0QlpORjJRWlJNSFJQQ0x1VUdhT3A3RGRMZ2xI?=
 =?utf-8?B?V1dFNDQ0cDl6cnNEOHRkRW5qVGtNUDB6NDYraExFdDUrTVFRa2tuMExEbzdU?=
 =?utf-8?B?bm5Xc2ZQd3NuZ1FYbFZad04wNno2N0V2RWRMMTNvMk5qZ3gwQStRK0lmMlkv?=
 =?utf-8?B?aEs4YnBtcUE5ek1ERXZ3WmhWYitKUlZtTzQvc1lwZzhZU1JFZHNVa1NHYUJI?=
 =?utf-8?B?dXJiWXcwRWJKRFhwWGlkdXd4NnV1L3VYazdMQnFLTEpmWlluSHduVmR0RGRv?=
 =?utf-8?B?MHBSTWU0TzRsTFZzWTNFSVVLc1hJc1BmNXRXYzY2eFpEZSt0aVFSekNtb2tK?=
 =?utf-8?B?TzFsSWxiNUhlVnJzRFYvSGZ0OEE2MnFSNGI4V25vbXVkMWowdXJhdWhkeXI4?=
 =?utf-8?B?N0ppOWcrclU4TGcyd3EvcHdiU3ZBY1Y4RXNqMUdQeGd6cVpwczFNOFhTTHc3?=
 =?utf-8?B?Q0VrajJGWHdHSU9tQm5lREg1YjhrdWxDa1l4b2RvWFNna0FQUDZGR2wyOGxt?=
 =?utf-8?B?SmExQUZ3Nll3bkJnbUVzcTRDMUFwQ1VMNy91bTZLbGRxL0FoeVFoWkxjWnpE?=
 =?utf-8?B?elNoUE5vc1grSGtjekVhRE1OUnpubTdVakhSNEozMm96TTV0Q0hzSDdObU9x?=
 =?utf-8?B?RFgzc01ScUpUVGtJM3lsVEg2cWdnaWhOK3hndmlBMHcwWVZsTVFndjY0S2Rr?=
 =?utf-8?B?VEI0N1A4R3FXZ2hzMnRwNTZZN3B6MmYveHJpZDh1REdYOXV3d2VleU5KSkEv?=
 =?utf-8?B?c0dNUFV5SjBTS2doS3REVEdMWlhOeExaY2YvbDRQdVZGaGZVOFh0QTNLWEhj?=
 =?utf-8?B?dXZGN3pTUWJXNTdHZlhBY0NuOGNEcTIwcUJsVFV1ZDJyTUU4b3ZWR2dpM2lX?=
 =?utf-8?B?WXlIa09YcDlNOTEvTWtmc2hHc05uOUdCK05KTWRJd05Wem45NnVjRTBpcGNH?=
 =?utf-8?B?M2VpdnRqM2VzK2lVTmUvaURpN3pJek9IVUZubzkyZmQwaE9WZGxKbjNhcnp4?=
 =?utf-8?B?UERsOE9BWFFpeGxBN3FoZDJTdzIwT3V1emVwTVI4emVNcDVWT29nRGhnZ3Rl?=
 =?utf-8?B?UTh6UzVLd0J4NlF0ZzUrWDRzQVhsa3Q2aEQzK3FjMUM0ZVUwYWVXQk1RTGJj?=
 =?utf-8?B?aGtqTFdtSHMybFgvMDdSb0JHR1hhWnJ2SlBjRkdwTUN3YTY3cGg1RHk0NnMz?=
 =?utf-8?B?Q21Hc1dxVy9LZDU0Wm5sOHpnZm9rN1lTamNlQ0FHczhocmJ6VXd0UE5rYWdn?=
 =?utf-8?B?czRzSjlON3VpMjhCQjQyazU0ZDh0THQ1bDdPNHNXZ1pCcFFlWFVoZVB3ZFlk?=
 =?utf-8?B?b0w0YzdIbFFBcEllcEdYbjA2MnhkV1JRSWZqVzlnWFRHemdzWk45YmN6TGZM?=
 =?utf-8?B?Qi9pRjgwdjBDUm42SzhuNlBOWFIrNm9kUGh0L0tvckQ3TlkyTUJld0Ywd2dw?=
 =?utf-8?B?aE5FQXMwMGhvSGVkYTFOTEVLVzVDWG9YWncvcUtHb3c0VTBYTkRJaEo4Z3pE?=
 =?utf-8?B?ZmJuY21PNmo0TlhjbEkvMWtialNoWUV5THJ0cXZZbU9aZDZ1Z0d3bnBJL2hC?=
 =?utf-8?B?S0JkTTZwYStnZVFWRXdHM0xlTjNrS3d4aFBZTXlobCt1UlRhajZaVUJaeU52?=
 =?utf-8?B?azlmSHljWnBrVTNSRnc5dTFtK2FJRXN4dmFRUWlqM2tqYTF4U2lZNXI1QTkv?=
 =?utf-8?B?WURlZnd3NHl6QzlpaVc5aFIxZGxPSWV3RU5BeVpuQ3g1Vi9HejdDYnhiNzBz?=
 =?utf-8?B?MVVhL0Y4Q2Z5ZWlCdkprRUhWWUdONGRLT1RDZEtzcWhlMTBobEJaM2ZHOGN0?=
 =?utf-8?B?YjdYbGtVei9RbHFGTTBqTHdOR3NkR1cwcTJ1OENKdDVpWnVmYS9jZTVVc3Rn?=
 =?utf-8?B?QlN1MS9xdGR1eDZCM2pWSWx4SStQTzFiKzdzSlViTEJUWWdpNzVhZW8xVE1w?=
 =?utf-8?B?U3N3bmhzTUJldkpIbjh0NGIxM2owczFTaDZXK1ZuWmRjY3hOWTFLZFNTdFJH?=
 =?utf-8?B?djZyUUpQQUFkajVLU2JDMkM5aElodWx3OFhjVWhzalpYVWpUaDRwbUhWSllo?=
 =?utf-8?B?YVRrcVJ1b2U0V0UvVUxmamtyT3RUNG9jM3ltUS90b3N2TUlkaWNEVlR2NW5G?=
 =?utf-8?B?c1BRNmhvNzJ1RTBVeSt0c1ZZTGpVNkV4Mm1qTGhud1JidDZPd1NsTGp4TWJV?=
 =?utf-8?B?SUNySjlzOHFBK29FVVU5VVZSV2FlUjg0WWFGUC95M28xZXg2WmV0dz09?=
X-Exchange-RoutingPolicyChecked: NG46fbErYftaRH/zOMUmY/e8oqvCDKd7NbfzdF+GW41E1PCdp3anmfNxx4H+GMKmaX98rbgkihqkQMlGGPZC2tKmFL/plZiup/i2/hv6g3d+7KlFVQov6lOHhIEWbddboDgXyawi6EDa6EvkE/QMRKsbL2abfU9pgCrg8IWvvmQieDJv/osC0VxSJNJPCDrqzBeNO6SjMQjSsITNnRpN1KoPSV4foY2I55za8M447G/ixwJTktNglDBr4JXj9ILwYF24yKWQpvXojMQ9YRARC2IrOBnLJYYLetkEWh94IeF8X4P2Rth10xZEhQzlC3/52aW6ZOKJ8zb/x9N/DrOYCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a86fcbc-9406-4ed7-fa5a-08df36c8baad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 20:59:46.6852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9y8bEqGA+D04ya6tVk8Ag9lJm+HeNvKLvCvXhGQPdFHin/OIA7rzDdAZ8tydMp5ooWVAX/oBEnP98FVEhYyxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3767
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX8ldf559B5AWJ
 C9mAa1N3qsp8yUK5yXclqkM9i3eQLt/YBbHgksRL/QIblu8RYRr4gVP15typ2E32KOS5vLurYPh
 XDKvQbB8PkQg2wtZxxYM7Ja+1y29mjY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX+zUrU3iL30z+
 2kDxhcl/UUH7p5lgfOZZUiipuiaZ3WdXH9kR/dTfkq8sXA2MsiypmpIuRk2VbBCbaXqzsE2C5Vn
 3im0MSYCaePbH5Fda99/cBBgIRRItBtP5+iy3O/kRl1BPpU0HqUpRjXkCyEpEUBQ9ozYFP0EBsP
 Q/S1u4Mar0cwEwe8e2iLGdATbXzZSOLZYwElOKKbYZbHM4YPPXp1fGhW/W3KNkQLkvX1wXMx3Ur
 KYwzfcWuj5cwCllO+iL+Lfvb4sU1PTMlHebYDse6HK9WsjZFIf786snDXOo/Dv166sJQQNHGWW+
 5Gf0gxxoVS3gSsZwe5dWlIlYY5+EVNw/v+zQ8pFLDGO4vQuCWgTy2jN20G5JvHfLxkBYPM999UA
 2Obq7o3UG4Y1zDkTde7oXvd3yhVfEWItK+DeB3RnkQ33Zn99WM30p3DMCl9dMsFagziwrJFbtR6
 G+0724IkT1cbWwRpkwA==
X-Authority-Analysis: v=2.4 cv=QOn91QLL c=1 sm=1 tr=0 ts=6ae50547 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=RtSn8ETxjE2H05FtM2s8:22 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=NEAV23lmAAAA:8
 a=MvuuwTCpAAAA:8 a=pGLkceISAAAA:8 a=J1Y8HTJGAAAA:8 a=20KFwNOVAAAA:8
 a=KKAkSRfTAAAA:8 a=zd2uoN0lAAAA:8 a=_jlGtV7tAAAA:8 a=G01YgMzK5MB_Nhad67QA:9
 a=Sy1gAVeDArLWOXVf:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=y1Q9-5lHfBjTkpIzbSAN:22 a=cvBusfyB2V15izCimMoJ:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: JssMu0k-ariX9guNCKwXQR6ZZsNzRKPB
X-Proofpoint-ORIG-GUID: JssMu0k-ariX9guNCKwXQR6ZZsNzRKPB
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

To: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>
To: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Christian König <christian.koenig@amd.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

This series adds the Linux drivers for the HPE Slingshot Cassini network
interface controller, the NIC used in HPE Slingshot high-performance
computing systems (Cassini 1 with 200 Gb/s links and Cassini 2 with
400 Gb/s links).

The hardware is reached through three layered drivers:

 - cxi-sbl (Slingshot Base Link): SerDes, PML, link state machine and
   media handling for 200 Gb/s links (patches 2-8)
 - cxi-sl (Slingshot Link): the link layer for 400 Gb/s links, with its
   control layer, media and cable handling and sysfs interface
   (patches 9-15)
 - cxi-ss1 (Cassini core): the PCI driver that owns the device, its
   address translation, event and command queues, communication
   profiles, resource groups, QoS and services, plus cxi-eth, an
   Ethernet personality on top of it (patches 1 and 16-22)

Patch 23 adds Kconfig, Makefile and MAINTAINERS. Until that patch the
new driver sources are not compiled; only the new UAPI headers are
built, by the UAPI header test.

The core driver exposes an in-kernel CXI interface (cxi.h) to client
drivers through the auxiliary bus. The Ethernet personality in this
series is one such client; the RDMA driver is another.

Series size
-----------

We know this is longer than the usual netdev limit of about 15
patches. The three drivers depend on each other: cxi-ss1 selects
cxi-sbl or cxi-sl at run time according to the NIC generation, and a
single Kconfig/Makefile patch enables all three. Posting only part of
them would add code that cannot be built or used. Within the series,
each patch adds one layer so that it can be reviewed on its own. If
you would prefer a different split, for example the two link drivers
first and the core driver after them, please tell us and we will
restructure V2.

Driver Structure
----------------

The main reason for sending this patchset now, given that there are
still a few issues unresolved and over 16,000 checkpatch warnings for
line length (we're working through the tools that generate these
files to fix that up) is to get input on several overall design issues:

1) We are an Ethernet driver structured over a Portals 4.0 API
hardware device.  That means that our Ethernet implementation
is complex, much like combined Ethernet/RoCE devices.  We have
chosen, as a design decision, to keep the driver mostly in one
place and the RDMA portion of the driver is just a thin layer
that routes things like memory registrations and what not to our
Ethernet driver core.  In addition, the Ethernet support needs
many of those same things anyway, and the driver's RDMA aspect
uses a plain socket connection to the fabric manager in order
to get the configuration it needs to run.

It is possible that the driver could be re-architected to be an RDMA
driver first, and just provide a thin shim layer in the net/ethernet
area instead.

This would be considerable work, and very likely result in the sl
and sbl drivers still belonging more in the netdev area (or maybe
the phy subsystem, but I think these drivers are more than your
generic phy) so we didn't pre-emptively undertake that task.

In addition, moving entirely over to the RDMA subsystem would invert
the normal order of bring up between shared ethernet/RDMA devices.
One of our engineers opined that such a suggestion would be anathema
to the netdev community.

2) Our sysfs usage.  We have extensive elements that we populate
in sysfs related to the hardware.  Initial comments were that we
were likely over-using/abusing sysfs, so we have already removed
the sysfs telemetry support we used to have, reducing our sysfs
elements by 1,925 items (those items are now accessed via the
RDMA stack's hw counters support).  There are still a significant
number of sysfs elements exported, especially from the sl driver.

Dependencies
------------

This series has no dependencies and applies to net-next.

Two later submissions to linux-rdma depend on it:

 - "RDMA/cxi: add the HPE Cassini verbs driver" (kernel, linux-rdma),
   which also depends on the UET RDMA core series
   [PATCH rdma-next v2 00/13] RDMA/core: Ultra Ethernet transport verbs
   https://lore.kernel.org/linux-rdma/20261019-uet-ib-core-v2-0-8bd654f25370@broadcom.com/T/#t
 - the cxiverbs rdma-core provider (rdma-core pull request), which also
   depends on the UET rdma-core series
   libibverbs: Ultra Ethernet reliable unconnected verbs
   https://github.com/linux-rdma/rdma-core/pull/1829

Known open issues
-----------------

Every patch with a known unresolved issue says so in its commit
message. In summary:

 - SR-IOV: patches 1, 16, 17, 19, 20, 21 and 22 carry virtual-function
   code from an older, incomplete version of the Cassini SR-IOV support.
   V2 will include the updated SR-IOV implementation, so please ignore
   issues in the VF paths for now. Specific known VF issues are listed
   in patches 17 and 19.
 - Patch 11 (SL core link state machines):
   sl_core_hw_pcs_keep_all_lanes_active_set() is an empty hook with a
   TODO. It belongs to graceful lane-degrade support, which SL does not
   implement yet.
 - Patch 14 (SL sysfs): about 378 SL attributes (and 23 in cxi-ss1) have
   no Documentation/ABI entries yet. We are working with the hardware
   engineers to decide which attributes are stable interfaces and which
   belong in debugfs; the documentation will be in V2.
 - Patch 17 (datapath, open hardware question): DMAC transfers are
   bounded, and the engine is disabled and its interrupt drained before
   the completion descriptor is read. We are confirming with the
   hardware engineers that clearing C_PI_CFG_DMAC ENABLE guarantees no
   further host writes. Current callers keep their DMA buffers for the
   lifetime of the device.

checkpatch
----------

checkpatch --strict (100 columns) still reports issues in most patches;
each patch lists its own types and counts. Most come from the generated
hardware headers in patches 1 and 9 (for example, 19058 LEADING_SPACE
warnings in patch 9 alone) and from long lines. This code is also
maintained in internal HPE repositories, from which the generated
headers come, so the remaining fixes need coordination with those
repositories and will be made in V2. The 25 remaining ERRORs are
SPACING, CODE_INDENT, COMPLEX_MACRO and FLEXIBLE_ARRAY in the header
patches 1, 2, 9 and 16.  Those issues will be addressed by humans
with actual thought and coordinated between the internal repos and
this submission.

Some UAPI headers in this series (for example sbl-abi.h) also have
copies in out-of-tree HPE packages; those copies will be synchronized
with this series over time.

Review and testing
------------------

Before posting, the series was reviewed with the Sashiko AI code
review tool and checkpatch. All valid findings are fixed, except the
open items listed above.

Tool use: GitHub Copilot, an AI coding assistant, was used under our
direction to write many of the review fixes, to fold them into these
patches, to write commit messages and to run the build and hardware
tests. Every change was reviewed by the submitter, who takes
responsibility for it as for any other patch.

 - every patch builds incrementally, without compiler warnings, with an
   x86_64 configuration that enables these drivers and the UAPI header
   test
 - with exactly this series, the cxiverbs series and the rdma-core
   provider, booted on two Cassini 2 x86_64 nodes, the complete stack
   passed a full test matrix on both nodes: module identity and
   signatures, link bring-up and a 60-second link-stability check,
   the rdma-core Python suite (434 tests; tests that need features
   this device lacks are skipped), resource and VNI isolation tests
   in default and indexed addressing modes, including wrong-VNI
   rejection, privileged and unprivileged CSR access tests, and 36
   two-node ping-pong and RMA traffic cases (polling and event modes)
   in each direction, 72 in total. Native NIC resource accounting was
   identical before and after the traffic, and the kernel logs had no
   WARN, BUG or oops reports and no module load errors.
 - targeted user space models of the functions changed by the review
   fixes pass under AddressSanitizer and UndefinedBehaviorSanitizer.

Co-developed by Sandeep Bhoot, Mamila Santosh and Iraimani P, as shown
by the trailers on each patch.

Doug Ledford (23):
  net: hpe: ss1: add the Cassini headers
  net: hpe: sbl: add the Slingshot Base Link headers
  net: hpe: sbl: add the core instance and configuration layer
  net: hpe: sbl: add the SerDes layer
  net: hpe: sbl: add the PML link layer
  net: hpe: sbl: add link state management
  net: hpe: sbl: add the SBM serial bus layer
  net: hpe: sbl: add media, FEC and counter support
  net: hpe: sl: add the Slingshot Link headers
  net: hpe: sl: add the module entry points
  net: hpe: sl: add the core link state machines
  net: hpe: sl: add the control layer
  net: hpe: sl: add media and cable handling
  net: hpe: sl: add the sysfs interface
  net: hpe: sl: add the NIC binding and logging helpers
  net: hpe: ss1: add the Cassini core device layer
  net: hpe: ss1: add the datapath and memory translation layers
  net: hpe: ss1: add the link layer glue
  net: hpe: ss1: add SR-IOV support
  net: hpe: ss1: add the CXI core interfaces
  net: hpe: ss1: add resource groups, QoS and services
  net: hpe: ss1: add the Ethernet personality
  net: hpe: wire up the Slingshot NIC drivers

 416 files changed, 185139 insertions(+)

Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
Doug Ledford (23):
      net: hpe: ss1: add the Cassini headers
      net: hpe: sbl: add the Slingshot Base Link headers
      net: hpe: sbl: add the core instance and configuration layer
      net: hpe: sbl: add the SerDes layer
      net: hpe: sbl: add the PML link layer
      net: hpe: sbl: add link state management
      net: hpe: sbl: add the SBM serial bus layer
      net: hpe: sbl: add media, FEC and counter support
      net: hpe: sl: add the Slingshot Link headers
      net: hpe: sl: add the module entry points
      net: hpe: sl: add the core link state machines
      net: hpe: sl: add the control layer
      net: hpe: sl: add media and cable handling
      net: hpe: sl: add the sysfs interface
      net: hpe: sl: add the NIC binding and logging helpers
      net: hpe: ss1: add the Cassini core device layer
      net: hpe: ss1: add the datapath and memory translation layers
      net: hpe: ss1: add the link layer glue
      net: hpe: ss1: add SR-IOV support
      net: hpe: ss1: add the CXI core interfaces
      net: hpe: ss1: add resource groups, QoS and services
      net: hpe: ss1: add the Ethernet personality
      net: hpe: wire up the Slingshot NIC drivers

 MAINTAINERS                                        |     7 +
 drivers/net/ethernet/Kconfig                       |     1 +
 drivers/net/ethernet/Makefile                      |     1 +
 drivers/net/ethernet/hpe/Kconfig                   |    26 +
 drivers/net/ethernet/hpe/Makefile                  |     8 +
 drivers/net/ethernet/hpe/sbl/Kconfig               |    15 +
 drivers/net/ethernet/hpe/sbl/Makefile              |    21 +
 drivers/net/ethernet/hpe/sbl/sbl_config_list.h     |    61 +
 drivers/net/ethernet/hpe/sbl/sbl_constants.h       |   352 +
 drivers/net/ethernet/hpe/sbl/sbl_counters.c        |   137 +
 drivers/net/ethernet/hpe/sbl/sbl_debug.c           |   167 +
 drivers/net/ethernet/hpe/sbl/sbl_fec.c             |   971 ++
 drivers/net/ethernet/hpe/sbl/sbl_fec_nic.c         |    36 +
 drivers/net/ethernet/hpe/sbl/sbl_inst.c            |   529 +
 drivers/net/ethernet/hpe/sbl/sbl_inst_nic.c        |    70 +
 drivers/net/ethernet/hpe/sbl/sbl_internal.c        |    23 +
 drivers/net/ethernet/hpe/sbl/sbl_internal.h        |   279 +
 drivers/net/ethernet/hpe/sbl/sbl_link.c            |  1739 +++
 drivers/net/ethernet/hpe/sbl/sbl_link.h            |    44 +
 drivers/net/ethernet/hpe/sbl/sbl_link_an.c         |  1010 ++
 drivers/net/ethernet/hpe/sbl/sbl_link_an_nic.c     |   111 +
 drivers/net/ethernet/hpe/sbl/sbl_link_nic.c        |   196 +
 drivers/net/ethernet/hpe/sbl/sbl_media.c           |   482 +
 drivers/net/ethernet/hpe/sbl/sbl_media_nic.c       |    47 +
 drivers/net/ethernet/hpe/sbl/sbl_misc.c            |   505 +
 drivers/net/ethernet/hpe/sbl/sbl_module_nic.c      |   132 +
 drivers/net/ethernet/hpe/sbl/sbl_platform.h        |    35 +
 drivers/net/ethernet/hpe/sbl/sbl_pml.c             |   787 +
 drivers/net/ethernet/hpe/sbl/sbl_pml_fn.h          |   132 +
 drivers/net/ethernet/hpe/sbl/sbl_pml_llr.c         |   736 +
 drivers/net/ethernet/hpe/sbl/sbl_pml_llr_nic.c     |    34 +
 drivers/net/ethernet/hpe/sbl/sbl_pml_mac.c         |   220 +
 drivers/net/ethernet/hpe/sbl/sbl_pml_pcs.c         |  1085 ++
 drivers/net/ethernet/hpe/sbl/sbl_pml_pcs_nic.c     |    53 +
 drivers/net/ethernet/hpe/sbl/sbl_pml_serdes_op.c   |   145 +
 drivers/net/ethernet/hpe/sbl/sbl_sbm.h             |    73 +
 drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.c      |  1114 ++
 drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.h      |   152 +
 drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes_nic.c  |   138 +
 drivers/net/ethernet/hpe/sbl/sbl_serdes.c          |  1117 ++
 drivers/net/ethernet/hpe/sbl/sbl_serdes.h          |    94 +
 drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.c       |  4310 ++++++
 drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.h       |   151 +
 drivers/net/ethernet/hpe/sbl/sbl_serdes_map.h      |    10 +
 drivers/net/ethernet/hpe/sbl/sbl_test.c            |   406 +
 drivers/net/ethernet/hpe/sbl/sbl_timers.c          |   228 +
 drivers/net/ethernet/hpe/sl/Kconfig                |    15 +
 drivers/net/ethernet/hpe/sl/Makefile               |   140 +
 .../net/ethernet/hpe/sl/core/base/sl_core_log.h    |    70 +
 .../ethernet/hpe/sl/core/base/sl_core_timer_link.c |   109 +
 .../ethernet/hpe/sl/core/base/sl_core_timer_link.h |    41 +
 .../ethernet/hpe/sl/core/base/sl_core_timer_llr.c  |    84 +
 .../ethernet/hpe/sl/core/base/sl_core_timer_llr.h  |    37 +
 .../ethernet/hpe/sl/core/base/sl_core_work_link.h  |    41 +
 .../ethernet/hpe/sl/core/base/sl_core_work_llr.h   |    19 +
 .../hpe/sl/core/data/nic/sl_core_data_link.c       |    11 +
 .../hpe/sl/core/data/nic/sl_core_data_mac.c        |    11 +
 .../ethernet/hpe/sl/core/data/sl_core_data_ldev.c  |   122 +
 .../ethernet/hpe/sl/core/data/sl_core_data_ldev.h  |    19 +
 .../ethernet/hpe/sl/core/data/sl_core_data_lgrp.c  |   351 +
 .../ethernet/hpe/sl/core/data/sl_core_data_lgrp.h  |    26 +
 .../hpe/sl/core/data/sl_core_data_lgrp_trace.c     |    50 +
 .../hpe/sl/core/data/sl_core_data_lgrp_trace.h     |    13 +
 .../ethernet/hpe/sl/core/data/sl_core_data_link.c  |  1343 ++
 .../ethernet/hpe/sl/core/data/sl_core_data_link.h  |    91 +
 .../ethernet/hpe/sl/core/data/sl_core_data_llr.c   |   526 +
 .../ethernet/hpe/sl/core/data/sl_core_data_llr.h   |    49 +
 .../ethernet/hpe/sl/core/data/sl_core_data_mac.c   |   273 +
 .../ethernet/hpe/sl/core/data/sl_core_data_mac.h   |    24 +
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_an.c    |    26 +
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_fec.c   |   113 +
 .../hpe/sl/core/hw/nic/sl_core_hw_intr_flgs.h      |    70 +
 .../hpe/sl/core/hw/nic/sl_core_hw_intr_flgs_llr.h  |    37 +
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_llr.c   |    44 +
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_mac.c   |    32 +
 .../ethernet/hpe/sl/core/hw/nic/sl_core_hw_pcs.c   |    14 +
 .../sl/core/hw/nic/sl_core_hw_serdes_firmware.h    |    11 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_an.c    |   602 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_an.h    |   112 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_an_lp.c |   254 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_an_lp.h |    23 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_an_up.c |   270 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_an_up.h |    15 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_fec.h   |    23 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_intr.c  |   222 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_intr.h  |    52 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_intr_llr.c  |   181 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_intr_llr.h  |    48 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_io.h    |   308 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_link.c  |  2172 +++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_link.h  |    35 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_llr.c   |   905 ++
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_llr.h   |    38 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_mac.c   |   172 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_mac.h   |    20 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_pcs.c   |   365 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_pcs.h   |    25 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_pmi.c   |    54 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_pmi.h   |    43 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_reset.c |    67 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_reset.h |    13 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_sbus.c  |   125 +
 .../net/ethernet/hpe/sl/core/hw/sl_core_hw_sbus.h  |    52 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_sbus_pmi.c  |   112 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_sbus_pmi.h  |    28 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_serdes.c    |   212 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_serdes.h    |    23 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_addrs.h       |    87 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_condor.h      |    12 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_core.c        |   439 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_core.h        |    12 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_serdes_fw.c |   191 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_serdes_fw.h |    15 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_lane.c        |  1085 ++
 .../hpe/sl/core/hw/sl_core_hw_serdes_lane.h        |   125 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_lane_rx.c     |   241 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_lane_tx.c     |   394 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_link.c        |   349 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_link.h        |    13 +
 .../hpe/sl/core/hw/sl_core_hw_serdes_osprey.h      |    89 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_settings.h  |    40 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_uc_ram.c    |    84 +
 .../ethernet/hpe/sl/core/hw/sl_core_hw_uc_ram.h    |    28 +
 drivers/net/ethernet/hpe/sl/core/hw/ucode/octet.h  |  9605 ++++++++++++
 drivers/net/ethernet/hpe/sl/core/hw/ucode/quad.h   |  9410 ++++++++++++
 drivers/net/ethernet/hpe/sl/core/sl_core_ldev.c    |   192 +
 drivers/net/ethernet/hpe/sl/core/sl_core_ldev.h    |    73 +
 drivers/net/ethernet/hpe/sl/core/sl_core_lgrp.c    |   659 +
 drivers/net/ethernet/hpe/sl/core/sl_core_lgrp.h    |   214 +
 drivers/net/ethernet/hpe/sl/core/sl_core_link.c    |   623 +
 drivers/net/ethernet/hpe/sl/core/sl_core_link.h    |   534 +
 drivers/net/ethernet/hpe/sl/core/sl_core_link_an.c |   166 +
 drivers/net/ethernet/hpe/sl/core/sl_core_link_an.h |    31 +
 .../net/ethernet/hpe/sl/core/sl_core_link_fec.c    |   233 +
 .../net/ethernet/hpe/sl/core/sl_core_link_fec.h    |    45 +
 drivers/net/ethernet/hpe/sl/core/sl_core_llr.c     |   350 +
 drivers/net/ethernet/hpe/sl/core/sl_core_llr.h     |   138 +
 drivers/net/ethernet/hpe/sl/core/sl_core_mac.c     |   183 +
 drivers/net/ethernet/hpe/sl/core/sl_core_mac.h     |    62 +
 drivers/net/ethernet/hpe/sl/core/sl_core_str.c     |   283 +
 drivers/net/ethernet/hpe/sl/core/sl_core_str.h     |    28 +
 .../net/ethernet/hpe/sl/ctrl/base/sl_ctrl_log.h    |    34 +
 .../ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp.c  |   164 +
 .../ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp.h  |    20 +
 .../hpe/sl/ctrl/data/sl_ctrl_data_lgrp_trace.c     |    50 +
 .../hpe/sl/ctrl/data/sl_ctrl_data_lgrp_trace.h     |    13 +
 .../ethernet/hpe/sl/ctrl/data/sl_ctrl_data_link.c  |   424 +
 .../ethernet/hpe/sl/ctrl/data/sl_ctrl_data_link.h  |    48 +
 .../ethernet/hpe/sl/ctrl/data/sl_ctrl_data_llr.c   |    64 +
 .../ethernet/hpe/sl/ctrl/data/sl_ctrl_data_llr.h   |    15 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_ldev.c    |   290 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_ldev.h    |    91 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp.c    |   351 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp.h    |    93 +
 .../net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp_notif.c  |   258 +
 .../net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp_notif.h  |    40 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link.c    |  1230 ++
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link.h    |   161 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_link_counters.c   |   388 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_link_counters.h   |   125 +
 .../net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec.c    |   202 +
 .../net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec.h    |    33 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_link_fec_priv.c   |   539 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_link_fec_priv.h   |    94 +
 .../net/ethernet/hpe/sl/ctrl/sl_ctrl_link_priv.c   |   865 ++
 .../net/ethernet/hpe/sl/ctrl/sl_ctrl_link_priv.h   |    47 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr.c     |   630 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr.h     |    69 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_llr_counters.c    |   136 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_llr_counters.h    |    57 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac.c     |   536 +
 drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac.h     |    57 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_mac_counters.c    |    56 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_mac_counters.h    |    43 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_media_counters.c  |   157 +
 .../ethernet/hpe/sl/ctrl/sl_ctrl_media_counters.h  |    53 +
 drivers/net/ethernet/hpe/sl/log/sl_log.c           |   566 +
 drivers/net/ethernet/hpe/sl/log/sl_log.h           |    67 +
 .../ethernet/hpe/sl/media/base/sl_media_eeprom.c   |   611 +
 .../ethernet/hpe/sl/media/base/sl_media_eeprom.h   |    16 +
 .../net/ethernet/hpe/sl/media/base/sl_media_log.h  |    36 +
 .../net/ethernet/hpe/sl/media/base/sl_media_work.h |    13 +
 .../hpe/sl/media/data/nic/sl_media_data_jack.c     |   496 +
 .../hpe/sl/media/data/nic/sl_media_data_jack_emu.c |    38 +
 .../hpe/sl/media/data/nic/sl_media_data_ldev.c     |    30 +
 .../hpe/sl/media/data/sl_media_data_cable_db.h     |  6896 +++++++++
 .../hpe/sl/media/data/sl_media_data_cable_db_ops.c |   111 +
 .../hpe/sl/media/data/sl_media_data_cable_db_ops.h |    13 +
 .../hpe/sl/media/data/sl_media_data_jack.c         |   344 +
 .../hpe/sl/media/data/sl_media_data_jack.h         |    92 +
 .../hpe/sl/media/data/sl_media_data_ldev.c         |   115 +
 .../hpe/sl/media/data/sl_media_data_ldev.h         |    20 +
 .../hpe/sl/media/data/sl_media_data_lgrp.c         |   127 +
 .../hpe/sl/media/data/sl_media_data_lgrp.h         |    20 +
 .../hpe/sl/media/data/sl_media_data_lgrp_trace.c   |    31 +
 .../hpe/sl/media/data/sl_media_data_lgrp_trace.h   |    12 +
 .../net/ethernet/hpe/sl/media/nic/sl_media_io.c    |    63 +
 .../net/ethernet/hpe/sl/media/nic/sl_media_jack.c  |   315 +
 .../net/ethernet/hpe/sl/media/nic/sl_media_ldev.c  |    13 +
 drivers/net/ethernet/hpe/sl/media/sl_media_io.h    |    17 +
 drivers/net/ethernet/hpe/sl/media/sl_media_jack.c  |  1067 ++
 drivers/net/ethernet/hpe/sl/media/sl_media_jack.h  |   319 +
 drivers/net/ethernet/hpe/sl/media/sl_media_ldev.c  |    22 +
 drivers/net/ethernet/hpe/sl/media/sl_media_ldev.h  |    33 +
 drivers/net/ethernet/hpe/sl/media/sl_media_lgrp.c  |   498 +
 drivers/net/ethernet/hpe/sl/media/sl_media_lgrp.h  |    99 +
 drivers/net/ethernet/hpe/sl/nic/sl_asic.h          |    35 +
 drivers/net/ethernet/hpe/sl/nic/sl_asic_csrs.h     |   215 +
 drivers/net/ethernet/hpe/sl/nic/sl_ldev.c          |   147 +
 drivers/net/ethernet/hpe/sl/nic/sl_media.c         |    53 +
 drivers/net/ethernet/hpe/sl/sl.h                   |    14 +
 drivers/net/ethernet/hpe/sl/sl_fec.c               |    68 +
 drivers/net/ethernet/hpe/sl/sl_ldev.c              |   133 +
 drivers/net/ethernet/hpe/sl/sl_ldev.h              |    25 +
 drivers/net/ethernet/hpe/sl/sl_lgrp.c              |   409 +
 drivers/net/ethernet/hpe/sl/sl_lgrp.h              |    21 +
 drivers/net/ethernet/hpe/sl/sl_link.c              |   632 +
 drivers/net/ethernet/hpe/sl/sl_link.h              |    22 +
 drivers/net/ethernet/hpe/sl/sl_llr.c               |   289 +
 drivers/net/ethernet/hpe/sl/sl_llr.h               |    20 +
 drivers/net/ethernet/hpe/sl/sl_mac.c               |   220 +
 drivers/net/ethernet/hpe/sl/sl_mac.h               |    20 +
 drivers/net/ethernet/hpe/sl/sl_media.c             |   356 +
 drivers/net/ethernet/hpe/sl/sl_media_nic.c         |    23 +
 drivers/net/ethernet/hpe/sl/sl_module.c            |   129 +
 drivers/net/ethernet/hpe/sl/sl_module.h            |    14 +
 drivers/net/ethernet/hpe/sl/sl_platform.h          |    16 +
 drivers/net/ethernet/hpe/sl/sl_test_common.h       |   105 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs.h       |   116 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_ldev.c  |   410 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_lgrp.c  |    98 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_config.c   |   438 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_lgrp_policy.c   |    53 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_link.c  |   830 ++
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_link_caps.c |   303 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_config.c   |   388 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_counters.c |  1498 ++
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_degrade.c  |   336 +
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec.c  |   148 +
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_link_fec.h  |    12 +
 .../hpe/sl/sysfs/sl_sysfs_link_fec_current.c       |   336 +
 .../hpe/sl/sysfs/sl_sysfs_link_fec_current.h       |    12 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_down.c |   316 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_down.h |    12 +
 .../hpe/sl/sysfs/sl_sysfs_link_fec_mon_check.c     |   195 +
 .../hpe/sl/sysfs/sl_sysfs_link_fec_mon_check.h     |    12 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_up.c   |   299 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_fec_up.h   |    12 +
 .../hpe/sl/sysfs/sl_sysfs_link_fec_up_check.c      |   137 +
 .../hpe/sl/sysfs/sl_sysfs_link_fec_up_check.h      |    12 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_pml_rec.c  |   193 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_link_policy.c   |   261 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_llr.c   |   221 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_llr_config.c    |   140 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_llr_counters.c  |   397 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_llr_loop_time.c |   221 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_llr_policy.c    |    74 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_mac.c   |   192 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_mac_counters.c  |   339 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_media.c |  1274 ++
 .../hpe/sl/sysfs/sl_sysfs_media_counters.c         |   599 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi.c   |    80 +
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_rd.c    |   197 +
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_pmi_wr.c    |   220 +
 drivers/net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus.c  |    89 +
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi.c  |    80 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_rd.c   |   244 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_sbus_pmi_wr.c   |   244 +
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rd.c   |   197 +
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_rst.c  |   105 +
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_sbus_wr.c   |   197 +
 .../net/ethernet/hpe/sl/sysfs/sl_sysfs_serdes.c    |   302 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_eye.c    |   197 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_eye.h    |    12 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_lol.c    |   141 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_lol.h    |    12 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_los.c    |   142 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_los.h    |    12 +
 .../hpe/sl/sysfs/sl_sysfs_serdes_settings.c        |   506 +
 .../hpe/sl/sysfs/sl_sysfs_serdes_settings.h        |    12 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_state.c  |   121 +
 .../ethernet/hpe/sl/sysfs/sl_sysfs_serdes_state.h  |    12 +
 .../hpe/sl/sysfs/sl_sysfs_serdes_swizzle.c         |   126 +
 .../hpe/sl/sysfs/sl_sysfs_serdes_swizzle.h         |    14 +
 drivers/net/ethernet/hpe/ss1/Kconfig               |    35 +
 drivers/net/ethernet/hpe/ss1/Makefile              |    28 +
 drivers/net/ethernet/hpe/ss1/cass_ats.c            |   299 +
 drivers/net/ethernet/hpe/ss1/cass_ats_inval.c      |    79 +
 drivers/net/ethernet/hpe/ss1/cass_atu.c            |  2072 +++
 drivers/net/ethernet/hpe/ss1/cass_cable.c          |   702 +
 drivers/net/ethernet/hpe/ss1/cass_cable.h          |   157 +
 drivers/net/ethernet/hpe/ss1/cass_core.c           |  1564 ++
 drivers/net/ethernet/hpe/ss1/cass_core.h           |  1472 ++
 drivers/net/ethernet/hpe/ss1/cass_cpt.c            |   585 +
 drivers/net/ethernet/hpe/ss1/cass_cq.c             |  1243 ++
 drivers/net/ethernet/hpe/ss1/cass_ct.c             |   639 +
 drivers/net/ethernet/hpe/ss1/cass_dev_info.c       |    60 +
 drivers/net/ethernet/hpe/ss1/cass_dma_buf.c        |   256 +
 drivers/net/ethernet/hpe/ss1/cass_dmac.c           |   597 +
 drivers/net/ethernet/hpe/ss1/cass_eq.c             |  1518 ++
 drivers/net/ethernet/hpe/ss1/cass_errors.c         |  1155 ++
 drivers/net/ethernet/hpe/ss1/cass_eth.c            |   702 +
 drivers/net/ethernet/hpe/ss1/cass_hmm.c            |   320 +
 drivers/net/ethernet/hpe/ss1/cass_hni.c            |   370 +
 drivers/net/ethernet/hpe/ss1/cass_irq.c            |   210 +
 drivers/net/ethernet/hpe/ss1/cass_ixe.c            |   348 +
 drivers/net/ethernet/hpe/ss1/cass_link.c           |   192 +
 drivers/net/ethernet/hpe/ss1/cass_link_misc.c      |   159 +
 drivers/net/ethernet/hpe/ss1/cass_lmon.c           |   573 +
 drivers/net/ethernet/hpe/ss1/cass_lni.c            |   404 +
 drivers/net/ethernet/hpe/ss1/cass_nta.c            |  1996 +++
 drivers/net/ethernet/hpe/ss1/cass_odp_decouple.c   |   599 +
 drivers/net/ethernet/hpe/ss1/cass_p2p.c            |   321 +
 drivers/net/ethernet/hpe/ss1/cass_p2p.h            |    69 +
 drivers/net/ethernet/hpe/ss1/cass_pcie_mon.c       |   288 +
 drivers/net/ethernet/hpe/ss1/cass_phy.c            |   224 +
 drivers/net/ethernet/hpe/ss1/cass_port_misc.c      |    68 +
 drivers/net/ethernet/hpe/ss1/cass_pt.c             |  1255 ++
 drivers/net/ethernet/hpe/ss1/cass_ptp.c            |   304 +
 drivers/net/ethernet/hpe/ss1/cass_rgid.c           |   293 +
 drivers/net/ethernet/hpe/ss1/cass_rgroup.c         |   281 +
 drivers/net/ethernet/hpe/ss1/cass_rgroup.h         |    30 +
 drivers/net/ethernet/hpe/ss1/cass_rmu.c            |   376 +
 drivers/net/ethernet/hpe/ss1/cass_rmu_eth.c        |  1017 ++
 drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.c  |   104 +
 drivers/net/ethernet/hpe/ss1/cass_rx_tx_profile.h  |    15 +
 drivers/net/ethernet/hpe/ss1/cass_sbl.c            |  1706 +++
 drivers/net/ethernet/hpe/ss1/cass_sbl.h            |   581 +
 drivers/net/ethernet/hpe/ss1/cass_sbus.c           |   172 +
 drivers/net/ethernet/hpe/ss1/cass_sl.c             |  1524 ++
 drivers/net/ethernet/hpe/ss1/cass_sl.h             |    95 +
 drivers/net/ethernet/hpe/ss1/cass_sl_io.c          |   368 +
 drivers/net/ethernet/hpe/ss1/cass_sl_io.h          |    19 +
 drivers/net/ethernet/hpe/ss1/cass_sriov.c          |  1274 ++
 drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.c    |   824 +
 drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.h    |    86 +
 drivers/net/ethernet/hpe/ss1/cass_svc.c            |  2011 +++
 drivers/net/ethernet/hpe/ss1/cass_sysfs.c          |   849 ++
 drivers/net/ethernet/hpe/ss1/cass_tc.c             |  2780 ++++
 drivers/net/ethernet/hpe/ss1/cass_telem.c          |   309 +
 drivers/net/ethernet/hpe/ss1/cass_telem_tables.h   |  3874 +++++
 drivers/net/ethernet/hpe/ss1/cass_trace.h          |    60 +
 drivers/net/ethernet/hpe/ss1/cass_uc.c             |  1933 +++
 drivers/net/ethernet/hpe/ss1/cass_vf.c             |    58 +
 drivers/net/ethernet/hpe/ss1/cass_vf.h             |    59 +
 drivers/net/ethernet/hpe/ss1/cass_vf_notif.c       |    51 +
 drivers/net/ethernet/hpe/ss1/cass_vf_notif.h       |    34 +
 drivers/net/ethernet/hpe/ss1/cuc_cxi.h             |   370 +
 drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.c   |   499 +
 drivers/net/ethernet/hpe/ss1/cxi_ac_entry_list.h   |    20 +
 drivers/net/ethernet/hpe/ss1/cxi_aux_dev.c         |   137 +
 drivers/net/ethernet/hpe/ss1/cxi_aux_dev.h         |    14 +
 drivers/net/ethernet/hpe/ss1/cxi_config.c          |  2990 ++++
 drivers/net/ethernet/hpe/ss1/cxi_config.h          |   234 +
 drivers/net/ethernet/hpe/ss1/cxi_configuration.h   |   332 +
 drivers/net/ethernet/hpe/ss1/cxi_core.c            |   281 +
 drivers/net/ethernet/hpe/ss1/cxi_core.h            |   434 +
 drivers/net/ethernet/hpe/ss1/cxi_eth.c             |   443 +
 drivers/net/ethernet/hpe/ss1/cxi_eth.h             |   352 +
 drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.c     |   206 +
 drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.h     |    26 +
 drivers/net/ethernet/hpe/ss1/cxi_eth_ioctl.c       |    44 +
 drivers/net/ethernet/hpe/ss1/cxi_eth_ops.c         |  2367 +++
 drivers/net/ethernet/hpe/ss1/cxi_ethtool.c         |   916 ++
 drivers/net/ethernet/hpe/ss1/cxi_ethtool.h         |    26 +
 drivers/net/ethernet/hpe/ss1/cxi_ethtool_names.h   |   110 +
 drivers/net/ethernet/hpe/ss1/cxi_internal.h        |    39 +
 drivers/net/ethernet/hpe/ss1/cxi_link.c            |   227 +
 drivers/net/ethernet/hpe/ss1/cxi_link.h            |    65 +
 drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.c    |   722 +
 drivers/net/ethernet/hpe/ss1/cxi_qos_profiles.h    |   149 +
 drivers/net/ethernet/hpe/ss1/cxi_rgroup.c          |  1791 +++
 drivers/net/ethernet/hpe/ss1/cxi_rgroup.h          |    68 +
 drivers/net/ethernet/hpe/ss1/cxi_rx_profile.c      |   833 ++
 drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.c    |   418 +
 drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.h    |   135 +
 .../net/ethernet/hpe/ss1/cxi_rxtx_profile_list.c   |   249 +
 .../net/ethernet/hpe/ss1/cxi_rxtx_profile_list.h   |    53 +
 drivers/net/ethernet/hpe/ss1/cxi_tx_profile.c      |   819 +
 drivers/net/ethernet/hpe/ss1/cxi_vf_cmd.h          |    52 +
 drivers/net/ethernet/hpe/ss1/pldm_cxi.h            |   374 +
 include/linux/hpe/cxi/cassini_cntr_defs.h          |  2888 ++++
 include/linux/hpe/cxi/cassini_csr_defaults.h       |   703 +
 include/linux/hpe/cxi/cassini_error_defs.h         |  9091 +++++++++++
 include/linux/hpe/cxi/cxi.h                        |   611 +
 include/linux/hpe/cxi/cxi_defs.h                   |  1506 ++
 include/linux/hpe/cxi/cxi_prov_hw.h                |  1875 +++
 include/linux/hpe/cxi/driver.h                     |   102 +
 include/linux/hpe/cxi/libcassini.h                 |  1252 ++
 include/linux/hpe/sbl/sbl.h                        |   436 +
 include/linux/hpe/sbl/sbl_an.h                     |   174 +
 include/linux/hpe/sbl/sbl_csr_common.h             |    63 +
 include/linux/hpe/sbl/sbl_fec.h                    |    88 +
 include/linux/hpe/sbl/sbl_kconfig.h                |    33 +
 include/linux/hpe/sbl/sbl_mb.h                     |    77 +
 include/linux/hpe/sbl/sbl_platform.h               |    35 +
 include/linux/hpe/sbl/sbl_pml.h                    |  1081 ++
 include/linux/hpe/sbl/sbl_test.h                   |    20 +
 include/linux/hpe/sl/sl_fec.h                      |    39 +
 include/linux/hpe/sl/sl_ldev.h                     |   140 +
 include/linux/hpe/sl/sl_lgrp.h                     |   213 +
 include/linux/hpe/sl/sl_link.h                     |   244 +
 include/linux/hpe/sl/sl_llr.h                      |    84 +
 include/linux/hpe/sl/sl_mac.h                      |    32 +
 include/linux/hpe/sl/sl_media.h                    |   191 +
 include/uapi/ethernet/cassini_user_defs.h          | 14936 +++++++++++++++++++
 include/uapi/ethernet/sbl-abi.h                    |   648 +
 include/uapi/ethernet/sbl_cassini.h                |    21 +
 include/uapi/ethernet/sbl_counters.h               |   152 +
 include/uapi/ethernet/sbl_platform_config.h        |    13 +
 include/uapi/ethernet/sbl_sbm_constants.h          |   330 +
 include/uapi/ethernet/sbl_serdes.h                 |   390 +
 include/uapi/ethernet/sbl_serdes_defaults.h        |    66 +
 include/uapi/ethernet/sbl_serdes_map.h             |    41 +
 include/uapi/ethernet/sbl_serdes_map_init.h        |    65 +
 usr/include/Makefile                               |     5 +
 416 files changed, 185137 insertions(+)
---
base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
change-id: 20261029-cxi-netdev-submission-673053a5d05e

Best regards,
--  
Doug Ledford <doug.ledford@hpe.com>

