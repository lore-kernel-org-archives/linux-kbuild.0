Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394078;
	b=yWJPSKklYIeHRi6izcqX0wIKziuG3AhzSpV1BlfYgl3OaJH9dBG5R2ZpnbSP3DT5z3z/
	 A3eOfa8U+dchW57OBh6nwJ4lRv5ssKoFYdXND0ZZdpmEf/F9qw1rBQIlmpqTvasaCH1x+
	 8p2DChRx7EmrdlNyzKdbWtZziDPAE3lVi8+NhLAyvmzU1g7hs+hd5qiboclz96y2QL/U3
	 ufbEYDq6aJ/GjqP13DnLies88c44uQH0jjYmlJ6EIzwD2SkQcyOu7tmhqmF1pFzb4Wcyc
	 gDvIIJK+z8qwmJ3Vazj8CZMovlRZ5zzP5IRUJRRxm93fyb2I3Hkv8R9MT1jsqPHNXRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394078;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xBRr2GZhxBHnHKtvtOttTc98zguohuoucwX/W+aKf9M=;
	b=ZGVKzrCNFft3ZcXbrVTIMbEik/RoFhzi+uhH0nZt7+AZQmteSiWvDGpgofo7Ov0IjTrX
	 UDMQv30Z5jZIGOJ39mflu+W3FWDUYfouJNVXppUmywNedTg85uf2VcXYYbuZ4+UZR5sMA
	 tyeiLjwoqiuUc5d5eT90/rGCluE0DqAJhVxXn1vs/C+Ek1yXLEdFIK8yVVXIscOLcDnsg
	 RS5v3U0ATqYvLT8PcosnC2bbqSZr2yaHIcV9aFPCzOw1u/H+Q3g61HilSdyT16qGv/zXh
	 Bn2w4FvLZ8ZjES6dIcIz1c5QlrpOoJSEbdiLmzrC0AnhsM06DJ+ozPZ8NIXCPkBCAlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b="B/AWfhbE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB16606A31F;
	Fri, 30 Oct 2026 21:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB16606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=B/AWfhbE
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHxgqr1536656;
	Fri, 30 Oct 2026 21:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=xB
	Rr2GZhxBHnHKtvtOttTc98zguohuoucwX/W+aKf9M=; b=B/AWfhbEKKZatNnPXc
	sUOWR3AvAb8Xpy7V4ee82Xrz3TLILJCX0D5P+kn1U1eK7kqau45vREzRzhv5WJMP
	d09sk+SJgvc2dUg1FAAS3FPg0WCP52owQydTr4NAp/Xt6NAh4vjYAlK8gWQhZrGM
	C2R3dhOLAhQVy6BrXyI0dGGm+1KSO7rONGBEuV6TleQGzJfG9burmzG2hwLpRRAz
	YHIrdlzfrcymdUR7VO5ZQSDiQTjNJHS7ngOXnr1aTyPKU6TbT/G8eGDqQgS7oYop
	rQor8rbvurTB6xK/PHwAuSGZcsc2DJuJc9Ow82xm+V5EM+gRQ9B11stwAWSH3+8s
	ZfBw==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmwj9v533-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:49 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 39C00D2A5;
	Fri, 30 Oct 2026 21:00:49 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:48 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:48 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 21:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XL9amNYoCubrSMOq35w1/CBf9UiF75XDTyPwX5sJPTJKDE6zXfVDPARAzUPGXKu881NoCkXWz2VcZgljBaYU5oU99fR+rAldGU+VCE/IeFVlnkz4RirgNcSC0kNaTtnGH2H+yZgxnU2D4SNyg2Wfa2Z5OCm4j7QuVFZs+mymH3zzMzr6GbMuX8srZuf3XJsqA/xjND7c9QPPBym2OiWu4nPe0CBwAWJaQTepv79/XMdLJVoXD6R9ao0EKfuIF5IIx4HCnJ+LHwI3VCqbCv+Gqu516GSuBZlPAHweveRylolJe2x5W2koOqRvieWByRZBZUC7pqr0tX+cWZ29aa0pcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBRr2GZhxBHnHKtvtOttTc98zguohuoucwX/W+aKf9M=;
 b=ZBKHP2pviB4TLzZCTBF16stiJ1U03gSsgFzDI5/CXjKd27CxHIZkyxxA4gUTz/5HVF+7sZ0Wx6Ef/mi0mV7mVyG4XOcGPiNhcORxngr2LBCBST7naQoPxbcI+VNSyAvbIp7H59erd2CGzhmwhgXEypapHwF+QngSOHnepLB9odY6naJZZHNoR6X0Qdym4L4CZ15KQdx/wNQrStOdYXJOF6dtyVCS9bxniAijHJeTEwFyfF0xDPuDYcmC5upg6ugMxZZyqsC21pAI/xX5s6QFT3fgQKXSU+xK7qmQ4F4A8wUm95RA9BtKKMgHBjzGYodLOgf565zWXz3+38aV6wkRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:41 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:41 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:09 -0700
Subject: [PATCH 13/23] net: hpe: sl: add media and cable handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-13-8c2c391cc283@hpe.com>
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
        "Mamila
 Santosh" <santosh-kumar.mamila@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: CH0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:610:b0::23) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 702d3196-c3d5-4b91-b486-08df36c8db29
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|921020|56012099006|5023799004|261021121427099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261026140227099003|261021133027099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003|261009221227099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: uP6inkd2Tq7xhCESv6z1TozBDSo1kFfqzG/Hf/MH2B3zn80g5jQHn/NE0zu0MuJtJiXFo1hUNE+O5wLyJ8XtYpdSUfp7kTQ+yxIjvJMjXY2x1q36nB5HMxCbjpj/kCtnQ0NaHQAxqDgRQ6VPf04sQ9PgjnXwUrU7N3IQrcw1BIC9cuMeDrsNqEWL5vxf8l9WEDNJiCy9l4+L2WBZ/WaRFgJKaEDEJPUq7IW9+l4PtzOpjlJD5WKjFLvMY/7p5sifQXwGz8hAfcPK7gaGqyDZYA0bwC6zsTJ3jo7krrb5hFi7K+5AvVkT/cnnOc+Eh8oaeNLTlI7sUajaCmK1QwDFcPJMYL2nbHQSt1jKwOMrRb+GSpsArBNAd5QHGiqT0OJuJZ2s1zxFVbJ+Zs9+0b9+KkE5y+raIp/WUnVgA8gafmWHDzZd5/YZvUhnVF34N4miNFwqdL0uLm58CyirPqN9yfnrmL96Ysa41yyulq2tMPeFuybYhKVzdTHEaNfMs084d8Fu/QSA4Wvj8CfuWHHHRXXMhp0RSgKfpR1uAL1rCsXKKonHK1McZCKBH9x1yJvkT+wvCGVmj1QtAZPQljOcuS91ZStfVJgW2XMQw9W9X8LXv/AvxDk6CXdEKl2ztMe4PXp3O+J6pLKP2Jky6KUi3trW61gEq9wSb/cnwvG4yqLBDqFFCPgJquwY45kHB+xamwCIcV3UDFsC6gA8aNzBUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(5023799004)(261021121427099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261026140227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003)(261009221227099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTZBbDZEdUl3OVFhTktDb1VjcDh4TWxCVnJ0QTJ2Zi9yRFBGb2hVdVJxb2JZ?=
 =?utf-8?B?OWVSb3FiUmo3eG01SzFZYS9OZmVjTG01NmxsNmZ4eXFOY1lHQzZZL2trMjdr?=
 =?utf-8?B?NHZMSUxZbmJrN2E3TWxPWkZENUhnTzlXS25uVlVEc2xyLzdjbWJiem5mUkU1?=
 =?utf-8?B?OXp0ck4zT0ZCZUEzeXpwTjhLRzlMUTl1K2krQmlUZTJ6V3Jab253T3NHS2lR?=
 =?utf-8?B?UGU5OEpXZmFsSDVzSThiYy9NOVl0enowTWx3MWdYMC9GaWEybVlsait4Um9T?=
 =?utf-8?B?WUFSZDJPV0JYL2pML2FNTVdFQm5BdlJ0Rm9MSlNZQWM1NnpxdWl3M0MvQWw3?=
 =?utf-8?B?L3BoRW5KOWlQL2cyaXJRTDM3SlBjblB6SmgyNjBRakJXRFpFK0ZiaW9hN0oy?=
 =?utf-8?B?RjBzUER6ZVVNOXJ0Q1RhODFnSnJGU2ZhYkIwOUVwc3p3cTRhNForZGxvYmoy?=
 =?utf-8?B?UHNtb1RybmZGcHU2T3FmOVpmbVJZSXhQRUkvT2M5Tk8wTTlKZUxJWTJzUEsr?=
 =?utf-8?B?RUFCTEhSdGhZV1ZMbXV2alpHdC8yYVFxclRkS3g2cDMybXNscWtmWVltTGl3?=
 =?utf-8?B?ZW5xSEFLQ254by9YNllvTVVtV3dmSkN0VjI5Z3dGRDd6dlhyT0VFdEpZZ0tq?=
 =?utf-8?B?V2RXV21DRG5sVDJZdDV1YzEyckdjYXY2TTQzVEtGMXZSWHFGa1cya1BjM29H?=
 =?utf-8?B?RnFjZDUvVUhvVzlhbTNHTXhQcmR3RXZkZkdJRldsQ3BFY1k3NWovYVd5Wll0?=
 =?utf-8?B?MHZTdDE0NWo3blRUMkYrcklmSGNSNzcrVmRyMmZWdXc3NmI2bmg3VVZaUEtW?=
 =?utf-8?B?QmxoaGNhRkkwM1lZWFQ2Wlh6bjM3akxhVTJFd0pMNTN4amN5VnVmUldZdE9j?=
 =?utf-8?B?T2JBOVJFWmdPdmdjcGxqaXNLUjFPdk14QUQ1SmxQSCtnREhQd1JMSlpFV042?=
 =?utf-8?B?UXhoTmpidUNCaW9mVkVNalBWd1NGOFFrUEhLZUdCMnNLUkdCcmdRQnhMa1RY?=
 =?utf-8?B?akxrWkhzbk9DTTJjdENtcGhDN014RFFOSUtXK2FYMWd0c2VObzZadHB5aDlK?=
 =?utf-8?B?UWd0ZFcxM3RRTVJ3VTNFdGU0OUh2cGxrS3JQS3kwaC9vY0c4UVJqUnBsbXdF?=
 =?utf-8?B?MFhGR3BjeUV1SzJTZmwydk94aElCaTRDOTA1VzlzNlVLNmsyTCsrYzJKYktE?=
 =?utf-8?B?VU5zWGdXMkF0eE1YRHE4NmYxQmo5S0IrY0xWQWpyUzk5OXJnZ3FIaFZoNjJP?=
 =?utf-8?B?M0tRNUpnQnRDOUN2empheDViTmhTKzArbEZld2hKZnlINmN5TDRRMDFSWjgw?=
 =?utf-8?B?MnZlN2dQNWVub3FXQnVXQzBCcS92TW1NTHNWcDQ5T2tySE1sd0Q4elJuYVZ1?=
 =?utf-8?B?dWRxSDcrTmRZQ0FtUkpYTmNJaVFFT0p1eVU4YUE0aFV0RzVwUjZ0a0c2alpi?=
 =?utf-8?B?b3UxS0xoazhNblZWQnNCa1BYZFVTRDB5enZzNXNuMEJWcWpENTZTUXBwNUlO?=
 =?utf-8?B?bmYyRC9Ia0JGSW1pVVBsOWgxSWRPZ3NnVlZDU0M2Z3V6RjZDdlVHcTNQaW4y?=
 =?utf-8?B?bFpSWWNqTEo3bWYrZTFuc2VuckVPeVJUUTRrZWk5bi9ub2VZOTZEclppYm1I?=
 =?utf-8?B?QjI3NUo2UGkyOTlMdHVLSC9jNXRpR0dxUTlEdlFOM3ZiZkJIcGJwajF3bnRz?=
 =?utf-8?B?cmxBTVNXeUxJaU9tQk9HMVJ3SUloZ21mQ1VqeGFiNFlJNWc0N0paYTlpdkwz?=
 =?utf-8?B?alhmRWoxVEJqcWdWNHdKTTFkNjVjUEZjVVMxZU5pdVlGOC9jbXRBQ1RYKzlq?=
 =?utf-8?B?dVJTQmxhSTMxdzVaT1hlR1oxTEdQVUN4ZGZWMUZUdm1sbnB5OCszc25HUDVl?=
 =?utf-8?B?ODBVSzQzSHRMNmZFQjcrZEJBRmZ6V1JnZkdFUnRTeWd3Wno0dlhVMFdNZkI0?=
 =?utf-8?B?ZHJ1THI1ZDhyR0VrQzFFY2dYT3FBTzl5bzkyNndQWjZ6cG1aOWQ5cjl5am55?=
 =?utf-8?B?RE42QmtNbmN6SnJaSHYzNjNQZWJ2dzVTK24zeENmWFpXbjVMN3Y4T1BTVU1p?=
 =?utf-8?B?WGVxa0tzQ051bjBOSTc0Y1FvT1lVNGdrblE5aURWUjNDblZzL0QyZ1VIenAw?=
 =?utf-8?B?eEVOdkhVQ2JXaERxSVIzMmdqdVJRSGRqdjVCcWs5d2xwRWUxYTBqR2h2VEZm?=
 =?utf-8?B?ZEFBYksyYmtMN2s3ZWJHclI0TjJFblFtVll4aTNUWlpQQ0t6UHE0VXNob3Vl?=
 =?utf-8?B?cFJpZmxhR0JBNER4TXhGS2xsL0dDdkJwK3VlZE9iaVk5c3BSS0E1eWdDOE1T?=
 =?utf-8?B?emkrcFRGdW9sQTJVSjdUWktCMDJkVXBCSzJHenpoYmZEWVVPcWx1UT09?=
X-Exchange-RoutingPolicyChecked: QwlY47EZjY0PSqwBEjEVzCbPenMyNVcU+K1SusfhpVsolBbw34B/Xx/Vo1NNeAZonWkWPSBxHgio7HOLoT6UqR50HX+kqVQ/zdkF6HwGuEkDxSZWf3u1ZWnTunmpxWv0CPXZFB4W95Z2YTFc899+6doDvqD9H2ivubVLvYnaxXnJpKl1q0/ctJCBGTOGwBKirhKNDnhSWYVqOa9vOlRMrWA3bGQJozS8US7xGLgj+MmPIi/I3g0u4uIqEN2UkAm10uSuSNtY8yBOWrDUDaBHZJLow/X/HW+NAQWYli/t9vuoYzzV3NcUfN57FvZt1IAdf53XpYq9Y+CtEUbjIkYsNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 702d3196-c3d5-4b91-b486-08df36c8db29
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:41.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIYAHGcszLFaUizNIB8mezZZyxixJW5C3B7p6I+ucNZak5SyBNXt5v/sKQTbJRwWYelO3yHKBhxqrKqJgv8Now==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: dU9eXnkX_n6fc1FXjlOriZAz8Xa_Or92
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX4JhYphrXFI8C
 TSE1eR4iyUYIrgwAMVyskf1NIaBcp6TH5JROOR9xNqk384sc95U8SzNK4S/3Ag/QtpKdsd+xotR
 pTy7QndgNUucYSNxr2cceRf1mCVqe/k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX4eCksjnDj8Hl
 adGHbovmdexlyuTven9bxpFxBQnAIvhgCzFIog8erIvbrRKvtRucji7bkWb0pLpoiDxrdOMNX73
 nr8MQHFASHydAaSwpbyKoz60LWLg4YB0xrQXTsaSyRD0rmUEIqoz5NqPpeJOuJyTQH/mI8y2CpX
 IljzfIpVEsaRxroknN180+qL/WB8dbRCEMFPm/VK/9oUTGFEjvSb52KXtMScRalf8+vGnRDhnEv
 l3wBUFbxvLXVeS+Xys9ybAtzabmBiFkHkbKGRaKUAEa58Zl2FvdnzAT0hjuNtfLXDEymzqm+mAi
 nEj/jBaLDJDuw0LgoZ5EIRnvvRKYs2uAOGyP6RXyLrLcCSVPuJRA8EtYc0getOGtHZiyL0yBwbd
 GmDsQWWJTG388/qSIYuDS+9NKzpaS3yo4jNMD9j6VoHAt74y6QBxCp/7A5lKZ7RmRxLxq5jw+jW
 fNv/fd5pLF8jid46FhQ==
X-Authority-Analysis: v=2.4 cv=bKGDs/+Z c=1 sm=1 tr=0 ts=6ae50581 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ay80y3fxfMS_JZZz1qJy:22 a=MvuuwTCpAAAA:8 a=oPDcsV5zAAAA:8
 a=LCAnrB7BMdWhVdc1Wu8A:9 a=UO5Xvd6sF9_3KjH3:21 a=QEXdDO2ut3YA:10
 a=nha20LbOgcfWf79Gid5B:22
X-Proofpoint-GUID: dU9eXnkX_n6fc1FXjlOriZAz8Xa_Or92
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add cable and media handling: EEPROM parsing, the cable database,
per-jack data, and the emulated jack used when no real media is
present.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (164), LONG_LINE_STRING (21), LONG_LINE_COMMENT
  (2), BRACES (1)
- CHECK: UNNECESSARY_PARENTHESES (27), ALLOC_SIZEOF_STRUCT (3), BRACES
  (2), COMPARISON_TO_NULL (1)

Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 .../ethernet/hpe/sl/media/base/sl_media_eeprom.c   |  611 +++++++++++
 .../hpe/sl/media/data/nic/sl_media_data_jack.c     |  496 +++++++++
 .../hpe/sl/media/data/nic/sl_media_data_jack_emu.c |   38 +
 .../hpe/sl/media/data/nic/sl_media_data_ldev.c     |   30 +
 .../hpe/sl/media/data/sl_media_data_cable_db_ops.c |  111 ++
 .../hpe/sl/media/data/sl_media_data_jack.c         |  344 +++++++
 .../hpe/sl/media/data/sl_media_data_ldev.c         |  115 +++
 .../hpe/sl/media/data/sl_media_data_lgrp.c         |  127 +++
 .../hpe/sl/media/data/sl_media_data_lgrp_trace.c   |   31 +
 .../net/ethernet/hpe/sl/media/nic/sl_media_io.c    |   63 ++
 .../net/ethernet/hpe/sl/media/nic/sl_media_jack.c  |  315 ++++++
 .../net/ethernet/hpe/sl/media/nic/sl_media_ldev.c  |   13 +
 drivers/net/ethernet/hpe/sl/media/sl_media_jack.c  | 1067 ++++++++++++++++++++
 drivers/net/ethernet/hpe/sl/media/sl_media_ldev.c  |   22 +
 drivers/net/ethernet/hpe/sl/media/sl_media_lgrp.c  |  498 +++++++++
 15 files changed, 3881 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sl/media/base/sl_media_eeprom.c b/drivers/net/ethernet/hpe/sl/media/base/sl_media_eeprom.c
new file mode 100644
index 000000000000..80113ec4860d
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/base/sl_media_eeprom.c
@@ -0,0 +1,611 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/slab.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "sl_media_eeprom.h"
+#include "sl_media_lgrp.h"
+#include "sl_media_jack.h"
+#include "base/sl_media_log.h"
+#include "data/sl_media_data_cable_db.h"
+
+#define LOG_NAME SL_MEDIA_EEPROM_LOG_NAME
+
+static void sl_media_eeprom_appsel_info_store(struct sl_media_jack *media_jack, u8 host_interface,
+					      unsigned long *speeds_map, u8 appsel_num, u8 lane_count)
+{
+	switch (host_interface) {
+	case SL_MEDIA_SS1_HOST_INTERFACE_50GAUI_1_C2M:
+	case SL_MEDIA_SS1_HOST_INTERFACE_50GBASE_CR:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CD_50G;
+		break;
+	case SL_MEDIA_SS1_HOST_INTERFACE_100GAUI_2_C2M:
+	case SL_MEDIA_SS1_HOST_INTERFACE_100GBASE_CR2:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CD_100G;
+		break;
+	case SL_MEDIA_SS2_HOST_INTERFACE_100GBASE_CR1:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BJ_100G;
+		fallthrough;
+	case SL_MEDIA_SS2_HOST_INTERFACE_100GAUI_1_L_C2M:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CK_100G;
+		break;
+	case SL_MEDIA_SS1_HOST_INTERFACE_200GBASE_CR4:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BS_200G;
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BJ_100G;
+		break;
+	case SL_MEDIA_SS1_HOST_INTERFACE_200GAUI_4_C2M:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BS_200G;
+		media_jack->appsel_num_200_gaui = appsel_num;
+		media_jack->lane_count_200_gaui = lane_count;
+		media_jack->host_interface_200_gaui = host_interface;
+		break;
+	case SL_MEDIA_SS2_HOST_INTERFACE_200GBASE_CR2:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BJ_100G;
+		fallthrough;
+	case SL_MEDIA_SS2_HOST_INTERFACE_200GAUI_2_S_C2M:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CK_200G;
+		break;
+	case SL_MEDIA_SS2_HOST_INTERFACE_400GBASE_CR4:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BJ_100G;
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
+		break;
+	case SL_MEDIA_SS2_HOST_INTERFACE_400GAUI_4_S_C2M:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
+		if (media_jack->appsel_num_400_gaui) /* we prefer 4_l_c2m over 4_s_c2m for default ck400G speed */
+			break;
+		media_jack->appsel_num_400_gaui = appsel_num;
+		media_jack->lane_count_400_gaui = lane_count;
+		media_jack->host_interface_400_gaui = host_interface;
+		break;
+	case SL_MEDIA_SS1_HOST_INTERFACE_400GAUI_4_L_C2M:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
+		media_jack->appsel_num_400_gaui = appsel_num;
+		media_jack->lane_count_400_gaui = lane_count;
+		media_jack->host_interface_400_gaui = host_interface;
+		fallthrough;
+	case SL_MEDIA_SS1_HOST_INTERFACE_400GBASE_CR8:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BS_200G;
+		fallthrough;
+	case SL_MEDIA_SS1_HOST_INTERFACE_CAUI_4_C2M:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BJ_100G;
+		break;
+	case SL_MEDIA_SS2_HOST_INTERFACE_800GBASE_CR8:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BJ_100G;
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CK_800G;
+		break;
+	case SL_MEDIA_SS2_HOST_INTERFACE_800GAUI_8_S_C2M:
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
+		*speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CK_800G;
+		if (!media_jack->host_interface_400_gaui) {
+			media_jack->appsel_num_400_gaui = appsel_num;
+			media_jack->host_interface_400_gaui = host_interface;
+		}
+		break;
+	default:
+		sl_media_log_dbg(media_jack, LOG_NAME,
+				 "invalid host interface (0x%x)", host_interface);
+	}
+}
+
+#define APPSEL_PAGE0_START_OFFSET 86
+#define APPSEL_PAGE1_START_OFFSET 223
+#define APPSEL_STRIDE             4
+#define APPSEL_END                0xFF
+#define APPSEL_LAST_PAGE0         114
+#define APPSEL_LAST_PAGE1         247
+#define APPSEL_LANE_COUNT_OFFSET  2
+static int sl_media_eeprom_appsel_info_get(struct sl_media_jack *media_jack, unsigned long *speeds_map)
+{
+	u8  host_interface;
+	u8  appsel_curr;
+	u8  appsel_num;
+
+	appsel_curr = APPSEL_PAGE0_START_OFFSET;
+	appsel_num = 1;
+	while (appsel_curr <= APPSEL_LAST_PAGE0) {
+		host_interface = media_jack->eeprom_page0[appsel_curr];
+		if (host_interface == APPSEL_END)
+			return 0;
+		sl_media_eeprom_appsel_info_store(media_jack, host_interface, speeds_map, appsel_num,
+						  media_jack->eeprom_page0[appsel_curr + APPSEL_LANE_COUNT_OFFSET]);
+		appsel_curr += APPSEL_STRIDE;
+		appsel_num++;
+	}
+
+	appsel_curr = APPSEL_PAGE1_START_OFFSET;
+	while (appsel_curr <= APPSEL_LAST_PAGE1) {
+		host_interface = media_jack->eeprom_page1[appsel_curr];
+		if (host_interface == APPSEL_END)
+			return 0;
+		sl_media_eeprom_appsel_info_store(media_jack, host_interface, speeds_map, appsel_num,
+						  media_jack->eeprom_page1[appsel_curr + APPSEL_LANE_COUNT_OFFSET]);
+		appsel_curr += APPSEL_STRIDE;
+		appsel_num++;
+	}
+
+	return 0;
+}
+
+static int sl_media_eeprom_furcation_get(struct sl_media_jack *media_jack, u32 *furcation)
+{
+	*furcation = SL_MEDIA_FURCATION_X1;
+	return 0;
+}
+
+#define CMIS_CONNECTOR_TYPE_OFFSET    203
+#define CMIS_CONNECTOR_POC_SR8        0x28
+#define CMIS_CONNECTOR_POC_SR4        0x0C
+#define SFF8436_CONNECTOR_TYPE_OFFSET 130
+#define SFF_CONNECTOR_AOC             0x23
+static bool sl_media_eeprom_is_type_poc(struct sl_media_jack *media_jack, u8 format)
+{
+	if (format == SL_MEDIA_MGMT_IF_CMIS) {
+		switch (media_jack->eeprom_page0[CMIS_CONNECTOR_TYPE_OFFSET]) {
+		case CMIS_CONNECTOR_POC_SR8:
+		case CMIS_CONNECTOR_POC_SR4:
+			return true;
+		default:
+			return false;
+		}
+	}
+
+	/* SFF */
+	switch (media_jack->eeprom_page0[SFF8436_CONNECTOR_TYPE_OFFSET]) {
+	case SFF_CONNECTOR_AOC:
+		return false;
+	default:
+		return true;
+	}
+}
+
+#define CMIS_TYPE_OFFSET    212
+#define CMIS_MEDIA_AOC      0x00
+#define CMIS_MEDIA_PEC      0x0A
+#define CMIS_MEDIA_AEC      0x0C
+#define CMIS_MEDIA_ACC      0x0F
+#define SFF8436_TYPE_OFFSET 147
+#define SFF_MEDIA_AOC       0x00
+#define SFF_MEDIA_PEC       0xA0
+#define SFF_MEDIA_AEC       0xC0
+static int sl_media_eeprom_type_get(struct sl_media_jack *media_jack, u8 format, u32 vendor, u32 *type)
+{
+	u8 media;
+
+	if (format == SL_MEDIA_MGMT_IF_CMIS) {
+		media = media_jack->eeprom_page0[CMIS_TYPE_OFFSET];
+		switch (media) {
+		case CMIS_MEDIA_AOC:
+			if (sl_media_eeprom_is_type_poc(media_jack, format))
+				*type = SL_MEDIA_TYPE_POC;
+			else
+				*type = SL_MEDIA_TYPE_AOC;
+			break;
+		case CMIS_MEDIA_PEC:
+			*type = SL_MEDIA_TYPE_PEC;
+			break;
+		case CMIS_MEDIA_AEC:
+			*type = SL_MEDIA_TYPE_AEC;
+			break;
+		case CMIS_MEDIA_ACC:
+			/* compensate for Molex type programming issue */
+			if (vendor == SL_MEDIA_VENDOR_MOLEX)
+				*type = SL_MEDIA_TYPE_AEC;
+			else
+				*type = SL_MEDIA_TYPE_ACC;
+			break;
+		default:
+			*type = SL_MEDIA_TYPE_UNSUPPORTED;
+		}
+	} else {
+		media = media_jack->eeprom_page0[SFF8436_TYPE_OFFSET];
+		switch (media) {
+		case SFF_MEDIA_AOC:
+			if (sl_media_eeprom_is_type_poc(media_jack, format))
+				*type = SL_MEDIA_TYPE_POC;
+			else
+				*type = SL_MEDIA_TYPE_AOC;
+			break;
+		case SFF_MEDIA_PEC:
+			*type = SL_MEDIA_TYPE_PEC;
+			break;
+		case SFF_MEDIA_AEC:
+			*type = SL_MEDIA_TYPE_AEC;
+			break;
+		default:
+			*type = SL_MEDIA_TYPE_UNSUPPORTED;
+		}
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "type get (media = 0x%X, type = 0x%X %s)",
+			 media, *type, sl_media_type_str(*type));
+
+	return 0;
+}
+
+#define CMIS_VENDOR_OFFSET      129
+#define SFF8436_VENDOR_OFFSET   148
+#define VENDOR_NAME_MAX_LEN     32
+struct vendor {
+	char name[VENDOR_NAME_MAX_LEN];
+	u32  type;
+};
+
+static const struct vendor vendor_list[] = {
+	{ .name = "TE Connectivity",
+	  .type = SL_MEDIA_VENDOR_TE },
+	{ .name = "Hisense",
+	  .type = SL_MEDIA_VENDOR_HISENSE },
+	{ .name = "FINISAR CORP",
+	  .type = SL_MEDIA_VENDOR_FINISAR },
+	{ .name = "Bizlink",
+	  .type = SL_MEDIA_VENDOR_BIZLINK },
+	{ .name = "Cloud Light",
+	  .type = SL_MEDIA_VENDOR_CLOUD_LIGHT },
+	{ .name = "Molex",
+	  .type = SL_MEDIA_VENDOR_MOLEX },
+	{ .name = "MULTILANE",
+	  .type = SL_MEDIA_VENDOR_MULTILANE },
+	{ .name = "Amphenol",
+	  .type = SL_MEDIA_VENDOR_AMPHENOL },
+};
+
+static int sl_media_eeprom_vendor_get(struct sl_media_jack *media_jack, u8 format, u32 *vendor)
+{
+	const char *vendor_ptr;
+	int         x;
+
+	if (format == SL_MEDIA_MGMT_IF_CMIS)
+		vendor_ptr = &(media_jack->eeprom_page0[CMIS_VENDOR_OFFSET]);
+	else
+		vendor_ptr = &(media_jack->eeprom_page0[SFF8436_VENDOR_OFFSET]);
+
+	for (x = 0; x < ARRAY_SIZE(vendor_list); ++x) {
+		if (strnstr(vendor_ptr, vendor_list[x].name, VENDOR_NAME_MAX_LEN) == NULL)
+			continue;
+		*vendor = vendor_list[x].type;
+		sl_media_log_dbg(media_jack, LOG_NAME,
+				 "vendor get (vendor = %u %s)", *vendor, sl_media_vendor_str(*vendor));
+		return 0;
+	}
+
+	*vendor = 0;
+
+	sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_EEPROM_VENDOR_UNSUPPORTED);
+	sl_media_log_err_trace(media_jack, LOG_NAME, "eeprom vendor get unsupported");
+
+	return 0;
+}
+
+static bool is_valid_char(char c)
+{
+	return c >= 33 && c <= 126;
+}
+
+#define CMIS_VENDOR_PN_OFFSET 148
+#define SFF_VENDOR_PN_OFFSET  168
+static int sl_media_eeprom_vendor_pn_str_get(struct sl_media_jack *media_jack, u8 format, char *vendor_pn_str)
+{
+	int x;
+	int pos;
+	u8  vendor_pn_offset;
+
+	if (format == SL_MEDIA_MGMT_IF_CMIS)
+		vendor_pn_offset = CMIS_VENDOR_PN_OFFSET;
+	else
+		vendor_pn_offset = SFF_VENDOR_PN_OFFSET;
+
+	pos = 0;
+	memset(vendor_pn_str, 0, SL_MEDIA_VENDOR_PN_SIZE);
+	for (x = 0; x < SL_MEDIA_VENDOR_PN_SIZE - 1; ++x) {
+		if (is_valid_char(media_jack->eeprom_page0[vendor_pn_offset + x])) {
+			vendor_pn_str[pos] = media_jack->eeprom_page0[vendor_pn_offset + x];
+			pos++;
+		}
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "vendor part num get (par_num = %s)", vendor_pn_str);
+
+	return 0;
+}
+
+#define HPE_PN_OFFSET 229
+static int sl_media_eeprom_hpe_pn_get(struct sl_media_jack *media_jack, u32 *hpe_pn, char *hpe_pn_str)
+{
+	const char *pn_ptr;
+	int         i;
+	int         counter;
+
+	counter = 0;
+	for (i = 0; i < SL_MEDIA_HPE_PN_SIZE - 1; ++i) {
+		if (is_valid_char(media_jack->eeprom_page0[HPE_PN_OFFSET + i])) {
+			hpe_pn_str[counter] = media_jack->eeprom_page0[HPE_PN_OFFSET + i];
+			counter++;
+		}
+	}
+	hpe_pn_str[counter] = '\0';
+
+	pn_ptr = &(media_jack->eeprom_page0[HPE_PN_OFFSET]);
+	for (i = 0; i < SL_MEDIA_HPE_PN_SIZE - 1; ++i) {
+		if (pn_ptr[i] < 48 || pn_ptr[i] > 57) /* if the PN character is not numeric, ignore it */
+			continue;
+		*hpe_pn = *hpe_pn * 10 + (pn_ptr[i] - '0');
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "hpe part num get (hpe_pn = %s)", hpe_pn_str);
+
+	return 0;
+}
+
+#define CMIS_SERIAL_NUM_OFFSET 166
+#define SFF_SERIAL_NUM_OFFSET  196
+static int sl_media_eeprom_serial_num_get(struct sl_media_jack *media_jack, u8 format, char *serial_num_str)
+{
+	int i;
+	int counter;
+	u8  serial_num_offset;
+
+	if (format == SL_MEDIA_MGMT_IF_CMIS)
+		serial_num_offset = CMIS_SERIAL_NUM_OFFSET;
+	else
+		serial_num_offset = SFF_SERIAL_NUM_OFFSET;
+
+	counter = 0;
+	memset(serial_num_str, '\0', SL_MEDIA_SERIAL_NUM_SIZE);
+	for (i = 0; i < (SL_MEDIA_SERIAL_NUM_SIZE - 1); ++i) {
+		if (media_jack->eeprom_page0[serial_num_offset + i] == '-')
+			break;
+
+		if (is_valid_char(media_jack->eeprom_page0[serial_num_offset + i])) {
+			serial_num_str[counter] = media_jack->eeprom_page0[serial_num_offset + i];
+			counter++;
+		}
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "serial num get (serial_num = %s)", serial_num_str);
+
+	return 0;
+}
+
+#define CMIS_DATE_CODE_OFFSET 182
+#define SFF_DATE_CODE_OFFSET  212
+static int sl_media_eeprom_date_code_get(struct sl_media_jack *media_jack, u8 format, char *date_code_str)
+{
+	u8 date_code_offset;
+
+	if (format == SL_MEDIA_MGMT_IF_CMIS)
+		date_code_offset = CMIS_DATE_CODE_OFFSET;
+	else
+		date_code_offset = SFF_DATE_CODE_OFFSET;
+
+	date_code_str[0] = media_jack->eeprom_page0[date_code_offset];
+	date_code_str[1] = media_jack->eeprom_page0[date_code_offset + 1];
+	date_code_str[2] = '-';
+	date_code_str[3] = media_jack->eeprom_page0[date_code_offset + 2];
+	date_code_str[4] = media_jack->eeprom_page0[date_code_offset + 3];
+	date_code_str[5] = '-';
+	date_code_str[6] = media_jack->eeprom_page0[date_code_offset + 4];
+	date_code_str[7] = media_jack->eeprom_page0[date_code_offset + 5];
+	date_code_str[8] = '\0';
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "date code get (date = %s)", date_code_str);
+
+	return 0;
+}
+
+#define FIRMWARE_VERSION_OFFSET 39
+static int sl_media_eeprom_fw_ver_get(struct sl_media_jack *media_jack, u8 *fw_ver)
+{
+	fw_ver[0] = media_jack->eeprom_page0[FIRMWARE_VERSION_OFFSET];
+	fw_ver[1] = media_jack->eeprom_page0[FIRMWARE_VERSION_OFFSET + 1];
+
+	return 0;
+}
+
+#define CABLE_END_OFFSET 240
+static int sl_media_eeprom_cable_end_get(struct sl_media_jack *media_jack)
+{
+	media_jack->cable_end = media_jack->eeprom_page0[CABLE_END_OFFSET];
+
+	return 0;
+}
+
+#define CMIS_LENGTH_OFFSET    202
+#define SFF8436_LENGTH_OFFSET 146
+static int sl_media_eeprom_length_get(struct sl_media_jack *media_jack, u8 format, u32 *length)
+{
+	if (format == SL_MEDIA_MGMT_IF_CMIS) {
+		*length = (media_jack->eeprom_page0[CMIS_LENGTH_OFFSET] & 0x3F);
+		switch (media_jack->eeprom_page0[CMIS_LENGTH_OFFSET] & 0xC0) {
+		case 0:
+			*length *= 10;
+			break;
+		case 0x40:
+			*length *= 100;
+			break;
+		case 0x80:
+			*length *= 1000;
+			break;
+		case 0xC0:
+			*length *= 10000;
+			break;
+		default:
+			*length = 0;
+			break;
+		}
+	} else {
+		*length = media_jack->eeprom_page0[SFF8436_LENGTH_OFFSET] * 100;
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "length get (length = %ucm)", *length);
+
+	return 0;
+}
+
+#define SUPPORTED_FLAGS_ADVERTISEMENT_OFFSET 157
+static void sl_media_eeprom_supported_flags_advertised_get(struct sl_media_jack *media_jack,
+							   u8 *supported_flags_advertised)
+{
+	spin_lock(&media_jack->data_lock);
+	memcpy(supported_flags_advertised, &media_jack->eeprom_page1[SUPPORTED_FLAGS_ADVERTISEMENT_OFFSET],
+	       SL_MEDIA_SUPPORTED_FLAGS_ADVERTISED_SIZE);
+	spin_unlock(&media_jack->data_lock);
+}
+
+bool sl_media_eeprom_is_fw_version_supported(struct sl_media_jack *media_jack, struct sl_media_attr *media_attr)
+{
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "is fw version supported (type = 0x%X %s, shape = %u %s, end = %u %s, idx = %d)",
+			 media_attr->type, sl_media_type_str(media_attr->type),
+			 media_attr->shape, sl_media_shape_str(media_attr->shape),
+			 media_jack->cable_end, sl_media_cable_end_str(media_jack->cable_end),
+			 media_jack->cable_db_idx);
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "is fw version supported (fw_ver = %02X.%02X, db_fw_ver = %02X.%02X, db_split_fw_ver = %02X.%02X)",
+			 media_attr->fw_ver[0], media_attr->fw_ver[1],
+			 cable_db[media_jack->cable_db_idx].fw_ver.major,
+			 cable_db[media_jack->cable_db_idx].fw_ver.minor,
+			 cable_db[media_jack->cable_db_idx].fw_ver.split_major,
+			 cable_db[media_jack->cable_db_idx].fw_ver.split_minor);
+
+	if (media_attr->shape == SL_MEDIA_SHAPE_SPLITTER && media_jack->cable_end != SL_MEDIA_CABLE_END_DD)
+		return ((media_attr->fw_ver[0] > cable_db[media_jack->cable_db_idx].fw_ver.split_major) ||
+			((media_attr->fw_ver[0] == cable_db[media_jack->cable_db_idx].fw_ver.split_major) &&
+			(media_attr->fw_ver[1] >= cable_db[media_jack->cable_db_idx].fw_ver.split_minor)));
+
+	return ((media_attr->fw_ver[0] > cable_db[media_jack->cable_db_idx].fw_ver.major) ||
+		((media_attr->fw_ver[0] == cable_db[media_jack->cable_db_idx].fw_ver.major) &&
+		(media_attr->fw_ver[1] >= cable_db[media_jack->cable_db_idx].fw_ver.minor)));
+}
+
+int sl_media_eeprom_target_fw_ver_str_get(struct sl_media_jack *media_jack, char *target_fw_str, size_t target_fw_size)
+{
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "target fw ver get (idx = %u, type = 0x%X %s, shape = %u %s, end = %u %s, supported = %s)",
+			 media_jack->cable_db_idx,
+			 media_jack->cable_info[0].media_attr.type,
+			 sl_media_type_str(media_jack->cable_info[0].media_attr.type),
+			 media_jack->cable_info[0].media_attr.shape,
+			 sl_media_shape_str(media_jack->cable_info[0].media_attr.shape),
+			 media_jack->cable_end,
+			 sl_media_cable_end_str(media_jack->cable_end),
+			 media_jack->is_cable_unsupported ? "no" : "yes");
+
+	if (!SL_MEDIA_LGRP_MEDIA_TYPE_IS_ACTIVE(media_jack->cable_info[0].media_attr.type)) {
+		snprintf(target_fw_str, target_fw_size, "invalid-type\n");
+		return 0;
+	}
+
+	if (media_jack->is_cable_unsupported) {
+		snprintf(target_fw_str, target_fw_size, "unsupported\n");
+		return 0;
+	}
+
+	if (media_jack->is_supported_ss200_cable) {
+		snprintf(target_fw_str, target_fw_size, "ss200-cable\n");
+		return 0;
+	}
+
+	if (media_jack->cable_info[0].media_attr.shape == SL_MEDIA_SHAPE_SPLITTER &&
+	    media_jack->cable_end != SL_MEDIA_CABLE_END_DD) {
+		snprintf(target_fw_str, target_fw_size, "%02X.%02X\n",
+			 cable_db[media_jack->cable_db_idx].fw_ver.split_major,
+			 cable_db[media_jack->cable_db_idx].fw_ver.split_minor);
+		return 0;
+	}
+
+	snprintf(target_fw_str, target_fw_size, "%02X.%02X\n",
+		 cable_db[media_jack->cable_db_idx].fw_ver.major,
+		 cable_db[media_jack->cable_db_idx].fw_ver.minor);
+
+	return 0;
+}
+
+void sl_media_eeprom_parse(struct sl_media_jack *media_jack, struct sl_media_attr *media_attr)
+{
+	sl_media_log_dbg(media_jack, LOG_NAME, "parse");
+
+	/* vendor get MUST be first */
+	sl_media_eeprom_vendor_get(media_jack, media_attr->format, &(media_attr->vendor));
+	sl_media_eeprom_vendor_pn_str_get(media_jack, media_attr->format, media_attr->vendor_pn_str);
+	sl_media_eeprom_type_get(media_jack, media_attr->format, media_attr->vendor, &(media_attr->type));
+	sl_media_eeprom_hpe_pn_get(media_jack, &(media_attr->hpe_pn), media_attr->hpe_pn_str);
+	sl_media_eeprom_serial_num_get(media_jack, media_attr->format, media_attr->serial_num_str);
+	sl_media_eeprom_date_code_get(media_jack, media_attr->format, media_attr->date_code_str);
+	sl_media_eeprom_fw_ver_get(media_jack, media_attr->fw_ver);
+	sl_media_eeprom_cable_end_get(media_jack);
+	sl_media_eeprom_length_get(media_jack, media_attr->format, &(media_attr->length_cm));
+	sl_media_eeprom_appsel_info_get(media_jack, &(media_attr->speeds_map));
+	sl_media_eeprom_furcation_get(media_jack, &(media_attr->furcation));
+	sl_media_eeprom_supported_flags_advertised_get(media_jack, media_attr->supported_flags_advertised);
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "parse (format = %u, vendor = %u %s, vendor_pn_str = %s, fw = %02X.%02X)",
+			 media_attr->format, media_attr->vendor, sl_media_vendor_str(media_attr->vendor),
+			 media_attr->vendor_pn_str, media_attr->fw_ver[0], media_attr->fw_ver[1]);
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "parse (type = 0x%X %s, length = %ucm, speeds_map = 0x%lX)",
+			 media_attr->type, sl_media_type_str(media_attr->type), media_attr->length_cm,
+			 media_attr->speeds_map);
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "parse (hpe_pn = %u, serial_num = %s, errors = 0x%X, info = 0x%X)",
+			 media_attr->hpe_pn, media_attr->serial_num_str, media_attr->errors, media_attr->info);
+}
+
+#define IDENTIFIER_OFFSET 0
+#define REV_CMPL_OFFSET   1
+int sl_media_eeprom_format_get(struct sl_media_jack *media_jack, u8 *format)
+{
+	u8   identifier;
+	u8   revision;
+	bool is_sff8636;
+	bool is_cmis;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "format get");
+
+	identifier = media_jack->eeprom_page0[IDENTIFIER_OFFSET];
+	revision   = media_jack->eeprom_page0[REV_CMPL_OFFSET];
+
+	is_sff8636 = (identifier == 0x0D || identifier == 0x11) && (revision < 0x27);
+	is_cmis    = ((identifier == 0x18) || (identifier == 0x19) || (identifier >= 0x1E && identifier <= 0x25)) &&
+			((revision & 0xF0) >= 0x30 && (revision & 0xF0) <= 0x50);
+
+	if (is_sff8636) {
+		*format = SL_MEDIA_MGMT_IF_SFF8636;
+		sl_media_log_dbg(media_jack, LOG_NAME, "format SFF8636 (id = 0x%X, rev = 0x%X)", identifier, revision);
+		return 0;
+	}
+
+	if (is_cmis) {
+		*format = SL_MEDIA_MGMT_IF_CMIS;
+		sl_media_log_dbg(media_jack, LOG_NAME, "format CMIS (id = 0x%X, rev = 0x%X)", identifier, revision);
+		return 0;
+	}
+
+	media_jack->is_cable_format_unsupported = true;
+	sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_EEPROM_FORMAT_UNSUPPORTED);
+	sl_media_log_err_trace(media_jack, LOG_NAME, "unsupported format (id = 0x%X, rev = 0x%X)",
+			       identifier, revision);
+
+	return -EMEDIUMTYPE;
+}
+
+#define MEDIA_INTERFACE_CODE_OFFSET 87
+int sl_media_eeprom_media_interface_get(struct sl_media_jack *media_jack, u8 *media_interface)
+{
+	spin_lock(&media_jack->data_lock);
+	*media_interface = media_jack->eeprom_page0[MEDIA_INTERFACE_CODE_OFFSET];
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_jack.c b/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_jack.c
new file mode 100644
index 000000000000..9d46b3f13de2
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_jack.c
@@ -0,0 +1,496 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/delay.h>
+
+#include "base/sl_media_log.h"
+
+#include "sl_media_io.h"
+#include "sl_media_jack.h"
+#include "data/sl_media_data_jack.h"
+#include "sl_core_link.h"
+
+#define LOG_NAME SL_MEDIA_DATA_JACK_LOG_NAME
+
+enum sl_media_led_states {
+	LED_OFF          = 0,
+	LED_ON_GRN       = 1,
+	LED_SLOW_GRN     = 2,
+	LED_FAST_GRN     = 3,
+	LED_ON_YEL       = 4,
+	LED_SLOW_YEL     = 5,
+	LED_FAST_YEL     = 6,
+	LED_SLOW_GRN_YEL = 7,
+	LED_FAST_GRN_YEL = 8,
+};
+
+int sl_media_data_jack_scan(u8 ldev_num)
+{
+	struct sl_media_jack *media_jack;
+
+	sl_media_log_dbg(NULL, LOG_NAME, "jack scan");
+
+	media_jack = sl_media_data_jack_get(ldev_num, 0);
+	media_jack->cable_info[0].ldev_num = ldev_num;
+	media_jack->cable_info[0].lgrp_num = 0; /* hardcoding 0 since only one lgrp*/
+
+	return 0;
+}
+
+int sl_media_data_jack_fake_media_attr_set(struct sl_media_jack *media_jack,
+					   struct sl_media_lgrp_cable_info *cable_info, struct sl_media_attr *fake_media_attr)
+{
+	return 0;
+}
+
+void sl_media_data_jack_fake_media_attr_clr(struct sl_media_jack *media_jack,
+					    struct sl_media_lgrp_cable_info *cable_info)
+{
+
+}
+
+#define DATA_PATH_STATE_DEACTIVATED       0x1
+#define DATA_PATH_EXPLICIT_CONTROL_ENABLE 0x00
+#define DATA_PATH_ID                      0x08
+#define DATA_PATH_LOWER_LANE_CONFIG       (DATA_PATH_EXPLICIT_CONTROL_ENABLE)
+#define DATA_PATH_LANES_DEACTIVATED       (DATA_PATH_STATE_DEACTIVATED << 4 | DATA_PATH_STATE_DEACTIVATED)
+int sl_media_data_jack_cable_downshift(struct sl_media_jack *media_jack)
+{
+	int rtn;
+	int i;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "data jack cable downshift");
+
+	/*
+	 * Deinit all lanes (DataPathDeinit @ page 0x10 byte 128)
+	 */
+	rtn = sl_media_io_write8(media_jack, 0x10, 128, 0xFF);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "data path deinit = 0xFF - write failed [%d]", rtn);
+		return rtn;
+	}
+	msleep(500);
+
+	/*
+	 * enable low power mode
+	 */
+	rtn = sl_media_data_jack_cable_low_power_set(media_jack);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO_LOW_POWER_SET);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "low power mode - write failed [%d]", rtn);
+		return rtn;
+	}
+	msleep(500);
+
+	/*
+	 * Staged Control Set 0, Data Path Configuration bytes @ page 0x10 bytes 145-148
+	 * Config lanes 1 to 4
+	 */
+	for (i = 0; i < 4; ++i) {
+		rtn = sl_media_io_write8(media_jack, 0x10, 145 + i,
+					 (media_jack->appsel_num_200_gaui << 4) |
+							   DATA_PATH_LOWER_LANE_CONFIG);
+		if (rtn) {
+			sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO);
+			sl_media_log_err_trace(media_jack, LOG_NAME,
+					       "SCS0 configuration - config lanes 1-4 - write failed [%d]", rtn);
+			return rtn;
+		}
+	}
+	msleep(100);
+
+	/*
+	 * ApplyDPInitLane8-1
+	 */
+	rtn = sl_media_io_write8(media_jack, 0x10, 143, 0xFF);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "apply dpinit = 0xFF - write failed [%d]", rtn);
+		return rtn;
+	}
+	msleep(500);
+
+	/*
+	 * enable high power mode
+	 */
+	rtn = sl_media_data_jack_cable_high_power_set(media_jack);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO_HIGH_POWER_SET);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "high power mode - write failed [%d]", rtn);
+		return rtn;
+	}
+	msleep(8000);
+
+	/*
+	 * (Re)Init all lanes (DataPathDeinit @ page 0x10 byte 128)
+	 */
+	rtn = sl_media_io_write8(media_jack, 0x10, 128, 0x00);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "data path deinit = 0x00 - write failed [%d]", rtn);
+		return rtn;
+	}
+
+	/*
+	 * waiting for firmware reload
+	 */
+	msleep(3000);
+
+	return 0;
+}
+
+int sl_media_data_jack_cable_hw_shift_state_get(struct sl_media_jack *media_jack)
+{
+	int rtn;
+	int i;
+	u8  downshift_lower_lane_config;
+	u8  upshift_lower_lane_config;
+	u8  read_data[4];
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "data jack cable hw shift state get");
+
+	downshift_lower_lane_config = (media_jack->appsel_num_200_gaui << 4) | DATA_PATH_LOWER_LANE_CONFIG;
+	upshift_lower_lane_config = (media_jack->appsel_num_400_gaui << 4) | DATA_PATH_LOWER_LANE_CONFIG;
+
+	for (i = 0; i < 4; ++i) {
+		rtn = sl_media_io_read8(media_jack, 0x10, 145 + i, &read_data[i]);
+		if (rtn) {
+			sl_media_log_err_trace(media_jack, LOG_NAME,
+					       "SCS0 configuration - config lanes 1-4 - read failed [%d]", rtn);
+			return SL_MEDIA_JACK_CABLE_HW_SHIFT_IO_ERROR;
+		}
+	}
+
+	if ((read_data[0] == downshift_lower_lane_config) &&
+	    (read_data[1] == downshift_lower_lane_config) &&
+	    (read_data[2] == downshift_lower_lane_config) &&
+	    (read_data[3] == downshift_lower_lane_config)) {
+		sl_media_log_dbg(media_jack, LOG_NAME, "cable is downshifted");
+		return SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_DOWNSHIFTED;
+	} else if ((read_data[0] == upshift_lower_lane_config) &&
+		   (read_data[1] == upshift_lower_lane_config) &&
+		   (read_data[2] == upshift_lower_lane_config) &&
+		   (read_data[3] == upshift_lower_lane_config)) {
+		sl_media_log_dbg(media_jack, LOG_NAME, "cable is upshifted");
+		return SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_UPSHIFTED;
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable is in unknown shift state");
+	return SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_UNKNOWN;
+}
+
+int sl_media_data_jack_cable_upshift(struct sl_media_jack *media_jack)
+{
+	int rtn;
+	int i;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "data jack cable upshift");
+
+	/*
+	 * Deinit all lanes (DataPathDeinit @ page 0x10 byte 128)
+	 */
+	rtn = sl_media_io_write8(media_jack, 0x10, 128, 0xFF);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "data path deinit = 0xFF - write failed [%d]", rtn);
+		return rtn;
+	}
+	msleep(500);
+
+	/*
+	 * enable low power mode
+	 */
+	rtn = sl_media_data_jack_cable_low_power_set(media_jack);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO_LOW_POWER_SET);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "low power mode - write failed [%d]", rtn);
+		return rtn;
+	}
+	msleep(500);
+
+	/*
+	 * Staged Control Set 0, Data Path Configuration bytes @ page 0x10 bytes 145-148
+	 * Config lanes 1 to 4
+	 */
+	for (i = 0; i < 4; ++i) {
+		rtn = sl_media_io_write8(media_jack, 0x10, 145 + i,
+					 (media_jack->appsel_num_400_gaui << 4) | DATA_PATH_LOWER_LANE_CONFIG);
+		if (rtn) {
+			sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO);
+			sl_media_log_err_trace(media_jack, LOG_NAME,
+					       "SCS0 configuration - config lanes 1-4 - write failed [%d]", rtn);
+			return rtn;
+		}
+	}
+	msleep(100);
+
+	/*
+	 * ApplyDPInitLane8-1
+	 */
+	rtn = sl_media_io_write8(media_jack, 0x10, 143, 0xFF);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "apply dpinit = 0xFF - write failed [%d]", rtn);
+		return rtn;
+	}
+	msleep(500);
+
+	/*
+	 * enable high power mode
+	 */
+	rtn = sl_media_data_jack_cable_high_power_set(media_jack);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO_HIGH_POWER_SET);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "high power mode - write failed [%d]", rtn);
+		return rtn;
+	}
+	msleep(8000);
+
+	/*
+	 * (Re)Init all lanes (DataPathDeinit @ page 0x10 byte 128)
+	 */
+	rtn = sl_media_io_write8(media_jack, 0x10, 128, 0x00);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "data path deinit = 0x00 - write failed [%d]", rtn);
+		return rtn;
+	}
+
+	/*
+	 * waiting for firmware reload
+	 */
+	msleep(3000);
+
+	return 0;
+}
+
+int sl_media_data_jack_cable_soft_reset(struct sl_media_jack *media_jack)
+{
+	int rtn;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "data jack cable soft reset");
+
+	rtn = sl_media_io_write8(media_jack, 0x00, 0x1a, 0x08);
+	if (rtn)
+		return rtn;
+
+	msleep(300);
+
+	rtn = sl_media_io_write8(media_jack, 0x00, 0x1a, 0x00);
+	if (rtn)
+		return rtn;
+
+	/*
+	 * waiting for firmware reload
+	 */
+	msleep(3000);
+
+	return 0;
+}
+
+#define SL_MEDIA_POWER_UP_PAGE      0x00
+#define SL_MEDIA_CMIS_POWER_UP_ADDR 0x1a
+#define SL_MEDIA_CMIS_POWER_UP_DATA 0x00
+#define SL_MEDIA_SFF_POWER_UP_ADDR  0x5D
+#define SL_MEDIA_SFF_POWER_UP_DATA  0x0D
+int sl_media_data_jack_cable_high_power_set(struct sl_media_jack *media_jack)
+{
+	int rtn;
+	u8  addr;
+	u8  data;
+
+	if (sl_media_data_jack_media_is_format_cmis(media_jack)) {
+		addr = SL_MEDIA_CMIS_POWER_UP_ADDR;
+		data = SL_MEDIA_CMIS_POWER_UP_DATA;
+	} else {
+		addr = SL_MEDIA_SFF_POWER_UP_ADDR;
+		data = SL_MEDIA_SFF_POWER_UP_DATA;
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "high power set (addr = 0x%X, data = 0x%X)", addr, data);
+
+	rtn = sl_media_io_write8(media_jack, SL_MEDIA_POWER_UP_PAGE, addr, data);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "write8 failed [%d]", rtn);
+		return -EIO;
+	}
+
+	spin_lock(&media_jack->data_lock);
+	media_jack->is_high_powered = true;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+#define SL_MEDIA_POWER_DOWN_PAGE      0x00
+#define SL_MEDIA_CMIS_POWER_DOWN_ADDR 0x1a
+#define SL_MEDIA_CMIS_POWER_DOWN_DATA 0x10
+#define SL_MEDIA_SFF_POWER_DOWN_ADDR  0x5D
+#define SL_MEDIA_SFF_POWER_DOWN_DATA  0x00
+int sl_media_data_jack_cable_low_power_set(struct sl_media_jack *media_jack)
+{
+	int rtn;
+	u8  addr;
+	u8  data;
+
+	if (sl_media_data_jack_media_is_format_cmis(media_jack)) {
+		addr = SL_MEDIA_CMIS_POWER_DOWN_ADDR;
+		data = SL_MEDIA_CMIS_POWER_DOWN_DATA;
+	} else {
+		addr = SL_MEDIA_SFF_POWER_DOWN_ADDR;
+		data = SL_MEDIA_SFF_POWER_DOWN_DATA;
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "low power set (addr = 0x%X, data = 0x%X)", addr, data);
+
+	rtn = sl_media_io_write8(media_jack, SL_MEDIA_POWER_DOWN_PAGE, addr, data);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "write8 failed [%d]", rtn);
+		return -EIO;
+	}
+
+	spin_lock(&media_jack->data_lock);
+	media_jack->is_high_powered = false;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_data_jack_cable_temp_get(struct sl_media_jack *media_jack, u8 *temp)
+{
+	int rtn;
+	u8  data;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "data jack cable temp get");
+
+	if (!sl_media_lgrp_media_type_is_active(media_jack->cable_info[0].ldev_num,
+						media_jack->cable_info[0].lgrp_num)) {
+		sl_media_log_dbg(media_jack, LOG_NAME, "not active cable");
+		return -EBADRQC;
+	}
+
+	rtn = sl_media_io_read8(media_jack, 0, 14, &data);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "temp get read failed [%d]", rtn);
+		return -EIO;
+	}
+
+	*temp = data;
+	return 0;
+}
+
+int sl_media_data_jack_cable_temp_warn_limit_get(struct sl_media_jack *media_jack, u8 *temp_warn_limit_c)
+{
+	int rtn;
+	u8  data;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable temp warn limit get");
+
+	if (!sl_media_lgrp_media_type_is_active(media_jack->cable_info[0].ldev_num,
+						media_jack->cable_info[0].lgrp_num)) {
+		sl_media_log_dbg(media_jack, LOG_NAME, "not active cable");
+		return -EBADRQC;
+	}
+
+	rtn = sl_media_io_read8(media_jack, 2, 132, &data);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "cable temp warn limit read failed [%d]", rtn);
+		return -EIO;
+	}
+
+	*temp_warn_limit_c = data;
+	return 0;
+}
+
+int sl_media_data_jack_cable_temp_down_limit_get(struct sl_media_jack *media_jack, u8 *temp_down_limit_c)
+{
+	int rtn;
+	u8  data;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable temp down limit get");
+
+	if (!sl_media_lgrp_media_type_is_active(media_jack->cable_info[0].ldev_num,
+						media_jack->cable_info[0].lgrp_num)) {
+		sl_media_log_dbg(media_jack, LOG_NAME, "not active cable");
+		return -EBADRQC;
+	}
+
+	rtn = sl_media_io_read8(media_jack, 2, 128, &data);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "cable temp down limit read failed [%d]", rtn);
+		return -EIO;
+	}
+
+	*temp_down_limit_c = data;
+	return 0;
+}
+
+void sl_media_data_jack_led_set(struct sl_media_jack *media_jack)
+{
+	int                  rtn;
+	struct sl_core_link *core_link;
+	u32                  link_state;
+	u8                   state;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "led set");
+
+	core_link = sl_core_link_get_pinned(media_jack->cable_info[0].ldev_num,
+					    media_jack->cable_info[0].lgrp_num, 0);
+	if (!core_link)
+		return;
+
+	/* hardcoding 0 since only one link*/
+	rtn = sl_core_link_state_get(media_jack->cable_info[0].ldev_num,
+				     media_jack->cable_info[0].lgrp_num, 0, &link_state);
+	sl_core_link_put_pinned(core_link);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "core link state get failed [%d]", rtn);
+		return;
+	}
+
+	rtn = sl_media_jack_state_get(media_jack, &state);
+	if (rtn)
+		sl_media_log_err_trace(media_jack, LOG_NAME, "media_jack_state_get failed [%d]", rtn);
+
+	switch (state) {
+	case SL_MEDIA_JACK_CABLE_REMOVED:
+		sl_media_io_led_set(media_jack, LED_OFF);
+		return;
+	case SL_MEDIA_JACK_CABLE_ERROR:
+		sl_media_io_led_set(media_jack, LED_FAST_YEL);
+		return;
+	}
+
+	switch (link_state) {
+	case SL_CORE_LINK_STATE_UNCONFIGURED:
+	case SL_CORE_LINK_STATE_CANCELING:
+	case SL_CORE_LINK_STATE_DOWN:
+	case SL_CORE_LINK_STATE_GOING_DOWN:
+	case SL_CORE_LINK_STATE_TIMEOUT:
+		sl_media_io_led_set(media_jack, LED_OFF);
+		break;
+	case SL_CORE_LINK_STATE_GOING_UP:
+	case SL_CORE_LINK_STATE_AN:
+		sl_media_io_led_set(media_jack, LED_FAST_GRN);
+		break;
+	case SL_CORE_LINK_STATE_UP:
+		sl_media_io_led_set(media_jack, LED_ON_GRN);
+		break;
+	}
+}
+
+static inline u8 sl_media_data_jack_num_update(u8 physical_jack_num)
+{
+	return physical_jack_num - 1;
+}
+
+void sl_media_data_jack_cable_temp_monitor_start(struct sl_media_ldev *media_ldev)
+{
+}
+
+void sl_media_data_jack_cable_temp_monitor_stop(struct sl_media_ldev *media_ldev)
+{
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_jack_emu.c b/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_jack_emu.c
new file mode 100644
index 000000000000..0aed275e8c5c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_jack_emu.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "sl_asic.h"
+
+#include "base/sl_media_log.h"
+
+#include "sl_media_lgrp.h"
+#include "sl_media_jack.h"
+#include "data/sl_media_data_jack.h"
+
+#define LOG_NAME SL_MEDIA_DATA_JACK_LOG_NAME
+
+int sl_media_data_jack_lgrp_connect(struct sl_media_lgrp *media_lgrp)
+{
+	struct sl_media_jack *media_jack;
+	u8                    i;
+
+	sl_media_log_dbg(media_lgrp, LOG_NAME, "jack lgrp connect");
+
+	media_jack = sl_media_data_jack_get(media_lgrp->media_ldev->num,
+					    media_lgrp->num >> (SL_MEDIA_LGRPS_DIVIDE_PER_PORT));
+	for (i = 0; i < SL_MEDIA_LGRPS_PER_PORT; ++i) {
+		if (media_jack->cable_info[i].lgrp_num == media_lgrp->num) {
+			media_lgrp->media_jack = media_jack;
+			media_lgrp->cable_info = &media_jack->cable_info[i];
+			return 0;
+		}
+	}
+
+	return -EFAULT;
+}
+
+void sl_media_data_jack_unregister_event_notifier(void)
+{
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_ldev.c b/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_ldev.c
new file mode 100644
index 000000000000..a2cd33257fc5
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_ldev.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/errno.h>
+
+#include "base/sl_media_log.h"
+#include "sl_media_ldev.h"
+#include "data/sl_media_data_ldev.h"
+
+#define LOG_NAME  SL_LOG_LDEV_LOG_NAME
+
+int sl_media_data_ldev_uc_ops_set(u8 ldev_num, struct sl_uc_ops *uc_ops,
+				  struct sl_uc_accessor *uc_accessor)
+{
+	struct sl_media_ldev *media_ldev;
+
+	media_ldev = sl_media_ldev_get(ldev_num);
+	if (!media_ldev) {
+		sl_media_log_err(NULL, LOG_NAME, "ldev not found (ldev_num = %u)", ldev_num);
+		return -EINVAL;
+	}
+
+	sl_media_log_dbg(media_ldev, LOG_NAME, "media_data_ldev_uc_ops_set");
+
+	media_ldev->uc_ops = uc_ops;
+	media_ldev->uc_accessor = uc_accessor;
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_cable_db_ops.c b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_cable_db_ops.c
new file mode 100644
index 000000000000..8099343084d8
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_cable_db_ops.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/slab.h>
+#include <linux/kernel.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "sl_media_jack.h"
+#include "data/sl_media_data_cable_db.h"
+#include "data/sl_media_data_cable_db_ops.h"
+#include "base/sl_media_log.h"
+
+#define LOG_NAME SL_MEDIA_CABLE_LOG_NAME
+
+#define SL_MEDIA_TYPE_SERDES 1
+
+int sl_media_data_cable_db_ops_cable_validate(struct sl_media_attr *media_attr, struct sl_media_jack *media_jack)
+{
+	int indexer;
+
+	sl_media_log_dbg(NULL, LOG_NAME, "cable validate");
+
+	/*
+	 * Check for loopback module
+	 */
+	if (media_attr->vendor == SL_MEDIA_VENDOR_MULTILANE) {
+		media_attr->hpe_pn       = 1;
+		media_attr->type         = SL_MEDIA_TYPE_PEC;
+		media_attr->length_cm    = 100;
+		media_attr->furcation    = SL_MEDIA_FURCATION_X1;
+		media_attr->max_speed    = SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
+		media_attr->speeds_map   = SL_MEDIA_SPEEDS_SUPPORT_CK_400G |
+					   SL_MEDIA_SPEEDS_SUPPORT_BS_200G |
+					   SL_MEDIA_SPEEDS_SUPPORT_BJ_100G |
+					   SL_MEDIA_SPEEDS_SUPPORT_CD_50G;
+		media_jack->cable_db_idx = -1;
+		return 0;
+	}
+
+	/*
+	 * Linear search through the cable_db array
+	 */
+	for (indexer = 0; indexer < ARRAY_SIZE(cable_db); ++indexer) {
+		if (cable_db[indexer].hpe_pn == media_attr->hpe_pn &&
+		    cable_db[indexer].vendor == media_attr->vendor &&
+		    cable_db[indexer].type   == media_attr->type) {
+			media_attr->shape                    = cable_db[indexer].shape;
+			media_attr->max_speed                = cable_db[indexer].max_speed;
+			media_jack->is_supported_ss200_cable = cable_db[indexer].is_supported_ss200_cable;
+			media_jack->cable_db_idx             = indexer;
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+int sl_media_data_cable_db_ops_serdes_settings_get(struct sl_media_jack *media_jack, u32 media_type, u32 flags)
+{
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "serdes settings get (media_type = 0x%X %s, flags = 0x%X)",
+		media_type, sl_media_type_str(media_type), flags);
+
+	if (flags & SL_MEDIA_TYPE_UNSUPPORTED) {
+		sl_media_log_warn_trace(media_jack, LOG_NAME, "serdes setting get unsuppported cable");
+		if (media_type == SL_MEDIA_TYPE_AEC ||
+		    media_type == SL_MEDIA_TYPE_ACC ||
+		    media_type == SL_MEDIA_TYPE_POC ||
+		    media_type == SL_MEDIA_TYPE_AOC) {
+			media_jack->serdes_settings.pre1   = -12;
+			media_jack->serdes_settings.pre2   = 0;
+			media_jack->serdes_settings.pre3   = 0;
+			media_jack->serdes_settings.cursor = 98;
+			media_jack->serdes_settings.post1  = -4;
+			media_jack->serdes_settings.post2  = 0;
+		} else {
+			media_jack->serdes_settings.pre1   = 0;
+			media_jack->serdes_settings.pre2   = 0;
+			media_jack->serdes_settings.pre3   = 0;
+			media_jack->serdes_settings.cursor = 100;
+			media_jack->serdes_settings.post1  = 0;
+			media_jack->serdes_settings.post2  = 0;
+		}
+	} else if (flags & SL_MEDIA_TYPE_BACKPLANE) {
+		media_jack->serdes_settings.pre1   = 0;
+		media_jack->serdes_settings.pre2   = 0;
+		media_jack->serdes_settings.pre3   = 0;
+		media_jack->serdes_settings.cursor = 100;
+		media_jack->serdes_settings.post1  = 0;
+		media_jack->serdes_settings.post2  = 0;
+	} else if (flags & SL_MEDIA_TYPE_LOOPBACK) {
+		media_jack->serdes_settings.pre1   = 0;
+		media_jack->serdes_settings.pre2   = 0;
+		media_jack->serdes_settings.pre3   = 0;
+		media_jack->serdes_settings.cursor = 100;
+		media_jack->serdes_settings.post1  = 0;
+		media_jack->serdes_settings.post2  = 0;
+	} else {
+		if (media_jack->cable_db_idx < 0 || media_jack->cable_db_idx >= ARRAY_SIZE(cable_db)) {
+			sl_media_log_err_trace(media_jack, LOG_NAME,
+					       "serdes settings get invalid (idx = %d)",
+					       media_jack->cable_db_idx);
+			return -ENOENT;
+		}
+		media_jack->serdes_settings = cable_db[media_jack->cable_db_idx].serdes_settings;
+	}
+	media_jack->serdes_settings.media = SL_MEDIA_TYPE_SERDES;
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_jack.c b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_jack.c
new file mode 100644
index 000000000000..17631509afa2
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_jack.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2022,2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/atomic.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "base/sl_media_log.h"
+#include "sl_media_ldev.h"
+#include "sl_media_lgrp.h"
+#include "sl_media_jack.h"
+#include "data/sl_media_data_jack.h"
+#include "sl_asic.h"
+#include "sl_ctrl_lgrp_notif.h"
+#include "data/sl_media_data_lgrp.h"
+#include "sl_ctrl_lgrp.h"
+#include "sl_core_link.h"
+#include "sl_ctrl_media_counters.h"
+
+static struct sl_media_jack *media_jacks[SL_ASIC_MAX_LDEVS][SL_MEDIA_MAX_JACK_NUM];
+static DEFINE_SPINLOCK(media_jacks_lock);
+
+#define LOG_NAME SL_MEDIA_DATA_JACK_LOG_NAME
+
+void sl_media_data_jack_del(u8 ldev_num, u8 jack_num)
+{
+	struct sl_media_jack *media_jack;
+
+	media_jack = sl_media_data_jack_get(ldev_num, jack_num);
+	if (!media_jack) {
+		sl_media_log_dbg(NULL, LOG_NAME, "not found (jack_num = %u)", jack_num);
+		return;
+	}
+
+	sl_ctrl_media_cause_counters_del(media_jack);
+
+	spin_lock(&media_jacks_lock);
+	media_jacks[ldev_num][jack_num] = NULL;
+	spin_unlock(&media_jacks_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "del (jack = 0x%p)", media_jack);
+
+	kfree(media_jack);
+}
+
+int sl_media_data_jack_new(struct sl_media_ldev *media_ldev, u8 jack_num)
+{
+	struct sl_media_jack *media_jack;
+	int                   rtn;
+
+	media_jack = sl_media_data_jack_get(media_ldev->num, jack_num);
+	if (media_jack) {
+		sl_media_log_err(NULL, LOG_NAME, "jack already exists");
+		return -EEXIST;
+	}
+
+	media_jack = kzalloc(sizeof(struct sl_media_jack), GFP_KERNEL);
+	if (!media_jack)
+		return -ENOMEM;
+
+	media_jack->magic             = SL_MEDIA_JACK_MAGIC;
+	media_jack->num               = jack_num;
+	media_jack->physical_num      = 1;
+	media_jack->cable_db_idx      = -1;
+	media_jack->fault_cause       = SL_MEDIA_FAULT_CAUSE_NONE;
+
+	spin_lock_init(&media_jack->log_lock);
+
+	rtn = sl_ctrl_media_cause_counters_init(media_jack);
+	if (rtn) {
+		sl_media_log_err(media_jack, LOG_NAME, "ctrl_media_cause_counters_init failed [%d]", rtn);
+		goto out;
+	}
+
+	spin_lock_init(&(media_jack->data_lock));
+
+	media_jack->media_ldev = media_ldev;
+
+	media_jack->state                  = SL_MEDIA_JACK_CABLE_REMOVED;
+	media_jack->lane_data.cache.cached = false;
+	media_jack->lane_data.read_state   = SL_MEDIA_JACK_LANE_DATA_READ_STATE_IDLE;
+	media_jack->lane_data.read_generation = 0;
+	init_waitqueue_head(&media_jack->lane_data.read_wait);
+
+	media_jack->temperature_value_c      = -1;
+	media_jack->temperature_down_limit_c = -1;
+	media_jack->temperature_warn_limit_c = -1;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "new (jack = 0x%p)", media_jack);
+
+	spin_lock(&media_jacks_lock);
+	media_jacks[media_ldev->num][jack_num] = media_jack;
+	spin_unlock(&media_jacks_lock);
+
+	return 0;
+
+out:
+	kfree(media_jack);
+	return -ENOMEM;
+}
+
+struct sl_media_jack *sl_media_data_jack_get(u8 ldev_num, u8 jack_num)
+{
+	struct sl_media_jack *media_jack;
+
+	spin_lock(&media_jacks_lock);
+	media_jack = media_jacks[ldev_num][jack_num];
+	spin_unlock(&media_jacks_lock);
+
+	sl_media_log_dbg(NULL, LOG_NAME,
+			 "get (ldev_num = %u, jack_num = %u, jack = 0x%p)",
+			 ldev_num, jack_num, media_jack);
+
+	return media_jack;
+}
+
+void sl_media_data_cable_serdes_settings_clr(struct sl_media_jack *media_jack)
+{
+	sl_media_log_dbg(media_jack, LOG_NAME, "serdes settings clr");
+
+	memset(&(media_jack->serdes_settings), 0, sizeof(struct sl_media_serdes_settings));
+}
+
+void sl_media_data_jack_eeprom_clr(struct sl_media_jack *media_jack)
+{
+	sl_media_log_dbg(media_jack, LOG_NAME, "eeprom clr");
+
+	memset(media_jack->eeprom_page0, 0, SL_MEDIA_EEPROM_PAGE_SIZE);
+	memset(media_jack->eeprom_page1, 0, SL_MEDIA_EEPROM_PAGE_SIZE);
+}
+
+/*
+ * This state describes the cable that is currently in the jack, so it must be
+ * cleared whenever the cable changes or the next cable inherits it. Client
+ * notification registrations, fake-cable debug state and counters belong to
+ * the jack and are kept. A stash that is still live behind a fake cable is
+ * kept too.
+ */
+void sl_media_data_jack_cable_state_clr(struct sl_media_jack *media_jack)
+{
+	unsigned int i;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable state clr");
+
+	spin_lock(&media_jack->data_lock);
+	media_jack->is_cable_unsupported        = false;
+	media_jack->is_cable_format_unsupported = false;
+	media_jack->is_supported_ss200_cable    = false;
+	media_jack->cable_db_idx                = -1;
+
+	media_jack->is_high_powered                = false;
+	media_jack->cable_high_power_wait_time_end = 0;
+
+	media_jack->cable_shift_state       = 0;
+	media_jack->appsel_num_200_gaui     = 0;
+	media_jack->lane_count_200_gaui     = 0;
+	media_jack->host_interface_200_gaui = 0;
+	media_jack->appsel_num_400_gaui     = 0;
+	media_jack->lane_count_400_gaui     = 0;
+	media_jack->host_interface_400_gaui = 0;
+
+	memset(&media_jack->lane_data.cache, 0, sizeof(media_jack->lane_data.cache));
+
+	media_jack->temperature_prev_state   = SL_MEDIA_JACK_TEMP_STATE_COLD;
+	media_jack->temperature_state        = SL_MEDIA_JACK_TEMP_STATE_COLD;
+	media_jack->temperature_value_c      = -1;
+	media_jack->temperature_warn_limit_c = -1;
+	media_jack->temperature_down_limit_c = -1;
+
+	for (i = 0; i < ARRAY_SIZE(media_jack->cable_info); ++i) {
+		struct sl_media_lgrp_cable_info *cable_info = &media_jack->cable_info[i];
+
+		if (cable_info->real_cable_status != CABLE_MEDIA_ATTR_STASHED)
+			memset(&cable_info->stashed_media_attr, 0,
+			       sizeof(cable_info->stashed_media_attr));
+		cable_info->hot_notif_sent  = false;
+		cable_info->warm_notif_sent = false;
+		cable_info->cold_notif_sent = false;
+	}
+	spin_unlock(&media_jack->data_lock);
+}
+
+int sl_media_data_jack_media_attr_set(struct sl_media_jack *media_jack,
+				      struct sl_media_lgrp_cable_info *cable_info, struct sl_media_attr *media_attr)
+{
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "media attr set (format = %d, vendor = %d %s, type = 0x%X %s, length_cm = %d, speeds_map = 0x%lX)",
+			 media_attr->format, media_attr->vendor, sl_media_vendor_str(media_attr->vendor),
+			 media_attr->type, sl_media_type_str(media_attr->type),
+			 media_attr->length_cm, media_attr->speeds_map);
+
+	spin_lock(&media_jack->data_lock);
+
+	if (cable_info->real_cable_status == CABLE_MEDIA_ATTR_ADDED) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "media attr already set");
+		spin_unlock(&media_jack->data_lock);
+		return -EEXIST;
+	}
+
+	if (cable_info->fake_cable_status == CABLE_MEDIA_ATTR_ADDED) {
+		cable_info->stashed_media_attr = *media_attr;
+		cable_info->real_cable_status  = CABLE_MEDIA_ATTR_STASHED;
+	} else {
+		cable_info->media_attr        = *media_attr;
+		cable_info->real_cable_status = CABLE_MEDIA_ATTR_ADDED;
+	}
+
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+void sl_media_data_jack_media_attr_clr(struct sl_media_jack *media_jack,
+				       struct sl_media_lgrp_cable_info *cable_info)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "media attr clr");
+
+	media_lgrp = sl_media_data_lgrp_get(cable_info->ldev_num, cable_info->lgrp_num);
+	spin_lock(&media_jack->data_lock);
+	if (cable_info->real_cable_status == CABLE_MEDIA_ATTR_REMOVED) {
+		spin_unlock(&media_jack->data_lock);
+		sl_media_log_dbg(media_jack, LOG_NAME, "no media attr to clear");
+		return;
+	}
+
+	if (cable_info->real_cable_status == CABLE_MEDIA_ATTR_ADDED)
+		memset(&(cable_info->media_attr), 0, sizeof(struct sl_media_attr));
+
+	cable_info->real_cable_status = CABLE_MEDIA_ATTR_REMOVED;
+	spin_unlock(&media_jack->data_lock);
+
+	if (media_lgrp) {
+		/* Only send notification if both real and fake cables are removed */
+		if (cable_info->fake_cable_status == CABLE_MEDIA_ATTR_REMOVED)
+			sl_media_data_jack_cable_if_not_present_send(media_lgrp);
+	}
+}
+
+bool sl_media_data_jack_media_is_format_cmis(struct sl_media_jack *media_jack)
+{
+	bool is_cmis;
+
+	spin_lock(&media_jack->data_lock);
+	is_cmis = (media_jack->cable_info[0].media_attr.format == SL_MEDIA_MGMT_IF_CMIS);
+	spin_unlock(&media_jack->data_lock);
+
+	return is_cmis;
+}
+
+void sl_media_data_jack_cable_if_present_send(struct sl_media_lgrp *media_lgrp)
+{
+	int                      rtn;
+	union sl_lgrp_notif_info info;
+
+	sl_media_log_dbg(media_lgrp, LOG_NAME, "present send");
+
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	if ((media_lgrp->cable_info->real_cable_status == CABLE_MEDIA_ATTR_ADDED) ||
+	    (media_lgrp->cable_info->fake_cable_status == CABLE_MEDIA_ATTR_ADDED)) {
+		info.media_attr = media_lgrp->cable_info->media_attr;
+		rtn = sl_ctrl_lgrp_notif_enqueue(sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num),
+						 SL_LGRP_NOTIF_NO_LINK, SL_LGRP_NOTIF_MEDIA_PRESENT, &info, 0);
+		if (rtn)
+			sl_media_log_warn_trace(media_lgrp, LOG_NAME,
+						"present_send ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+}
+
+void sl_media_data_jack_cable_if_not_present_send(struct sl_media_lgrp *media_lgrp)
+{
+	int rtn;
+
+	sl_media_log_dbg(media_lgrp, LOG_NAME, "not present send");
+
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	if (media_lgrp->cable_info->real_cable_status == CABLE_MEDIA_ATTR_REMOVED) {
+		rtn = sl_ctrl_lgrp_notif_enqueue(sl_ctrl_lgrp_get(media_lgrp->media_ldev->num, media_lgrp->num),
+						 SL_LGRP_NOTIF_NO_LINK, SL_LGRP_NOTIF_MEDIA_NOT_PRESENT, NULL, 0);
+		if (rtn)
+			sl_media_log_warn_trace(media_lgrp, LOG_NAME,
+						"not_present_send ctrl_lgrp_notif_enqueue failed [%d]", rtn);
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+}
+
+void sl_media_data_jack_cable_temp_state_init(struct sl_media_jack *media_jack)
+{
+	spin_lock(&media_jack->data_lock);
+	media_jack->temperature_prev_state = SL_MEDIA_JACK_TEMP_STATE_COLD;
+	media_jack->temperature_state = SL_MEDIA_JACK_TEMP_STATE_COLD;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "temperature state init (prev_state = %u, state = %u)",
+			 media_jack->temperature_prev_state, media_jack->temperature_state);
+}
+
+void sl_media_data_jack_cable_temp_state_set(struct sl_media_jack *media_jack, u8 temperature_state)
+{
+	spin_lock(&media_jack->data_lock);
+	media_jack->temperature_prev_state = media_jack->temperature_state;
+	media_jack->temperature_state = temperature_state;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "temperature state set (state = %u)", media_jack->temperature_state);
+}
+
+int sl_media_data_jack_cable_temp_state_get(struct sl_media_jack *media_jack, u8 *temperature_state)
+{
+	spin_lock(&media_jack->data_lock);
+	*temperature_state = media_jack->temperature_state;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "temperature state get (state = %u %s)",
+			 *temperature_state, sl_media_temp_state_str(*temperature_state));
+
+	return 0;
+}
+
+int  sl_media_data_jack_cable_temp_prev_state_get(struct sl_media_jack *media_jack, u8 *temperature_prev_state)
+{
+	spin_lock(&media_jack->data_lock);
+	*temperature_prev_state = media_jack->temperature_prev_state;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "temperature prev state get (state = %u %s)",
+			 *temperature_prev_state, sl_media_temp_state_str(*temperature_prev_state));
+
+	return 0;
+}
+
+void sl_media_data_jack_headshell_busy_set(struct sl_media_jack *media_jack, int value)
+{
+	atomic_set(&media_jack->is_headshell_busy, value);
+}
+
+bool sl_media_data_jack_is_headshell_busy(struct sl_media_jack *media_jack)
+{
+	return (atomic_read(&media_jack->is_headshell_busy) == SL_MEDIA_JACK_HEADSHELL_BUSY);
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_ldev.c b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_ldev.c
new file mode 100644
index 000000000000..fddedcd46776
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_ldev.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "sl_asic.h"
+#include "base/sl_media_log.h"
+#include "sl_media_ldev.h"
+#include "data/sl_media_data_ldev.h"
+#include "data/sl_media_data_lgrp.h"
+#include "data/sl_media_data_jack.h"
+
+static struct sl_media_ldev *media_ldevs[SL_ASIC_MAX_LDEVS];
+static DEFINE_SPINLOCK(media_ldevs_lock);
+
+#define LOG_NAME SL_MEDIA_DATA_LDEV_LOG_NAME
+
+int sl_media_data_ldev_new(u8 ldev_num, struct workqueue_struct *workqueue)
+{
+	struct sl_media_ldev *media_ldev;
+	int                   rtn;
+	u8                    jack_num;
+
+	media_ldev = sl_media_data_ldev_get(ldev_num);
+	if (media_ldev) {
+		sl_media_log_err(NULL, LOG_NAME, "exists (ldev = 0x%p)", media_ldev);
+		return -EBADRQC;
+	}
+
+	media_ldev = kzalloc(sizeof(struct sl_media_ldev), GFP_KERNEL);
+	if (!media_ldev)
+		return -ENOMEM;
+
+	media_ldev->magic     = SL_MEDIA_LDEV_MAGIC;
+	media_ldev->num       = ldev_num;
+	media_ldev->workqueue = workqueue;
+
+	for (jack_num = 0; jack_num < SL_MEDIA_MAX_JACK_NUM; ++jack_num) {
+		rtn = sl_media_data_jack_new(media_ldev, jack_num);
+		if (rtn) {
+			sl_media_log_err(media_ldev, LOG_NAME, "jack new failed [%d]", rtn);
+			goto out_jacks;
+		}
+	}
+
+	rtn = sl_media_data_jack_scan(ldev_num);
+	if (rtn) {
+		sl_media_log_err(media_ldev, LOG_NAME, "jack scan failed [%d]", rtn);
+		goto out_jacks;
+	}
+
+	sl_media_log_dbg(media_ldev, LOG_NAME, "new (ldev = 0x%p)", media_ldev);
+
+	spin_lock(&media_ldevs_lock);
+	media_ldevs[ldev_num] = media_ldev;
+	spin_unlock(&media_ldevs_lock);
+
+	sl_media_data_jack_cable_temp_monitor_start(media_ldev);
+
+	return 0;
+
+out_jacks:
+	while (jack_num)
+		sl_media_data_jack_del(ldev_num, --jack_num);
+	kfree(media_ldev);
+	return -EFAULT;
+}
+
+void sl_media_data_ldev_del(u8 ldev_num)
+{
+	struct sl_media_ldev *media_ldev;
+	u8                    lgrp_num;
+	u8                    jack_num;
+
+	media_ldev = sl_media_data_ldev_get(ldev_num);
+	if (!media_ldev) {
+		sl_media_log_dbg(NULL, LOG_NAME, "not found (ldev_num = %u)", ldev_num);
+		return;
+	}
+
+	sl_media_data_jack_cable_temp_monitor_stop(media_ldev);
+
+	spin_lock(&media_ldevs_lock);
+	media_ldevs[ldev_num] = NULL;
+	spin_unlock(&media_ldevs_lock);
+
+	sl_media_log_dbg(media_ldev, LOG_NAME, "del (ldev = 0x%p)", media_ldev);
+
+	for (lgrp_num = 0; lgrp_num < SL_ASIC_MAX_LGRPS; ++lgrp_num)
+		sl_media_data_lgrp_del(ldev_num, lgrp_num);
+
+	for (jack_num = 0; jack_num < SL_MEDIA_MAX_JACK_NUM; ++jack_num)
+		sl_media_data_jack_del(ldev_num, jack_num);
+
+	sl_media_data_jack_unregister_event_notifier();
+
+	kfree(media_ldev);
+}
+
+struct sl_media_ldev *sl_media_data_ldev_get(u8 ldev_num)
+{
+	struct sl_media_ldev *media_ldev;
+
+	spin_lock(&media_ldevs_lock);
+	media_ldev = media_ldevs[ldev_num];
+	spin_unlock(&media_ldevs_lock);
+
+	sl_media_log_dbg(NULL, LOG_NAME, "get (ldev_num = %u, ldev = 0x%p)",
+			 ldev_num, media_ldev);
+
+	return media_ldev;
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_lgrp.c b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_lgrp.c
new file mode 100644
index 000000000000..27c30bdf3378
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_lgrp.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023,2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "sl_media_lgrp.h"
+#include "data/sl_media_data_lgrp.h"
+#include "data/sl_media_data_ldev.h"
+#include "data/sl_media_data_jack.h"
+#include "sl_asic.h"
+#include "base/sl_media_log.h"
+
+static struct sl_media_lgrp *media_lgrps[SL_ASIC_MAX_LDEVS][SL_ASIC_MAX_LGRPS];
+static DEFINE_SPINLOCK(media_lgrps_lock);
+
+#define LOG_NAME SL_MEDIA_DATA_LGRP_LOG_NAME
+
+int sl_media_data_lgrp_new(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_lgrp *media_lgrp;
+	int                   rtn;
+
+	media_lgrp = sl_media_data_lgrp_get(ldev_num, lgrp_num);
+	if (media_lgrp) {
+		sl_media_log_err(NULL, LOG_NAME, "exists (lgrp = 0x%p)", media_lgrp);
+		return -EBADRQC;
+	}
+
+	media_lgrp = kzalloc(sizeof(struct sl_media_lgrp), GFP_KERNEL);
+	if (!media_lgrp)
+		return -ENOMEM;
+
+	media_lgrp->magic       = SL_MEDIA_LGRP_MAGIC;
+	media_lgrp->num         = lgrp_num;
+	media_lgrp->media_ldev  = sl_media_data_ldev_get(ldev_num);
+
+	media_lgrp->speeds_kobj_init = false;
+	spin_lock_init(&media_lgrp->log_lock);
+	spin_lock_init(&media_lgrp->data_lock);
+	snprintf(media_lgrp->connect_id, sizeof(media_lgrp->connect_id), "lgrp%02u", lgrp_num);
+
+	rtn = sl_media_data_jack_lgrp_connect(media_lgrp);
+	if (rtn) {
+		sl_media_log_err(media_lgrp, LOG_NAME, "jack lgrp connect failed [%d]", rtn);
+		kfree(media_lgrp);
+		return -EFAULT;
+	}
+
+	sl_media_log_dbg(media_lgrp, LOG_NAME, "new (lgrp = 0x%p)", media_lgrp);
+
+	spin_lock(&media_lgrps_lock);
+	media_lgrps[ldev_num][lgrp_num] = media_lgrp;
+	spin_unlock(&media_lgrps_lock);
+
+	return 0;
+}
+
+void sl_media_data_lgrp_del(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_data_lgrp_get(ldev_num, lgrp_num);
+	if (!media_lgrp) {
+		sl_media_log_dbg(NULL, LOG_NAME, "not found (lgrp_num = %u)", lgrp_num);
+		return;
+	}
+
+	spin_lock(&media_lgrps_lock);
+	media_lgrps[ldev_num][lgrp_num] = NULL;
+	spin_unlock(&media_lgrps_lock);
+
+	sl_media_log_dbg(media_lgrp, LOG_NAME, "del (lgrp = 0x%p)", media_lgrp);
+
+	kfree(media_lgrp);
+}
+
+struct sl_media_lgrp *sl_media_data_lgrp_get(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	spin_lock(&media_lgrps_lock);
+	media_lgrp = media_lgrps[ldev_num][lgrp_num];
+	spin_unlock(&media_lgrps_lock);
+
+	sl_media_log_dbg(NULL, LOG_NAME,
+			 "get (ldev_num = %u, lgrp_num = %u, lgrp = 0x%p)",
+			 ldev_num, lgrp_num, media_lgrp);
+
+	return media_lgrp;
+}
+
+void sl_media_data_lgrp_connect_id_set(struct sl_media_lgrp *media_lgrp, const char *connect_id)
+{
+	unsigned long irq_flags;
+
+	spin_lock_irqsave(&(media_lgrp->log_lock), irq_flags);
+	strscpy_pad(media_lgrp->connect_id, connect_id,
+		    sizeof(media_lgrp->connect_id));
+	spin_unlock_irqrestore(&(media_lgrp->log_lock), irq_flags);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_DATA_LGRP_LOG_NAME, "connect_id = %s", connect_id);
+}
+
+int sl_media_data_lgrp_err_trace_enable_set(struct sl_media_lgrp *media_lgrp, bool err_trace_enable)
+{
+	spin_lock(&media_lgrp->data_lock);
+	media_lgrp->err_trace_enable = err_trace_enable;
+	spin_unlock(&media_lgrp->data_lock);
+
+	sl_media_log_dbg(media_lgrp, LOG_NAME, "set (err_trace_enable = %s)", err_trace_enable ? "true" : "false");
+
+	return 0;
+}
+
+int sl_media_data_lgrp_warn_trace_enable_set(struct sl_media_lgrp *media_lgrp, bool warn_trace_enable)
+{
+	spin_lock(&media_lgrp->data_lock);
+	media_lgrp->warn_trace_enable = warn_trace_enable;
+	spin_unlock(&media_lgrp->data_lock);
+
+	sl_media_log_dbg(media_lgrp, LOG_NAME, "set (warn_trace_enable = %s)", warn_trace_enable ? "true" : "false");
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_lgrp_trace.c b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_lgrp_trace.c
new file mode 100644
index 000000000000..aec8a52d1cc0
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_lgrp_trace.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/spinlock.h>
+
+#include "data/sl_media_data_lgrp_trace.h"
+
+#define LOG_NAME SL_MEDIA_DATA_LGRP_LOG_NAME
+
+int sl_media_data_lgrp_is_err_trace_enabled(struct sl_media_lgrp *media_lgrp, bool *err_trace_enable)
+{
+	spin_lock(&media_lgrp->data_lock);
+	*err_trace_enable = media_lgrp->err_trace_enable;
+	spin_unlock(&media_lgrp->data_lock);
+
+	sl_media_log_dbg(media_lgrp, LOG_NAME, "get (err_trace_enable = %s)", *err_trace_enable ? "true" : "false");
+
+	return 0;
+}
+
+int sl_media_data_lgrp_is_warn_trace_enabled(struct sl_media_lgrp *media_lgrp, bool *warn_trace_enable)
+{
+	spin_lock(&media_lgrp->data_lock);
+	*warn_trace_enable = media_lgrp->warn_trace_enable;
+	spin_unlock(&media_lgrp->data_lock);
+
+	sl_media_log_dbg(media_lgrp, LOG_NAME, "get (warn_trace_enable = %s)", *warn_trace_enable ? "true" : "false");
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/nic/sl_media_io.c b/drivers/net/ethernet/hpe/sl/media/nic/sl_media_io.c
new file mode 100644
index 000000000000..e031d82b104b
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/nic/sl_media_io.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/hpe/sl/sl_ldev.h>
+
+#include "sl_media_ldev.h"
+#include "sl_media_io.h"
+#include "sl_media_jack.h"
+#include "base/sl_media_log.h"
+
+#define LOG_NAME SL_MEDIA_IO_LOG_NAME
+
+int sl_media_io_write8(struct sl_media_jack *media_jack, u8 page, u8 offset, u8 data)
+{
+	struct sl_media_ldev *media_ldev;
+
+	media_ldev = media_jack->media_ldev;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "media_io_write8 0x%x <- 0x%x", offset, data);
+
+	return media_ldev->uc_ops->uc_write8(media_ldev->uc_accessor->uc, page, offset, data);
+}
+
+int sl_media_io_read(struct sl_media_jack *media_jack, u8 page, u8 offset, u8 *data, size_t len)
+{
+	int                   rtn_len;
+	struct sl_media_ldev *media_ldev;
+
+	media_ldev = media_jack->media_ldev;
+
+	rtn_len = media_ldev->uc_ops->uc_read(media_ldev->uc_accessor->uc, (u32)offset, (u32)page, data, len);
+	if (rtn_len < 0) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "media_io_read failed [%d]", rtn_len);
+		return rtn_len;
+	}
+
+	if (rtn_len != len) {
+		sl_media_log_err_trace(media_jack, LOG_NAME,
+				       "media_io_read length mismatch (expected = %zu, returned = %d)", len, rtn_len);
+		return -EIO;
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "media_io_read (page = 0x%X, offset = 0x%X, rtn_len = %d)", page, offset, rtn_len);
+
+	return 0;
+}
+
+int sl_media_io_read8(struct sl_media_jack *media_jack, u8 page, u8 offset, u8 *data)
+{
+	return sl_media_io_read(media_jack, page, offset, data, 1);
+}
+
+void sl_media_io_led_set(struct sl_media_jack *media_jack, u8 led_pattern)
+{
+	struct sl_media_ldev *media_ldev;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "media_io_led_set (pattern = %u)", led_pattern);
+
+	media_ldev = media_jack->media_ldev;
+
+	media_ldev->uc_ops->uc_led_set(media_ldev->uc_accessor->uc, led_pattern);
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/nic/sl_media_jack.c b/drivers/net/ethernet/hpe/sl/media/nic/sl_media_jack.c
new file mode 100644
index 000000000000..33f1a2a20ab7
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/nic/sl_media_jack.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024,2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/string.h>
+
+#include <linux/hpe/sl/sl_media.h>
+
+#include "sl_asic.h"
+#include "sl_sysfs.h"
+#include "sl_media_jack.h"
+#include "sl_media_lgrp.h"
+#include "data/sl_media_data_jack.h"
+#include "data/sl_media_data_lgrp.h"
+#include "data/sl_media_data_cable_db_ops.h"
+#include "base/sl_media_log.h"
+#include "base/sl_media_eeprom.h"
+
+#define LOG_NAME SL_MEDIA_JACK_LOG_NAME
+
+#define FLAT_MEM_OFFSET 2
+#define FLAT_MEM_BIT    7
+static int sl_media_data_jack_eeprom_page1_get(struct sl_media_jack *media_jack, u8 *eeprom_page1)
+{
+	sl_media_log_dbg(media_jack, LOG_NAME, "eeprom page1 get");
+
+	if ((media_jack->eeprom_page0[FLAT_MEM_OFFSET] & BIT(FLAT_MEM_BIT)) != 0) {
+		sl_media_log_dbg(media_jack, LOG_NAME, "no page1 in eeprom");
+		return 0;
+	}
+
+	memcpy(media_jack->eeprom_page1, eeprom_page1, SL_MEDIA_EEPROM_PAGE_SIZE);
+
+	return 0;
+}
+
+static int sl_media_jack_cable_attr_set(struct sl_media_jack *media_jack, u8 ldev_num, u8 lgrp_num,
+					struct sl_media_attr *media_attr)
+{
+	int rtn;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable attr set");
+
+	/*
+	 * only first element is valid in cable_info since single lgrp on nic
+	 */
+	media_jack->cable_info[0].ldev_num = ldev_num;
+	media_jack->cable_info[0].lgrp_num = lgrp_num;
+
+	rtn = sl_media_data_jack_media_attr_set(media_jack, &media_jack->cable_info[0], media_attr);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "media attr set failed [%d]", rtn);
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_MEDIA_ATTR_SET);
+		return rtn;
+	}
+
+	return 0;
+}
+
+static void sl_media_jack_cable_attr_errors_update(struct sl_media_jack *media_jack, u32 errors)
+{
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable attr errors update");
+
+	/*
+	 * only first element is valid in cable_info since single lgrp on nic
+	 */
+	media_jack->cable_info[0].media_attr.errors |= errors;
+}
+
+static void sl_media_data_jack_cable_attr_send(struct sl_media_jack *media_jack)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable attr send");
+
+	/*
+	 * only first element is valid in cable_info since single lgrp on nic
+	 */
+	media_lgrp = sl_media_data_lgrp_get(media_jack->cable_info[0].ldev_num,
+					    media_jack->cable_info[0].lgrp_num);
+	if (media_lgrp)
+		sl_media_data_jack_cable_if_present_send(media_lgrp);
+}
+
+int sl_media_jack_cable_insert(u8 ldev_num, u8 lgrp_num, u8 jack_num,
+			       u8 *eeprom_page0, u8 *eeprom_page1, u32 flags)
+{
+	int                   rtn;
+	struct sl_media_attr  media_attr;
+	struct sl_media_jack *media_jack;
+
+	media_jack = sl_media_data_jack_get(ldev_num, jack_num);
+	if (!media_jack) {
+		sl_media_log_err(NULL, LOG_NAME, "media_data_jack_get failed");
+		return -EFAULT;
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable insert");
+
+	/* Start clean so nothing from the previous cable is inherited */
+	sl_media_data_jack_cable_state_clr(media_jack);
+
+	sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_NONE);
+
+	memset(&media_attr, 0, sizeof(struct sl_media_attr));
+
+	media_attr.magic    = SL_MEDIA_ATTR_MAGIC;
+	media_attr.ver      = SL_MEDIA_ATTR_VER;
+	media_attr.size     = sizeof(struct sl_media_attr);
+	media_attr.errors   = 0;
+	media_attr.info     = 0;
+
+	if (flags & SL_MEDIA_TYPE_BACKPLANE) {
+		media_attr.vendor        = SL_MEDIA_VENDOR_HPE;
+		media_attr.type          = SL_MEDIA_TYPE_BKP;
+		media_attr.info          = SL_MEDIA_INFO_AUTONEG;
+		media_attr.length_cm     = 25;
+		media_attr.hpe_pn        = 60821555;
+		media_attr.furcation     = SL_MEDIA_FURCATION_X1;
+		media_attr.speeds_map    = SL_MEDIA_SPEEDS_SUPPORT_CK_400G |
+					   SL_MEDIA_SPEEDS_SUPPORT_CK_200G |
+					   SL_MEDIA_SPEEDS_SUPPORT_BS_200G |
+					   SL_MEDIA_SPEEDS_SUPPORT_CK_100G |
+					   SL_MEDIA_SPEEDS_SUPPORT_CD_100G |
+					   SL_MEDIA_SPEEDS_SUPPORT_BJ_100G |
+					   SL_MEDIA_SPEEDS_SUPPORT_CD_50G;
+		media_attr.max_speed     = SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
+		media_attr.jack_type     = SL_MEDIA_JACK_TYPE_BACKPLANE;
+		strscpy_pad(media_attr.serial_num_str, "AK20212120", sizeof(media_attr.serial_num_str));
+		strscpy_pad(media_attr.hpe_pn_str, "PK60821-555", sizeof(media_attr.hpe_pn_str));
+		strscpy_pad(media_attr.date_code_str, "08-19-21", sizeof(media_attr.date_code_str));
+		memset(media_attr.fw_ver, 0, sizeof(media_attr.fw_ver));
+	} else {
+		memcpy(media_jack->eeprom_page0, eeprom_page0, SL_MEDIA_EEPROM_PAGE_SIZE);
+
+		sl_media_data_jack_eeprom_page1_get(media_jack, eeprom_page1);
+
+		rtn = sl_media_eeprom_format_get(media_jack, &(media_attr.format));
+		if (rtn) {
+			sl_media_log_warn_trace(media_jack, LOG_NAME, "eeprom format unsupported");
+			memset(&media_attr, 0, sizeof(struct sl_media_attr));
+			media_attr.errors |= SL_MEDIA_ERROR_CABLE_FORMAT_UNSUPPORTED;
+			media_attr.errors |= SL_MEDIA_ERROR_TRYABLE;
+			rtn = sl_media_jack_cable_attr_set(media_jack, ldev_num, lgrp_num, &media_attr);
+			if (rtn)
+				sl_media_log_err_trace(media_jack, LOG_NAME, "cable attr set failed [%d]", rtn);
+			sl_media_data_jack_cable_attr_send(media_jack);
+			return 0;
+		}
+
+		sl_media_eeprom_parse(media_jack, &media_attr);
+
+		if (media_attr.type == SL_MEDIA_TYPE_PEC)
+			media_attr.info |= SL_MEDIA_INFO_AUTONEG;
+
+		rtn = sl_media_data_cable_db_ops_cable_validate(&media_attr, media_jack);
+		if (rtn) {
+			sl_media_log_warn_trace(media_jack, LOG_NAME,
+						"cable validate failed [%d] (vendor = %d %s, type = 0x%X %s, length_cm = %d, speeds = 0x%lX)",
+						rtn, media_attr.vendor, sl_media_vendor_str(media_attr.vendor),
+						media_attr.type, sl_media_type_str(media_attr.type),
+						media_attr.length_cm, media_attr.speeds_map);
+
+			media_jack->is_cable_unsupported = true;
+			media_attr.errors |= SL_MEDIA_ERROR_CABLE_UNSUPPORTED;
+			media_attr.errors |= SL_MEDIA_ERROR_TRYABLE;
+		}
+
+		if (SL_MEDIA_LGRP_MEDIA_TYPE_IS_ACTIVE(media_attr.type) &&
+		    !media_jack->is_cable_unsupported && !media_jack->is_supported_ss200_cable) {
+			if (!sl_media_eeprom_is_fw_version_supported(media_jack, &media_attr)) {
+				sl_media_log_warn_trace(media_jack, LOG_NAME, "eeprom fw version unsupported");
+				media_attr.errors |= SL_MEDIA_ERROR_CABLE_FW_UNSUPPORTED;
+				media_attr.errors |= SL_MEDIA_ERROR_TRYABLE;
+			}
+			/*
+			 * disallow BJ100 speed on active cables
+			 */
+			media_attr.speeds_map &= ~SL_MEDIA_SPEEDS_SUPPORT_BJ_100G;
+		}
+
+		if (media_jack->is_supported_ss200_cable) {
+			media_attr.speeds_map  = 0;
+			media_attr.speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_BS_200G;
+			media_attr.speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CD_100G;
+			media_attr.speeds_map |= SL_MEDIA_SPEEDS_SUPPORT_CD_50G;
+			media_attr.info       |= SL_MEDIA_INFO_SUPPORTED_SS200_CABLE;
+		}
+
+		media_attr.jack_type = SL_MEDIA_JACK_TYPE_QSFP;
+		media_attr.jack_type_info.qsfp.density = SL_MEDIA_QSFP_DENSITY_SINGLE;
+	}
+
+	rtn = sl_media_jack_cable_attr_set(media_jack, ldev_num, lgrp_num, &media_attr);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "cable attr set failed [%d]", rtn);
+		return 0;
+	}
+
+	if (media_jack->is_cable_unsupported)
+		flags |= SL_MEDIA_TYPE_UNSUPPORTED;
+	if (media_attr.vendor == SL_MEDIA_VENDOR_MULTILANE)
+		flags |= SL_MEDIA_TYPE_LOOPBACK;
+	rtn = sl_media_data_cable_db_ops_serdes_settings_get(media_jack, media_attr.type, flags);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "serdes settings get failed [%d]", rtn);
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SERDES_SETTINGS_GET);
+		sl_media_data_jack_cable_attr_send(media_jack);
+		return 0;
+	}
+
+	if (SL_MEDIA_LGRP_MEDIA_TYPE_IS_ACTIVE(media_attr.type)) {
+		rtn = sl_media_data_jack_cable_soft_reset(media_jack);
+		if (rtn) {
+			sl_media_log_err_trace(media_jack, LOG_NAME, "cable soft reset failed [%d]", rtn);
+			sl_media_jack_state_set(media_jack, SL_MEDIA_JACK_CABLE_ERROR);
+			sl_media_jack_cable_attr_errors_update(media_jack, SL_MEDIA_ERROR_CABLE_HEADSHELL_FAULT);
+			sl_media_data_jack_cable_attr_send(media_jack);
+			return rtn;
+		}
+
+		/* must be last in the sequence because it needs time to load firmware */
+		rtn = sl_media_jack_cable_high_power_set(ldev_num, jack_num);
+		if (rtn) {
+			sl_media_log_err_trace(media_jack, LOG_NAME, "cable high power set failed [%d]", rtn);
+			sl_media_jack_state_set(media_jack, SL_MEDIA_JACK_CABLE_ERROR);
+			sl_media_jack_cable_attr_errors_update(media_jack, SL_MEDIA_ERROR_CABLE_HEADSHELL_FAULT);
+			sl_media_data_jack_cable_attr_send(media_jack);
+			return 0;
+		}
+	}
+
+	rtn = sl_sysfs_media_speeds_create(ldev_num, lgrp_num);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "media speeds create failed [%d]", rtn);
+		sl_media_data_jack_cable_attr_send(media_jack);
+		return rtn;
+	}
+
+	if (SL_MEDIA_LGRP_MEDIA_TYPE_IS_ACTIVE(media_attr.type)) {
+		if (sl_media_data_jack_cable_hw_shift_state_get(media_jack) ==
+		    SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_DOWNSHIFTED)
+			sl_media_jack_cable_shift_state_set(media_jack, SL_MEDIA_JACK_CABLE_SHIFT_STATE_DOWNSHIFTED);
+		else if (sl_media_data_jack_cable_hw_shift_state_get(media_jack) ==
+			 SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_UPSHIFTED)
+			sl_media_jack_cable_shift_state_set(media_jack, SL_MEDIA_JACK_CABLE_SHIFT_STATE_UPSHIFTED);
+		else
+			sl_media_jack_cable_shift_state_set(media_jack, SL_MEDIA_JACK_CABLE_SHIFT_STATE_NOTSHIFTED);
+	}
+
+	sl_media_jack_state_set(media_jack, SL_MEDIA_JACK_CABLE_ONLINE);
+
+	sl_media_data_jack_cable_attr_send(media_jack);
+
+	return 0;
+}
+
+int sl_media_jack_cable_remove(u8 ldev_num, u8 lgrp_num, u8 jack_num)
+{
+	struct sl_media_jack *media_jack;
+
+	media_jack = sl_media_data_jack_get(ldev_num, jack_num);
+	if (!media_jack) {
+		sl_media_log_err(NULL, LOG_NAME, "media_data_jack_get failed");
+		return -EFAULT;
+	}
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable remove");
+
+	sl_sysfs_media_speeds_delete(ldev_num, lgrp_num);
+
+	/*
+	 * only first element is valid in cable_info since single lgrp on nic
+	 */
+	sl_media_data_jack_media_attr_clr(media_jack, &media_jack->cable_info[0]);
+	sl_media_data_cable_serdes_settings_clr(media_jack);
+	sl_media_data_jack_eeprom_clr(media_jack);
+	sl_media_data_jack_cable_state_clr(media_jack);
+
+	sl_media_jack_state_set(media_jack, SL_MEDIA_JACK_CABLE_REMOVED);
+	sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_NONE);
+
+	return 0;
+}
+
+int sl_media_jack_cable_temp_hw_check(struct sl_media_jack *media_jack)
+{
+	return SL_MEDIA_JACK_TEMP_STATE_COLD;
+}
+
+void sl_media_jack_cable_hot_notif_send(struct sl_media_jack *media_jack)
+{
+}
+
+void sl_media_jack_cable_warm_notif_send(struct sl_media_jack *media_jack)
+{
+}
+
+void sl_media_jack_cable_cold_notif_send(struct sl_media_jack *media_jack)
+{
+}
+
+void sl_media_jack_cable_hot_notif_sent_set(struct sl_media_jack *media_jack,
+					    struct sl_media_lgrp_cable_info *cable_info, bool value)
+{
+}
+
+void sl_media_jack_cable_warm_notif_sent_set(struct sl_media_jack *media_jack,
+					     struct sl_media_lgrp_cable_info *cable_info, bool value)
+{
+}
+
+void sl_media_jack_cable_cold_notif_sent_set(struct sl_media_jack *media_jack,
+					     struct sl_media_lgrp_cable_info *cable_info, bool value)
+{
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/nic/sl_media_ldev.c b/drivers/net/ethernet/hpe/sl/media/nic/sl_media_ldev.c
new file mode 100644
index 000000000000..6902223eb76a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/nic/sl_media_ldev.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "sl_media_ldev.h"
+#include "data/sl_media_data_ldev.h"
+
+int sl_media_ldev_uc_ops_set(u8 ldev_num, struct sl_uc_ops *uc_ops,
+			     struct sl_uc_accessor *uc_accessor)
+{
+	return sl_media_data_ldev_uc_ops_set(ldev_num, uc_ops, uc_accessor);
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/sl_media_jack.c b/drivers/net/ethernet/hpe/sl/media/sl_media_jack.c
new file mode 100644
index 000000000000..14be1d19c097
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/sl_media_jack.c
@@ -0,0 +1,1067 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/delay.h>
+
+#include "sl_asic.h"
+#include "sl_core_link.h"
+#include "sl_media_jack.h"
+#include "sl_media_lgrp.h"
+#include "sl_media_io.h"
+#include "data/sl_media_data_jack.h"
+#include "base/sl_media_log.h"
+
+#define LOG_NAME SL_MEDIA_JACK_LOG_NAME
+
+#define SL_MEDIA_JACK_SIGNAL_CACHE_LIFETIME_MS 1200
+#define SL_MEDIA_JACK_SIGNAL_READ_TIMEOUT_MS   (2 * SL_MEDIA_JACK_SIGNAL_CACHE_LIFETIME_MS)
+#define SL_MEDIA_JACK_MAX_NUM_LANE_DATA_READS  4
+#define SL_MEDIA_JACK_LANE_DATA_POLL_TIME_MS   (SL_MEDIA_JACK_SIGNAL_CACHE_LIFETIME_MS / \
+						SL_MEDIA_JACK_MAX_NUM_LANE_DATA_READS)
+
+#define SWAP_BYTE_NIBBLE(_x) ({                    \
+	typeof(_x) __x = (_x);                     \
+	((__x & 0x0F) << 4) | ((__x & 0xF0) >> 4); \
+})
+
+#define MEDIA_LANE_DP_STATE_GET(_lane_data, _lane_num) ({ \
+	typeof(_lane_data) __lane_data = (_lane_data);    \
+	typeof(_lane_num)  __lane_num  = (_lane_num);     \
+	(__lane_data)->dp_states[__lane_num / 2] >>       \
+		(4 * (__lane_num & 1)) & 0x0F;            \
+})
+
+#define SL_MEDIA_JACK_SIGNAL_INFO_ALLOWED(_dp_state) ({         \
+	typeof(_dp_state) __dp_state = (_dp_state);             \
+	((__dp_state) == SL_MEDIA_JACK_DP_STATE_ACTIVATED)   || \
+	((__dp_state) == SL_MEDIA_JACK_DP_STATE_TX_TURN_ON)  || \
+	((__dp_state) == SL_MEDIA_JACK_DP_STATE_TX_TURN_OFF) || \
+	((__dp_state) == SL_MEDIA_JACK_DP_STATE_INITIALIZED);   \
+})
+
+enum sl_media_cable_shift {
+	SL_MEDIA_JACK_CABLE_DOWNSHIFT,
+	SL_MEDIA_JACK_CABLE_UPSHIFT,
+};
+
+int sl_media_jack_new(struct sl_media_ldev *media_ldev, u8 jack_num)
+{
+	return sl_media_data_jack_new(media_ldev, jack_num);
+}
+
+void sl_media_jack_del(u8 ldev_num, u8 jack_num)
+{
+	sl_media_data_jack_del(ldev_num, jack_num);
+}
+
+struct sl_media_jack *sl_media_jack_get(u8 ldev_num, u8 jack_num)
+{
+	return sl_media_data_jack_get(ldev_num, jack_num);
+}
+
+void sl_media_jack_state_set(struct sl_media_jack *media_jack, u8 jack_state)
+{
+	spin_lock(&media_jack->data_lock);
+	media_jack->state = jack_state;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_data_jack_led_set(media_jack);
+}
+
+int sl_media_jack_state_get(struct sl_media_jack *media_jack, u8 *state)
+{
+	spin_lock(&media_jack->data_lock);
+	*state = media_jack->state;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_jack_cable_end_get(struct sl_media_jack *media_jack, u8 *cable_end)
+{
+	spin_lock(&media_jack->data_lock);
+	*cable_end = media_jack->cable_end;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+bool sl_media_jack_is_high_powered(struct sl_media_jack *media_jack)
+{
+	bool is_high_powered;
+
+	spin_lock(&media_jack->data_lock);
+	is_high_powered = media_jack->is_high_powered;
+	spin_unlock(&media_jack->data_lock);
+
+	return is_high_powered;
+}
+
+void sl_media_jack_cable_shift_state_set(struct sl_media_jack *media_jack, u8 state)
+{
+	spin_lock(&media_jack->data_lock);
+	media_jack->cable_shift_state = state;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable shift state set = %u", media_jack->cable_shift_state);
+}
+
+int sl_media_jack_cable_shift_state_get(struct sl_media_jack *media_jack, u8 *cable_shift_state)
+{
+	spin_lock(&media_jack->data_lock);
+	*cable_shift_state = media_jack->cable_shift_state;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable shift state get = %u", *cable_shift_state);
+
+	return 0;
+}
+
+bool sl_media_jack_is_cable_online(struct sl_media_jack *media_jack)
+{
+	u8 state;
+
+	spin_lock(&media_jack->data_lock);
+	state = media_jack->state;
+	spin_unlock(&media_jack->data_lock);
+
+	return (state == SL_MEDIA_JACK_CABLE_ONLINE);
+}
+
+bool sl_media_jack_is_cable_format_unsupported(struct sl_media_jack *media_jack)
+{
+	bool is_format_unsupported;
+
+	spin_lock(&media_jack->data_lock);
+	is_format_unsupported = media_jack->is_cable_format_unsupported;
+	spin_unlock(&media_jack->data_lock);
+
+	return is_format_unsupported;
+}
+
+int sl_media_jack_active_cable_200g_host_interface_get(struct sl_media_jack *media_jack, u8 *host_interface_200_gaui)
+{
+	spin_lock(&media_jack->data_lock);
+	*host_interface_200_gaui = media_jack->host_interface_200_gaui;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_jack_active_cable_200g_appsel_num_get(struct sl_media_jack *media_jack, u8 *appsel_num_200_gaui)
+{
+	spin_lock(&media_jack->data_lock);
+	*appsel_num_200_gaui = media_jack->appsel_num_200_gaui;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_jack_active_cable_200g_lane_count_get(struct sl_media_jack *media_jack, u8 *lane_count_200_gaui)
+{
+	spin_lock(&media_jack->data_lock);
+	*lane_count_200_gaui = media_jack->lane_count_200_gaui;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_jack_active_cable_400g_host_interface_get(struct sl_media_jack *media_jack, u8 *host_interface_400_gaui)
+{
+	spin_lock(&media_jack->data_lock);
+	*host_interface_400_gaui = media_jack->host_interface_400_gaui;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_jack_active_cable_400g_appsel_num_get(struct sl_media_jack *media_jack, u8 *appsel_num_400_gaui)
+{
+	spin_lock(&media_jack->data_lock);
+	*appsel_num_400_gaui = media_jack->appsel_num_400_gaui;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_jack_active_cable_400g_lane_count_get(struct sl_media_jack *media_jack, u8 *lane_count_400_gaui)
+{
+	spin_lock(&media_jack->data_lock);
+	*lane_count_400_gaui = media_jack->lane_count_400_gaui;
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+#define SL_MEDIA_HIGH_POWER_WAIT_TIME 10000
+int sl_media_jack_cable_high_power_set(u8 ldev_num, u8 jack_num)
+{
+	int                   rtn;
+	struct sl_media_jack *media_jack;
+
+	media_jack = sl_media_jack_get(ldev_num, jack_num);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "high power set");
+
+	rtn = sl_media_data_jack_cable_high_power_set(media_jack);
+	if (rtn) {
+		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_POWER_SET);
+		sl_media_log_err_trace(media_jack, LOG_NAME, "high power set failed [%d]", rtn);
+		return -EIO;
+	}
+
+	media_jack->cable_high_power_wait_time_end = jiffies +
+		msecs_to_jiffies(SL_MEDIA_HIGH_POWER_WAIT_TIME);
+
+	return 0;
+}
+
+static int sl_media_jack_cable_shift_checks(struct sl_media_lgrp *media_lgrp, u8 shift_state)
+{
+	u8 i;
+
+	sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "cable shift checks");
+
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	if (media_lgrp->media_jack->state != SL_MEDIA_JACK_CABLE_ONLINE) {
+		media_lgrp->media_jack->cable_shift_state = SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_NO_CABLE;
+		spin_unlock(&media_lgrp->media_jack->data_lock);
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "shift check failed - no online cable");
+		return -EFAULT;
+	}
+
+	for (i = 0; i < SL_MEDIA_MAX_LGRPS_PER_JACK; ++i) {
+		if (media_lgrp->media_jack->cable_info[i].real_cable_status == CABLE_MEDIA_ATTR_STASHED) {
+			media_lgrp->media_jack->cable_shift_state = SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_FAKE_CABLE;
+			spin_unlock(&media_lgrp->media_jack->data_lock);
+			sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME,
+					 "shift check failed - fake cable (lgrp_num = %u)",
+					 media_lgrp->media_jack->cable_info[i].lgrp_num);
+			return -EFAULT;
+		}
+	}
+	if (!(media_lgrp->media_jack->cable_info[0].media_attr.speeds_map &
+			(SL_MEDIA_SPEEDS_SUPPORT_CK_400G | SL_MEDIA_SPEEDS_SUPPORT_BS_200G))) {
+		media_lgrp->media_jack->cable_shift_state = SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_NO_SUPPORT;
+		spin_unlock(&media_lgrp->media_jack->data_lock);
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME,
+				 "shift check failed - no shift support in cable");
+		return -EINVAL;
+	}
+	if (shift_state == SL_MEDIA_JACK_CABLE_DOWNSHIFT) {
+		if ((media_lgrp->media_jack->host_interface_200_gaui != SL_MEDIA_SS1_HOST_INTERFACE_200GAUI_4_C2M) ||
+		    (media_lgrp->media_jack->lane_count_200_gaui != 0x44) ||
+			(media_lgrp->media_jack->host_interface_400_gaui == 0)) {
+			media_lgrp->media_jack->cable_shift_state = SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_CHECK;
+			spin_unlock(&media_lgrp->media_jack->data_lock);
+			sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME,
+					 "downshift check failed - invalid host interface and/or lane count");
+			return -EINVAL;
+		}
+	} else {
+		if (((media_lgrp->media_jack->host_interface_400_gaui != SL_MEDIA_SS2_HOST_INTERFACE_400GAUI_4_S_C2M) &&
+		     (media_lgrp->media_jack->host_interface_400_gaui != SL_MEDIA_SS1_HOST_INTERFACE_400GAUI_4_L_C2M)) ||
+			(media_lgrp->media_jack->lane_count_400_gaui != 0x44)) {
+			media_lgrp->media_jack->cable_shift_state = SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_CHECK;
+			spin_unlock(&media_lgrp->media_jack->data_lock);
+			sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME,
+					 "upshift check failed - invalid host interface and/or lane count");
+			return -EINVAL;
+		}
+	}
+
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_jack_cable_downshift(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	int                   rtn;
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	struct sl_media_attr  media_attr;
+
+	media_lgrp = sl_media_lgrp_get(ldev_num, lgrp_num);
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "cable downshift");
+
+	if (media_lgrp->media_jack->is_cable_unsupported) {
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "cable unsupported - shift not required");
+		return 0;
+	}
+
+	if (media_lgrp->media_jack->is_supported_ss200_cable) {
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "ss200 cable - shift not required");
+		return 0;
+	}
+
+	if (!sl_media_lgrp_media_type_is_active(media_lgrp->media_ldev->num, media_lgrp->num)) {
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "non-active cable - shift not required");
+		return 0;
+	}
+
+	if (sl_media_data_jack_cable_hw_shift_state_get(media_lgrp->media_jack) == SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_DOWNSHIFTED) {
+		sl_media_jack_cable_shift_state_set(media_lgrp->media_jack, SL_MEDIA_JACK_CABLE_SHIFT_STATE_DOWNSHIFTED);
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "already downshifted");
+		return 0;
+	}
+
+	rtn = sl_media_jack_cable_shift_checks(media_lgrp, SL_MEDIA_JACK_CABLE_DOWNSHIFT);
+	if (rtn) {
+		sl_media_log_err_trace(media_lgrp->media_jack, LOG_NAME, "cable shift checks failed [%d]", rtn);
+		return 0;
+	}
+
+	if (!sl_core_link_policy_is_ignore_media_errors_set(core_link)) {
+		sl_media_lgrp_media_attr_get(ldev_num, lgrp_num, &media_attr);
+		if (media_attr.errors & SL_MEDIA_ERROR_CABLE_FW_UNSUPPORTED) {
+			sl_media_log_err_trace(media_lgrp->media_jack, LOG_NAME,
+					       "can't downshift - cable firmware unsupported");
+			return 0;
+		}
+	}
+
+	rtn = sl_media_data_jack_cable_downshift(media_lgrp->media_jack);
+	if (rtn) {
+		sl_media_jack_cable_shift_state_set(media_lgrp->media_jack,
+						    SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_DOWNSHIFT);
+		sl_media_log_err_trace(media_lgrp->media_jack, LOG_NAME, "data jack cable downshift failed [%d]", rtn);
+		return rtn;
+	}
+
+	sl_media_jack_cable_shift_state_set(media_lgrp->media_jack, SL_MEDIA_JACK_CABLE_SHIFT_STATE_DOWNSHIFTED);
+
+	return 0;
+}
+
+int sl_media_jack_cable_upshift(u8 ldev_num, u8 lgrp_num, u8 link_num)
+{
+	int                   rtn;
+	struct sl_media_lgrp *media_lgrp;
+	struct sl_core_link *core_link __free(sl_core_link_put) = NULL;
+	struct sl_media_attr  media_attr;
+
+	media_lgrp = sl_media_lgrp_get(ldev_num, lgrp_num);
+	core_link = sl_core_link_get(ldev_num, lgrp_num, link_num);
+	if (!core_link)
+		return -ENODEV;
+
+	sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "cable upshift");
+
+	if (media_lgrp->media_jack->is_cable_unsupported) {
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "cable unsupported - shift not required");
+		return 0;
+	}
+
+	if (media_lgrp->media_jack->is_supported_ss200_cable) {
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "ss200 cable - shift not required");
+		return 0;
+	}
+
+	if (!sl_media_lgrp_media_type_is_active(media_lgrp->media_ldev->num, media_lgrp->num)) {
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "non-active cable - shift not required");
+		return 0;
+	}
+
+	if (sl_media_data_jack_cable_hw_shift_state_get(media_lgrp->media_jack) == SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_UPSHIFTED) {
+		sl_media_jack_cable_shift_state_set(media_lgrp->media_jack, SL_MEDIA_JACK_CABLE_SHIFT_STATE_UPSHIFTED);
+		sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "already upshifted");
+		return 0;
+	}
+
+	rtn = sl_media_jack_cable_shift_checks(media_lgrp, SL_MEDIA_JACK_CABLE_UPSHIFT);
+	if (rtn) {
+		sl_media_log_err_trace(media_lgrp->media_jack, LOG_NAME, "cable shift checks failed [%d]", rtn);
+		return 0;
+	}
+
+	if (!sl_core_link_policy_is_ignore_media_errors_set(core_link)) {
+		sl_media_lgrp_media_attr_get(ldev_num, lgrp_num, &media_attr);
+		if (media_attr.errors & SL_MEDIA_ERROR_CABLE_FW_UNSUPPORTED) {
+			sl_media_log_err_trace(media_lgrp->media_jack, LOG_NAME,
+					       "can't upshift - cable firmware unsupported");
+			return 0;
+		}
+	}
+
+	rtn = sl_media_data_jack_cable_upshift(media_lgrp->media_jack);
+	if (rtn) {
+		sl_media_jack_cable_shift_state_set(media_lgrp->media_jack,
+						    SL_MEDIA_JACK_CABLE_SHIFT_STATE_FAILED_UPSHIFT);
+		sl_media_log_err_trace(media_lgrp->media_jack, LOG_NAME, "data jack cable upshift failed [%d]", rtn);
+		return rtn;
+	}
+
+	sl_media_jack_cable_shift_state_set(media_lgrp->media_jack, SL_MEDIA_JACK_CABLE_SHIFT_STATE_UPSHIFTED);
+
+	return 0;
+}
+
+void sl_media_jack_fault_cause_set(struct sl_media_jack *media_jack, u32 fault_cause)
+{
+	spin_lock(&media_jack->data_lock);
+	media_jack->fault_cause = fault_cause;
+	media_jack->fault_time  = ktime_get_real_seconds();
+	spin_unlock(&media_jack->data_lock);
+
+	if (fault_cause == SL_MEDIA_FAULT_CAUSE_NONE)
+		return;
+
+	if (fault_cause == SL_MEDIA_FAULT_CAUSE_HOT)
+		sl_media_data_jack_led_set(media_jack);
+
+	sl_ctrl_media_cause_counter_inc(media_jack, fault_cause);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "fault cause set (cause = %u %s)", fault_cause,
+			 sl_media_fault_cause_str(fault_cause));
+}
+
+int sl_media_jack_fault_cause_get(struct sl_media_jack *media_jack, u32 *fault_cause,
+				  time64_t *fault_time)
+{
+	spin_lock(&media_jack->data_lock);
+	*fault_cause = media_jack->fault_cause;
+	*fault_time  = media_jack->fault_time;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "cable fault cause get (cause = %u %s)", *fault_cause,
+			 sl_media_fault_cause_str(*fault_cause));
+
+	return 0;
+}
+
+const char *sl_media_fault_cause_str(u32 fault_cause)
+{
+	switch (fault_cause) {
+	case SL_MEDIA_FAULT_CAUSE_EEPROM_FORMAT_UNSUPPORTED:
+		return "eeprom-format-unsupported";
+	case SL_MEDIA_FAULT_CAUSE_EEPROM_VENDOR_UNSUPPORTED:
+		return "eeprom-vendor-unsupported";
+	case SL_MEDIA_FAULT_CAUSE_EEPROM_JACK_IO:
+		return "eeprom-jack-io";
+	case SL_MEDIA_FAULT_CAUSE_ONLINE_STATUS_GET:
+		return "online-status-get";
+	case SL_MEDIA_FAULT_CAUSE_ONLINE_TIMEDOUT:
+		return "online-timedout";
+	case SL_MEDIA_FAULT_CAUSE_ONLINE_JACK_IO:
+		return "online-jack-io";
+	case SL_MEDIA_FAULT_CAUSE_ONLINE_JACK_GET:
+		return "online-jack-get";
+	case SL_MEDIA_FAULT_CAUSE_SERDES_SETTINGS_GET:
+		return "serdes-settings-get";
+	case SL_MEDIA_FAULT_CAUSE_SCAN_STATUS_GET:
+		return "scan-status-get";
+	case SL_MEDIA_FAULT_CAUSE_SCAN_HDL_GET:
+		return "scan-hdl-get";
+	case SL_MEDIA_FAULT_CAUSE_SCAN_JACK_GET:
+		return "scan-jack-get";
+	case SL_MEDIA_FAULT_CAUSE_MEDIA_ATTR_SET:
+		return "media-attr-set";
+	case SL_MEDIA_FAULT_CAUSE_INTR_EVENT_JACK_IO:
+		return "intr-event-jack-io";
+	case SL_MEDIA_FAULT_CAUSE_POWER_SET:
+		return "power-set";
+	case SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO:
+		return "shift-down-jack-io";
+	case SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO_LOW_POWER_SET:
+		return "shift-down-jack-io-low-power-set";
+	case SL_MEDIA_FAULT_CAUSE_SHIFT_DOWN_JACK_IO_HIGH_POWER_SET:
+		return "shift-down-jack-io-high-power-set";
+	case SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO:
+		return "shift-up-jack-io";
+	case SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO_LOW_POWER_SET:
+		return "shift-up-jack-io-low-power-set";
+	case SL_MEDIA_FAULT_CAUSE_SHIFT_UP_JACK_IO_HIGH_POWER_SET:
+		return "shift-up-jack-io-high-power-set";
+	case SL_MEDIA_FAULT_CAUSE_SHIFT_STATE_JACK_IO:
+		return "shift-state-jack-io";
+	case SL_MEDIA_FAULT_CAUSE_OFFLINE:
+		return "offline";
+	case SL_MEDIA_FAULT_CAUSE_HOT:
+		return "hot";
+	case SL_MEDIA_FAULT_CAUSE_WARM:
+		return "warm";
+	default:
+		return "unknown";
+	}
+}
+
+const char *sl_media_temp_state_str(u8 temperature_state)
+{
+	switch (temperature_state) {
+	case SL_MEDIA_JACK_TEMP_STATE_COLD:
+		return "cold";
+	case SL_MEDIA_JACK_TEMP_STATE_WARM:
+		return "warm";
+	case SL_MEDIA_JACK_TEMP_STATE_HOT:
+		return "hot";
+	default:
+		return "unknown";
+	}
+}
+
+int sl_media_jack_cable_temp_state_get(struct sl_media_jack *media_jack, u8 *temperature_state)
+{
+	return sl_media_data_jack_cable_temp_state_get(media_jack, temperature_state);
+}
+
+int sl_media_jack_cable_temp_prev_state_get(struct sl_media_jack *media_jack, u8 *temperature_prev_state)
+{
+	return sl_media_data_jack_cable_temp_prev_state_get(media_jack, temperature_prev_state);
+}
+
+int sl_media_jack_cable_temp_get(u8 ldev_num, u8 lgrp_num, u8 *temp)
+{
+	struct sl_media_lgrp *group = sl_media_lgrp_get(ldev_num, lgrp_num);
+
+	if (!group || !group->media_jack)
+		return -EBADRQC;
+	return sl_media_data_jack_cable_temp_get(group->media_jack, temp);
+}
+
+int sl_media_jack_cable_temp_warn_limit_get(u8 ldev_num, u8 lgrp_num, u8 *temp_warn_limit_c)
+{
+	struct sl_media_lgrp *group = sl_media_lgrp_get(ldev_num, lgrp_num);
+
+	if (!group || !group->media_jack)
+		return -EBADRQC;
+	return sl_media_data_jack_cable_temp_warn_limit_get(group->media_jack,
+							 temp_warn_limit_c);
+}
+
+int sl_media_jack_cable_temp_down_limit_get(u8 ldev_num, u8 lgrp_num, u8 *temp_down_limit_c)
+{
+	struct sl_media_lgrp *group = sl_media_lgrp_get(ldev_num, lgrp_num);
+
+	if (!group || !group->media_jack)
+		return -EBADRQC;
+	return sl_media_data_jack_cable_temp_down_limit_get(group->media_jack,
+							 temp_down_limit_c);
+}
+
+int sl_media_jack_cable_low_power_set(struct sl_media_jack *media_jack)
+{
+	return sl_media_data_jack_cable_low_power_set(media_jack);
+}
+
+void sl_media_jack_led_set(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp->media_jack, LOG_NAME, "led set");
+
+	sl_media_data_jack_led_set(media_lgrp->media_jack);
+}
+
+static const char *sl_media_jack_lane_dp_state_str(u8 dp_state)
+{
+	switch (dp_state) {
+	case SL_MEDIA_JACK_DP_STATE_DEACTIVATED:
+		return "dp-deactivated";
+	case SL_MEDIA_JACK_DP_STATE_INIT:
+		return "dp-init";
+	case SL_MEDIA_JACK_DP_STATE_DEINIT:
+		return "dp-deinit";
+	case SL_MEDIA_JACK_DP_STATE_ACTIVATED:
+		return "dp-activated";
+	case SL_MEDIA_JACK_DP_STATE_TX_TURN_ON:
+		return "dp-tx-turn-on";
+	case SL_MEDIA_JACK_DP_STATE_TX_TURN_OFF:
+		return "dp-tx-turn-off";
+	case SL_MEDIA_JACK_DP_STATE_INITIALIZED:
+		return "dp-initialized";
+	default:
+		return "unknown";
+	}
+}
+
+/* Swap the lanes in the lane data structure. See sl_core_lgrp_media_lane_data_swap
+ * for more details.
+ */
+static void sl_media_jack_lane_data_swap(struct sl_media_jack_lane_data *lane_data)
+{
+	u8 dp_states;
+
+	lane_data->signal.rx.los_map = SWAP_BYTE_NIBBLE(lane_data->signal.rx.los_map);
+	lane_data->signal.tx.los_map = SWAP_BYTE_NIBBLE(lane_data->signal.tx.los_map);
+	lane_data->signal.rx.lol_map = SWAP_BYTE_NIBBLE(lane_data->signal.rx.lol_map);
+	lane_data->signal.tx.lol_map = SWAP_BYTE_NIBBLE(lane_data->signal.tx.lol_map);
+	lane_data->dp_states_changed = SWAP_BYTE_NIBBLE(lane_data->dp_states_changed);
+
+	/* Swap lanes 0 & 1 for 4 & 5 and visa versa */
+	dp_states = lane_data->dp_states[2];
+	lane_data->dp_states[2] = lane_data->dp_states[0];
+	lane_data->dp_states[0] = dp_states;
+
+	/* Swap lanes 2 & 3 for 6 & 7 and visa versa */
+	dp_states = lane_data->dp_states[3];
+	lane_data->dp_states[3] = lane_data->dp_states[1];
+	lane_data->dp_states[1] = dp_states;
+}
+
+#define SL_MEDIA_JACK_DP_STATE_OFFSET    128
+#define SL_MEDIA_JACK_TX_LOS_OFFSET      136
+#define SL_MEDIA_JACK_RX_LOS_OFFSET      147
+#define SL_MEDIA_JACK_MAX_COHERENT_BYTES 8
+static int sl_media_jack_lane_data_read(u8 ldev_num, u8 lgrp_num, struct sl_media_jack_lane_data *lane_data)
+{
+	int                             rtn;
+	u8                              read_bytes[SL_MEDIA_JACK_MAX_COHERENT_BYTES];
+	bool                            swap;
+	struct sl_media_jack_lane_data  tmp_lane_data;
+	struct sl_media_jack           *media_jack;
+
+	media_jack = sl_media_lgrp_get(ldev_num, lgrp_num)->media_jack;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "media_io_read_lane_data (ldev_num = %u, lgrp_num = %u)",
+			 ldev_num, lgrp_num);
+
+	rtn = sl_media_io_read(media_jack, 0x11, SL_MEDIA_JACK_TX_LOS_OFFSET, (u8 *)&tmp_lane_data.signal.tx, 2);
+	if (rtn) {
+		sl_media_log_err(media_jack, LOG_NAME, "media_io_read_data failed [%d]", rtn);
+		return -EIO;
+	}
+
+	rtn = sl_media_io_read(media_jack, 0x11, SL_MEDIA_JACK_RX_LOS_OFFSET, (u8 *)&tmp_lane_data.signal.rx, 2);
+	if (rtn) {
+		sl_media_log_err(media_jack, LOG_NAME, "media_io_read_data failed [%d]", rtn);
+		return -EIO;
+	}
+
+	rtn = sl_media_io_read(media_jack, 0x11, SL_MEDIA_JACK_DP_STATE_OFFSET, read_bytes,
+			       SL_MEDIA_JACK_MAX_COHERENT_BYTES);
+	if (rtn) {
+		sl_media_log_err(media_jack, LOG_NAME, "media_io_read_data failed [%d]", rtn);
+		return -EIO;
+	}
+
+	memcpy(tmp_lane_data.dp_states, read_bytes, 4);
+	tmp_lane_data.dp_states_changed = read_bytes[6];
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "lane data read (dp_states_changed = 0x%X)", tmp_lane_data.dp_states_changed);
+
+	swap = sl_core_lgrp_media_lane_data_swap(ldev_num, lgrp_num);
+	if (swap)
+		sl_media_jack_lane_data_swap(&tmp_lane_data);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "lane data swap = %s", swap ? "yes" : "no");
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "lane data read map (rx_lol = 0x%X, tx_lol = 0x%X, rx_los = 0x%X, tx_los = 0x%X)",
+			 tmp_lane_data.signal.rx.lol_map, tmp_lane_data.signal.tx.lol_map,
+			 tmp_lane_data.signal.rx.los_map, tmp_lane_data.signal.tx.los_map);
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "lanes dp_state (0 = %s, 1 = %s, 2 = %s, 3 = %s, 4 = %s, 5 = %s, 6 = %s, 7 = %s)",
+			 sl_media_jack_lane_dp_state_str(MEDIA_LANE_DP_STATE_GET(&tmp_lane_data, 0)),
+			 sl_media_jack_lane_dp_state_str(MEDIA_LANE_DP_STATE_GET(&tmp_lane_data, 1)),
+			 sl_media_jack_lane_dp_state_str(MEDIA_LANE_DP_STATE_GET(&tmp_lane_data, 2)),
+			 sl_media_jack_lane_dp_state_str(MEDIA_LANE_DP_STATE_GET(&tmp_lane_data, 3)),
+			 sl_media_jack_lane_dp_state_str(MEDIA_LANE_DP_STATE_GET(&tmp_lane_data, 4)),
+			 sl_media_jack_lane_dp_state_str(MEDIA_LANE_DP_STATE_GET(&tmp_lane_data, 5)),
+			 sl_media_jack_lane_dp_state_str(MEDIA_LANE_DP_STATE_GET(&tmp_lane_data, 6)),
+			 sl_media_jack_lane_dp_state_str(MEDIA_LANE_DP_STATE_GET(&tmp_lane_data, 7)));
+
+	spin_lock(&media_jack->data_lock);
+	memcpy(lane_data, &tmp_lane_data, sizeof(*lane_data));
+	spin_unlock(&media_jack->data_lock);
+
+	return 0;
+}
+
+static bool sl_media_jack_is_lane_data_valid(struct sl_media_jack *media_jack, unsigned long serdes_lane_map,
+					     struct sl_media_jack_lane_data *lane_data)
+{
+	u8 serdes_lane_num;
+	u8 lane_dp_state;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "lane data valid (serdes_lane_map = 0x%lx)", serdes_lane_map);
+
+	if (lane_data->dp_states_changed & serdes_lane_map) {
+		sl_media_log_dbg(media_jack, LOG_NAME,
+				 "lane data valid DP state changed (dp_states_changed = 0x%X, serdes_lane_map = 0x%lx)",
+				 lane_data->dp_states_changed, serdes_lane_map);
+		return false;
+	}
+
+	for_each_set_bit(serdes_lane_num, &serdes_lane_map, SL_ASIC_MAX_LANES) {
+		lane_dp_state = MEDIA_LANE_DP_STATE_GET(lane_data, serdes_lane_num);
+
+		if (!SL_MEDIA_JACK_SIGNAL_INFO_ALLOWED(lane_dp_state)) {
+			sl_media_log_dbg(media_jack, LOG_NAME,
+					 "lane data valid DP state not allowed (lane_num = %u, dp_state = %u %s)",
+					 serdes_lane_num, lane_dp_state,
+					 sl_media_jack_lane_dp_state_str(lane_dp_state));
+			return false;
+		}
+	}
+
+	return true;
+}
+
+static void sl_media_jack_lane_data_cache_set(struct sl_media_jack *media_jack,
+					      struct sl_media_jack_lane_data *lane_data)
+{
+	spin_lock(&media_jack->data_lock);
+	media_jack->lane_data.cache.data   = *lane_data;
+	media_jack->lane_data.cache.cached = true;
+	media_jack->lane_data.cache.timestamp_s = ktime_get_real_seconds();
+	spin_unlock(&media_jack->data_lock);
+}
+
+static bool sl_media_jack_lane_data_cache_get(struct sl_media_jack *media_jack,
+					      struct sl_media_jack_lane_data *lane_data)
+{
+	bool     cached;
+
+	spin_lock(&media_jack->data_lock);
+	cached     = media_jack->lane_data.cache.cached;
+	*lane_data = media_jack->lane_data.cache.data;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "lane data cache get map (rx_los = 0x%X, tx_los = 0x%X, rx_lol = 0x%X, tx_lol = 0x%X)",
+			 lane_data->signal.rx.los_map, lane_data->signal.tx.los_map,
+			 lane_data->signal.rx.lol_map, lane_data->signal.tx.lol_map);
+
+	return cached;
+}
+
+static bool sl_media_jack_signal_equal(struct sl_media_jack_signal *a, struct sl_media_jack_signal *b)
+{
+	return (a->rx.los_map == b->rx.los_map) &&
+	       (a->tx.los_map == b->tx.los_map) &&
+	       (a->rx.lol_map == b->rx.lol_map) &&
+	       (a->tx.lol_map == b->tx.lol_map);
+}
+
+static void sl_media_jack_signal_or(struct sl_media_jack_signal *a, struct sl_media_jack_signal *b)
+{
+	a->rx.los_map |= b->rx.los_map;
+	a->tx.los_map |= b->tx.los_map;
+	a->rx.lol_map |= b->rx.lol_map;
+	a->tx.lol_map |= b->tx.lol_map;
+}
+
+static int sl_media_jack_lane_data_get(u8 ldev_num, u8 lgrp_num, u8 serdes_lane_map,
+				       struct sl_media_jack_lane_data *lane_data)
+{
+	int                             rtn;
+	u8                              read_count;
+	bool                            is_stable;
+	struct sl_media_jack_lane_data  current_lane_data;
+	struct sl_media_jack_signal     prev_signal;
+	struct sl_media_jack           *media_jack;
+
+	media_jack = sl_media_lgrp_get(ldev_num, lgrp_num)->media_jack;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "lane data get (ldev_num = %u, lgrp_num = %u, serdes_lane_map = 0x%X)",
+			 ldev_num, lgrp_num, serdes_lane_map);
+
+	rtn = sl_media_jack_lane_data_read(ldev_num, lgrp_num, lane_data);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "lane data read failed [%d]", rtn);
+		return rtn;
+	}
+
+	msleep(SL_MEDIA_JACK_LANE_DATA_POLL_TIME_MS);
+
+	read_count = 0;
+	is_stable  = false;
+
+	rtn = sl_media_jack_lane_data_read(ldev_num, lgrp_num, lane_data);
+	if (rtn) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "lane data read failed [%d]", rtn);
+		return rtn;
+	}
+
+	if (!sl_media_jack_is_lane_data_valid(media_jack, serdes_lane_map, lane_data)) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "lane data not valid");
+		return -EIO;
+	}
+
+	/* Short circuit, no new bits can be set */
+	if (lane_data->signal.rx.los_map == 0xFF &&
+	    lane_data->signal.tx.los_map == 0xFF &&
+	    lane_data->signal.rx.lol_map == 0xFF &&
+	    lane_data->signal.tx.lol_map == 0xFF) {
+		read_count++;
+		is_stable = true;
+		goto out;
+	}
+
+	prev_signal = lane_data->signal;
+
+	msleep(SL_MEDIA_JACK_LANE_DATA_POLL_TIME_MS);
+
+	for (read_count = 1; read_count < SL_MEDIA_JACK_MAX_NUM_LANE_DATA_READS; ++read_count) {
+		rtn = sl_media_jack_lane_data_read(ldev_num, lgrp_num, &current_lane_data);
+		if (rtn) {
+			sl_media_log_err_trace(media_jack, LOG_NAME, "lane data read failed [%d]", rtn);
+			return rtn;
+		}
+
+		if (!sl_media_jack_is_lane_data_valid(media_jack, serdes_lane_map, &current_lane_data)) {
+			sl_media_log_err_trace(media_jack, LOG_NAME, "lane data not valid");
+			return -EIO;
+		}
+
+		prev_signal = lane_data->signal;
+		sl_media_jack_signal_or(&lane_data->signal, &current_lane_data.signal);
+
+		is_stable = sl_media_jack_signal_equal(&lane_data->signal, &prev_signal);
+		if (is_stable) {
+			++read_count;
+			break;
+		}
+
+		msleep(SL_MEDIA_JACK_LANE_DATA_POLL_TIME_MS);
+	}
+
+out:
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "lane data get (read_count = %u)", read_count);
+
+	if (!is_stable) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "lane data unstable");
+		return -EIO;
+	}
+
+	sl_media_jack_lane_data_cache_set(media_jack, lane_data);
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "lane data get map (rx_los = 0x%X, tx_los = 0x%X, rx_lol = 0x%X, tx_lol = 0x%X)",
+			 lane_data->signal.rx.los_map, lane_data->signal.tx.los_map,
+			 lane_data->signal.rx.lol_map, lane_data->signal.tx.lol_map);
+
+	return 0;
+}
+
+int sl_media_jack_signal_get(u8 ldev_num, u8 lgrp_num, u8 serdes_lane_map, struct sl_media_jack_signal *media_signal)
+{
+	int                             rtn;
+	struct sl_media_jack_lane_data  lane_data;
+	struct sl_media_jack           *media_jack;
+	bool                            cached;
+	unsigned long                   time_left;
+	u32                             generation;
+
+	media_jack = sl_media_lgrp_get(ldev_num, lgrp_num)->media_jack;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "signal get (ldev_num = %u, lgrp_num = %u, serdes_lane_map = 0x%X)",
+			 ldev_num, lgrp_num, serdes_lane_map);
+
+	if (!sl_media_lgrp_media_type_is_active(ldev_num, lgrp_num)) {
+		sl_media_log_warn_trace(media_jack, LOG_NAME, "cable not active");
+		return -EBADRQC;
+	}
+
+	if (!sl_media_lgrp_is_signal_status_supported(ldev_num, lgrp_num)) {
+		sl_media_log_dbg(media_jack, LOG_NAME, "signal status unsupported");
+		return -EBADRQC;
+	}
+
+	spin_lock(&media_jack->data_lock);
+	switch (media_jack->lane_data.read_state) {
+	case SL_MEDIA_JACK_LANE_DATA_READ_STATE_IDLE:
+		media_jack->lane_data.read_state = SL_MEDIA_JACK_LANE_DATA_READ_STATE_BUSY;
+		sl_media_log_dbg(media_jack, LOG_NAME, "reading lane data - state set to BUSY");
+		spin_unlock(&media_jack->data_lock);
+
+		rtn = sl_media_jack_lane_data_get(ldev_num, lgrp_num, serdes_lane_map, &lane_data);
+
+		spin_lock(&media_jack->data_lock);
+		media_jack->lane_data.read_state    = SL_MEDIA_JACK_LANE_DATA_READ_STATE_IDLE;
+		media_jack->lane_data.last_read_rtn = rtn;
+		WRITE_ONCE(media_jack->lane_data.read_generation,
+			   media_jack->lane_data.read_generation + 1);
+		spin_unlock(&media_jack->data_lock);
+
+		wake_up_all(&media_jack->lane_data.read_wait);
+
+		if (rtn) {
+			sl_media_log_err_trace(media_jack, LOG_NAME, "lane data read failed [%d]", rtn);
+			return rtn;
+		}
+
+		goto out;
+
+	case SL_MEDIA_JACK_LANE_DATA_READ_STATE_BUSY:
+		generation = media_jack->lane_data.read_generation;
+		sl_media_log_dbg(media_jack, LOG_NAME, "waiting for lane data read to complete");
+		spin_unlock(&media_jack->data_lock);
+
+		time_left = msecs_to_jiffies(SL_MEDIA_JACK_SIGNAL_READ_TIMEOUT_MS);
+		time_left = wait_event_timeout(media_jack->lane_data.read_wait,
+					       READ_ONCE(media_jack->lane_data.read_generation) !=
+					       generation, time_left);
+
+		if (time_left == 0) {
+			sl_media_log_err_trace(media_jack, LOG_NAME, "lane data read timed out");
+			return -ETIMEDOUT;
+		}
+
+		spin_lock(&media_jack->data_lock);
+		rtn = media_jack->lane_data.last_read_rtn;
+		if (rtn) {
+			sl_media_log_err_trace(media_jack, LOG_NAME, "lane data read failed [%d]", rtn);
+			spin_unlock(&media_jack->data_lock);
+			return rtn;
+		}
+
+		cached    = media_jack->lane_data.cache.cached;
+		lane_data = media_jack->lane_data.cache.data;
+		spin_unlock(&media_jack->data_lock);
+
+		if (!cached) {
+			sl_media_log_err_trace(media_jack, LOG_NAME, "lane data not cached");
+			return -EIO;
+		}
+
+		goto out;
+
+	default:
+		sl_media_log_err(media_jack, LOG_NAME, "invalid lane data read state (%u)",
+				 media_jack->lane_data.read_state);
+		spin_unlock(&media_jack->data_lock);
+		return -EIO;
+	}
+
+out:
+	*media_signal = lane_data.signal;
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "signal get (rx_los = 0x%X, rx_lol = 0x%X, tx_los = 0x%X, tx_lol = 0x%X)",
+			 media_signal->rx.los_map, media_signal->rx.lol_map,
+			 media_signal->tx.los_map, media_signal->tx.lol_map);
+
+	return 0;
+}
+
+int sl_media_jack_signal_cache_get(u8 ldev_num, u8 lgrp_num, u8 serdes_lane_map,
+				   struct sl_media_jack_signal *media_signal)
+{
+	struct sl_media_jack_lane_data  lane_data;
+	struct sl_media_jack           *media_jack;
+
+	media_jack = sl_media_lgrp_get(ldev_num, lgrp_num)->media_jack;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "signal cache get (ldev_num =%u, lgrp_num = %u, serdes_lane_map = 0x%X)",
+			 ldev_num, lgrp_num, serdes_lane_map);
+
+	if (!sl_media_jack_lane_data_cache_get(media_jack, &lane_data)) {
+		sl_media_log_err_trace(media_jack, LOG_NAME, "lane data not cached");
+		return -ENOENT;
+	}
+
+	*media_signal = lane_data.signal;
+
+	return 0;
+}
+
+int sl_media_jack_signal_cache_time_s_get(u8 ldev_num, u8 lgrp_num, time64_t *cache_time)
+{
+	bool                  cached;
+	struct sl_media_jack *media_jack;
+
+	media_jack = sl_media_lgrp_get(ldev_num, lgrp_num)->media_jack;
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "signal cache time get (ldev_num =%u, lgrp_num = %u)",
+			 ldev_num, lgrp_num);
+
+	spin_lock(&media_jack->data_lock);
+	cached = media_jack->lane_data.cache.cached;
+	*cache_time = media_jack->lane_data.cache.timestamp_s;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME,
+			 "signal cache time get (cache_time = %lld, cached = %s)",
+			 *cache_time, cached ? "yes" : "no");
+
+	return cached ? 0 : -ENOENT;
+}
+
+int sl_media_jack_attr_error_map_str(unsigned long error_map, char *error_str, unsigned int error_str_size)
+{
+	int rtn;
+	int str_pos;
+	int which;
+
+	if (!error_str)
+		return -EINVAL;
+
+	if (error_str_size < SL_MEDIA_JACK_ATTR_ERR_STR_SIZE)
+		return -EINVAL;
+
+	if (!error_map) {
+		str_pos = snprintf(error_str, error_str_size, "none ");
+		goto out;
+	}
+
+	str_pos = 0;
+
+	for_each_set_bit(which, &error_map, sizeof(error_map) * BITS_PER_BYTE) {
+		switch (BIT(which)) {
+		case SL_MEDIA_ERROR_CABLE_UNSUPPORTED:
+			rtn = snprintf(error_str + str_pos, error_str_size - str_pos, "cable-unsupported ");
+			break;
+		case SL_MEDIA_ERROR_CABLE_FORMAT_UNSUPPORTED:
+			rtn = snprintf(error_str + str_pos, error_str_size - str_pos, "cable-format-unsupported ");
+			break;
+		case SL_MEDIA_ERROR_CABLE_FW_UNSUPPORTED:
+			rtn = snprintf(error_str + str_pos, error_str_size - str_pos, "cable-fw-unsupported ");
+			break;
+		case SL_MEDIA_ERROR_CABLE_HEADSHELL_FAULT:
+			rtn = snprintf(error_str + str_pos, error_str_size - str_pos, "cable-headshell-fault ");
+			break;
+		case SL_MEDIA_ERROR_TEMP_DOWN_LIMIT_DEFAULT:
+			rtn = snprintf(error_str + str_pos, error_str_size - str_pos, "temp-down-limit-default ");
+			break;
+		case SL_MEDIA_ERROR_TEMP_WARN_LIMIT_DEFAULT:
+			rtn = snprintf(error_str + str_pos, error_str_size - str_pos, "temp-warn-limit-default ");
+			break;
+		case SL_MEDIA_ERROR_TRYABLE:
+			rtn = snprintf(error_str + str_pos, error_str_size - str_pos, "tryable ");
+			break;
+		default:
+			rtn = snprintf(error_str + str_pos, error_str_size - str_pos, "unknown ");
+			break;
+		}
+
+		if (rtn < 0) {
+			str_pos = snprintf(error_str, error_str_size, "error ");
+			goto out;
+		}
+		if (str_pos + rtn >= error_str_size) {
+			error_str[str_pos - 2] = '.';
+			error_str[str_pos - 3] = '.';
+			error_str[str_pos - 4] = '.';
+			break;
+		}
+		str_pos += rtn;
+	}
+
+out:
+	error_str[str_pos - 1] = '\0';
+
+	return 0;
+}
+
+int sl_media_jack_attr_error_map_get(struct sl_media_jack *media_jack, u32 *error_map)
+{
+	spin_lock(&media_jack->data_lock);
+	*error_map = media_jack->cable_info->media_attr.errors;
+	spin_unlock(&media_jack->data_lock);
+
+	sl_media_log_dbg(media_jack, LOG_NAME, "attr error map get (error_map = %u)", *error_map);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/sl_media_ldev.c b/drivers/net/ethernet/hpe/sl/media/sl_media_ldev.c
new file mode 100644
index 000000000000..a78d70494b5c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/sl_media_ldev.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#include "sl_media_ldev.h"
+#include "data/sl_media_data_ldev.h"
+
+int sl_media_ldev_new(u8 ldev_num, struct workqueue_struct *workqueue)
+{
+	return sl_media_data_ldev_new(ldev_num, workqueue);
+}
+
+void sl_media_ldev_del(u8 ldev_num)
+{
+	sl_media_data_ldev_del(ldev_num);
+}
+
+struct sl_media_ldev *sl_media_ldev_get(u8 ldev_num)
+{
+	return sl_media_data_ldev_get(ldev_num);
+}
diff --git a/drivers/net/ethernet/hpe/sl/media/sl_media_lgrp.c b/drivers/net/ethernet/hpe/sl/media/sl_media_lgrp.c
new file mode 100644
index 000000000000..b15805a82270
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/media/sl_media_lgrp.c
@@ -0,0 +1,498 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "base/sl_media_log.h"
+
+#include "sl_media_lgrp.h"
+#include "sl_media_jack.h"
+#include "data/sl_media_data_lgrp.h"
+#include "data/sl_media_data_jack.h"
+
+#define LOG_NAME SL_MEDIA_LGRP_LOG_NAME
+
+int sl_media_lgrp_new(u8 ldev_num, u8 lgrp_num)
+{
+	return sl_media_data_lgrp_new(ldev_num, lgrp_num);
+}
+
+void sl_media_lgrp_del(u8 ldev_num, u8 lgrp_num)
+{
+	sl_media_data_lgrp_del(ldev_num, lgrp_num);
+}
+
+struct sl_media_lgrp *sl_media_lgrp_get(u8 ldev_num, u8 lgrp_num)
+{
+	return sl_media_data_lgrp_get(ldev_num, lgrp_num);
+}
+
+void sl_media_lgrp_media_attr_get(u8 ldev_num, u8 lgrp_num, struct sl_media_attr *media_attr)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	memset(media_attr, 0, sizeof(struct sl_media_attr));
+
+	media_lgrp = sl_media_data_lgrp_get(ldev_num, lgrp_num);
+	if (!media_lgrp) {
+		sl_media_log_err(NULL, SL_MEDIA_LGRP_LOG_NAME, "media_data_lgrp_get failed");
+		return;
+	}
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "media_attr_get");
+
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		*media_attr = media_lgrp->cable_info->media_attr;
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		*media_attr = media_lgrp->cable_info->stashed_media_attr;
+		break;
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+}
+
+bool sl_media_lgrp_media_has_error(struct sl_media_lgrp *media_lgrp)
+{
+	struct sl_media_attr media_attr;
+
+	sl_media_lgrp_media_attr_get(media_lgrp->media_ldev->num, media_lgrp->num, &media_attr);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME,
+			 "media has error (media_attr.errors = 0x%X)", media_attr.errors);
+
+	return ((media_attr.errors & (SL_MEDIA_ERROR_CABLE_FORMAT_UNSUPPORTED |
+				      SL_MEDIA_ERROR_CABLE_FW_UNSUPPORTED)) != 0);
+}
+
+void sl_media_lgrp_media_serdes_settings_get(u8 ldev_num, u8 lgrp_num,
+					     struct sl_media_serdes_settings *media_serdes_settings)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_data_lgrp_get(ldev_num, lgrp_num);
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "media serdes settings get");
+
+	*media_serdes_settings = media_lgrp->media_jack->serdes_settings;
+}
+
+bool sl_media_lgrp_media_type_is_active(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_attr media_attr;
+
+	sl_media_lgrp_media_attr_get(ldev_num, lgrp_num, &media_attr);
+
+	return SL_MEDIA_LGRP_MEDIA_TYPE_IS_ACTIVE(media_attr.type);
+}
+
+void sl_media_lgrp_connect_id_set(u8 ldev_num, u8 lgrp_num, const char *connect_id)
+{
+	sl_media_data_lgrp_connect_id_set(sl_media_data_lgrp_get(ldev_num, lgrp_num), connect_id);
+}
+
+void sl_media_lgrp_real_cable_if_present_send(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_data_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "real cable if present send");
+
+	sl_media_data_jack_cable_if_present_send(media_lgrp);
+}
+
+void sl_media_lgrp_real_cable_if_not_present_send(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_data_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "real cable if not present send");
+
+	sl_media_data_jack_cable_if_not_present_send(media_lgrp);
+}
+
+void sl_media_lgrp_cable_hot_send(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "cable hot send");
+
+	if (sl_media_lgrp_media_type_is_active(ldev_num, lgrp_num)) {
+		sl_media_lgrp_hot_client_ready_set(ldev_num, lgrp_num, true);
+		if (sl_media_jack_cable_temp_hw_check(media_lgrp->media_jack) == SL_MEDIA_JACK_TEMP_STATE_HOT) {
+			sl_media_jack_fault_cause_set(media_lgrp->media_jack, SL_MEDIA_FAULT_CAUSE_HOT);
+			sl_media_jack_cable_hot_notif_send(media_lgrp->media_jack);
+		}
+	}
+}
+
+void sl_media_lgrp_cable_warm_send(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "cable warm send");
+
+	if (sl_media_lgrp_media_type_is_active(ldev_num, lgrp_num)) {
+		sl_media_lgrp_warm_client_ready_set(ldev_num, lgrp_num, true);
+		if (sl_media_jack_cable_temp_hw_check(media_lgrp->media_jack) == SL_MEDIA_JACK_TEMP_STATE_WARM) {
+			sl_media_jack_cable_warm_notif_send(media_lgrp->media_jack);
+		}
+	}
+}
+
+void sl_media_lgrp_cable_cold_send(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "cable cold send");
+
+	if (sl_media_lgrp_media_type_is_active(ldev_num, lgrp_num)) {
+		sl_media_lgrp_cold_client_ready_set(ldev_num, lgrp_num, true);
+		if (sl_media_jack_cable_temp_hw_check(media_lgrp->media_jack) == SL_MEDIA_JACK_TEMP_STATE_COLD)
+			sl_media_jack_cable_cold_notif_send(media_lgrp->media_jack);
+	}
+}
+
+void sl_media_lgrp_cable_temp_flags_clr(u8 ldev_num, u8 lgrp_num)
+{
+	u8                   i;
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "cable temp flags clr");
+
+	for (i = 0; i < media_lgrp->media_jack->port_count; ++i) {
+		if (sl_media_lgrp_media_type_is_active(ldev_num, lgrp_num)) {
+			sl_media_lgrp_hot_client_ready_set(ldev_num, lgrp_num, false);
+			sl_media_jack_cable_hot_notif_sent_set(media_lgrp->media_jack,
+							       &media_lgrp->media_jack->cable_info[i], false);
+			sl_media_lgrp_warm_client_ready_set(ldev_num, lgrp_num, false);
+			sl_media_jack_cable_warm_notif_sent_set(media_lgrp->media_jack,
+								&media_lgrp->media_jack->cable_info[i], false);
+			sl_media_lgrp_cold_client_ready_set(ldev_num, lgrp_num, false);
+			sl_media_jack_cable_cold_notif_sent_set(media_lgrp->media_jack,
+								&media_lgrp->media_jack->cable_info[i], false);
+		}
+	}
+}
+
+void sl_media_lgrp_hot_client_ready_set(u8 ldev_num, u8 lgrp_num, bool value)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_data_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "hot client ready set (value = %s)",
+			 value ? "true" : "false");
+
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	media_lgrp->cable_info->hot_client_ready = value;
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+}
+
+void sl_media_lgrp_warm_client_ready_set(u8 ldev_num, u8 lgrp_num, bool value)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_data_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "warm client ready set (value = %s)",
+			 value ? "true" : "false");
+
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	media_lgrp->cable_info->warm_client_ready = value;
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+}
+
+void sl_media_lgrp_cold_client_ready_set(u8 ldev_num, u8 lgrp_num, bool value)
+{
+	struct sl_media_lgrp *media_lgrp;
+
+	media_lgrp = sl_media_data_lgrp_get(ldev_num, lgrp_num);
+
+	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "cold client ready set (value = %s)",
+			 value ? "true" : "false");
+
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	media_lgrp->cable_info->cold_client_ready = value;
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+}
+
+int sl_media_lgrp_vendor_get(struct sl_media_lgrp *media_lgrp, u32 *vendor)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		*vendor = media_lgrp->cable_info->media_attr.vendor;
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		*vendor = media_lgrp->cable_info->stashed_media_attr.vendor;
+		break;
+	default:
+		*vendor = SL_MEDIA_VENDOR_UNKNOWN;
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_vendor_pn_str_get(struct sl_media_lgrp *media_lgrp, char *vendor_pn_str)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		strscpy_pad(vendor_pn_str,
+			    media_lgrp->cable_info->media_attr.vendor_pn_str, SL_MEDIA_VENDOR_PN_SIZE);
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		strscpy_pad(vendor_pn_str,
+			    media_lgrp->cable_info->stashed_media_attr.vendor_pn_str, SL_MEDIA_VENDOR_PN_SIZE);
+		break;
+	default:
+		memset(vendor_pn_str, '0', SL_MEDIA_VENDOR_PN_SIZE - 2);
+		vendor_pn_str[SL_MEDIA_VENDOR_PN_SIZE - 1] = '\0';
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_type_get(struct sl_media_lgrp *media_lgrp, u32 *type)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		*type = media_lgrp->cable_info->media_attr.type;
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		*type = media_lgrp->cable_info->stashed_media_attr.type;
+		break;
+	default:
+		*type = SL_MEDIA_TYPE_UNKNOWN;
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_shape_get(struct sl_media_lgrp *media_lgrp, u32 *shape)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		*shape = media_lgrp->cable_info->media_attr.shape;
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		*shape = media_lgrp->cable_info->stashed_media_attr.shape;
+		break;
+	default:
+		*shape = SL_MEDIA_SHAPE_UNKNOWN;
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_length_get(struct sl_media_lgrp *media_lgrp, u32 *length_cm)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		*length_cm = media_lgrp->cable_info->media_attr.length_cm;
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		*length_cm = media_lgrp->cable_info->stashed_media_attr.length_cm;
+		break;
+	default:
+		*length_cm = 0;
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_max_speed_get(struct sl_media_lgrp *media_lgrp, u32 *max_speed)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		*max_speed = media_lgrp->cable_info->media_attr.max_speed;
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		*max_speed = media_lgrp->cable_info->stashed_media_attr.max_speed;
+		break;
+	default:
+		*max_speed = 0;
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_serial_num_str_get(struct sl_media_lgrp *media_lgrp, char *serial_num_str)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		strscpy_pad(serial_num_str,
+			    media_lgrp->cable_info->media_attr.serial_num_str, SL_MEDIA_SERIAL_NUM_SIZE);
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		strscpy_pad(serial_num_str,
+			    media_lgrp->cable_info->stashed_media_attr.serial_num_str, SL_MEDIA_SERIAL_NUM_SIZE);
+		break;
+	default:
+		memset(serial_num_str, '0', (SL_MEDIA_SERIAL_NUM_SIZE - 1));
+		serial_num_str[SL_MEDIA_SERIAL_NUM_SIZE - 1] = '\0';
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_hpe_pn_str_get(struct sl_media_lgrp *media_lgrp, char *hpe_pn_str)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		strscpy_pad(hpe_pn_str,
+			    media_lgrp->cable_info->media_attr.hpe_pn_str, SL_MEDIA_HPE_PN_SIZE);
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		strscpy_pad(hpe_pn_str,
+			    media_lgrp->cable_info->stashed_media_attr.hpe_pn_str, SL_MEDIA_HPE_PN_SIZE);
+		break;
+	default:
+		memset(hpe_pn_str, '0', SL_MEDIA_HPE_PN_SIZE - 2);
+		hpe_pn_str[SL_MEDIA_HPE_PN_SIZE - 1] = '\0';
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_jack_type_get(struct sl_media_lgrp *media_lgrp, u32 *jack_type)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		*jack_type = media_lgrp->cable_info->media_attr.jack_type;
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		*jack_type = media_lgrp->cable_info->stashed_media_attr.jack_type;
+		break;
+	default:
+		*jack_type = SL_MEDIA_JACK_TYPE_UNKNOWN;
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_jack_type_qsfp_density_get(struct sl_media_lgrp *media_lgrp, u32 *density)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		*density = media_lgrp->cable_info->media_attr.jack_type_info.qsfp.density;
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		*density = media_lgrp->cable_info->stashed_media_attr.jack_type_info.qsfp.density;
+		break;
+	default:
+		*density = SL_MEDIA_QSFP_DENSITY_UNKNOWN;
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_furcation_get(struct sl_media_lgrp *media_lgrp, u32 *furcation)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		*furcation = media_lgrp->cable_info->media_attr.furcation;
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		*furcation = media_lgrp->cable_info->stashed_media_attr.furcation;
+		break;
+	default:
+		*furcation = SL_MEDIA_FURCATION_UNKNOWN;
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+bool sl_media_lgrp_is_cable_unsupported(struct sl_media_lgrp *media_lgrp)
+{
+	bool unsupported;
+
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	unsupported = media_lgrp->media_jack->is_cable_unsupported;
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return unsupported;
+}
+
+int sl_media_lgrp_date_code_str_get(struct sl_media_lgrp *media_lgrp, char *date_code_str)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		strscpy_pad(date_code_str,
+			    media_lgrp->cable_info->media_attr.date_code_str, SL_MEDIA_DATE_CODE_SIZE);
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		strscpy_pad(date_code_str,
+			    media_lgrp->cable_info->stashed_media_attr.date_code_str, SL_MEDIA_DATE_CODE_SIZE);
+		break;
+	default:
+		memset(date_code_str, '0', SL_MEDIA_DATE_CODE_SIZE - 2);
+		date_code_str[SL_MEDIA_DATE_CODE_SIZE - 1] = '\0';
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+int sl_media_lgrp_fw_ver_str_get(struct sl_media_lgrp *media_lgrp, u8 *fw_ver)
+{
+	spin_lock(&media_lgrp->media_jack->data_lock);
+	switch (media_lgrp->cable_info->real_cable_status) {
+	case CABLE_MEDIA_ATTR_ADDED:
+		memcpy(fw_ver, media_lgrp->cable_info->media_attr.fw_ver, SL_MEDIA_FIRMWARE_VERSION_SIZE);
+		break;
+	case CABLE_MEDIA_ATTR_STASHED:
+		memcpy(fw_ver, media_lgrp->cable_info->stashed_media_attr.fw_ver, SL_MEDIA_FIRMWARE_VERSION_SIZE);
+		break;
+	default:
+		memset(fw_ver, 0, SL_MEDIA_FIRMWARE_VERSION_SIZE);
+	}
+	spin_unlock(&media_lgrp->media_jack->data_lock);
+
+	return 0;
+}
+
+bool sl_media_lgrp_is_signal_status_supported(u8 ldev_num, u8 lgrp_num)
+{
+	struct sl_media_attr media_attr;
+
+	sl_media_lgrp_media_attr_get(ldev_num, lgrp_num, &media_attr);
+
+	return (media_attr.supported_flags_advertised[0] & SL_MEDIA_ADVERTISED_FLAGS_TX_LOS) ||
+	       (media_attr.supported_flags_advertised[0] & SL_MEDIA_ADVERTISED_FLAGS_TX_LOL) ||
+	       (media_attr.supported_flags_advertised[1] & SL_MEDIA_ADVERTISED_FLAGS_RX_LOS) ||
+	       (media_attr.supported_flags_advertised[1] & SL_MEDIA_ADVERTISED_FLAGS_RX_LOL);
+}

-- 
2.56.0

