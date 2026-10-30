Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394065;
	b=JGWXfPZkwuszIycenl1dMkicUiOOAXUBwAafG08ruHflF3ZdPmpNtQWU5Q8hUdD6zFi4
	 MS8ri/7a6WW0cG8ten3Bk0qrH4GDXITEc2kic8p4KoOE4+538MKIeet2R5K3FiABs33H0
	 OeKFov7Dbup0hxw9Q6l/wE9UpLE8KAK6uoYlNpsNDCCWchXpNnQzeNo6ID9Az/3iz3lQM
	 3nw0Yosj1PWz89pOpWq08loHryBBr4NIVJCkaQmBMVrj7MTQIDnAZYWEOQbAxPzhDB5zs
	 fRYUA7d1ITPe4Oo7XkG2ed/ae2NrT1liQ/3dkM1dhFkEVpE8VFiIZKEO9j2y929xO9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394065;
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
	bh=UUetOG8bb12H7eTtGvbIiaV5Extzs9iFYH1LAkp3Hug=;
	b=M7ZmgBYVxADI3Tuz8qR0G/iq+0tYjc7p5pxklDAtodJ0KEHB6SQ7Cle4471RWAhbaAl5
	 XvTSLgcfFsKEDn0K31EJhJ+FGogKLhzrnDYVmzrIR2a5w3FdWimuTSXDvD9tQZWnWK0G1
	 bnIvJzg7iuAt5Wb+GCIwBGOqsVKHjuNRCg0/ifIQzSqx/2fF0GrjPgGtuPeoewjHqMzEG
	 qNpyd2kkvYJJM+ErFK7MJUKcvnqYUg4zYKML6SWk6/XhPIrEmYu9WkP+Q6EWy5E4x64A4
	 WylvCmHSOdsWiVLUkieqB+LMjM5Cb+iTUv7OcKmKFXHjnpTbQLamAKQTqZdekU1dgDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Wxoa2qGV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0701E60A3822;
	Fri, 30 Oct 2026 21:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0701E60A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Wxoa2qGV
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvU3a1038028;
	Fri, 30 Oct 2026 21:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=UU
	etOG8bb12H7eTtGvbIiaV5Extzs9iFYH1LAkp3Hug=; b=Wxoa2qGVvESY3fvNbv
	cBWiTJc1LMestkYTA9AaMu7T/mvYPT13QgNYH3rWO/GjFhKaj6aQpLG75kvz5u5W
	1ITY0FDJWwdVUvJjqLX2s6zPs2d19+i5Wch6AZfZbwSWZLqZf3rTkDSkPyFb4QNr
	uewWyyA2oR6sav/OqWRWBt95lWYoFsJRCib3COr9QAWhdmSG9kIeELz7PaasWSNz
	61AOZt+4Ann6FmxgyGVi4zZOSeFMxN3c5RHb64WDguF8QmerDQaa0dRlw4Yj9tPf
	jjtTNzqw+8xsXaTB0w3kY5JOPnE+DZUKHWWH0hfyU7r+h0bctoKGfdhl139m3eVZ
	C0aA==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmx98uj5d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:30 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 64281D2F8;
	Fri, 30 Oct 2026 21:00:29 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:21 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:21 -1200
Received: from CO1PR08CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 21:00:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAE1d9jhyIAVjq5phkXY5S/GAVspbRanVPG3hxT1V32HpkLXA0fmwasavqHMozIn3m6gQzWESdogMcNywxoLDY7bdlL3mzjE2pZhLJFYkOJj1/SwnSix8tF7jUGBvnhpkUSY115rIw60FTeJ468HP34MRzhCciNrjJyazP4bt59VYk6trclQHpzQCCd2PGOLqQxrES+QfVabuYHBCdU/UYhwtJf9k+0J+YEqawYxnt4TH1luvrzUzmOzA1f2hZjrkCgVHenMV8vo3Ewxxgon2LL/K7OzHS0oAAOTYmO3eTE46/J8LRWClTlZCvCYaiwpOc/H/Na1dYSKsPJqQpWQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUetOG8bb12H7eTtGvbIiaV5Extzs9iFYH1LAkp3Hug=;
 b=ayAknQf3RGxB4OSczL98moXCsQo4UzYY4RztnEdDGPp108zxNo0C4Ob4eCXBNoemCGAuUK+etwTDPQslxYGisRH+JcvZS6I4v4sL2eLIbTSYHqxVk0xaKq26XA3ruJ7VWz2+zVyKrXqNjgnZi8JHoPAaVQYG0UWw4Y/fazGF7BdZUvPFSJYgKYX32tK/0UQCufpXJ8s8gAUNDqhSMk25pt0R4/njwIWJQmy9LbwMF4s8WEoZX0t464b/zVbHdNJZpSFiQ4qcThLVRsmXcrYNTEIUD+ghwiLo/R+n00EUhVQN0hDelG1nA/YH0WsE4WSwPNrkUNzglnRHD5MxNReVUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:00:17 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:17 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:04 -0700
Subject: [PATCH 08/23] net: hpe: sbl: add media, FEC and counter support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-8-8c2c391cc283@hpe.com>
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
X-ClientProxiedBy: CH2PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:610:4c::34) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 2b50deb5-f084-4898-ea7e-08df36c8cd0f
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|3023799007|921020|56012099006|5023799004|261021121427099003|261026130827099003|261028144727099003|261026121527099003|261026135527099003|10067099003|261026140227099003|261021133027099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021123027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: pKbEIOpUpeae7bRCenkCLiS45csp93aaeNsx3Ra9crj+QH8/3k/dA9MK90TkHjlXoZ7pm4zBmpSogADZ+CQMDblQjo1gMfNxRpB1zykw5NJcYN4BHD+pGs/zZuMf138m7uklkAV+5QqxjPYyB2OJv7/qeiB/JsmIPV9LViVVwIq3WBNqgAOHDJOLhfKNkegEZgrS4QPMeytxw0ur0ODLRjVs1HWZbML224ReVChe5q8P0iKCFeG+ZSvHNyTvaoYs+a1u6TXgoUAJOD1kB+E3MPsIwAtqYiCL47YjdI7eWvyoZEnTFbm6FYugG6IDymlsHisd5PVT0F30hr8eAoDJdlex64hU2UbBQ16CV7aACvA6nOJzCBl3MolQu0h52bzVvCXmf01v1nkuGP6ytIkKgkMks7DqoFyBR7YGLqPNvInZRUMqbi3kWqQFtOtmxxyef33vlJjWNwSFd4CAQcG7gspP5vFupMprZfVDY7u0R8vz5GDjpYo5LZW1sEXZwfKsEThxcnNncQ0h6Iv+eGMSQ0SDohzvoCej2uwfoLeQBKscZyNztppAbRb0RT8aNFfrmO8uc2LZwzm8+Wsljsrj1HES+pTEipRlTo1a7GyQWPn9k22KjeuYrRYeUIdzMrDHgcW+eBguIBnwnIB3ZfY6gGJ0BCXDRlW6X8DGDgS5ZIFGAk4p33xvw9puqjN5LsSHy+er7awbCirNSLL1HbhCyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(3023799007)(921020)(56012099006)(5023799004)(261021121427099003)(261026130827099003)(261028144727099003)(261026121527099003)(261026135527099003)(10067099003)(261026140227099003)(261021133027099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021123027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1c0c24zL2IvSzZFS3ltbmplQlE2SHlIN1BvYS9QTXlyVWc2TzVVTGFqRkoy?=
 =?utf-8?B?SzMyRTVyckNRVTd5MzZTc1FTWWFhdWlHQUlLc3JqM2dWNFc1VlVWK1k0RklE?=
 =?utf-8?B?aUw5VjFlTGoxMkorN2JrMThpYk9aaWpPSFZwZmliYm44cGI2Z2gvdXVvMzIy?=
 =?utf-8?B?WDhnVlVHdEljbXJicmR2TkN1bXhYcTNLOXFUUGJEZFZGRjk0M0UrUmMwaGpD?=
 =?utf-8?B?ZGZrNkprbkx5UHFBQ2xKTUdrL05qSnFvbzNCVjZQSFVJV2ErandpYUJIUHQr?=
 =?utf-8?B?NmZMa2szbFhCam1OWEZJZHdDcW45VU5paGJyZ05TS3pRdG5RcHJKQ3gxTkxr?=
 =?utf-8?B?NWZIMUczTHM1ZzU5TWdJdVBYTDVlYjBDd2t4QUJDNmJsajZjOVJRSmJVeTNa?=
 =?utf-8?B?SUtNbjBib0tVWTcrOFFZejRZU3N1TXEzaDVoUUZPNVEyYjFwMENjNjRoZFB1?=
 =?utf-8?B?cjhCYWhncTNYUUJ4U01NWitWSERLamxHN1RKeG9LYVEvK0NURkN3d2tQSmFn?=
 =?utf-8?B?SHRNWXY1NE9ONGRtaWQ5dW1yTlhua09ocWszRXhjcDhvZTdJSVJaMk1RRWE4?=
 =?utf-8?B?OFNOeXdUcWFKSklSUGZBTWJHQytrZFJNak9WWS9KdGFmVW5TcVMrczVUWCtL?=
 =?utf-8?B?eWcreVpINi9Tczc4VWdiV2lPMkZFN0JYMjR1NW5ETkFjaFY0OWliZ3V5cHBm?=
 =?utf-8?B?MHJJZUFiQWplUDNITy9yanBMWFlldXdhQTIycWZqd2NzZXByQnhJMG5kdzZO?=
 =?utf-8?B?MVhkbyt0RFJSTTNEdkl0RWtIZlpwS3ZpUVgwbVZZTkZ4eVlwdlhFVlNnQWx1?=
 =?utf-8?B?WUFtOWcvNnBDN0phY2V0MENsVGFBVTVPNlZyNFBPL29Ud3BrZlZsVitDcndH?=
 =?utf-8?B?c2VxWk5GZXk5eldscmdzcVl2MGIyMi9semM2SWcvSmI0VnN4VUxxYlFUd0ww?=
 =?utf-8?B?NmFsZGhSKzhPaUZnaGVvQ2VXTmhSeWdycWxYTVhsQzFaeWlPQ1FJVklWNVF6?=
 =?utf-8?B?WHhSVU1oQ3BZeTFLNzN2Rzl6QS9DQVNUMFczdTBIRVdwK0E5OXR0SU5MVmgx?=
 =?utf-8?B?NU5zWXQwdmROdWg1WXFnOTE5Smc3TmVJUnovQTVaNFVmdTBGeksrUEpnTVA4?=
 =?utf-8?B?MFRDODBGakRVREJPcmdPMktVZkxubndEMWN3aTZ0RWFqcDRobUc2VFJkOGdl?=
 =?utf-8?B?Y2NJeS9ySExoSzBBVVNCS3N4VkpLdGIxR1FGWnFNL3lRVTRKWGRBcmxuWFNL?=
 =?utf-8?B?blJkT3FVRDB1alJEbjZaM1owcklTd2NFQ0hTZGNPTnZ3ckZvQTNqanFoZUo3?=
 =?utf-8?B?WWxSUWNKZXQ4bUhabTY1NmMyRDAxWE4zbWdHVGVITGNSMHl0b3RhT1F4eldY?=
 =?utf-8?B?eDJ0VFMrcTZqVU5ybGJKZVVWV2V6SUx1QUhXTFpCRDlaZHhNRFMrMmFxVXJq?=
 =?utf-8?B?N28yR1NBcVBOV05iMVdYTS9lV1QycUVHb0NzaHRURUJBRzlNZGxOcWVnU3hy?=
 =?utf-8?B?cjJQWEIxTVZtZVh5TFR0U1I4TGJkQUMzNkZieDRzTnY3ZlpnV0pEMFJEck1j?=
 =?utf-8?B?UDI4bzZxcE1QYjYrOGFtem5YbDJoK3ErOFN2WFhLSWdJbWN6ZEpGcWVIbDAx?=
 =?utf-8?B?Nm1EZlArTTM4dFQxSkFjSDJyblN4UWlvaUlnRmhSd1dLTmFYajF0c0Y4ZHdo?=
 =?utf-8?B?eTZkOTJleGY2SlNVMFRiVnZrTmpPbUNXcFBHVERqSE1TbmIvdVFsOU1JR0p5?=
 =?utf-8?B?RFdweDhGaEdPNzRpbHE4VUI0Nk1yV0dkZXNlaXNJVitLcnFMZjZ1ZC9jbWNs?=
 =?utf-8?B?aEpYWFdtbHlqUUozeWF0MDlqS1paWWdvQ2lxZjAwaGE1WmFtdkpsL0tGcXU3?=
 =?utf-8?B?aVNoeHVNaG9odmJSTzFiNHhBbEJzMUduMmdFSmJJRkdSOWJzZ3V3TVIwMU84?=
 =?utf-8?B?eGhaWm9qVDcwSTNvbC8rRUE0Q3dBVFFJcmN4c3U2T2o1YkVoa2l1dEJXbzZz?=
 =?utf-8?B?ZXpiakRTeWpsNlg3cnRGSUhMb1hkTFRqdVhkNlVXSzk0bitaK0dBOWFrTVdq?=
 =?utf-8?B?MVczc1ZvbitYb2FkMWZzOGxJN2tWRGF4bUJIcFE1TzhjNEVFNG4rYXhmbGNx?=
 =?utf-8?B?WEhEbTFtWU9McE5uZUxBMHhoTlZ6KzZja25IenNudEdUSWpZeE5adjlCQ2VS?=
 =?utf-8?B?R1g3aXhSRkdpakFDMmNDYVk5ZXBuOWNnSWJvRHlXbUpxdWdGRDdLa09wcXRm?=
 =?utf-8?B?clRLMTdKdUxxT2NHWUp5OUhrcmdFNyt1MHdDUDJESlMrZHplQnd5c1RIcE5w?=
 =?utf-8?B?OENtWkRyWC9kT1ppMHRsWU1meDkxTzhyNjhTTVl4WkRrbE5oS0Rtdz09?=
X-Exchange-RoutingPolicyChecked: p7UQv6nJkH+Obs9mIW/nrOIcRheg2cQK51KORKN5tRZMsuYY22VA5j2VKlJNZ8y5/WKQH98Vk5KtkeYwzGOLWTPHyYDl6C/5YH5chZH6BUFhnjzdQo1SW/UWp4HpeN9MnytUKMiP8vkThuOPy/HITZ0h7z10y+Px1i6G3gG/URVs2qUvkhxaxx20kMPvzY4w1e7kfpYyoTt80BYegDnXBAjYPDOYfhsOABOEyNn+7o4PRhKXlMvJWaeNI/gdH2+LMVAVsUASj0AKllrpH0CM9e1wuS30y0QdiFnop5PsOH9Bf9hhbE9rCM3PF2cqlXD/ZZGdfEqyJMFyOt28tY/Wkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b50deb5-f084-4898-ea7e-08df36c8cd0f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:17.5954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fqoryb+6xbc5NSV8flu9nXwHoSuTmAw1ILqHkjfO0RT44HGKpBZJJk9PtOIiemtTjhUAsEelKY/0yOUxDeBhyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Authority-Analysis: v=2.4 cv=QOf91QLL c=1 sm=1 tr=0 ts=6ae5056e cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=3haJ9R1Aw3gUfsUHDaCR:22 a=MvuuwTCpAAAA:8 a=iTzTgzf_AAAA:8
 a=uJ3LQuXv2TKb7hm_gHAA:9 a=UgyqpFzXoMhERF59:21 a=QEXdDO2ut3YA:10
 a=JL7qxNyGISI99KadRA9B:22
X-Proofpoint-GUID: _oqZsscYN_RL4Xv66yXuOR35ZX5m-JEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXw3XE/CqWS2Yg
 jENnRA01GWha/yQdegB3J5+k03SbeUZs9whNJLVXnoD3La/txPKLVEwCtRDjDJtQHkkiXAE53em
 TNiWgC1qDaHGux9CA6VI3GRvXaIUKlm7WPEjCBGk1+ozBRKlQc6IS4Ma/VVwZei9PFkG3ghIPfY
 c66cdSX+DUFgjX/uduiMzZbzixAvtHEfvDjMTkHPiigv9wPyqjCkv3FXlb1E0Xly7mHJ7K+Xsdq
 lmsq4v2DXj25wnrviv4jtLsKK24blfmve2Q2MMVMZsuVY+PAP7ACy0o0w/3MImIJrA/yoSJmAQe
 00iiEU0g6ZWmnsMWw7Etny+xvtOpK9bp8Geap96YFDcU+g4y5OAOwavbeByfHXyavfhZVrQ35bJ
 1B8fZtHInYZBxuWfSQlyPJld6n5uu1GRGjG/74gSH6XPUTdEiVf9fPDqjs/M0CHzxZ7+R0mAfRA
 VALmqHuuj9mpQyIPiEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXyJiWaY+FhNnr
 qLMUeYO0MG4ZGHYaNkvGenxfo/P0pDQSdlY+it9ob4nkiddewcTc5TIDV+fncSIFI3AjTUVXXMn
 OiPB5NVVISpL9BO84SiPQ446ZD8AW3M=
X-Proofpoint-ORIG-GUID: _oqZsscYN_RL4Xv66yXuOR35ZX5m-JEN
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add media detection, FEC (forward error correction) configuration and
the link counters.  sbl_platform.h is updated for the media fields
added here.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (5)
- CHECK: BRACES (16), UNNECESSARY_PARENTHESES (10)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sbl/sbl_counters.c  | 137 ++++
 drivers/net/ethernet/hpe/sbl/sbl_fec.c       | 971 +++++++++++++++++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_fec_nic.c   |  36 +
 drivers/net/ethernet/hpe/sbl/sbl_media.c     | 482 +++++++++++++
 drivers/net/ethernet/hpe/sbl/sbl_media_nic.c |  47 ++
 5 files changed, 1673 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sbl/sbl_counters.c b/drivers/net/ethernet/hpe/sbl/sbl_counters.c
new file mode 100644
index 000000000000..90feb6436105
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_counters.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019, 2022 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+
+#include <linux/hpe/sbl/sbl.h>
+
+#include "sbl_internal.h"
+
+/* create and initialise the SBL link's counter array */
+int sbl_link_counters_init(struct sbl_link *link)
+{
+	int i;
+
+	if (!link->counters) {
+		link->counters = kzalloc(sizeof(atomic_t) * SBL_LINK_NUM_COUNTERS,
+					 GFP_KERNEL);
+		if (!link->counters)
+			return -ENOMEM;
+	}
+
+	for (i = 0; i < SBL_LINK_NUM_COUNTERS; ++i)
+		atomic_set(link->counters + i, 0);
+
+	return 0;
+}
+
+/* destroy the SBL link's counter array */
+void sbl_link_counters_term(struct sbl_link *link)
+{
+	kfree(link->counters);
+	link->counters = NULL;
+}
+
+/**
+ * sbl_link_counters_get() - Get a block of SBL link counters
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @counters: Number of counters to read from 'first'
+ * @first: Index of the first counter to read
+ * @count: Number of consecutive counters to read starting from 'first'
+ *
+ * Reads a sequence of counters starting from index 'first'
+ * until the given 'count' and stores them to output
+ * pointed by 'counters'
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_link_counters_get(struct sbl_inst *sbl, int port_num,
+			  int *counters, u16 first, u16 count)
+{
+	struct sbl_link *link;
+	int i;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return -EINVAL;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return -EINVAL;
+
+	link = sbl->link + port_num;
+
+	if ((first + count) > SBL_LINK_NUM_COUNTERS)
+		return -EINVAL;
+
+	if (!counters)
+		return -EINVAL;
+
+	for (i = first; i < first + count; ++i)
+		*counters++ = atomic_read(link->counters + i);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_link_counters_get);
+
+/**
+ * sbl_link_counters_read() - Read value of a SBL link counter
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @counter: Index at which reads the counter value
+ *
+ * Read link count value based on the 'counter' index
+ *
+ * Return: value of a SBL link counter on success, 0 on failure
+ */
+int sbl_link_counters_read(struct sbl_inst *sbl, int port_num, u16 counter)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return 0;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return 0;
+
+	link = sbl->link + port_num;
+
+	if (counter >= SBL_LINK_NUM_COUNTERS)
+		return 0;
+
+	return atomic_read(link->counters + counter);
+}
+EXPORT_SYMBOL(sbl_link_counters_read);
+
+/* Increment a SBL link counter */
+int sbl_link_counters_incr(struct sbl_inst *sbl, int port_num, u16 counter)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return -EINVAL;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return -EINVAL;
+
+	link = sbl->link + port_num;
+
+	if (counter >= SBL_LINK_NUM_COUNTERS)
+		return -EINVAL;
+
+	atomic_inc(link->counters + counter);
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_fec.c b/drivers/net/ethernet/hpe/sbl/sbl_fec.c
new file mode 100644
index 000000000000..d458ca5e1269
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_fec.c
@@ -0,0 +1,971 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2024-2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/workqueue.h>
+#include <linux/spinlock.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_an.h>
+#include <linux/hpe/sbl/sbl_fec.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_serdes_map.h"
+#include "sbl_pml_fn.h"
+#include "sbl_link.h"
+#include "sbl_serdes.h"
+#include "sbl_serdes_fn.h"
+#include "sbl_internal.h"
+
+static void sbl_fec_counts_zero(struct sbl_inst *sbl, int port_num,
+				struct sbl_pcs_fec_cntrs *cntrs)
+{
+	memset(cntrs, 0, sizeof(struct sbl_pcs_fec_cntrs));
+}
+
+static u64 sbl_fec_rate_calc(struct sbl_inst *sbl, int port_num,
+			     u64 curr, u64 prev, unsigned long tdiff)
+{
+	if (curr < prev) {
+		sbl_dev_err(sbl->dev, "%d: fec counter went backwards", port_num);
+
+		return 0;
+	} else
+		return (curr - prev) * HZ / tdiff;
+}
+
+static int sbl_fec_rates_update(struct sbl_inst *sbl, int port_num,
+				u32 window)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+	struct sbl_pcs_fec_cntrs *temp;
+	unsigned long tdiff;
+	int i;
+	bool discard_rates;
+	enum sbl_fec_discard_type reason;
+	unsigned long irq_flags;
+
+	spin_lock(&fec_prmts->fec_cnt_lock);
+
+	/* make sure the period is sufficient to update rates
+	 * otherwise zero rates so nothing fires
+	 */
+	if (time_is_after_jiffies(fec_prmts->fec_curr_cnts->time + msecs_to_jiffies(window))) {
+		sbl_fec_counts_zero(sbl, port_num, fec_prmts->fec_rates);
+		spin_unlock(&fec_prmts->fec_cnt_lock);
+
+		return -EINPROGRESS;
+	}
+
+	temp = fec_prmts->fec_prev_cnts;
+	fec_prmts->fec_prev_cnts = fec_prmts->fec_curr_cnts;
+	fec_prmts->fec_curr_cnts = temp;
+	sbl_fec_counts_get(sbl, port_num, fec_prmts->fec_curr_cnts);
+
+	spin_lock_irqsave(&link->fec_discard_lock, irq_flags);
+	discard_rates = (link->fec_discard_time >= fec_prmts->fec_prev_cnts->time) &&
+			(link->fec_discard_time < fec_prmts->fec_curr_cnts->time);
+	reason = link->fec_discard_type;
+	spin_unlock_irqrestore(&link->fec_discard_lock, irq_flags);
+
+	if (discard_rates) {
+		sbl_dev_dbg(sbl->dev, "%d: %s - ignoring FEC rates for the current window", port_num,
+			    sbl_fec_discard_str(reason));
+		sbl_fec_counts_zero(sbl, port_num, fec_prmts->fec_rates);
+		spin_unlock(&fec_prmts->fec_cnt_lock);
+		return -EINTR;
+	}
+
+	/* calc time difference  (HZ)
+	 * (unsigned so rollover ok)
+	 */
+	tdiff = fec_prmts->fec_curr_cnts->time - fec_prmts->fec_prev_cnts->time;
+
+	/* calculate rates */
+	fec_prmts->fec_rates->ccw =
+		sbl_fec_rate_calc(sbl, port_num,
+				  fec_prmts->fec_curr_cnts->ccw,
+				  fec_prmts->fec_prev_cnts->ccw, tdiff);
+	fec_prmts->fec_rates->ucw =
+		sbl_fec_rate_calc(sbl, port_num,
+				  fec_prmts->fec_curr_cnts->ucw,
+				  fec_prmts->fec_prev_cnts->ucw, tdiff);
+	fec_prmts->fec_rates->llr_tx_replay =
+		sbl_fec_rate_calc(sbl, port_num,
+				  fec_prmts->fec_curr_cnts->llr_tx_replay,
+				  fec_prmts->fec_prev_cnts->llr_tx_replay, tdiff);
+
+	for (i = 0; i < SBL_PCS_NUM_FECL_CNTRS; ++i)
+		fec_prmts->fec_rates->fecl[i] =
+			sbl_fec_rate_calc(sbl, port_num,
+					  fec_prmts->fec_curr_cnts->fecl[i],
+					  fec_prmts->fec_prev_cnts->fecl[i], tdiff);
+
+	fec_prmts->fec_rates->time = jiffies_to_msecs(tdiff);
+
+	spin_unlock(&fec_prmts->fec_cnt_lock);
+
+	return 0;
+
+}
+
+/* returns true if the corrected code word rate is bad */
+static bool sbl_fec_ccw_rate_bad(struct sbl_inst *sbl, int port_num,
+				 u32 thresh_adj, bool use_stp_thresh)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	u64 ccw_bad;
+	bool ignore_err;
+	u64 ccw_hwm;
+
+	sbl_fec_ccw_bad_get(fec_prmts, use_stp_thresh, &ccw_bad, &ccw_hwm);
+
+	/* update high water mark
+	 * we record this even if no test is performed so we can use it for
+	 * debug/calibration
+	 */
+	if (fec_prmts->fec_rates->ccw > ccw_hwm) {
+		spin_lock(&fec_prmts->fec_cw_lock);
+		fec_prmts->fec_ccw_hwm = fec_prmts->fec_rates->ccw;
+		spin_unlock(&fec_prmts->fec_cw_lock);
+	}
+
+	/* apply percentage adjustment */
+	ccw_bad = ccw_bad * thresh_adj / 100;
+
+	if (ccw_bad == 0) {
+		sbl_dev_dbg(sbl->dev, "%d: fec ccw test ignored, threshold is zero", port_num);
+
+		return false;
+	}
+
+	/* check corrected code words */
+	if (fec_prmts->fec_rates->ccw > ccw_bad) {
+		sbl_link_counters_incr(sbl, port_num, fec_ccw_err);
+		ignore_err = sbl_debug_option(sbl, port_num, SBL_DEBUG_IGNORE_HIGH_FEC_CCW);
+
+		sbl_dev_err(sbl->dev, "%d: bad ccw, ccw %lld (>%lld), ucw %lld, (%lld %lld %lld %lld %lld %lld %lld %lld), window %ldms%s\n",
+			    port_num, fec_prmts->fec_rates->ccw, ccw_bad,
+				fec_prmts->fec_rates->ucw,
+				fec_prmts->fec_rates->fecl[0], fec_prmts->fec_rates->fecl[1],
+				fec_prmts->fec_rates->fecl[2], fec_prmts->fec_rates->fecl[3],
+				fec_prmts->fec_rates->fecl[4], fec_prmts->fec_rates->fecl[5],
+				fec_prmts->fec_rates->fecl[6], fec_prmts->fec_rates->fecl[7],
+				fec_prmts->fec_rates->time,
+				ignore_err ? " -ignored" : "");
+		if (ignore_err)
+			return false;
+		else
+			return true;
+	}
+	return false;
+}
+
+/* returns true if the uncorrected code word rate is bad
+ * threshold adjustment is a percentage
+ */
+static bool sbl_fec_ucw_rate_bad(struct sbl_inst *sbl, int port_num,
+				 u32 thresh_adj)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	bool ignore_err;
+	u64 ucw_bad;
+	u64 ucw_hwm;
+
+	sbl_fec_ucw_bad_get(fec_prmts, &ucw_bad, &ucw_hwm);
+
+	/* update high water mark
+	 * we record this even if no test is performed so we can use it for
+	 * debug/calibration
+	 */
+	if (fec_prmts->fec_rates->ucw > ucw_hwm) {
+		spin_lock(&fec_prmts->fec_cw_lock);
+		fec_prmts->fec_ucw_hwm = fec_prmts->fec_rates->ucw;
+		spin_unlock(&fec_prmts->fec_cw_lock);
+	}
+
+	/* apply percentage adjustment */
+	ucw_bad = ucw_bad * thresh_adj / 100;
+
+	if (ucw_bad == 0) {
+		sbl_dev_dbg(sbl->dev, "%d: fec ucw test ignored, threshold is zero", port_num);
+		return false;
+	}
+
+	/* check uncorrected code words */
+	if (fec_prmts->fec_rates->ucw > ucw_bad) {
+		sbl_link_counters_incr(sbl, port_num, fec_ucw_err);
+		ignore_err = sbl_debug_option(sbl, port_num, SBL_DEBUG_IGNORE_HIGH_FEC_UCW);
+
+		sbl_dev_err(sbl->dev, "%d: bad ucw, ccw %lld, ucw %lld (>%lld), (%lld %lld %lld %lld %lld %lld %lld %lld), window %ldms%s\n",
+			    port_num, fec_prmts->fec_rates->ccw,
+				    fec_prmts->fec_rates->ucw, ucw_bad,
+				    fec_prmts->fec_rates->fecl[0], fec_prmts->fec_rates->fecl[1],
+				    fec_prmts->fec_rates->fecl[2], fec_prmts->fec_rates->fecl[3],
+				    fec_prmts->fec_rates->fecl[4], fec_prmts->fec_rates->fecl[5],
+				    fec_prmts->fec_rates->fecl[6], fec_prmts->fec_rates->fecl[7],
+				    fec_prmts->fec_rates->time,
+				    ignore_err ? " -ignored" : "");
+		if (ignore_err)
+			return false;
+		else
+			return true;
+	}
+	return false;
+
+}
+
+static bool sbl_fec_txr_rate_bad(struct sbl_inst *sbl, int port_num,
+				 u32 thresh_adj)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	u64 llr_tx_replay_bad;
+	u64 llr_tx_replay_hwm;
+	bool ignore_err;
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	llr_tx_replay_bad = fec_prmts->fec_llr_tx_replay_thresh;
+	llr_tx_replay_hwm = fec_prmts->fec_llr_tx_replay_hwm;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+
+	/* update high water mark
+	 * we record this even if no test is performed so we can use it for
+	 * debug/calibration
+	 */
+	if (fec_prmts->fec_rates->llr_tx_replay > llr_tx_replay_hwm) {
+		spin_lock(&fec_prmts->fec_cw_lock);
+		fec_prmts->fec_llr_tx_replay_hwm = fec_prmts->fec_rates->llr_tx_replay;
+		spin_unlock(&fec_prmts->fec_cw_lock);
+	}
+	if (llr_tx_replay_bad == 0) {
+		sbl_dev_dbg(sbl->dev, "%d: fec llr_tx_replay test ignored, threshold is zero", port_num);
+		return false;
+	}
+
+	/* check llr_tx_replay rate */
+	if (fec_prmts->fec_rates->llr_tx_replay > llr_tx_replay_bad) {
+		sbl_link_counters_incr(sbl, port_num, fec_txr_err);
+		ignore_err = sbl_debug_option(sbl, port_num, SBL_DEBUG_IGNORE_HIGH_FEC_TXR);
+
+		sbl_dev_err(sbl->dev, "%d: bad llr_tx_replay, llr_tx_replay %lld (>%lld), window %ldms%s\n",
+			    port_num,
+				fec_prmts->fec_rates->llr_tx_replay, llr_tx_replay_bad,
+				fec_prmts->fec_rates->time,
+				ignore_err ? " -ignored" : "");
+
+		if (ignore_err)
+			return false;
+		else
+			return true;
+	}
+	return false;
+}
+
+/* print a few warnings (so we can see how things are changing) about high
+ * fec lane error rates
+ */
+static void sbl_fec_rates_warnings(struct sbl_inst *sbl, int port_num,
+				   int *warning_count)
+{
+
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+	int fecl_warn;
+	int i;
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	fecl_warn = fec_prmts->fecl_warn;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+
+	if (fecl_warn == 0) {
+		dev_dbg(sbl->dev, "%d: fec ccw warn ignored, threshold is zero", port_num);
+
+		return;
+	}
+
+	for (i = 0; i < SBL_PCS_NUM_FECL_CNTRS; ++i) {
+		if (fec_prmts->fec_rates->fecl[i] > fecl_warn) {
+			sbl_link_counters_incr(sbl, port_num, fec_warn);
+
+			if (*warning_count > 0) {
+				dev_warn(sbl->dev,
+					 "sbl %d: warning, ccw %lld, (%lld %lld %lld %lld %lld %lld %lld %lld)%s\n",
+					 port_num, fec_prmts->fec_rates->ccw,
+					 fec_prmts->fec_rates->fecl[0],
+					 fec_prmts->fec_rates->fecl[1],
+					 fec_prmts->fec_rates->fecl[2],
+					 fec_prmts->fec_rates->fecl[3],
+					 fec_prmts->fec_rates->fecl[4],
+					 fec_prmts->fec_rates->fecl[5],
+					 fec_prmts->fec_rates->fecl[6],
+					 fec_prmts->fec_rates->fecl[7],
+					 (*warning_count == 1) ? " - last" : "");
+				--*warning_count;
+			} else {
+				dev_dbg(sbl->dev,
+					"sbl %d: warning, ccw %lld, (%lld %lld %lld %lld %lld %lld %lld %lld)\n",
+					port_num, fec_prmts->fec_rates->ccw,
+					fec_prmts->fec_rates->fecl[0],
+					fec_prmts->fec_rates->fecl[1],
+					fec_prmts->fec_rates->fecl[2],
+					fec_prmts->fec_rates->fecl[3],
+					fec_prmts->fec_rates->fecl[4],
+					fec_prmts->fec_rates->fecl[5],
+					fec_prmts->fec_rates->fecl[6],
+					fec_prmts->fec_rates->fecl[7]);
+			}
+			return;
+		}
+	}
+}
+
+/**
+ * sbl_fec_thresholds_clear() - Clear fec ccw/ucw/warn thresholds to zero
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Clears fec ccw/ucw/warn parameters to zero. This update is performed
+ * while holding a spinlock to ensure safe concurrent access.
+ *
+ * Context: Process context, Acquires lock and release fec_cw_lock <spin_lock>
+ */
+void sbl_fec_thresholds_clear(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	sbl_dev_dbg(sbl->dev, "%d: clearing fec thresholds", port_num);
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	fec_prmts->fec_ucw_thresh = 0;
+	fec_prmts->fec_ccw_thresh = 0;
+	fec_prmts->fec_stp_ccw_thresh = 0;
+	fec_prmts->fecl_warn  = 0;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+}
+EXPORT_SYMBOL(sbl_fec_thresholds_clear);
+
+/**
+ * sbl_fec_thresholds_set() - setup the fec thresholds
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @ucw_in: value for link mode and media
+ * @ccw_in: value for link mode and media
+ *
+ * This function gets ccw/ucw/ccw warning values using arguments
+ * provided and copies it to the fec parameters.
+ *
+ * Context: Process context, Acquires lock and release fec_cw_lock <spin_lock>
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_fec_thresholds_set(struct sbl_inst *sbl, int port_num,
+			   s32 ucw_in, s32 ccw_in)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	int link_mode;
+	u64 ucw;
+	u64 ccw;
+	u64 stp_ccw;
+	u64 fecl_warn  = 0;
+	int err = 0;
+
+	/* Uncorrected codeword threshold */
+	switch (ucw_in) {
+	case SBL_LINK_FEC_INVALID:
+		sbl_dev_err(sbl->dev, "%d: link ucw invalid", port_num);
+		goto fail;
+
+	case SBL_LINK_FEC_OFF:
+		ucw = 0;
+		break;
+
+	case SBL_LINK_FEC_IEEE:
+		ucw = sbl_link_get_ucw_thresh_ieee(sbl, port_num);
+		break;
+
+	case SBL_LINK_FEC_HPE:
+		ucw = sbl_link_get_ucw_thresh_hpe(sbl, port_num);
+		break;
+
+	default:
+
+		if (ucw_in < 0) {
+			sbl_dev_err(sbl->dev, "%d: bad link attr ucw (%d)", port_num,
+				    ucw_in);
+			goto fail;
+		}
+
+		/* explicit number, just use it */
+		ucw = ucw_in;
+		break;
+	}
+
+	/* Corrected codeword threshold */
+	switch (ccw_in) {
+	case SBL_LINK_FEC_INVALID:
+		sbl_dev_err(sbl->dev, "%d: attr ccw invalid", port_num);
+		goto fail;
+
+	case SBL_LINK_FEC_OFF:
+		ccw = 0;
+		stp_ccw = 0;
+		break;
+
+	case SBL_LINK_FEC_IEEE:
+		ccw = sbl_link_get_ccw_thresh_ieee(sbl, port_num);
+		stp_ccw = sbl_link_get_stp_ccw_thresh_ieee(sbl, port_num);
+		break;
+
+	case SBL_LINK_FEC_HPE:
+		ccw = sbl_link_get_ccw_thresh_hpe(sbl, port_num);
+		stp_ccw = sbl_link_get_stp_ccw_thresh_hpe(sbl, port_num);
+		break;
+
+	default:
+
+		if (ccw_in < 0) {
+			sbl_dev_err(sbl->dev, "%d:bad link attr ccw (%d)", port_num,
+				    ccw_in);
+			goto fail;
+		}
+
+		/* explicit number, just use it */
+		ccw = ccw_in;
+		stp_ccw = ccw_in;
+		break;
+	}
+
+	/* ccw warning thresholds */
+	err = sbl_base_link_get_status(sbl, port_num,
+				       NULL, NULL, NULL, NULL, NULL, &link_mode);
+
+	if (err) {
+		sbl_dev_warn(sbl->dev, "%d:thresh, get mode failed [%d]-warnings disabled", port_num, err);
+		fecl_warn = 0;
+	} else {
+
+		switch (link_mode) {
+		case SBL_LINK_MODE_BS_200G:
+			fecl_warn = ccw / 8;
+			break;
+		case SBL_LINK_MODE_BJ_100G:
+			fecl_warn = ccw / 8;
+			break;
+		case SBL_LINK_MODE_CD_100G:
+			fecl_warn = ccw / 4;
+			break;
+		case SBL_LINK_MODE_CD_50G:
+			fecl_warn = ccw / 2;
+			break;
+		default:
+			fecl_warn = 0;
+			break;
+		}
+	}
+
+	sbl_dev_dbg(sbl->dev, "%d: Setting fec thresh ucw %lld, ccw %lld, warn %lld",
+		    port_num, ucw, ccw, fecl_warn);
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	fec_prmts->fec_ucw_thresh = ucw;
+	fec_prmts->fec_ccw_thresh = ccw;
+	fec_prmts->fec_stp_ccw_thresh = stp_ccw;
+	fec_prmts->fec_llr_tx_replay_thresh = SBL_FEC_LLR_TX_REPLAY_THRESH;
+	fec_prmts->fecl_warn = fecl_warn;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+
+	return 0;
+fail:
+	sbl_dev_warn(sbl->dev, "%d: fec monitoring disabled", port_num);
+	sbl_fec_thresholds_clear(sbl, port_num);
+	return -ENAVAIL;
+}
+EXPORT_SYMBOL(sbl_fec_thresholds_set);
+
+/**
+ * sbl_fec_adjustments_set() - setup the fec threshold adjustments
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @ucw_adj: Value (An adjustment of zero means disable the test)
+ * @ccw_adj: Value (An adjustment of zero means disable the test)
+ *
+ * This function copies provided parameters(ucw adj/ccw adj) from caller
+ * into fec parameters of fec_ucw_down_thresh_adj and fec_ccw_down_thresh_adj
+ *
+ * Context: Process context, Acquires lock and release fec_cw_lock <spin_lock>
+ *
+ * Return: 0 on success
+ */
+int sbl_fec_adjustments_set(struct sbl_inst *sbl, int port_num,
+			    u32 ucw_adj, u32 ccw_adj)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	fec_prmts->fec_ucw_down_thresh_adj = ucw_adj;
+	fec_prmts->fec_ccw_down_thresh_adj = ccw_adj;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+
+	sbl_dev_dbg(sbl->dev, "%d: Setting fec thresh adjustments ucw_adj %d, ccw_adj %d",
+		    port_num, ucw_adj, ccw_adj);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_fec_adjustments_set);
+
+int sbl_fec_up_check(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+	bool ucw_err;
+	bool ccw_err	 = false;
+	bool stp_ccw_err = false;
+	u32 ucw_thresh_adj;
+	u32 ccw_thresh_adj;
+	u32 stp_ccw_thresh_adj;
+	int i;
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	ucw_thresh_adj = fec_prmts->fec_ucw_up_thresh_adj;
+	ccw_thresh_adj = fec_prmts->fec_ccw_up_thresh_adj;
+	stp_ccw_thresh_adj = fec_prmts->fec_stp_ccw_up_thresh_adj;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+
+	/* initial measurement */
+	msleep(SBL_FEC_UP_SETTLE_PERIOD); /* time for fec rates to settle */
+	sbl_fec_counts_get(sbl, port_num, fec_prmts->fec_curr_cnts);
+
+	for (i = 0; i < (link->blattr.options & SBL_OPT_FABRIC_LINK ?
+			 SBL_FEC_UP_COUNT_FABRIC : SBL_FEC_UP_COUNT_EDGE); ++i) {
+
+		msleep(SBL_FEC_UP_WINDOW);
+		sbl_fec_rates_update(sbl, port_num, SBL_FEC_UP_WINDOW);
+
+		ucw_err = sbl_fec_ucw_rate_bad(sbl, port_num, ucw_thresh_adj);
+		if (ucw_err)
+			sbl_dev_err(sbl->dev, "%d: fec up check: ucw fail", port_num);
+
+		if ((link->dfe_tune_count == SBL_DFE_USED_SAVED_PARAMS) && (stp_ccw_thresh_adj > 0))
+			stp_ccw_err = sbl_fec_ccw_rate_bad(sbl, port_num, stp_ccw_thresh_adj, true);
+		else
+			ccw_err = sbl_fec_ccw_rate_bad(sbl, port_num, ccw_thresh_adj, false);
+
+		if (ccw_err)
+			sbl_dev_err(sbl->dev, "%d: fec up check: ccw fail", port_num);
+		else if (stp_ccw_err)
+			sbl_dev_err(sbl->dev, "%d: fec up check: stp ccw fail", port_num);
+
+		if (ucw_err || ccw_err || stp_ccw_err) {
+			sbl_link_counters_incr(sbl, port_num, fec_up_fail);
+			return -EOVERFLOW;
+		}
+	}
+
+	return 0;
+}
+
+void sbl_fec_counts_get(struct sbl_inst *sbl, int port_num,
+			struct sbl_pcs_fec_cntrs *cntrs)
+{
+	cntrs->fecl[0] = sbl_read64(sbl, SBL_PCS_FECL_ERRORS_00_ADDR(port_num));
+	cntrs->fecl[1] = sbl_read64(sbl, SBL_PCS_FECL_ERRORS_01_ADDR(port_num));
+	cntrs->fecl[2] = sbl_read64(sbl, SBL_PCS_FECL_ERRORS_02_ADDR(port_num));
+	cntrs->fecl[3] = sbl_read64(sbl, SBL_PCS_FECL_ERRORS_03_ADDR(port_num));
+	cntrs->fecl[4] = sbl_read64(sbl, SBL_PCS_FECL_ERRORS_04_ADDR(port_num));
+	cntrs->fecl[5] = sbl_read64(sbl, SBL_PCS_FECL_ERRORS_05_ADDR(port_num));
+	cntrs->fecl[6] = sbl_read64(sbl, SBL_PCS_FECL_ERRORS_06_ADDR(port_num));
+	cntrs->fecl[7] = sbl_read64(sbl, SBL_PCS_FECL_ERRORS_07_ADDR(port_num));
+
+	cntrs->ccw = sbl_read64(sbl, SBL_PCS_CORRECTED_CW_ADDR(port_num));
+	cntrs->ucw = sbl_read64(sbl, SBL_PCS_UNCORRECTED_CW_ADDR(port_num));
+
+	cntrs->llr_tx_replay = sbl_read64(sbl, SBL_LLR_TX_REPLAY_EVENT_ADDR(port_num));
+
+	cntrs->time = jiffies;
+}
+
+void sbl_fec_monitor_start(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned long flags;
+
+	spin_lock_irqsave(&link->lock, flags);
+	if (!link->start_cancelled) {
+		link->fec_monitor_enabled = true;
+		mod_timer(&link->fec_data->fec_timer,
+			  jiffies + msecs_to_jiffies(SBL_FEC_MON_PERIOD));
+	}
+	spin_unlock_irqrestore(&link->lock, flags);
+}
+
+void sbl_fec_monitor_stop(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned long flags;
+
+	spin_lock_irqsave(&link->lock, flags);
+	link->fec_monitor_enabled = false;
+	spin_unlock_irqrestore(&link->lock, flags);
+
+	timer_delete_sync(&link->fec_data->fec_timer);
+	cancel_work_sync(&link->fec_data->fec_timer_work);
+}
+
+static void sbl_fec_monitor_rearm(struct sbl_link *link)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&link->lock, flags);
+	if (link->fec_monitor_enabled)
+		mod_timer(&link->fec_data->fec_timer,
+			  jiffies + msecs_to_jiffies(SBL_FEC_MON_PERIOD));
+	spin_unlock_irqrestore(&link->lock, flags);
+}
+
+void sbl_fec_timer_work(struct work_struct *work)
+{
+	u32 ucw_thresh_adj;
+	u32 ccw_thresh_adj;
+	int port_num;
+	unsigned long irq_flags;
+	struct sbl_link *link;
+	enum sbl_link_down_origin down_origin = SBL_LINK_DOWN_ORIGIN_UNKNOWN;
+	struct sbl_fec *fec_prmts;
+	int warning_count = SBL_MAX_FEC_WARNINGS;
+	int err;
+	struct fec_data *fec_data = container_of(work, struct fec_data, fec_timer_work);
+	struct sbl_inst *sbl = fec_data->sbl;
+
+	port_num = fec_data->port_num;
+	link = sbl->link + port_num;
+	fec_prmts = fec_data->fec_prmts;
+
+	if ((link->blstate == SBL_BASE_LINK_STATUS_UP) && (sbl_pml_pcs_aligned(sbl, port_num))) {
+		err = sbl_fec_rates_update(sbl, port_num, SBL_FEC_MON_PERIOD);
+
+		if (!err) {
+			spin_lock_irqsave(&fec_prmts->fec_cw_lock, irq_flags);
+			ucw_thresh_adj = fec_prmts->fec_ucw_down_thresh_adj;
+			ccw_thresh_adj = fec_prmts->fec_ccw_down_thresh_adj;
+			spin_unlock_irqrestore(&fec_prmts->fec_cw_lock, irq_flags);
+
+			if (sbl_fec_ucw_rate_bad(sbl, port_num, ucw_thresh_adj)) {
+				/* take the link down */
+				down_origin = SBL_LINK_DOWN_ORIGIN_UCW;
+				sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
+				return;
+			}
+
+			if (sbl_fec_ccw_rate_bad(sbl, port_num, ccw_thresh_adj, false)) {
+				/* take the link down */
+				down_origin = SBL_LINK_DOWN_ORIGIN_CCW;
+				sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
+				return;
+			}
+
+			if (sbl_fec_txr_rate_bad(sbl, port_num, 0)) {
+				/* take the link down */
+				down_origin = SBL_LINK_DOWN_ORIGIN_LLR_TX_REPLAY;
+				sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
+				return;
+			}
+			sbl_fec_rates_warnings(sbl, port_num, &warning_count);
+
+		}
+
+	}
+	sbl_fec_monitor_rearm(link);
+}
+
+void sbl_zero_all_fec_counts(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	spin_lock(&fec_prmts->fec_cnt_lock);
+	memset(fec_prmts->fec_curr_cnts, 0, sizeof(struct sbl_pcs_fec_cntrs));
+	memset(fec_prmts->fec_prev_cnts, 0, sizeof(struct sbl_pcs_fec_cntrs));
+	memset(fec_prmts->fec_rates, 0, sizeof(struct sbl_pcs_fec_cntrs));
+	spin_unlock(&fec_prmts->fec_cnt_lock);
+}
+
+void sbl_fec_timer(struct timer_list *timer)
+{
+	int port_num;
+	struct sbl_link *link;
+	struct fec_data *fec_data = timer_container_of(fec_data, timer,
+						       fec_timer);
+	struct sbl_inst *sbl = fec_data->sbl;
+
+	port_num = fec_data->port_num;
+	link = sbl->link + port_num;
+
+	if (!queue_work(sbl->workq, &(link->fec_data->fec_timer_work)))
+		sbl_dev_warn(sbl->dev, "fec timer work already queued");
+}
+
+#ifdef CONFIG_SYSFS
+/**
+ * sbl_fec_sysfs_sprint() - Format FEC parameters status into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * This function formats FEC parameters and writes the result into the
+ * provided buffer typically for use in sysfs output.
+ *
+ * Context: Process context, Acquires lock and release fec_cw_lock <spin_lock>
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_fec_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	u64 ucw_thresh;
+	u64 ucw_hwm;
+	u64 ccw_thresh;
+	u64 ccw_hwm;
+	u64 llr_tx_replay_thresh;
+	u64 llr_tx_replay_hwm;
+	u64 fecl_warn;
+	int s = 0;
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	if (link->blstate == SBL_BASE_LINK_STATUS_STARTING) {
+		ucw_thresh = fec_prmts->fec_ucw_thresh * fec_prmts->fec_ucw_up_thresh_adj / 100;
+		ccw_thresh = fec_prmts->fec_ccw_thresh * fec_prmts->fec_ccw_up_thresh_adj / 100;
+	} else {
+		ucw_thresh = fec_prmts->fec_ucw_thresh * fec_prmts->fec_ucw_down_thresh_adj / 100;
+		ccw_thresh = fec_prmts->fec_ccw_thresh * fec_prmts->fec_ccw_down_thresh_adj / 100;
+	}
+
+	llr_tx_replay_thresh = fec_prmts->fec_llr_tx_replay_thresh;
+	ucw_hwm = fec_prmts->fec_ucw_hwm;
+	ccw_hwm = fec_prmts->fec_ccw_hwm;
+	llr_tx_replay_hwm = fec_prmts->fec_llr_tx_replay_hwm;
+	fecl_warn = fec_prmts->fecl_warn;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+	if (link->blstate == SBL_BASE_LINK_STATUS_UP) {
+
+		s += scnprintf(buf + s, size - s,
+			       "fec monitor: hwm- ccw %lld/%lld, ucw %lld/%lld",
+			       ccw_hwm, ccw_thresh, ucw_hwm, ucw_thresh);
+		s += scnprintf(buf + s, size - s,
+			       ", llr_tx_replay %lld/%lld, warn %lld",
+			       llr_tx_replay_hwm, llr_tx_replay_thresh, fecl_warn);
+
+		if (ucw_thresh == 0)
+			s += scnprintf(buf + s, size - s, ", ucw-off");
+
+		if (ccw_thresh == 0)
+			s += scnprintf(buf + s, size - s, ", ccw-off");
+
+		s += scnprintf(buf + s, size - s, "\n");
+
+		if (sbl_pml_pcs_aligned(sbl, port_num)) {
+			spin_lock(&fec_prmts->fec_cnt_lock);
+			if (fec_prmts->fec_rates) {
+				s += scnprintf(buf + s, size - s,
+					       "fec monitor: rates- ccw %lld",
+					       fec_prmts->fec_rates->ccw);
+				s += scnprintf(buf + s, size - s, ", ucw %lld/%lld",
+					       fec_prmts->fec_rates->ucw,
+					       fec_prmts->fec_curr_cnts->ucw);
+				s += scnprintf(buf + s, size - s,
+					       ", llr_tx_replay %lld, window %ld",
+					       fec_prmts->fec_rates->llr_tx_replay,
+					       fec_prmts->fec_rates->time);
+				s += scnprintf(buf + s, size - s,
+					       ", (%lld %lld %lld %lld %lld %lld %lld %lld)\n",
+					       fec_prmts->fec_rates->fecl[0],
+					       fec_prmts->fec_rates->fecl[1],
+					       fec_prmts->fec_rates->fecl[2],
+					       fec_prmts->fec_rates->fecl[3],
+					       fec_prmts->fec_rates->fecl[4],
+					       fec_prmts->fec_rates->fecl[5],
+					       fec_prmts->fec_rates->fecl[6],
+					       fec_prmts->fec_rates->fecl[7]);
+			}
+			spin_unlock(&fec_prmts->fec_cnt_lock);
+		}
+	}
+	return s;
+}
+EXPORT_SYMBOL(sbl_fec_sysfs_sprint);
+#endif
+
+/**
+ * sbl_fec_txr_rate_set() - set the llr replay threshold
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @txr_rate: Value - An adjustment of zero means disable the test
+ *
+ * This function sets the LLR (Link-Level Retry) replay threshold
+ * used by the FEC logic. The threshold value is provided by the caller.
+ *
+ * Context: Process context, Acquires lock and release fec_cw_lock <spin_lock>
+ *
+ * Return: 0 on success
+ */
+int sbl_fec_txr_rate_set(struct sbl_inst *sbl, int port_num,
+			 u32 txr_rate)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	fec_prmts->fec_llr_tx_replay_thresh = txr_rate;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+
+	sbl_dev_dbg(sbl->dev, "%d: Setting txr_rate %d",
+		    port_num, txr_rate);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_fec_txr_rate_set);
+
+/**
+ * sbl_fec_modify_adjustments() - Update FEC threshold adjustments
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @ucw_up_adj: Adjusting un-corrected code word thresholds
+ * @ccw_up_adj: Adjusting corrected code word thresholds
+ * @ucw_down_adj: Adjusting un-corrected code word thresholds
+ * @ccw_down_adj: Adjusting corrected code word thresholds
+ * @stp_ccw_up_adj: stp un-corrected code word thresholds
+ *
+ * This function adjusts max/min of uncorrected/corrected
+ * words for tuning/debug/test purposes at various levels.
+ * Used at test/debug/tuning interface.
+ *
+ * Context: Process context, Acquires lock and release fec_cw_lock <spin_lock>
+ */
+void sbl_fec_modify_adjustments(struct sbl_inst *sbl, int port_num,
+				u32 *ucw_up_adj, u32 *ccw_up_adj,
+				u32 *ucw_down_adj, u32 *ccw_down_adj,
+				u32 *stp_ccw_up_adj)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	if (ucw_up_adj)
+		fec_prmts->fec_ucw_up_thresh_adj = *ucw_up_adj;
+	if (ccw_up_adj)
+		fec_prmts->fec_ccw_up_thresh_adj = *ccw_up_adj;
+	if (ucw_down_adj)
+		fec_prmts->fec_ucw_down_thresh_adj = *ucw_down_adj;
+	if (ccw_down_adj)
+		fec_prmts->fec_ccw_down_thresh_adj = *ccw_down_adj;
+	if (stp_ccw_up_adj)
+		fec_prmts->fec_stp_ccw_up_thresh_adj = *stp_ccw_up_adj;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+}
+EXPORT_SYMBOL(sbl_fec_modify_adjustments);
+
+/**
+ * sbl_fec_dump() - Print FEC info
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Context: Process context, Acquires lock and release fec_cw_lock <spin_lock>
+ */
+void sbl_fec_dump(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	u64 ucw_thresh;
+	u64 ccw_thresh;
+	u64 stp_ccw_thresh;
+	u32 ucw_up_adj;
+	u32 ccw_up_adj;
+	u32 stp_ccw_up_adj;
+	u32 ucw_down_adj;
+	u32 ccw_down_adj;
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	ucw_thresh     = fec_prmts->fec_ucw_thresh;
+	ccw_thresh     = fec_prmts->fec_ccw_thresh;
+	stp_ccw_thresh = fec_prmts->fec_stp_ccw_thresh;
+	ucw_up_adj     = fec_prmts->fec_ucw_up_thresh_adj;
+	ccw_up_adj     = fec_prmts->fec_ccw_up_thresh_adj;
+	stp_ccw_up_adj = fec_prmts->fec_stp_ccw_up_thresh_adj;
+	ucw_down_adj   = fec_prmts->fec_ucw_down_thresh_adj;
+	ccw_down_adj   = fec_prmts->fec_ccw_down_thresh_adj;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+
+	sbl_dev_info(sbl->dev, "%d: ucw : thresh %lld", port_num, ucw_thresh);
+	sbl_dev_info(sbl->dev, "%d: ucw up: x%d%%, %lld", port_num,
+		     ucw_up_adj, ucw_thresh * ucw_up_adj / 100);
+	sbl_dev_info(sbl->dev, "%d: ucw down: x%d%%, %lld", port_num,
+		     ucw_down_adj, ucw_thresh * ucw_down_adj / 100);
+
+	sbl_dev_info(sbl->dev, "%d: ccw : thresh %lld", port_num, ccw_thresh);
+	sbl_dev_info(sbl->dev, "%d: stp ccw : thresh %lld", port_num, stp_ccw_thresh);
+	sbl_dev_info(sbl->dev, "%d: ccw up: x%d%%, %lld", port_num,
+		     ccw_up_adj, ccw_thresh * ccw_up_adj / 100);
+	sbl_dev_info(sbl->dev, "%d: stp ccw up: x%d%%, %lld", port_num,
+		     stp_ccw_up_adj, stp_ccw_thresh * stp_ccw_up_adj / 100);
+	sbl_dev_info(sbl->dev, "%d: ccw down: x%d%%, %lld", port_num,
+		     ccw_down_adj, ccw_thresh * ccw_down_adj / 100);
+}
+EXPORT_SYMBOL(sbl_fec_dump);
+
+/**
+ * sbl_fec_hwms_clear() - Clear fec HW management config
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * This function clears the FEC HWM configuration
+ *
+ * Context: Process context, Acquires lock and release fec_cw_lock <spin_lock>
+ */
+void sbl_fec_hwms_clear(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	struct fec_data *fec_data = link->fec_data;
+	struct sbl_fec *fec_prmts = fec_data->fec_prmts;
+
+	sbl_dev_dbg(sbl->dev, "%d: clearing fec thresholds", port_num);
+
+	spin_lock(&fec_prmts->fec_cw_lock);
+	fec_prmts->fec_ucw_hwm = 0;
+	fec_prmts->fec_ccw_hwm = 0;
+	fec_prmts->fec_llr_tx_replay_hwm = 0;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+}
+EXPORT_SYMBOL(sbl_fec_hwms_clear);
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_fec_nic.c b/drivers/net/ethernet/hpe/sbl/sbl_fec_nic.c
new file mode 100644
index 000000000000..e7a06c8895d7
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_fec_nic.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/workqueue.h>
+#include <linux/spinlock.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_fec.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_internal.h"
+
+void sbl_fec_ucw_bad_get(struct sbl_fec *fec_prmts, u64 *ucw_bad, u64 *ucw_hwm)
+{
+	spin_lock(&fec_prmts->fec_cw_lock);
+	*ucw_hwm = fec_prmts->fec_ucw_hwm;
+	*ucw_bad = fec_prmts->fec_ucw_thresh;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+}
+
+void sbl_fec_ccw_bad_get(struct sbl_fec *fec_prmts, bool use_stp_thresh,
+			 u64 *ccw_bad, u64 *ccw_hwm)
+{
+	spin_lock(&fec_prmts->fec_cw_lock);
+	*ccw_hwm = fec_prmts->fec_ccw_hwm;
+	*ccw_bad = use_stp_thresh ? fec_prmts->fec_stp_ccw_thresh :
+		fec_prmts->fec_ccw_thresh;
+	spin_unlock(&fec_prmts->fec_cw_lock);
+}
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_media.c b/drivers/net/ethernet/hpe/sbl/sbl_media.c
new file mode 100644
index 000000000000..ec2b4574565e
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_media.c
@@ -0,0 +1,482 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019, 2021-2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_internal.h"
+
+/**
+ * sbl_media_config() - Config media
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @mattr: media attributes
+ *
+ * This function sets the media attributes for the link
+ * and sets the state as configured.
+ *
+ * Context: Process, Acquires locks and releases link->lock <spin_lock>
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_media_config(struct sbl_inst *sbl, int port_num,
+		     struct sbl_media_attr *mattr)
+{
+	struct sbl_link *link;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "media config\n");
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	if (!mattr)
+		return -EINVAL;
+
+	if (mattr->magic != SBL_MEDIA_ATTR_MAGIC)
+		return -EINVAL;
+
+	link = sbl->link + port_num;
+
+	spin_lock(&link->lock);
+
+	if (!(link->blstate & (SBL_BASE_LINK_STATUS_UNCONFIGURED | SBL_BASE_LINK_STATUS_DOWN))) {
+
+		sbl_dev_err(sbl->dev, "%d: wrong state (%s) to configure media\n", port_num,
+			    sbl_link_state_str(link->blstate));
+		spin_unlock(&link->lock);
+		return -EUCLEAN;
+	}
+
+	memcpy(&link->mattr, mattr, sizeof(struct sbl_media_attr));
+	link->mconfigured = true;
+
+	if (link->blconfigured)
+		link->blstate = SBL_BASE_LINK_STATUS_DOWN;
+
+	/* the media might have changed so invalidate the llr loop time */
+	link->llr_loop_time = 0;
+
+	spin_unlock(&link->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_media_config);
+
+/**
+ * sbl_media_unconfig() - Unconfig media
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Clear media attributes and set base link status to unconfigure.
+ *
+ * Context: Process, Acquires Lock and releases link->lock <spin_lock>
+ *
+ * Return: negative error code on failure
+ */
+int sbl_media_unconfig(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int err = 0;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "media unconfig\n");
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	link = sbl->link + port_num;
+
+	spin_lock(&link->lock);
+
+	if (!(link->blstate & (SBL_BASE_LINK_STATUS_UNCONFIGURED |
+			SBL_BASE_LINK_STATUS_DOWN |
+			SBL_BASE_LINK_STATUS_STOPPING))) {
+
+		sbl_dev_err(sbl->dev, "%d: wrong state (%s) to unconfigure media\n", port_num,
+			    sbl_link_state_str(link->blstate));
+		spin_unlock(&link->lock);
+		return -EUCLEAN;
+	}
+
+	memset(&link->mattr, 0, sizeof(struct sbl_media_attr));
+	link->mconfigured = false;
+
+	link->blstate = SBL_BASE_LINK_STATUS_UNCONFIGURED;
+
+	spin_unlock(&link->lock);
+
+	return err;
+}
+EXPORT_SYMBOL(sbl_media_unconfig);
+
+bool sbl_media_check_mode_supported(struct sbl_inst *sbl, int port_num, u32 link_mode)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 info_mode_bit = 0;
+	u32 media_info;
+	bool allow_bad_mode;
+	unsigned long flags;
+
+	spin_lock_irqsave(&link->lock, flags);
+	media_info = link->mattr.info;
+	allow_bad_mode = link->blattr.options & SBL_OPT_ALLOW_MEDIA_BAD_MODE;
+	spin_unlock_irqrestore(&link->lock, flags);
+
+	if (!media_info) {
+		/* We have no info about media
+		 * assume its OK so we can carry on
+		 * if its not we will fail later anyway
+		 */
+		sbl_dev_warn(sbl->dev, "%d: no media info - assuming link mode OK", port_num);
+		return true;
+	}
+
+	switch (link_mode) {
+	case SBL_LINK_MODE_BS_200G:
+		info_mode_bit = SBL_MEDIA_INFO_SUPPORTS_BS_200G;
+		break;
+	case SBL_LINK_MODE_BJ_100G:
+		info_mode_bit = SBL_MEDIA_INFO_SUPPORTS_BJ_100G;
+		break;
+	case SBL_LINK_MODE_CD_100G:
+		info_mode_bit = SBL_MEDIA_INFO_SUPPORTS_CD_100G;
+		break;
+	case SBL_LINK_MODE_CD_50G:
+		info_mode_bit = SBL_MEDIA_INFO_SUPPORTS_CD_50G;
+		break;
+	default:
+		/* do nothing here - below will catch invalid link mode */
+		break;
+	}
+
+	if (media_info & info_mode_bit)
+		return true;
+
+	if (allow_bad_mode ||
+	    sbl_debug_option(sbl, port_num, SBL_DEBUG_ALLOW_MEDIA_BAD_MODE)) {
+		sbl_dev_warn(sbl->dev, "%d: link mode (%s) not supported by media - ignored",
+			     port_num, sbl_link_mode_str(link_mode));
+		return true;
+	}
+	sbl_dev_err(sbl->dev, "%d: link mode (%s) not supported by media",
+		    port_num, sbl_link_mode_str(link_mode));
+	return false;
+}
+
+/**
+ * sbl_media_check_headshell_reset_supported() - Check headshell based on media info
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Return: True if reset is supported else false
+ */
+bool sbl_media_check_headshell_reset_supported(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	if (!link->mattr.info) {
+		/* We have no info about media */
+		sbl_dev_dbg(sbl->dev, "%d: no media info available to check headshell reset supported bit", port_num);
+		return false;
+	}
+
+	if (link->mattr.info & SBL_MEDIA_INFO_SUPPORTS_HEADSHELL_RESET)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL(sbl_media_check_headshell_reset_supported);
+
+static bool sbl_media_check_len_supported(struct sbl_inst *sbl, int port_num, u64 len)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	switch (len) {
+	case SBL_LINK_LEN_BACKPLANE:
+	case SBL_LINK_LEN_000_300:
+	case SBL_LINK_LEN_000_400:
+	case SBL_LINK_LEN_000_750:
+	case SBL_LINK_LEN_000_800:
+	case SBL_LINK_LEN_001_000:
+	case SBL_LINK_LEN_001_100:
+	case SBL_LINK_LEN_001_150:
+	case SBL_LINK_LEN_001_200:
+	case SBL_LINK_LEN_001_400:
+	case SBL_LINK_LEN_001_420:
+	case SBL_LINK_LEN_001_500:
+	case SBL_LINK_LEN_001_600:
+	case SBL_LINK_LEN_001_640:
+	case SBL_LINK_LEN_001_700:
+	case SBL_LINK_LEN_001_800:
+	case SBL_LINK_LEN_001_900:
+	case SBL_LINK_LEN_001_910:
+	case SBL_LINK_LEN_002_000:
+	case SBL_LINK_LEN_002_100:
+	case SBL_LINK_LEN_002_130:
+	case SBL_LINK_LEN_002_200:
+	case SBL_LINK_LEN_002_300:
+	case SBL_LINK_LEN_002_390:
+	case SBL_LINK_LEN_002_400:
+	case SBL_LINK_LEN_002_500:
+	case SBL_LINK_LEN_002_600:
+	case SBL_LINK_LEN_002_620:
+	case SBL_LINK_LEN_002_700:
+	case SBL_LINK_LEN_002_800:
+	case SBL_LINK_LEN_002_900:
+	case SBL_LINK_LEN_002_990:
+	case SBL_LINK_LEN_003_000:
+	case SBL_LINK_LEN_004_000:
+	case SBL_LINK_LEN_005_000:
+	case SBL_LINK_LEN_006_000:
+	case SBL_LINK_LEN_007_000:
+	case SBL_LINK_LEN_008_000:
+	case SBL_LINK_LEN_010_000:
+	case SBL_LINK_LEN_014_000:
+	case SBL_LINK_LEN_015_000:
+	case SBL_LINK_LEN_019_000:
+	case SBL_LINK_LEN_025_000:
+	case SBL_LINK_LEN_030_000:
+	case SBL_LINK_LEN_035_000:
+	case SBL_LINK_LEN_050_000:
+	case SBL_LINK_LEN_075_000:
+	case SBL_LINK_LEN_100_000:
+		return true;
+	default:
+		if ((link->blattr.options & SBL_OPT_ALLOW_MEDIA_BAD_LEN) ||
+		    sbl_debug_option(sbl, port_num, SBL_DEBUG_ALLOW_MEDIA_BAD_LEN)) {
+			sbl_dev_warn(sbl->dev, "%d: unsupported media len (%lld) - ignored", port_num, len);
+			return true;
+		}
+		sbl_dev_err(sbl->dev, "%d: unsupported media len (%lld)", port_num, len);
+		return false;
+	}
+}
+
+/* return valid length in cm or 0 */
+u32 sbl_media_get_len_cm(struct sbl_inst *sbl, int port_num, u64 len)
+{
+	if (sbl_media_check_len_supported(sbl, port_num, len)) {
+		switch (len) {
+		case SBL_LINK_LEN_BACKPLANE: return 25;
+		case SBL_LINK_LEN_000_300:   return 30;
+		case SBL_LINK_LEN_000_400:   return 40;
+		case SBL_LINK_LEN_000_750:   return 75;
+		case SBL_LINK_LEN_000_800:   return 80;
+		case SBL_LINK_LEN_001_000:   return 100;
+		case SBL_LINK_LEN_001_100:   return 110;
+		case SBL_LINK_LEN_001_150:   return 115;
+		case SBL_LINK_LEN_001_200:   return 120;
+		case SBL_LINK_LEN_001_400:   return 140;
+		case SBL_LINK_LEN_001_420:   return 142;
+		case SBL_LINK_LEN_001_500:   return 150;
+		case SBL_LINK_LEN_001_600:   return 160;
+		case SBL_LINK_LEN_001_640:   return 164;
+		case SBL_LINK_LEN_001_700:   return 170;
+		case SBL_LINK_LEN_001_800:   return 180;
+		case SBL_LINK_LEN_001_900:   return 190;
+		case SBL_LINK_LEN_001_910:   return 191;
+		case SBL_LINK_LEN_002_000:   return 200;
+		case SBL_LINK_LEN_002_100:   return 210;
+		case SBL_LINK_LEN_002_130:   return 213;
+		case SBL_LINK_LEN_002_200:   return 220;
+		case SBL_LINK_LEN_002_300:   return 230;
+		case SBL_LINK_LEN_002_390:   return 239;
+		case SBL_LINK_LEN_002_400:   return 240;
+		case SBL_LINK_LEN_002_500:   return 250;
+		case SBL_LINK_LEN_002_600:   return 260;
+		case SBL_LINK_LEN_002_620:   return 262;
+		case SBL_LINK_LEN_002_700:   return 270;
+		case SBL_LINK_LEN_002_800:   return 280;
+		case SBL_LINK_LEN_002_900:   return 290;
+		case SBL_LINK_LEN_002_990:   return 299;
+		case SBL_LINK_LEN_003_000:   return 300;
+		case SBL_LINK_LEN_004_000:   return 400;
+		case SBL_LINK_LEN_005_000:   return 500;
+		case SBL_LINK_LEN_006_000:   return 600;
+		case SBL_LINK_LEN_007_000:   return 700;
+		case SBL_LINK_LEN_008_000:   return 800;
+		case SBL_LINK_LEN_010_000:   return 1000;
+		case SBL_LINK_LEN_014_000:   return 1400;
+		case SBL_LINK_LEN_015_000:   return 1500;
+		case SBL_LINK_LEN_019_000:   return 1900;
+		case SBL_LINK_LEN_025_000:   return 2500;
+		case SBL_LINK_LEN_030_000:   return 3000;
+		case SBL_LINK_LEN_035_000:   return 3500;
+		case SBL_LINK_LEN_050_000:   return 5000;
+		case SBL_LINK_LEN_075_000:   return 7500;
+		case SBL_LINK_LEN_100_000:   return 10000;
+		}
+	}
+
+	return 0;
+}
+
+/* calc loop time based on cable length */
+int sbl_media_calc_loop_time(struct sbl_inst *sbl, int port_num, u64 *calc_loop_time)
+{
+	struct sbl_link *link;
+	u32 len;
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
+	if (!calc_loop_time)
+		return -EINVAL;
+
+	link = sbl->link + port_num;
+	*calc_loop_time = 0;
+
+	if ((link->blattr.loopback_mode == SBL_LOOPBACK_MODE_OFF) ||
+	    (link->blattr.loopback_mode == SBL_LOOPBACK_MODE_INVALID)) {
+		len = sbl_media_get_len_cm(sbl, port_num, link->mattr.len);
+		if (!len)
+			return -EBADRQC;
+	} else
+		len = 0;
+
+	sbl_dev_dbg(sbl->dev, "%d: len = %d, lb = %s",
+		    port_num, len, sbl_loopback_mode_str(link->blattr.loopback_mode));
+
+	if (link->mattr.media == SBL_LINK_MEDIA_ELECTRICAL)
+		*calc_loop_time = 2 * len * SBL_MEDIA_NS_PER_M / 100;
+	else
+		*calc_loop_time = (2 * len * SBL_MEDIA_OPTICAL_NS_PER_M / 100) +
+			(4 * SBL_MEDIA_OPTICAL_TRANCEIVER_DELAY);
+	*calc_loop_time += 2 * (SBL_ASIC_TX_DELAY + SBL_ASIC_RX_DELAY);
+
+	sbl_dev_dbg(sbl->dev, "%d: calc loop time %lld cm %lld ns",
+		    port_num, link->mattr.len, *calc_loop_time);
+
+	return 0;
+}
+
+/**
+ * sbl_media_get_loop_time_ns() - Get loop time in ns
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @measurement_only: set to false when reading
+ *
+ * This function returns available loop time. If not and
+ * 'measurement_only' is true, returns 0 with a warning.
+ * Otherwise attempts to calculate the loop time.
+ *
+ * Return: calculate loop time on success, 0 on failure
+ */
+u64 sbl_media_get_loop_time_ns(struct sbl_inst *sbl, int port_num,
+			       bool measurement_only)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u64 calc_loop_time;
+	int err;
+
+	if (!link->mconfigured)
+		return 0;
+
+	if (link->llr_loop_time)
+		return link->llr_loop_time;
+
+	if (measurement_only) {
+		sbl_dev_warn(sbl->dev, "%d: measured loop time not found", port_num);
+		return 0;
+	}
+
+	if (!sbl_media_check_len_supported(sbl, port_num, link->mattr.len))
+		return 0;
+
+	err = sbl_media_calc_loop_time(sbl, port_num, &calc_loop_time);
+	if (err)
+		return 0;
+
+	return calc_loop_time;
+}
+EXPORT_SYMBOL(sbl_media_get_loop_time_ns);
+
+int sbl_media_validate_config(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	if (!(link->mconfigured && link->blconfigured))
+		return -EUCLEAN;
+
+	if ((link->mattr.media == SBL_LINK_MEDIA_ELECTRICAL) &&
+	    (link->blattr.config_target == SBL_BASE_LINK_CONFIG_PEC))
+		return 0;
+
+	if ((link->mattr.media == SBL_LINK_MEDIA_OPTICAL) &&
+	    (link->blattr.config_target == SBL_BASE_LINK_CONFIG_AOC))
+		return 0;
+
+	return -EMEDIUMTYPE;
+}
+
+#ifdef CONFIG_SYSFS
+/**
+ * sbl_media_sysfs_sprint() - Format media info into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * This function checks the state of media configuration and info.
+ * Based on that it will format the string and write into the
+ * provided buffer.
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_media_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int s = 0;
+
+	spin_lock(&link->lock);
+	if (link->mconfigured) {
+		s += scnprintf(buf + s, size - s, "media: %s, %s, (%s), info ",
+			       sbl_link_media_str(link->mattr.media),
+			       sbl_link_len_str(link->mattr.len),
+			       sbl_link_vendor_str(link->mattr.vendor));
+		if (link->mattr.info) {
+			if (link->mattr.info & SBL_MEDIA_INFO_SUPPORTS_BS_200G)
+				s += scnprintf(buf + s, size - s, "200 ");
+			if (link->mattr.info & SBL_MEDIA_INFO_SUPPORTS_BJ_100G)
+				s += scnprintf(buf + s, size - s, "100bj ");
+			if (link->mattr.info & SBL_MEDIA_INFO_SUPPORTS_CD_100G)
+				s += scnprintf(buf + s, size - s, "100cd ");
+			if (link->mattr.info & SBL_MEDIA_INFO_SUPPORTS_CD_50G)
+				s += scnprintf(buf + s, size - s, "50 ");
+			if (link->mattr.info & SBL_MEDIA_INFO_ANALOG)
+				s += scnprintf(buf + s, size - s, "analog ");
+			if (link->mattr.info & SBL_MEDIA_INFO_DIGITAL)
+				s += scnprintf(buf + s, size - s, "digital ");
+		} else
+			s += scnprintf(buf + s, size - s, "none");
+		s += scnprintf(buf + s, size - s, "\n");
+	}
+	spin_unlock(&link->lock);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_media_sysfs_sprint);
+#endif
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_media_nic.c b/drivers/net/ethernet/hpe/sbl/sbl_media_nic.c
new file mode 100644
index 000000000000..dc462e17dd72
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_media_nic.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include "sbl_internal.h"
+
+#ifdef CONFIG_SYSFS
+
+/**
+ * sbl_media_type_sysfs_sprint() - Report media type into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * This function reads the physical type of media used based on mconfigured
+ * and writes a formatted description of the type into the provided buffer
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_media_type_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int s = 0;
+
+	spin_lock(&link->lock);
+
+	if (link->mconfigured)
+		s += scnprintf(buf + s, size - s, "%s", sbl_link_media_str(link->mattr.media));
+	else
+		s += scnprintf(buf + s, size - s, "NA");
+
+	spin_unlock(&link->lock);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_media_type_sysfs_sprint);
+#endif

-- 
2.56.0

