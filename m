Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394047;
	b=dFILclUzWT3T+qP9XIh4jMOk9+aw9kqjZmeBTIsg1xZomOWosTn+ikh/XWwVKAqdtGlf
	 t6n5HD/uNmAa+lwv5wsBcxkePDZYuIlQTBb5QO5olWKTaGXtSiUDDplhdcwMdSZHpTqYj
	 tQIX0VlcVw+rE2PO78cMWpI24Txft8ALJqWRAnKNNeTgjRIboVwzI0OLloLMHgS2+ZYTX
	 DdT75rOLhyvNB6zziG5TDyJ882DDwZLwRnBPEzFHmWvUlg89AP453wGP8xS4e6GVSsCEE
	 KNSM14kCySPfZF3QlHKxeqMF9JyTEjT2WF/DsNL0FSjxT6CfYrNNbhJjii1KwkucLYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394047;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fsBQPk4vTz6eo6R/4j52WHRIb0tf3+PzvQpLM2wfcLs=;
	b=i6rojK1TfU9+kfX1X2l5Zn7ARXsp26S6900lPlPuUA9y3AngtWfiFFBylQcU+lxexW9T
	 jmL3EIBJP6F+CkGJKS6RA2TySmmiK45yx7pk0kO6g8N/iogg8SjchzbUQjbqY305qin51
	 bQJtc33SZOB1CzQPJigrSiMbqpY3JeBkiPeynwlNEXu3pxkpxLYBkZWTBsPd+Qr/0kOLR
	 CxRRb3OKsw1LVxSbVihbNrF32OZRrMseUgZk2PnaSpWElq+tlt+Uetk2PQK90V7sG/lt8
	 8CemnZgtXLHIZHWpqva1REDHqMLD35xq6v5iDdZ5FlvmesfrgSLKXBZ0UBnWp/kgTbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b="Ay+s+EG/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0C8606A31D;
	Fri, 30 Oct 2026 21:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D0C8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Ay+s+EG/
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UKPY3E956908;
	Fri, 30 Oct 2026 21:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=fs
	BQPk4vTz6eo6R/4j52WHRIb0tf3+PzvQpLM2wfcLs=; b=Ay+s+EG/ll8YjlElvw
	0eeB4vuyl+n29hawess8mVyPGO7HYMhpHk+3wnT8uFSJJeuKQKqO4utCPLwsMdy/
	uPNTu91B82T3gNbe7rqqCR8McIWPG3bbTGgy3EZCyePkspQMPHst86ByxO33EvnG
	BeYdPkNxDKVk4MToAD/38SoNNItLSutG01qDIPNY4NDM+vYIIxAuIHwlNS8TPmhJ
	Y8BnqJG96BPYstB6BgmudH1luSTizKGVUt/dv+D78zVIzSnf0Qise3qLsHO24NDk
	B/epnhj4zJ7/slUS0JsfhJYys30D/9bEbs/nyfs8StQycJ6WYUk6ZJvJI+dNaKWV
	qmRw==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hn28b09p7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:10 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 9443C8047A0;
	Fri, 30 Oct 2026 21:00:09 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:00:08 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:00:08 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 21:00:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QzhIF0j7H06D3ZYMCqXAuMIQ9ESjnJ9pflTUaXgaxPmlFNj9fIKLRXROhGEM6xiCk1zqjwtrjX6tYHhoTjQc4W4wW1z20npunXZg+gfaO4O0wcqfwLCLV6Y6vE4ojOD/tKeH+yPjKPCNM0NmNyMVKAU/sSTODoo3T5ebfZ7egyfHMLsxRWtLydkaQAiwOzx+9nmNemv1kxa6S6uLCiJrghNCdTFWWdQv0U9jD15mMgFMLrc/INkXm4Of/0ZY/KmKzESvT/U1428ZF6dc8+i9+qCCLR2LOHtCHx7748QCh7iFAdGQLnRETeQnGqQS1Ox1BAxkFBfMcw4iDoIlJLNMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsBQPk4vTz6eo6R/4j52WHRIb0tf3+PzvQpLM2wfcLs=;
 b=lqobkmbcpflyiPgBgGLqlrNg1M9NAWFjssbm7F4p/UU87tWjqlEENPYAF8eGDoZgqn8kNvahpjvKCGHahO/kET08olo8Spq+/TbcqLb87dbv7CU3Hl2SvY0ZrFCRYEjGdudyp5Ej2dtvQfcxFSDkfb7gps2g2sqjnqu1VTOWvK8GFwBso/qsO35SKwFu0UWJ22xCFtgejcqF3FyNIBRZFMqkaFt4jj/RGJvjwgyUGY6X2kyUfN9o9JYKwCErIO0WKf2DP5Vb9O13dvWY4D20BbYYQZtA7NSGMlLV7vz+Nsq65PmMy0BOosIY1BCKw/1gLdkLd+FLTJ3xAMjtQJlUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by LV3PR84MB3767.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 21:00:00 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:00:00 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:00 -0700
Subject: [PATCH 04/23] net: hpe: sbl: add the SerDes layer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-4-8c2c391cc283@hpe.com>
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
X-ClientProxiedBy: DSSP221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:3d5::17) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 47d917d7-b163-4138-bfd4-08df36c8c2c4
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|261022075727099003|261026135527099003|261022113327099003|261022115727099003|261022105027099003|261021133027099003|261028144727099003|261021123027099003|261021135927099003|261021130227099003|261021121427099003|261009223027099003|261026121527099003|261026130827099003|261026140227099003|10067099003|56012099006|5023799004|6133799003|3023799007|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: myh0EhBL1vuUwqZyPT9TZmHCdAx2CEDTMSwFMK+kQ/RkngVrdI/GTgE4TX79D4SrPZ6cL9QoZcrOlAuhApjun63JxYeTauhMHh/eUw9GNuyHbkyjKSR2BK7pcimPcDWxte171BLaAihutTR3StBg+H+9tSr2B6NXSVE3hIR3BRi9dsN/HWqVZWOXhgkx+hWmmvz8kdRko8FhBj3pIMYSequxTyikHzxk8ZRPeBj1F9my3RtYqspEdMi9v0YxxAGxS+6XuV4JZ8bxp+Mg4l2Rj4vW3uU1n94RgIEp0hbIbGbHCpbGnOOZegQuqE2A/Lrxx6wwBsARv4wB0bUr8jgxoslhNVoKe5BvIkJpVCDKhbef4a1PxOSjO7gCKgr8+zgD5Lc/w6qGzy37XDjG98z2Rug0BMq5cbS0yHtJs2Jk6lRGqs6jdi1LlU/UAs/9MrkoZ6dc9o5O6WJzus8rLgodJePyad9L7Yja+E4Wopaqk1EVy7J68Sd9zbkd762q0V5PBvqMmum1/1XNRTqi2Cirq77Lbyx0zhny0D96A0+fX1BSiGD1dqHIYhLo1vNyRF9+y6TSQak1J4QSVy6ImJlWoVx7AfeLSmJbzcWKjcagZb5ULdi/+ZwOTieVdanUUvG0PYipFyl2OhqP+lpQ5Ie257eYldu0CnkDFAqGhnYIiflNDAVot1N4MbUZN8rdwGPZtt2Mlgu+Y1NQnX5yOZ+Vww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(261022075727099003)(261026135527099003)(261022113327099003)(261022115727099003)(261022105027099003)(261021133027099003)(261028144727099003)(261021123027099003)(261021135927099003)(261021130227099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026130827099003)(261026140227099003)(10067099003)(56012099006)(5023799004)(6133799003)(3023799007)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHczbU1zMXp4L1p2LzR0Nmx1VHEvdnBFZGVVNVFPd1pabkNlRzdnMll6eUZE?=
 =?utf-8?B?endBb2w4Q3RaM28zZXVpZDAwTEdrZHNIK2ZuYkZlS1J2WlZrc21mZVFaV0RN?=
 =?utf-8?B?RWtjSzUwdGg2M3JMUzRReDZReUtvcHB6bWE1cWdxejdKcG1JWmxGOE1aRzJR?=
 =?utf-8?B?YTArR2FTM1RUdlltUDlXMVJwUmhQSlV6bjN1aDhQOXRjdkJkdUMwTG9tWGZi?=
 =?utf-8?B?MnByS0JEamdnV0ZJdU8wQ1VIT0JLN0dKN1Z5Q2RkR2g2cjg3Mko2R2lqUXBl?=
 =?utf-8?B?Y1lYV3h5UVdGNEhxazh2TWpwdmEydzRnNjRvZmJUNWFqenV0aXZZRlI5QTJU?=
 =?utf-8?B?R2xNazFvQnpNa0JudXE2UFBTR0ZWay9wcktlaHVQRWx6WnlnUXdpYTlKTldH?=
 =?utf-8?B?NmVLb3NTbXRHT1o2alZBdXpCLy9kOFdxR3RyQnVQTXhQaUxkd2ZPWUVBL0tz?=
 =?utf-8?B?ZjJZQks1R2FlZ1ZMR3FIR3JNQm55TUQ3ZGJTblNxQkhOYkVWczM0Z1dWWkls?=
 =?utf-8?B?N0ZLVzY4OFZGYmJTNmsxZDJhc2lEMTVFa3VMTUNRd3ZPd1FJRGtZOVdmUDI3?=
 =?utf-8?B?R2hqYXJITHFObXlYejFUTWo3N0pCUzNKQU82NUhvMUJmbGpXdFZ6VlNNR0JN?=
 =?utf-8?B?YlRWcDUwaDZLSDZOU2xIVlhpM1ZwWjZCK1R1SUZOQmNlcVA3OEtBc3E0THNl?=
 =?utf-8?B?NytvdEowOEZSMEpCN2hlYmVzUUhEWXptcWZ2bUlPUGZ3M3BpRWxWaXBqNXhl?=
 =?utf-8?B?ZHMrR3BqOHF0WVBFdy9oZW04Qmhtdmg2Tk95aVJmUi9pQ2JRSnBNOWlIVWRu?=
 =?utf-8?B?TzFQL0t1T3prNXIrRCsyQlJGRzl1TW1UcUM0WEdHWmJ5cysyV1VZdFpyWlJ3?=
 =?utf-8?B?NHhJSlBpUWdjbHZyeTdKK1orejFEQXlHdUtycEVzSHV0ZGcwS2VHNDUrRDFL?=
 =?utf-8?B?aXkyL3VIVFNpcjhFaVdMZEplRnpzMDlISS82Q243L3RTbndFd3NId3BiQWcz?=
 =?utf-8?B?c1ZzUzRieG1TVnBRejNmZE1LMW1WbG9ONjAvSnVqa1pYNTk5UjVQZ25rZFV3?=
 =?utf-8?B?Zk5kWnRDTEZETTgyeUNBcHJHRldRcE9va29kdlBwSmJzeHIzbWhSZTZqR0Zk?=
 =?utf-8?B?WE9rUGRXaEoxSkxvUmx1UmdNSHdmenVOVmkzWjl5NGN1K29TY1Y2VlNpU2x5?=
 =?utf-8?B?RWRRdjRPRkxndGRadEE5WmVGZCtqUnFWTStXVmVROG53Mm1uOUVXNmZaZ2Vz?=
 =?utf-8?B?QkVSUGh1encxU0plb0dvNmxDdmIxbmk2VmFHaFlBcVc1Rk45WStUNEFtYmJE?=
 =?utf-8?B?VkNSa1A4WVc1SXdrRjVGTlNIMS9UTEJkbTNGNDNnL1dtTms4aFcrRElaRVBt?=
 =?utf-8?B?eStsTXd6SURrV0R4cFlBZGFxT0lEdmx4REpaalZIZ05xUGwvb2pPRVFXQVpp?=
 =?utf-8?B?NWp3UGk5VEdIRVltdlkzM3RaTWk5N01IVWZSQ0JqVy9IeDE1N1FVNHZ0QTBS?=
 =?utf-8?B?WTZ3dkRLVkd2NCsyS2Urc3QwczNEQy9MbTh3d1N2KzBXa3ZBMG1LcFlnTkVU?=
 =?utf-8?B?eU5hQ3g0QjZZWnVYeVMxVk44ZVJqQ09jSk9nMmN3VEJWQmZLbEtKSzI1YnB2?=
 =?utf-8?B?WE9RREFuczI3b1ZaK1RhWkJpeldEOU1YeVVUN24zWlpYVDZ5RWhWWE9hQzNq?=
 =?utf-8?B?Wm9EL2ZyYXdVYzh6dDA5T2tzN0dPR3VWUmJ5QUhDNm5tenZKcnp6dVV2bnht?=
 =?utf-8?B?c2tWdlM0ay8zKzFaZnVWbHEwWW84d2N6T01RaDNUODlkYThYMStMc2pJQkFU?=
 =?utf-8?B?OHZrdXN3SXpyYWQ5dWd4eTdadkxzZ1Q4VmgwSEFaQy90QURIZEEweWlwc0tX?=
 =?utf-8?B?MitkMkJ1TVI2bmlDalRPUlRHTWdRSlVuTnRFWmJISUovMGNIQTVpSDVkdHZV?=
 =?utf-8?B?ZTR1QlQrNG9HOWVlUEI4TWdHNWJBazFhYW0vbXp1K0ZIZ016bWdIc28yaG03?=
 =?utf-8?B?bzFWOXo1WXUxOE14ZW9Mc0lxRk95REhJUVBwamVWZkFtNm1XS2JDdGk2MTlE?=
 =?utf-8?B?Qk9wVDhHMnhUdE9mMUxJVlF4NHFXWFVGSlFYUHZDajQ0SXpIdXhmU1hFNVY4?=
 =?utf-8?B?bG9BSnZ1SHVuSnI4UGlBaTIwSjBzYlFtUGRkM0lVbjFtUHVnUFFIdTdXVVpz?=
 =?utf-8?B?Uis0b2p5QmpycG9LTXRxMzI0aVAzUU9vd1BQR3hyOWY0dDFkdmI0MkpSSFJy?=
 =?utf-8?B?WWp1TUdVaEg1ZkJPRW1Fa3Rjb3B1WlBXaUZwWWcxbkhiK0xxRFlRaGwvQ3Vw?=
 =?utf-8?B?SHFGUUllNk5EUEFrNjhWTEFpemVuckZWOXNYNS9OeFRhSVVEZ1ZyQT09?=
X-Exchange-RoutingPolicyChecked: EGNz6LnvMxO7hPNqwrcQb8GfSdutmvlg7VD490tbWiSkGy7T2NZjHij8pqWSuxi/fMV8vtatMCPuuU2YI6hesUYRbv/SR4OMByxwNnSat1Hxfe7Q2BC9AlHKzCG6Dgh1spyQDTtZJrz9asnOAviKgwwi2nVXeS+M3l3QL+Utl1TxOCmEMb8BJN4PGl/7sqDy96o+ZzzRW7oB69C9qR8v7Xnc7VqofsSYHho9FqD8d1ilj+VJJ2XqA4FcgeFNn0V4YxcRrNalZaZU66Pm2BuIn1W3y2biZak6W8fE46tJNHUusJV0Snjm1I2HmNE0GCWQsIcNTesKkBhI+2ZL3HLSCw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d917d7-b163-4138-bfd4-08df36c8c2c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:00:00.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgbAg5my2wHGL98PWTbtd6oALM1ggKaJ8YqylrBqij1Ssjzma3WWr1dyYu4cp/vhny4+t1h6RKCjTkMMK1xxVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3767
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX6ShRL4KDw3xx
 PuXupTuTVmoHVcezSGSKIdyBPoh+LwDeOhVdEC5MXGJ3VrkxM8x/IsYB13Fgmxg6dAPk2oEApA+
 kTVfLzyhYOoC9HnPFwKkmRPagXR4k2hxFwNBxl3KO+Cb3w50sIbVqCj0MYH+pgqbDMh//Ht7Nu9
 aqAoHpSvoMcUNWn5CjLBiNwFw4OzBw3AkdDyxkUDfYYFdQNj2xx9JA7bFTVokI45N1pV3e0fhOK
 kHvcIdcQq5d9LtO2X1DdH/OmpO0XwDIaYXYwE3t5GCH7M8qnoNu4YMaXOnMmNWUZQmGdH4B4eAo
 9iMUtRB4/1vPc5i+EXN1cjthlLjlLcyxMmiZJDQYhLN1uakTuLG/F/9k+KPYCGyYl8HqU68CJc3
 r9KAPUEOvIJUfHAY/MCY7iHeMJInhSU44VCRN9HQ52rZ/0Xcroon/OGW+HmOnhfklbpClXMYh9n
 s+VlFwxb7GA+CrlOgfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX1EMimP7HMUdg
 JD+2ceWMVgdeza2Ldym0zSEMdykIU0YUzCjU37Rigb5NO9SEiEDw7Do0QTlf3Go63N6xc9RshCP
 SfWz1BtJJOSbTiZ49RG9YudhTyEJ+mQ=
X-Proofpoint-ORIG-GUID: yG6fLZG8c87NwtHXoYx49ygFV66IMb8k
X-Authority-Analysis: v=2.4 cv=P8+vFSAu c=1 sm=1 tr=0 ts=6ae5055b cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ZSrvDirOKP4VPF05hnFf:22 a=MvuuwTCpAAAA:8 a=iTzTgzf_AAAA:8
 a=wzg1yKxi0KSakgm5DiMA:9 a=EObSGzcHVnEKk7FG:21 a=QEXdDO2ut3YA:10
 a=JL7qxNyGISI99KadRA9B:22
X-Proofpoint-GUID: yG6fLZG8c87NwtHXoYx49ygFV66IMb8k
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the SerDes layer: per-lane configuration, the autogenerated lane
map, and the function-pointer table that lets the PML layer drive the
SerDes without knowing which SerDes core is present.

sbl_serdes_map_autogen.h is generated from the hardware lane
description and is kept in generated form, so style checkers will flag
it for line length and macro layout.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: LONG_LINE (45), BLOCK_COMMENT_STYLE (36), ALLOC_WITH_SIZEOF
  (2), ENOTSUPP (1), LONG_LINE_COMMENT (1), LONG_LINE_STRING (1),
  TYPO_SPELLING (1)
- CHECK: UNNECESSARY_PARENTHESES (37), BRACES (13), ALLOC_SIZEOF_STRUCT
  (2), PARENTHESIS_ALIGNMENT (2), COMPARISON_TO_NULL (1), LINE_SPACING
  (1)

Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sbl/sbl_serdes.c    | 1117 +++++++
 drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.c | 4310 ++++++++++++++++++++++++++
 2 files changed, 5427 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sbl/sbl_serdes.c b/drivers/net/ethernet/hpe/sbl/sbl_serdes.c
new file mode 100644
index 000000000000..4db5bb1a0bb9
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_serdes.c
@@ -0,0 +1,1117 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2022, 2024-2025 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+
+#include "sbl_constants.h"
+#include "sbl_serdes.h"
+#include "sbl_config_list.h"
+#include "sbl_serdes_map.h"
+#include "sbl_serdes_fn.h"
+#include "sbl_internal.h"
+
+static atomic_t sbl_next_serdes_config_tag = ATOMIC_INIT(-1);
+
+static int sbl_serdes_stop_internal(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int err = 0;
+	int serdes;
+
+	sbl_dev_dbg(sbl->dev, "p%d: SerDes stop", port_num);
+
+	err = sbl_port_stop_pcal(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes stop: port_pcal_stop failed [%d]",
+			    port_num, err);
+		goto out;
+	}
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		err = sbl_set_tx_rx_enable(sbl, port_num, serdes,
+					   false, false, false);
+		if (err) {
+			sbl_dev_err(sbl->dev,
+				    "p%d: SerDes stop: disable failed [%d]",
+				port_num, err);
+			goto out;
+		}
+	}
+
+	err = sbl_spico_reset(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes stop: spico_reset failed [%d]",
+			    port_num, err);
+		goto out;
+	}
+
+out:
+	if (err) {
+		link->sstate = SBL_SERDES_STATUS_ERROR;
+		/* Try and recover from errors with FW reload */
+		link->reload_serdes_fw = true;
+	} else {
+		sbl_dev_dbg(sbl->dev, "p%d: SerDes stop: done", port_num);
+		link->sstate = SBL_SERDES_STATUS_DOWN;
+	}
+	link->serr = err;
+
+	return err;
+}
+
+/* This delay is to give time for the optical transceivers to lock */
+static int sbl_serdes_optical_lock_delay(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	unsigned long last_jiffy;
+	int err = 0;
+
+	sbl_dev_dbg(sbl->dev, "p%d: optical lock delay", port_num);
+
+	if (link->blattr.config_target != SBL_BASE_LINK_CONFIG_AOC) {
+		sbl_dev_err(sbl->dev, "p%d: optical lock delay - config not optical", port_num);
+		return -EINVAL;
+	}
+
+	link->optical_delay_active = true;
+	last_jiffy = jiffies + msecs_to_jiffies(link->blattr.aoc.optical_lock_delay);
+	while (time_is_after_jiffies(last_jiffy)) {
+		if (sbl_base_link_start_cancelled(sbl, port_num)) {
+			err = -ECANCELED;
+			goto out;
+		}
+		if (sbl_start_timeout(sbl, port_num)) {
+			err = -ETIMEDOUT;
+			goto out;
+		}
+		msleep(link->blattr.aoc.optical_lock_interval);
+	}
+out:
+	link->optical_delay_active = false;
+	return err;
+}
+
+/**
+ * sbl_serdes_load() - SerDes initial load function
+ * @sbl: pointer containing target config and state
+ * @port_num: target port number
+ * @force: reset and flash even if current fw is at the correct
+ *        rev and build number
+ *
+ *  When power cycle or controller boots, This function
+ *  Applies the SBus speedup and flashes all SBM/SerDes firmware images
+ *
+ * Return: 0 on success or negative errno on failure
+ */
+int sbl_serdes_load(struct sbl_inst *sbl, int port_num, bool force)
+{
+	int err;
+
+	if (!sbl->is_hw)
+		return 0;
+
+	if (port_num == SBL_ALL_PORTS) {
+		err = sbl_apply_sbus_divider(sbl, SBL_SBUS_DIVIDER_DFLT);
+		if (err) {
+			sbl_dev_err(sbl->dev, "p%d: SBus speedup failed [%d]", port_num, err);
+			return err;
+		}
+	}
+
+	/* retrieve, flash and release SBM firmware */
+	if (port_num == SBL_ALL_PORTS) {
+		err = sbl_sbm_firmware_flash(sbl);
+		if (err) {
+			sbl_dev_err(sbl->dev, "p%d: failed to flash SBM fw [%d]", port_num, err);
+			return err;
+		}
+	}
+
+	/* retrieve and flash SerDes firmware */
+	err = sbl_serdes_firmware_flash(sbl, port_num, force);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%d: failed to flash SerDes fw [%d]",
+			    port_num, err);
+		return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_serdes_load);
+
+/* link partner detection
+ *
+ * This function will attempt a serdes minitune. This fast tune will only
+ * succeed if the lp is sending AM using the same mode as we are using.
+ *
+ */
+int sbl_serdes_lp_detect(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int err;
+	int tmp_err;
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
+	/* in loopback mode the link partner (ourself) is always present! */
+	if (link->loopback_mode == SBL_LOOPBACK_MODE_LOCAL)
+		return 0;
+
+	if (link->sstate != SBL_SERDES_STATUS_DOWN) {
+		sbl_dev_err(sbl->dev, "p%d: serdes_lpd wrong state to start (%s)",
+			    port_num, sbl_serdes_state_str(link->sstate));
+		/* leave state unchanged */
+		return -EUCLEAN;
+	}
+
+	link->sstate = SBL_SERDES_STATUS_LPD_MT;
+	link->serr = 0;
+
+	for (link->lpd_try_count = 0; true; ++link->lpd_try_count) {
+		err = sbl_serdes_minitune_setup(sbl, port_num);
+		if (err) {
+			sbl_dev_err(sbl->dev, "p%d: serdes_lpd setup failed [%d]",
+				    port_num, err);
+			goto out_err;
+		}
+
+		/* If the other end is there then we should block for no more
+		 * than 5s
+		 */
+		err = sbl_serdes_minitune_block(sbl, port_num);
+		switch (err) {
+		case 0:
+			sbl_dev_dbg(sbl->dev, "p%d: serdes_lpd done", port_num);
+			link->lp_detected = true;
+			goto out_done;
+
+		case -ETIMEDOUT:
+			sbl_dev_warn(sbl->dev, "p%d: serdes_lpd timed out", port_num);
+			/* Occasionally serdes minitune will fail even though the link
+			 * partner is actually there!
+			 * Sometimes we can recover by resetting the serdes PLLs and/or
+			 * reloading the serdes firmware
+			 */
+			if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_SPLL_RESET)) {
+				tmp_err = sbl_reset_serdes_plls(sbl, port_num);
+				if (tmp_err) {
+					/* if this fails nothing we can do */
+					sbl_dev_err(sbl->dev, "p%d: serdes_lpd pll reset failed [%d]",
+						    port_num, tmp_err);
+					/* TODO maybe force fw reload here? */
+				}
+			}
+
+			if (link->blattr.options & SBL_OPT_RELOAD_FW_ON_TIMEOUT)
+				link->reload_serdes_fw = true;
+
+			goto out_done;
+
+		case -ECANCELED:
+			sbl_dev_dbg(sbl->dev, "p%d: serdes_lpd cancelled", port_num);
+			goto out_done;
+
+		case -ETIME:
+			sbl_dev_dbg(sbl->dev, "p%d: serdes_lpd nothing detected", port_num);
+			/* just try again */
+			break;
+
+		default:
+			sbl_dev_err(sbl->dev, "p%d: serdes_lpd block failed [%d]", port_num, err);
+			goto out_err;
+		}
+	};
+
+out_done:
+	link->sstate = SBL_SERDES_STATUS_DOWN;
+	link->serr = 0;
+	return err;
+
+out_err:
+	/* serdes is broken and requires reset */
+	link->sstate = SBL_SERDES_STATUS_ERROR;
+	link->serr = err;
+	return err;
+}
+
+int sbl_serdes_start(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int err;
+	int tmp_err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "p%d: SerDes start", port_num);
+
+	link = sbl->link + port_num;
+
+	if (link->sstate != SBL_SERDES_STATUS_DOWN) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes start: wrong state (%s)",
+			    port_num, sbl_serdes_state_str(link->sstate));
+		/* leave state unchanged */
+		return -EUCLEAN;
+	}
+
+	/* configure serdes */
+	err = sbl_serdes_config(sbl, port_num, false);
+	if (err) {
+		sbl_dev_err(sbl->dev,
+			    "p%d: SerDes start: serdes_config failed [%d]",
+			    port_num, err);
+		if (err == -EBADE)
+			link->reload_serdes_fw = true;
+		goto out;
+	}
+
+	/* wait a while before starting to tune to let the optics lock if present
+	 * (in local loopback mode however there are never any optics to wait for)
+	 */
+	if (link->blattr.loopback_mode != SBL_LOOPBACK_MODE_LOCAL) {
+		if (link->mattr.media == SBL_LINK_MEDIA_OPTICAL) {
+			err = sbl_serdes_optical_lock_delay(sbl, port_num);
+			if (err)
+				goto out;
+		}
+	}
+
+	/* make sure we have time left for at lease 2 tuning cycles */
+	sbl_start_timeout_ensure_remaining(sbl, port_num,
+					   2 * (link->blattr.dfe_timeout +
+						 link->blattr.dfe_pre_delay));
+
+	/* tune serdes */
+	link->sstate = SBL_SERDES_STATUS_TUNING;
+
+	err = sbl_serdes_tuning(sbl, port_num);
+	if (err) {
+		switch (err) {
+		case -ECANCELED:
+			sbl_dev_dbg(sbl->dev, "p%d: SerDes start: tuning cancelled", port_num);
+			break;
+		case -ETIMEDOUT:
+			sbl_dev_dbg(sbl->dev, "p%d: SerDes start: tuning timed out", port_num);
+			/* occasionally tuning can fail even thought the lp is good
+			 * resetting the serdes rx plls or reloading the serdes fw can
+			 * sometimes fix this
+			 */
+			if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_SPLL_RESET)) {
+				tmp_err = sbl_reset_serdes_plls(sbl, port_num);
+				if (tmp_err) {
+					/* if this fails nothing we can do */
+					sbl_dev_err(sbl->dev, "p%d: SerDes start: reset_serdes_plls failed [%d]",
+						    port_num, tmp_err);
+					/* TODO maybe force fw reload here? */
+				}
+			}
+
+			if (link->blattr.options & SBL_OPT_RELOAD_FW_ON_TIMEOUT)
+				link->reload_serdes_fw = true;
+			break;
+		default:
+			sbl_dev_err(sbl->dev,
+				    "p%d: SerDes start: serdes_tuning failed [%d]",
+				    port_num, err);
+			break;
+		}
+	}
+
+out:
+	/* update status */
+	if (err) {
+		link->sstate = SBL_SERDES_STATUS_ERROR;
+		link->serr = err;
+	} else {
+		sbl_dev_dbg(sbl->dev, "p%d: SerDes start: done", port_num);
+		link->sstate = SBL_SERDES_STATUS_RUNNING;
+		link->serr = 0;
+	}
+
+	return err;
+}
+
+int sbl_serdes_stop(struct sbl_inst *sbl, int port_num)
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
+	if (!(link->sstate & (SBL_SERDES_STATUS_RUNNING | SBL_SERDES_STATUS_AUTONEG))) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes stop: wrong state (%s)",
+			    port_num, sbl_serdes_state_str(link->sstate));
+		/* leave state unchanged */
+		return -EUCLEAN;
+	}
+
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_KEEP_SERDES_UP)) {
+		sbl_dev_err(sbl->dev, "p%d: KEEP SERDES UP", port_num);
+		return 0;
+	}
+
+	return sbl_serdes_stop_internal(sbl, port_num);
+}
+
+int sbl_serdes_reset(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link;
+	int fail_reset_serdes = 0;
+	int serdes;
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
+	sbl_dev_dbg(sbl->dev, "p%d: SerDes reset", port_num);
+
+	link = sbl->link + port_num;
+	link->sstate = SBL_SERDES_STATUS_RESETTING;
+
+	/* optionally clear any saved tuning params */
+	if (link->blattr.options & SBL_OPT_RESET_CLEAR_PARAMS) {
+		link->tuning_params.tp_state_hash0 = 0;
+		link->tuning_params.tp_state_hash1 = 0;
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			memset(link->tuning_params.params[serdes].ctle, 0,
+			       sizeof(u16) * NUM_CTLE_PARAMS);
+			memset(link->tuning_params.params[serdes].ffe, 0,
+			       sizeof(u16) * NUM_FFE_PARAMS);
+			memset(link->tuning_params.params[serdes].dfe, 0,
+			       sizeof(u16) * NUM_DFE_PARAMS);
+			memset(link->tuning_params.params[serdes].rxvs, 0,
+			       sizeof(u16) * NUM_RXVS_PARAMS);
+			memset(link->tuning_params.params[serdes].rxvc, 0,
+			       sizeof(u16) * NUM_RXVC_PARAMS);
+			memset(link->tuning_params.params[serdes].rsdo, 0,
+			       sizeof(u16) * NUM_RSDO_PARAMS);
+			memset(link->tuning_params.params[serdes].rsdc, 0,
+			       sizeof(u16) * NUM_RSDC_PARAMS);
+			memset(link->tuning_params.params[serdes].rsto, 0,
+			       sizeof(u16) * NUM_RSTO_PARAMS);
+			memset(link->tuning_params.params[serdes].rstc, 0,
+			       sizeof(u16) * NUM_RSTC_PARAMS);
+			memset(link->tuning_params.params[serdes].eh, 0,
+			       sizeof(u16) * NUM_EH_PARAMS);
+			memset(link->tuning_params.params[serdes].gtp, 0,
+			       sizeof(u16) * NUM_GTP_PARAMS);
+			memset(link->tuning_params.params[serdes].dccd, 0,
+			       sizeof(u16) * NUM_DCCD_PARAMS);
+			memset(link->tuning_params.params[serdes].p4lv, 0,
+			       sizeof(u16) * NUM_P4LV_PARAMS);
+			memset(link->tuning_params.params[serdes].afec, 0,
+			       sizeof(u16) * NUM_AFEC_PARAMS);
+		}
+	}
+
+	/* Stop continuous tune */
+	err = sbl_port_stop_pcal(sbl, port_num);
+	if (err)
+		sbl_dev_warn(sbl->dev, "p%d: SerDes reset: port_stop_pcal failed [%d]",
+			     port_num, err);
+
+	/* Previously sbl_spico_reset() is now changed to
+	 * sbl_serdes_soft_reset() to avoid SBUS lockups - SSHOTPLAT-2222.
+	 * Upon error, spico reset will reload serdes firmware.
+	 * Note, reloading the firmware can be forced with a
+	 * debug option.
+	 */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		err = sbl_serdes_soft_reset(sbl, port_num, serdes);
+		if (err) {
+			fail_reset_serdes = serdes;
+			break;
+		}
+	}
+	if (err)
+		sbl_dev_err(sbl->dev, "p%ds%d: SerDes reset: serdes_soft_reset failed [%d]",
+			    port_num, fail_reset_serdes, err);
+	else if (sbl_debug_option(sbl, port_num, SBL_DEBUG_FORCE_RELOAD_SERDES_FW))
+		/* Skip out_success and continue to SPICO reload */
+		sbl_dev_info(sbl->dev, "p%d: SPICO force serdes_firmware_flash_safe", port_num);
+	else
+		goto out_success;
+
+	/* reload fw */
+	err = sbl_serdes_firmware_flash_safe(sbl, port_num, true);
+	if (err)
+		sbl_dev_err(sbl->dev, "p%d: SerDes reset: serdes_firmware_flash_safe failed [%d]",
+			    port_num, err);
+	else
+		goto out_success;
+
+	/* This is really bad!
+	 * There is nothing we can do but say we are in error and
+	 * be reset again
+	 */
+	sbl_dev_err(sbl->dev, "p%d: SerDes reset: failed [%d]", port_num, err);
+	link->sstate = SBL_SERDES_STATUS_ERROR;
+	link->serr = err;
+
+	return err;
+
+out_success:
+	/* serdes should be fine */
+	sbl_dev_dbg(sbl->dev, "p%d: SerDes reset: done", port_num);
+	link->sstate = SBL_SERDES_STATUS_DOWN;
+	link->serr = 0;
+
+	return 0;
+}
+
+int sbl_an_serdes_start(struct sbl_inst *sbl, int port_num)
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
+	if (link->mattr.media != SBL_LINK_MEDIA_ELECTRICAL) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes AN start - media not electrical",
+			    port_num);
+		return -EINVAL;
+	}
+
+	if (link->blattr.pec.an_mode != SBL_AN_MODE_ON &&
+	    link->blattr.pec.an_mode != SBL_AN_MODE_FIXED) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes AN start - bad mode specified (%s)",
+			    port_num, sbl_an_mode_str(link->blattr.pec.an_mode));
+		return -EINVAL;
+	}
+
+	if (link->sstate != SBL_SERDES_STATUS_DOWN) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes AN start - wrong state (%s)",
+			    port_num, sbl_serdes_state_str(link->sstate));
+		/* leave state unchanged */
+		return -EUCLEAN;
+	}
+
+	err = sbl_serdes_stop_internal(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes AN start - stop internal failed [%d]",
+			    port_num, err);
+		goto out_err;
+	}
+
+	err = sbl_serdes_config(sbl, port_num, true);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes AN start - config failed [%d]",
+			    port_num, err);
+		goto out_err;
+	}
+
+	sbl_dev_dbg(sbl->dev, "p%d: SerDes AN started", port_num);
+	link->sstate = SBL_SERDES_STATUS_AUTONEG;
+	link->serr = 0;
+	return 0;
+
+out_err:
+	link->sstate = SBL_SERDES_STATUS_ERROR;
+	link->serr = err;
+	return err;
+}
+
+int sbl_an_serdes_stop(struct sbl_inst *sbl, int port_num)
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
+	if (link->sstate != SBL_SERDES_STATUS_AUTONEG) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes in wrong state (%s) for AN stop\n",
+			    port_num, sbl_serdes_state_str(link->sstate));
+		/* leave state unchanged */
+		return -EUCLEAN;
+	}
+
+	err = sbl_serdes_stop_internal(sbl, port_num);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%d: SerDes AN stop failed [%d]\n",
+			    port_num, err);
+		link->sstate = SBL_SERDES_STATUS_ERROR;
+	} else {
+		sbl_dev_dbg(sbl->dev, "p%d: SerDes AN stopped", port_num);
+		link->sstate = SBL_SERDES_STATUS_DOWN;
+	}
+	link->serr = err;
+	return err;
+}
+
+/**
+ * sbl_serdes_get_tuning_params() - Save tuning params
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @tuning_params: tuning parameters used to configure a link,
+ *                allowing the SerDes to come up without needing to DFE tune.
+ *
+ * Get tuning parameters which was used to configure a link
+ *
+ * Context: Process, May sleep. Uses mutex_lock
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_serdes_get_tuning_params(struct sbl_inst *sbl, int port_num,
+				 struct sbl_tuning_params *tuning_params)
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
+	/* don't return invalid parameters */
+	mutex_lock(&link->tuning_params_mtx);
+	if (link->tuning_params.magic != SBL_TUNING_PARAM_MAGIC) {
+		mutex_unlock(&link->tuning_params_mtx);
+		return -ENODATA;
+	}
+
+	sbl_dev_dbg(sbl->dev, "p%d: tp get - returning hash0 0x%llx hash1 0x%llx\n",
+		    port_num, link->tuning_params.tp_state_hash0,
+		link->tuning_params.tp_state_hash1);
+
+	memcpy(tuning_params, &link->tuning_params, sizeof(struct sbl_tuning_params));
+	mutex_unlock(&link->tuning_params_mtx);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_serdes_get_tuning_params);
+
+/**
+ * sbl_serdes_set_tuning_params() - set tuning params for serdes
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @tuning_params: Pointer to struct sbl_tuning_params
+ *
+ *  Set tuning parameters used to configure a link, allowing the SerDes
+ *  to come up.
+ *
+ * Context: Process, May sleep. Uses mutex_lock
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_serdes_set_tuning_params(struct sbl_inst *sbl, int port_num,
+				 struct sbl_tuning_params *tuning_params)
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
+	if (tuning_params->magic != SBL_TUNING_PARAM_MAGIC)
+		return -EINVAL;
+
+	/* only support one verion for now */
+	if (tuning_params->version != SBL_TUNING_PARAM_VERSION)
+		return -EINVAL;
+
+	mutex_lock(&link->tuning_params_mtx);
+	memcpy(&link->tuning_params, tuning_params, sizeof(struct sbl_tuning_params));
+	mutex_unlock(&link->tuning_params_mtx);
+
+	sbl_dev_dbg(sbl->dev, "p%d: tp set - received hash0 0x%llx hash1 0x%llx\n",
+		    port_num, link->tuning_params.tp_state_hash0,
+		link->tuning_params.tp_state_hash1);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_serdes_set_tuning_params);
+
+/**
+ * sbl_serdes_invalidate_tuning_params() - Invalidate tuning params
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ *
+ * Clearing per port tuning parameters
+ *
+ * Context: Process, May sleep. Uses mutex_lock
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int sbl_serdes_invalidate_tuning_params(struct sbl_inst *sbl, int port_num)
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
+	mutex_lock(&link->tuning_params_mtx);
+	link->tuning_params.magic = 0;               /* prevent transfer to usr-space */
+	link->tuning_params.tp_state_hash0 = 0;      /* prevent use */
+	link->tuning_params.tp_state_hash1 = 0;      /* prevent use */
+	mutex_unlock(&link->tuning_params_mtx);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_serdes_invalidate_tuning_params);
+
+/**
+ * sbl_serdes_invalidate_all_tuning_params() - Invalidate all tuning params
+ * @sbl: A slingshot base link device instance
+ *
+ * Clearing all ports tuning parameters
+ *
+ * Return: 0 on success
+ */
+int sbl_serdes_invalidate_all_tuning_params(struct sbl_inst *sbl)
+{
+	int i;
+
+	for (i = 0; i < sbl->switch_info->num_ports; ++i)
+		sbl_serdes_invalidate_tuning_params(sbl, i);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_serdes_invalidate_all_tuning_params);
+
+/**
+ * sbl_serdes_add_config() - Serdes configuration addition
+ * @sbl: A slingshot base link device instance
+ * @tp_state_mask0: State lookup mask
+ * @tp_state_mask1: State lookup mask
+ * @tp_state_match0: match values after masking
+ * @tp_state_match1: match values after masking
+ * @port_mask: applicable ports
+ * @serdes_mask: applicable serdes
+ * @vals: Configuration values
+ * @is_default: Default configuration
+ *
+ * A SerDes configuration entry specifies a set of config values which
+ * are selected to get the SerDes to tune reliably for a given setup.
+ *
+ * Context: Process context, Acquires lock and release serdes_config_lock <spin_lock>
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_serdes_add_config(struct sbl_inst *sbl,
+			  u64 tp_state_mask0, u64 tp_state_mask1,
+		u64 tp_state_match0, u64 tp_state_match1,
+		u64 port_mask, u8 serdes_mask, struct sbl_sc_values *vals,
+		bool is_default)
+{
+	struct sbl_serdes_config *new_sc;
+	struct sbl_serdes_config *sc;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	if (vals->magic != SBL_SERDES_CONFIG_MAGIC)
+		return -EINVAL;
+
+	sbl_dev_dbg(sbl->dev, "serdes add config");
+
+	new_sc = kmalloc(sizeof(struct sbl_serdes_config), GFP_KERNEL);
+	if (!new_sc)
+		return -ENOMEM;
+
+	new_sc->tp_state_mask0  = tp_state_mask0;
+	new_sc->tp_state_mask1  = tp_state_mask1;
+	new_sc->tp_state_match0 = tp_state_match0;
+	new_sc->tp_state_match1 = tp_state_match1;
+	new_sc->port_mask       = port_mask;
+	new_sc->serdes_mask     = serdes_mask;
+	new_sc->is_default      = is_default;
+	new_sc->tag             = sbl_serdes_get_config_tag();
+	memcpy(&new_sc->vals, vals, sizeof(struct sbl_sc_values));
+	INIT_LIST_HEAD(&new_sc->list);
+
+	spin_lock(&sbl->serdes_config_lock);
+
+	/* check new entry is unique */
+	list_for_each_entry(sc, &sbl->serdes_config_list, list) {
+		if (sc->port_mask == port_mask &&
+		    sc->serdes_mask == serdes_mask &&
+		    sc->tp_state_mask0 == tp_state_mask0 &&
+		    sc->tp_state_mask1 == tp_state_mask1 &&
+		    sc->tp_state_match0 == tp_state_match0 &&
+		    sc->tp_state_match1 == tp_state_match1) {
+			spin_unlock(&sbl->serdes_config_lock);
+			kfree(new_sc);
+			return -EEXIST;
+		}
+	}
+
+	/* add the new entry */
+	list_add(&new_sc->list, &sbl->serdes_config_list);
+	sbl_dev_dbg(sbl->dev, "added serdes config, tag %d\n", new_sc->tag);
+	spin_unlock(&sbl->serdes_config_lock);
+	return 0;
+}
+EXPORT_SYMBOL(sbl_serdes_add_config);
+
+/**
+ * sbl_serdes_del_config() - Delete serdes configuration
+ * @sbl: A slingshot base link device instance
+ * @tp_state_mask0: State lookup mask
+ * @tp_state_mask1: State lookup mask
+ * @tp_state_match0: match values after masking
+ * @tp_state_match1: match values after masking
+ * @port_mask: applicable ports
+ * @serdes_mask: applicable serdes
+ *
+ * Delete SerDes config values which are selected to get the
+ * SerDes to tune
+ *
+ * Context: Process context, Acquires lock and release serdes_config_lock <spin_lock>
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int sbl_serdes_del_config(struct sbl_inst *sbl,
+			  u64 tp_state_mask0, u64 tp_state_mask1,
+		u64 tp_state_match0, u64 tp_state_match1,
+		u64 port_mask, u8  serdes_mask)
+{
+	struct sbl_serdes_config *sc;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "serdes del config");
+
+	spin_lock(&sbl->serdes_config_lock);
+
+	/* find the entry and remove it */
+	list_for_each_entry(sc, &sbl->serdes_config_list, list) {
+		if (sc->port_mask == port_mask &&
+		    sc->serdes_mask == serdes_mask &&
+		    sc->tp_state_mask0 == tp_state_mask0 &&
+		    sc->tp_state_mask1 == tp_state_mask1 &&
+		    sc->tp_state_match0 == tp_state_match0 &&
+		    sc->tp_state_match1 == tp_state_match1) {
+			list_del(&sc->list);
+			spin_unlock(&sbl->serdes_config_lock);
+			sbl_dev_dbg(sbl->dev, "deleted serdes config, tag %d\n", sc->tag);
+			kfree(sc);
+			return 0;
+		}
+	}
+
+	/* not found */
+	spin_unlock(&sbl->serdes_config_lock);
+	return -ENOENT;
+}
+EXPORT_SYMBOL(sbl_serdes_del_config);
+
+/**
+ * sbl_serdes_clear_all_configs() - serdes clear all configurations
+ * @sbl: A slingshot base link device instance
+ * @clr_default: Clear default value
+ *
+ * Context: Process context, Acquires lock and release serdes_config_lock <spin_lock>
+ *
+ * Return: 0 on success, negative error on failure
+ */
+int sbl_serdes_clear_all_configs(struct sbl_inst *sbl, bool clr_default)
+{
+	struct sbl_serdes_config *sc;
+	struct sbl_serdes_config *tmp_sc;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return err;
+
+	sbl_dev_dbg(sbl->dev, "serdes clear all configs");
+
+	/* find the entries and remove them */
+	spin_lock(&sbl->serdes_config_lock);
+	list_for_each_entry_safe(sc, tmp_sc, &sbl->serdes_config_list, list) {
+		/* clear if not default or we want to clear the default */
+		if (!sc->is_default || clr_default) {
+			list_del(&sc->list);
+			kfree(sc);
+		}
+	}
+	spin_unlock(&sbl->serdes_config_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(sbl_serdes_clear_all_configs);
+
+/**
+ * sbl_serdes_dump_configs() - Print all serdes configs
+ * @sbl: A slingshot base link device instance
+ *
+ * Context: Process context, Acquires lock and release serdes_config_lock <spin_lock>
+ * Return: on error
+ */
+void sbl_serdes_dump_configs(struct sbl_inst *sbl)
+{
+	struct sbl_serdes_config *sc;
+	int count = 0;
+	int err;
+
+	err = sbl_validate_instance(sbl);
+	if (err)
+		return;
+
+	spin_lock(&sbl->serdes_config_lock);
+	list_for_each_entry_reverse(sc, &sbl->serdes_config_list, list) {
+		sbl_dev_info(sbl->dev,
+			     "serdes config %d: dflt: %d, tag %d, mask0 0x%llx, match0 0x%llx, mask1 0x%llx, match1 0x%llx, ports 0x%llx, serdes 0x%x\n",
+			count++, sc->is_default, sc->tag, sc->tp_state_mask0, sc->tp_state_match0, sc->tp_state_mask1, sc->tp_state_match1, sc->port_mask, sc->serdes_mask);
+	}
+	spin_unlock(&sbl->serdes_config_lock);
+}
+EXPORT_SYMBOL(sbl_serdes_dump_configs);
+
+u32 sbl_serdes_get_config_tag(void)
+{
+	return atomic_inc_return(&sbl_next_serdes_config_tag);
+}
+
+#ifdef CONFIG_SYSFS
+/**
+ * sbl_serdes_sysfs_sprint() - Format all seredes status into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * Inspects the current SERDES state and based on the value, formats
+ * relevant status or counter information into a readable string. The
+ * formatted output is written to the provided buffer. The output includes
+ * flags such as ":on", ":off", or serdes-reload-counters[fw,spico,pll] values
+ *
+ * Context: Process context, Acquires lock and release link->lock <spin_lock>
+ *
+ * Return: Number of characters written, at most @size - 1
+ */
+int sbl_serdes_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int s = 0;
+	int i;
+	int s_fw_reload_count[4] = {0};
+	int s_spico_reset_count[4] = {0};
+	int s_pll_reset_count[4] = {0};
+
+	spin_lock(&link->lock);
+	s += scnprintf(buf + s, size - s, "serdes: %s",
+			sbl_serdes_state_str(link->sstate));
+	switch (link->sstate) {
+	case SBL_SERDES_STATUS_ERROR:
+		s += scnprintf(buf + s, size - s, " [%d]", link->serr);
+		break;
+	case SBL_SERDES_STATUS_LPD_MT:
+		s += scnprintf(buf + s, size - s, " cnt %d", link->lpd_try_count);
+		break;
+	case SBL_SERDES_STATUS_RUNNING:
+		if (link->loopback_mode != SBL_LOOPBACK_MODE_OFF) {
+			s += scnprintf(buf + s, size - s, ", loopback: %s",
+					sbl_loopback_mode_str(link->loopback_mode));
+		}
+		s += scnprintf(buf + s, size - s, ", precoding: %s",
+				(link->precoding_enabled) ? "on" : "off");
+		if (link->dfe_tune_count == SBL_DFE_USED_SAVED_PARAMS) {
+			s += scnprintf(buf + s, size - s, ", tune: used-saved-params");
+		} else {
+			s += scnprintf(buf + s, size - s,
+				       ", tune: cnt %d, eff %s (%lld.%.3ld/%lld.%.3ld)",
+					link->dfe_tune_count,
+					sbl_serdes_effort_str(link->ical_effort),
+					(long long)link->tune_time.tv_sec,
+					link->tune_time.tv_nsec / 1000000,
+					(long long)link->total_tune_time.tv_sec,
+					link->total_tune_time.tv_nsec / 1000000);
+		}
+		break;
+	case SBL_SERDES_STATUS_TUNING:
+		if (link->dfe_tune_count == SBL_DFE_USED_SAVED_PARAMS) {
+			s += scnprintf(buf + s, size - s, ", loading-saved-params");
+		} else {
+			s += scnprintf(buf + s, size - s, ", cnt %d, eff %s (%d/%d)",
+					link->dfe_tune_count,
+					sbl_serdes_effort_str(link->ical_effort),
+					sbl_link_tune_elapsed(sbl, port_num),
+					link->blattr.dfe_timeout);
+		}
+		break;
+	default:
+		break;
+	}
+
+	s += scnprintf(buf + s, size - s, ", pcal: %s",
+			(link->pcal_running) ? "on" : "off");
+	if (link->dfe_predelay_active)
+		s += scnprintf(buf + s, size - s, ", pre-delay");
+	if (link->optical_delay_active)
+		s += scnprintf(buf + s, size - s, ", optical-delay");
+	s += scnprintf(buf + s, size - s, ", fw_reload_skip_cnt: %d",
+			sbl_link_counters_read(sbl, port_num, serdes_fw_reload_skip));
+	s += scnprintf(buf + s, size - s, "\n");
+
+	s += scnprintf(buf + s, size - s, "serdes-reload-counters[fw,spico,pll]:");
+	sbl_link_counters_get(sbl, port_num, s_fw_reload_count,
+			      serdes0_fw_reload, 4);
+	sbl_link_counters_get(sbl, port_num, s_spico_reset_count,
+			      serdes0_spico_reset, 4);
+	sbl_link_counters_get(sbl, port_num, s_pll_reset_count,
+			      serdes0_pll_reset, 4);
+	for (i = 0; i < sbl->switch_info->num_serdes; ++i) {
+		s += scnprintf(buf + s, size - s, " s%d:[%d,%d,%d]", i, s_fw_reload_count[i],
+					s_spico_reset_count[i], s_pll_reset_count[i]);
+	}
+	s += scnprintf(buf + s, size - s, "\n");
+	spin_unlock(&link->lock);
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_serdes_sysfs_sprint);
+
+/**
+ * sbl_serdes_fw_sysfs_sprint() - Format SERDES firmware rev and build into buffer
+ * @sbl: A slingshot base link device instance
+ * @port_num: port number
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * Get the serdes firmware version and build information for the port as a string.
+ * Multiple serdes firmware versions and build exist per port. Format those information
+ * into provided buffer
+ *
+ * Return: Number of characters written (at most @size - 1), negative error on failure
+ */
+int sbl_serdes_fw_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size)
+{
+	int serdes = 0;
+	struct fw {
+		uint rev;
+		uint build;
+	} fw[SBL_SERDES_LANES_PER_PORT];
+	ssize_t s = 0;
+
+	int err = sbl_validate_instance(sbl);
+
+	if (err)
+		return err;
+
+	err = sbl_validate_port_num(sbl, port_num);
+	if (err)
+		return err;
+
+	if (!buf || size == 0U)
+		return -ENOMEM;
+
+	memset(fw, 0, sizeof(fw));
+	for (serdes = 0; serdes < SBL_SERDES_LANES_PER_PORT; ++serdes) {
+		struct fw *pfw = fw + serdes;
+
+		sbl_serdes_get_fw_vers(sbl, port_num, serdes,
+				       &pfw->rev, &pfw->build);
+
+		s += scnprintf(buf + s, size - s,
+			"0x%4.4x_%4.4x\n", pfw->rev, pfw->build);
+	}
+
+	return s;
+}
+EXPORT_SYMBOL(sbl_serdes_fw_sysfs_sprint);
+
+/**
+ * sbl_sbm_fw_sysfs_sprint() - Get sbus master firmware version
+ * @sbl: A slingshot base link device instance
+ * @ring: Value
+ * @buf: Destination buffer to write the data
+ * @size: Size of @buf in bytes, the output is truncated to fit
+ *
+ * Return: Number of characters written (at most @size - 1), negative error on failure
+ */
+int sbl_sbm_fw_sysfs_sprint(struct sbl_inst *sbl, int ring, char *buf, size_t size)
+{
+	uint fw_rev, fw_build = 0;
+
+	int err = sbl_validate_instance(sbl);
+
+	if (err)
+		return err;
+
+	if (ring < 0 || ring >= sbl_get_num_sbus_rings(sbl))
+		return -EINVAL;
+
+	if (!buf || size == 0U)
+		return -ENOMEM;
+
+	sbl_sbm_get_fw_vers(sbl, ring, &fw_rev, &fw_build);
+	return scnprintf(buf, size, "0x%4.4x_%4.4x\n", fw_rev, fw_build);
+}
+EXPORT_SYMBOL(sbl_sbm_fw_sysfs_sprint);
+
+#endif
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.c b/drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.c
new file mode 100644
index 000000000000..f085d5c41da1
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.c
@@ -0,0 +1,4310 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+
+#include <linux/hpe/sbl/sbl.h>
+#include <linux/hpe/sbl/sbl_kconfig.h>
+#include <linux/hpe/sbl/sbl_test.h>
+
+#include <linux/hpe/sbl/sbl_pml.h>
+
+#include <uapi/ethernet/sbl_sbm_constants.h>
+#include <uapi/ethernet/sbl_serdes_defaults.h>
+
+#include "sbl_constants.h"
+#include "sbl_serdes_map.h"
+#include "sbl_serdes.h"
+#include "sbl_sbm_serdes.h"
+#include "sbl_serdes_fn.h"
+#include "sbl_internal.h"
+#include "sbl_config_list.h"
+#include "sbl_pml_fn.h"
+
+static void sbl_send_serdes_fw_corruption_alert(struct sbl_inst *sbl, int port, int serdes)
+{
+	u32 alert_data;
+	struct serdes_info *serdes_info;
+
+	serdes_info = &sbl->switch_info->ports[port].serdes[serdes];
+	alert_data = ((serdes_info->sbus_ring & 0xffff) << 16) |
+		(serdes_info->rx_addr & 0xffff);
+
+	sbl_async_alert(sbl, port,
+			SBL_ASYNC_ALERT_SERDES_FW_CORRUPTION,
+			(void *)(uintptr_t)alert_data, 0);
+
+	/* Delay to allow userspace to get a serdes state dump */
+	msleep(SBL_SERDES_STATE_DUMP_DELAY);
+}
+
+static bool get_serdes_precoding(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_FORCE_PRECODING_ON))
+		return true;
+
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_FORCE_PRECODING_OFF))
+		return false;
+
+	switch (link->blattr.precoding) {
+	case SBL_PRECODING_ON:
+		return true;
+	case SBL_PRECODING_OFF:
+		return false;
+	case SBL_PRECODING_DEFAULT:
+		return (link->blattr.options & SBL_OPT_FABRIC_LINK) ? true : false;
+	default:
+		sbl_dev_err(sbl->dev, "%d: invalid precoding (%d) - switching off",
+			    port_num, link->blattr.precoding);
+		/* switch off anyway */
+		return false;
+	}
+}
+
+/* Dummy function used when DEV_TRACE2 or DEV_TRACE3 are not defined */
+void dev_ignore(struct device *dev, const char *format, ...)
+{
+
+}
+
+/* Creates a u64 hash key based on the currently requested serdes state */
+/* NOTE: enums need to be bitwise values to use this hashing */
+static u64 sbl_get_tp_hash0(struct sbl_inst *sbl, int port_num)
+{
+	int media;
+
+	switch (sbl->link[port_num].mattr.media) {
+	case SBL_LINK_MEDIA_ELECTRICAL:
+		if (sbl->link[port_num].mattr.info & SBL_MEDIA_INFO_DIGITAL)
+			media = SBL_EXT_LINK_MEDIA_ELECTRICAL_ACT;
+		else
+			media = SBL_EXT_LINK_MEDIA_ELECTRICAL;
+
+		break;
+
+	case SBL_LINK_MEDIA_OPTICAL:
+		if (sbl->link[port_num].mattr.info & SBL_MEDIA_INFO_DIGITAL)
+			media = SBL_EXT_LINK_MEDIA_OPTICAL_DIGITAL;
+		else
+			media = SBL_EXT_LINK_MEDIA_OPTICAL_ANALOG;
+
+		break;
+
+	default:
+		media = SBL_EXT_LINK_MEDIA_ELECTRICAL;
+		break;
+	}
+
+	return sbl_create_tp_hash0(sbl->link[port_num].blattr.link_partner,
+			sbl->link[port_num].loopback_mode,
+			sbl->link[port_num].blattr.tuning_pattern,
+			sbl->link[port_num].link_mode,
+			media,
+			sbl->link[port_num].mattr.vendor);
+}
+
+static u64 sbl_get_tp_hash1(struct sbl_inst *sbl, int port_num)
+{
+	return sbl_create_tp_hash1(sbl->link[port_num].mattr.len);
+}
+
+void sbl_serdes_get_fw_vers(struct sbl_inst *sbl, int port_num, int serdes,
+			    uint *fw_rev, uint *fw_build)
+{
+	if (sbl_serdes_spico_int(sbl, port_num, serdes, SPICO_INT_CM4_REV_ID,
+				 SPICO_INT_DATA_NONE, (uint16_t *)fw_rev,
+				SPICO_INT_RETURN_RESULT)) {
+		/* Failure expected when Spico is in reset */
+		dev_dbg(sbl->dev, "p%ds%d: Failed to read firmware rev!", port_num, serdes);
+		*fw_rev = 0x0;
+	}
+	if (sbl_serdes_spico_int(sbl, port_num, serdes, SPICO_INT_CM4_BUILD_ID,
+				 SPICO_INT_DATA_NONE, (uint16_t *)fw_build,
+				SPICO_INT_RETURN_RESULT)) {
+		/* Failure expected when Spico is in reset */
+		dev_dbg(sbl->dev, "p%ds%d: Failed to read firmware build!", port_num, serdes);
+		*fw_build = 0x0;
+	}
+}
+
+/* Get mask of serdes used for target link mode */
+static u8 get_serdes_tx_mask(struct sbl_inst *sbl, int port_num)
+{
+	int serdes;
+	u8 serdes_mask = 0;
+
+	switch (sbl->link[port_num].link_mode) {
+	case SBL_LINK_MODE_CD_50G:
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (sbl->switch_info->ports[port_num].serdes[serdes].tx_lane_source == 0) {
+				serdes_mask |= 1 << serdes;
+				break;
+			}
+		}
+		break;
+	case SBL_LINK_MODE_CD_100G:
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if ((sbl->switch_info->ports[port_num].serdes[serdes].tx_lane_source == 0) ||
+			    (sbl->switch_info->ports[port_num].serdes[serdes].tx_lane_source == 1)) {
+				serdes_mask |= 1 << serdes;
+			}
+		}
+		break;
+	case SBL_LINK_MODE_BS_200G:
+	case SBL_LINK_MODE_BJ_100G:
+		serdes_mask = 0xf;
+		break;
+	default:
+		sbl_dev_warn(sbl->dev, "%d: Unsupported link mode (%d)",
+			     port_num, sbl->link[port_num].link_mode);
+		serdes_mask = 0x0;
+		break;
+	}
+
+	return serdes_mask;
+}
+
+/* Get mask of serdes used for target link mode */
+static u8 get_serdes_rx_mask(struct sbl_inst *sbl, int port_num)
+{
+	int serdes;
+	u8 serdes_mask = 0;
+
+	/* if we are looped back then rx serdes are the same as the tx ones */
+	if (sbl->link[port_num].loopback_mode == SBL_LOOPBACK_MODE_LOCAL)
+		return get_serdes_tx_mask(sbl, port_num);
+
+	/* otherwise look them up */
+	switch (sbl->link[port_num].link_mode) {
+	case SBL_LINK_MODE_CD_50G:
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (sbl->switch_info->ports[port_num].serdes[serdes].rx_lane_source == 0) {
+				serdes_mask |= 1 << serdes;
+				break;
+			}
+		}
+		break;
+	case SBL_LINK_MODE_CD_100G:
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if ((sbl->switch_info->ports[port_num].serdes[serdes].rx_lane_source == 0) ||
+			    (sbl->switch_info->ports[port_num].serdes[serdes].rx_lane_source == 1)) {
+				serdes_mask |= 1 << serdes;
+			}
+		}
+		break;
+	case SBL_LINK_MODE_BS_200G:
+	case SBL_LINK_MODE_BJ_100G:
+		serdes_mask = 0xf;
+		break;
+	default:
+		sbl_dev_warn(sbl->dev, "%d: Unsupported link mode (%d)",
+			     port_num, sbl->link[port_num].link_mode);
+		serdes_mask = 0x0;
+		break;
+	}
+
+	return serdes_mask;
+}
+
+/* Utility function to skip over irrelevant serdes lanes */
+static bool tx_serdes_required_for_link_mode(struct sbl_inst *sbl, int port_num,
+					     int serdes)
+{
+	u8 serdes_mask = get_serdes_tx_mask(sbl, port_num);
+
+	/* Enable physical lane 0 - this has the clock for all serdes and is
+	   always required. */
+	if ((serdes == 0) || (serdes_mask & (1 << serdes)))
+		return true;
+	else
+		return false;
+}
+
+/* Utility function to skip over irrelevant serdes lanes */
+static bool rx_serdes_required_for_link_mode(struct sbl_inst *sbl, int port_num,
+					     int serdes)
+{
+	u8 serdes_mask = get_serdes_rx_mask(sbl, port_num);
+
+	if (serdes_mask & (1 << serdes))
+		return true;
+	else
+		return false;
+}
+
+/* Returns a count of the number of bits set in input val */
+static int sbl_num_bits_set(u64 val)
+{
+	int bits_set = 0;
+	int i;
+
+	for (i = 0; i < 64; ++i) {
+		if (val & (1ULL << i))
+			bits_set++;
+	}
+	return bits_set;
+}
+
+/* Looks up sbl_sc_val struct for the given port, serdes, and hash */
+static int sbl_get_serdes_config_values(struct sbl_inst *sbl, int port_num,
+					int serdes, struct sbl_sc_values *vals)
+{
+	u64 hash0 = sbl_get_tp_hash0(sbl, port_num);
+	u64 hash1 = sbl_get_tp_hash1(sbl, port_num);
+	struct sbl_serdes_config *sc;
+	int num_ports_bits, num_serdes_bits, num_mask_bits;
+	int least_port_bits = 64;
+	int least_serdes_bits = 64;
+	int most_mask_bits = 0;
+	bool curr_best;
+	int rc = -1;
+
+	spin_lock(&sbl->serdes_config_lock);
+
+	list_for_each_entry(sc, &sbl->serdes_config_list, list) {
+
+		if ((sc->port_mask & (1ULL << port_num)) &&
+		    (sc->serdes_mask & (1ULL << serdes)) &&
+		    /* Ensure no bits are set in hash that are not set
+		       in tp_state_match for all bits included in the mask */
+		    (((sc->tp_state_mask0 & hash0) &
+		      ~(sc->tp_state_mask0 & sc->tp_state_match0)) == 0) &&
+		    (((sc->tp_state_mask1 & hash1) &
+		      ~(sc->tp_state_mask1 & sc->tp_state_match1)) == 0)) {
+			/* This is A match, but there may be >1. We want to
+			   choose the match that's most specific to this
+			   config. To determine this, we choose a match which:
+			   * [1] Has the least number of bits set in its
+			   port_mask
+			   * [2] If tie, has the least number of bits set in
+			    its serdes_mask
+			   * [3] If tie, has the most number bits set it its
+			    tp_state_mask0 and tp_state_mask1.
+			   * [4] If tie, pick the one with the lowest index */
+			sbl_dev_dbg(sbl->dev,
+				    "p%d: get values: hash0 0x%llx hash1 0x%llx matched 0x%llx 0x%llx, tag %d\n",
+				port_num, hash0, hash1, sc->tp_state_match0, sc->tp_state_match1, sc->tag);
+			curr_best = false;
+			num_ports_bits	= sbl_num_bits_set(sc->port_mask);
+			num_serdes_bits = sbl_num_bits_set(sc->serdes_mask);
+			num_mask_bits	= sbl_num_bits_set(sc->tp_state_mask0);
+			num_mask_bits  += sbl_num_bits_set(sc->tp_state_mask1);
+			if (num_ports_bits < least_port_bits) {
+				/* [1] */
+				curr_best = true;
+			} else if (num_ports_bits == least_port_bits) {
+				if (num_serdes_bits < least_serdes_bits) {
+					/* [2] */
+					curr_best = true;
+				} else if (num_serdes_bits == least_serdes_bits) {
+					if (num_mask_bits > most_mask_bits) {
+						/* [3] */
+						curr_best = true;
+					}
+				}
+			}
+
+			if (curr_best) {
+				sbl_dev_dbg(sbl->dev, "p%d: tag %d is current best match\n", port_num, sc->tag);
+				*vals = sc->vals;
+				least_port_bits = num_ports_bits;
+				least_serdes_bits = num_serdes_bits;
+				most_mask_bits = num_mask_bits;
+				rc = 0;
+			}
+		}
+	}
+	spin_unlock(&sbl->serdes_config_lock);
+
+	if (rc == 0)
+		return 0;
+
+	sbl_dev_err(sbl->dev, "%d: get values: no match for hash0 0x%llx hash1 0x%llx\n",
+		    port_num, hash0, hash1);
+	return -ENOENT;
+}
+
+/* Checks if there are valid tuning params in the sbl struct which can
+ * be used for this serdes tune
+ */
+static bool sbl_is_retune(struct sbl_inst *sbl, int port_num)
+{
+	int serdes, i;
+	u64 tp_state_hash0, tp_state_hash1;
+	struct sbl_link *link = sbl->link + port_num;
+
+	DEV_TRACE2(sbl->dev, "p%d", port_num);
+
+	/* Reuse of cached tuning params are disabled until AOC sync is implemented */
+	if (link->mattr.media == SBL_LINK_MEDIA_OPTICAL)
+		return false;
+
+	/* Check tuning params are for this target configuration */
+	tp_state_hash0 = sbl_get_tp_hash0(sbl, port_num);
+	tp_state_hash1 = sbl_get_tp_hash1(sbl, port_num);
+	if ((sbl->link[port_num].tuning_params.tp_state_hash0 != tp_state_hash0) ||
+	    (sbl->link[port_num].tuning_params.tp_state_hash1 != tp_state_hash1)) {
+		sbl_dev_dbg(sbl->dev,
+			    "p%d: tuning param mismatch (saved: 0x%llx 0x%llx curr:0x%llx 0x%llx) - not retune\n",
+			port_num, sbl->link[port_num].tuning_params.tp_state_hash0,
+			sbl->link[port_num].tuning_params.tp_state_hash1, tp_state_hash0, tp_state_hash1);
+		return false;
+	}
+
+	/* Check that we actually have tuning params to apply */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		for (i = 0; i < NUM_CTLE_PARAMS; ++i) {
+			if (sbl->link[port_num].tuning_params.params[serdes].ctle[i]) {
+				sbl_dev_dbg(sbl->dev, "p%d: tuning params OK - retune\n", port_num);
+				return true;
+			}
+		}
+		for (i = 0; i < NUM_FFE_PARAMS; ++i) {
+			if (sbl->link[port_num].tuning_params.params[serdes].ffe[i]) {
+				sbl_dev_dbg(sbl->dev, "p%d: tuning params OK - retune\n", port_num);
+				return true;
+			}
+		}
+		for (i = 0; i < NUM_DFE_PARAMS; ++i) {
+			if (sbl->link[port_num].tuning_params.params[serdes].dfe[i]) {
+				sbl_dev_dbg(sbl->dev, "p%d: tuning params OK - retune\n", port_num);
+				return true;
+			}
+		}
+		/* Could continue on to check vernier, etc., but if all the above are 0,
+		    we've got other problems. */
+	}
+
+	sbl_dev_warn(sbl->dev, "p%d: Saved tuning parameters but all 0-forcing retune", port_num);
+
+	return false;
+}
+
+/* Parse the vers string into rev and build */
+static int sbl_parse_version_string(struct sbl_inst *sbl, const char *fw_fname,
+				    int *fw_rev, int *fw_build)
+{
+	char  rev_str[SBL_MAX_STR_LEN];
+	char  build_str[SBL_MAX_STR_LEN];
+	char  *p;
+	int err;
+
+	p = strstr(fw_fname, ".");
+	if (p == NULL) {
+		sbl_dev_err(sbl->dev, "Bad firmware file name: %s", fw_fname);
+		return -EINVAL;
+	}
+
+	if (strlen(p) < strlen(".0x0000_0000")) {
+		sbl_dev_err(sbl->dev, "Bad firmware file name: %s", fw_fname);
+		return -EINVAL;
+	}
+
+	memcpy(rev_str, &(p[3]), SBL_FW_REV_LEN);
+	rev_str[SBL_FW_REV_LEN] = '\n';
+	rev_str[SBL_FW_REV_LEN + 1] = '\0';
+	memcpy(build_str, &(p[8]), SBL_FW_BUILD_LEN);
+	build_str[SBL_FW_BUILD_LEN] = '\n';
+	build_str[SBL_FW_BUILD_LEN + 1] = '\0';
+
+	err = kstrtou32(rev_str, 16, fw_rev);
+	if (err) {
+		sbl_dev_err(sbl->dev, "Failed to convert %s to an integer [%d]", rev_str, err);
+		return err;
+	}
+
+	err = kstrtou32(build_str, 16, fw_build);
+	if (err) {
+		sbl_dev_err(sbl->dev, "Failed to convert %s to an integer [%d]", build_str, err);
+		return err;
+	}
+	return 0;
+}
+
+void sbl_sbm_get_fw_vers(struct sbl_inst *sbl, int sbus_ring, uint *fw_rev, uint *fw_build)
+{
+	uint sbus_addr = SBUS_ADDR(sbus_ring, SBUS_BCAST_SBM_SPICO);
+
+	/* SBUS Critical Section */
+	mutex_lock(&sbl->sbus_ring_mtx[sbus_ring]);
+
+	if (sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_REV_ID,
+			      SPICO_INT_DATA_NONE, fw_rev)) {
+		/* Failure expected when Spico is in reset */
+		dev_dbg(sbl->dev, "sbm%d: Failed to read firmware rev from 0x%x", sbus_ring, sbus_addr);
+		*fw_rev = 0x0;
+	}
+	if (sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_BUILD_ID,
+			      SPICO_INT_DATA_NONE, fw_build)) {
+		/* Failure expected when Spico is in reset */
+		dev_dbg(sbl->dev, "sbm%d: Failed to read firmware build from 0x%x", sbus_ring, sbus_addr);
+		*fw_build = 0x0;
+	}
+	mutex_unlock(&sbl->sbus_ring_mtx[sbus_ring]);
+}
+
+int sbl_sbm_firmware_flash(struct sbl_inst *sbl)
+{
+	int err;
+
+	err = sbl_sbm_firmware_flash_ring(sbl, 0,
+					  sbl->switch_info->num_sbus_rings - 1, false);
+	if (err)
+		/* sending port 0 in event as this event doesn't apply to any specific port */
+		sbl_async_alert(sbl, 0, SBL_ASYNC_ALERT_SBM_FW_LOAD_FAILURE, NULL, 0);
+
+	return err;
+}
+
+int sbl_sbm_firmware_flash_ring(struct sbl_inst *sbl, int first_ring,
+				int last_ring, bool force)
+{
+	bool flash_needed, fw_requested = false;
+	int sbus_ring;
+	int err;
+	int fw_rev, fw_build;
+	const struct firmware *fw = NULL;
+
+	if ((last_ring < first_ring) || (first_ring < 0) ||
+	    (last_ring > sbl->switch_info->num_sbus_rings - 1)) {
+		sbl_dev_err(sbl->dev, "Invalid rings specified first:%d last:%d",
+			    first_ring, last_ring);
+		return -EINVAL;
+	}
+
+	err = sbl_parse_version_string(sbl, sbl->iattr.sbm_fw_fname,
+				       &fw_rev, &fw_build);
+	if (err) {
+		sbl_dev_err(sbl->dev, "Failed to parse version string %s [%d]",
+			    sbl->iattr.sbm_fw_fname, err);
+		return err;
+	}
+
+	/* Check SBus Master firmware versions */
+	for (sbus_ring = first_ring; sbus_ring <= last_ring; ++sbus_ring) {
+		flash_needed = false;
+		if (sbl_validate_sbm_fw_vers(sbl, sbus_ring, fw_rev,
+					     fw_build)) {
+			flash_needed = true;
+		}
+
+		if (flash_needed || force) {
+			if (!fw_requested) {
+				err = request_firmware(&fw, sbl->iattr.sbm_fw_fname,
+						       sbl->dev);
+				if (err) {
+					sbl_dev_err(sbl->dev, "firmware request failed [%d]", err);
+					return err;
+				}
+				sbl_dev_dbg(sbl->dev, "loaded fw (size %zd)", fw->size);
+				fw_requested = true;
+			}
+			sbl_dev_dbg(sbl->dev, "ring %d sbus_master firmware out of date! Flashing...", sbus_ring);
+
+			err = sbl_sbm_firm_upload(sbl, sbus_ring, fw->size, fw->data);
+			if (err) {
+				sbl_dev_err(sbl->dev, "Failed to upload ring %d firmware!", sbus_ring);
+				goto out_release;
+			} else {
+				sbl_dev_info(sbl->dev, "Ring %d Sbus Master firmware flashed successfully.", sbus_ring);
+			}
+		}
+	}
+
+ out_release:
+	release_firmware(fw);
+
+	return err;
+}
+
+static void sbl_serdes_firmware_validation(struct sbl_inst *sbl, const struct firmware *fw,
+					   u32 sbus_addr, u32 result, u32 sbus_ring)
+{
+	int rc, i;
+	u8 data;
+	bool corruption_found = false;
+
+	for (i = 0; i < fw->size; ++i) {
+		if (i % 2 == 0) {
+			rc = sbl_sbus_wr(sbl, sbus_addr,
+					SPICO_SBR_ADDR_IMEM, i / 2);
+			if (rc)
+				break;
+			rc = sbl_sbus_rd(sbl, sbus_addr,
+					 SPICO_SBR_ADDR_RDATA,
+					&result);
+			if (rc)
+				break;
+			data = (result & 0xff00) >> 8;
+		} else {
+			data = result & 0xff;
+		}
+		if (data != fw->data[i]) {
+			corruption_found = true;
+			sbl_dev_warn(sbl->dev, "0x%x: Act 0x%4.4x Exp 0x%4.4x", i, data, fw->data[i]);
+		}
+	}
+	rc = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_CTL,
+			 SPICO_SBR_DATA_IMEM_CNTL_DIS);
+	if (rc)
+		sbl_dev_err(sbl->dev, "SBM Imem rd disable failed [%d]", rc);
+	if (corruption_found)
+		sbl_dev_err(sbl->dev, "r%d: SBM FW corruption found", sbus_ring);
+	else
+		sbl_dev_info(sbl->dev, "r%d: No SBM FW corruption found", sbus_ring);
+}
+
+int sbl_serdes_firmware_flash_safe(struct sbl_inst *sbl, int port_num,
+				   bool force)
+{
+	int rc;
+	u32 sbus_addr, crc_result, sbus_ring;
+	u32 curr_fw_rev = 0, curr_fw_build = 0;
+	u32 result;
+	const struct firmware *fw = NULL;
+	int fw_rev, fw_build;
+	int serdes = 0;
+
+	if (!sbl->is_hw)
+		return 0;
+
+	if (port_num == SBL_ALL_PORTS)
+		return -ENOTSUPP;
+
+	sbus_ring = sbl->switch_info->ports[port_num].serdes[serdes].sbus_ring;
+
+	/* First, try the FW flash */
+	rc = sbl_serdes_firmware_flash(sbl, port_num, force);
+	if (rc)
+		goto sbm_fw_reload;
+
+	/* Now, validate the SerDes FW - this also validates
+	 * SPICO interrupts are working correctly.
+	 */
+	rc = sbl_parse_version_string(sbl, sbl->iattr.serdes_fw_fname,
+				      &fw_rev, &fw_build);
+	if (rc) {
+		sbl_dev_err(sbl->dev,
+			    "Failed to parse version string %s [%d]",
+			sbl->iattr.sbm_fw_fname, rc);
+		return rc;
+	}
+	rc = sbl_validate_serdes_fw_vers(sbl, port_num, serdes, fw_rev, fw_build);
+	if (rc)
+		goto sbm_fw_reload;
+
+	/* Finally, validate the SBM FW - this also validates
+	 * Sbus reads/writes are working correctly.
+	 */
+	rc = sbl_parse_version_string(sbl, sbl->iattr.sbm_fw_fname,
+				      &fw_rev, &fw_build);
+	if (rc) {
+		sbl_dev_err(sbl->dev,
+			    "Failed to parse version string %s [%d]",
+			sbl->iattr.sbm_fw_fname, rc);
+		return rc;
+	}
+	rc = sbl_validate_sbm_fw_vers(sbl, sbus_ring, fw_rev, fw_build);
+	if (rc)
+		goto sbm_fw_reload;
+
+	/* If all the above succeed, we're done unless we force SBM FW reload */
+	if (sbl_debug_option(sbl, port_num,
+			     SBL_DEBUG_FORCE_RELOAD_SBM_FW)) {
+		sbl_dev_info(sbl->dev, "p%d: SBus Master FW reload forced", port_num);
+		goto sbm_fw_reload;
+	}
+	return 0;
+
+ sbm_fw_reload:
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_RELOAD_SBM_FW)) {
+		sbl_dev_warn(sbl->dev, "p%d: SBus Master FW reload inhibited", port_num);
+		return rc;
+	}
+
+	/* We may trigger a sbus master FW reload from multiple ports at the
+	 * same time. Ensure we only actually reload the firmware once per
+	 * sbus ring
+	 */
+	sbl->reload_sbm_fw[sbus_ring] = true;
+	mutex_lock(SBM_FW_MTX(sbl, sbus_ring));
+	if (!sbl->reload_sbm_fw[sbus_ring]) {
+		sbl_dev_info(sbl->dev, "r%d: Sbus master FW reload no longer needed", sbus_ring);
+	} else {
+
+		if (mutex_is_locked(SBUS_RING_MTX(sbl, sbus_ring)))
+			sbl_dev_dbg(sbl->dev,
+				    "%s: Sbus contention detected, sbus_ring_mtx[%d] locked",
+				    __func__, sbus_ring);
+
+		/* SBUS Critical Section */
+		mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));
+
+		/* First, dump the SBM FW info for debug */
+		sbus_addr = SBUS_ADDR(sbus_ring, SBUS_BCAST_SBM_SPICO);
+		/* Version info: Rev.Build */
+		if (sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_REV_ID,
+				      SPICO_INT_DATA_NONE, &curr_fw_rev)) {
+			sbl_dev_warn(sbl->dev,
+				     "r%d: Failed to read firmware rev from 0x%x",
+				 sbus_ring, sbus_addr);
+		} else {
+			sbl_dev_info(sbl->dev, "r%d: firmware rev 0x%x", sbus_ring, curr_fw_rev);
+		}
+		if (sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_BUILD_ID,
+				      SPICO_INT_DATA_NONE, &curr_fw_build)) {
+			sbl_dev_warn(sbl->dev,
+				     "r%d: Failed to read firmware build from 0x%x",
+				 sbus_ring, sbus_addr);
+		} else {
+			sbl_dev_info(sbl->dev, "r%d: firmware build 0x%x",
+				     sbus_ring, curr_fw_build);
+		}
+		/* CRC */
+		rc = sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_DO_CRC,
+				       SPICO_INT_DATA_NONE, &crc_result);
+		if (rc) {
+			sbl_dev_err(sbl->dev,
+				    "p%d(0x%x): CRC check interrupt failed (%d)!",
+				port_num, sbus_addr, rc);
+		} else {
+			if (crc_result != SPICO_RESULT_SBR_CRC_PASS) {
+				sbl_dev_err(sbl->dev,
+					    "p%d(0x%x): CRC check fail (result: 0x%x exp: 0x%x)!",
+					port_num, sbus_addr, crc_result, SPICO_RESULT_SBR_CRC_PASS);
+			} else {
+				sbl_dev_info(sbl->dev,
+					     "p%d(0x%x): CRC check passed",
+					 port_num, sbus_addr);
+			}
+		}
+		/* FW Status */
+		rc = sbl_sbus_rd(sbl, sbus_addr, SPICO_INT_SBMS_FW_STS,
+				 &result);
+		if (rc) {
+			sbl_dev_err(sbl->dev,
+				    "p%d(0x%x): FW status read failed (%d)!",
+				port_num, sbus_addr, rc);
+		} else {
+			sbl_dev_info(sbl->dev, "p%d(0x%x): FW status: 0x%x",
+				     port_num, sbus_addr, result);
+		}
+
+		rc = request_firmware(&fw, sbl->iattr.sbm_fw_fname, sbl->dev);
+		if (rc != 0) {
+			sbl_dev_err(sbl->dev, "firmware request failed [%d]", rc);
+		} else {
+			sbl_dev_info(sbl->dev,
+				     "p%d(0x%x): Checking SBM FW for corruption...",
+				 port_num, sbus_addr);
+			rc = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_CTL,
+					 SPICO_SBR_DATA_IMEM_CNTL_EN_RD);
+			if (rc)
+				sbl_dev_err(sbl->dev, "SBM Imem rd enable failed [%d]", rc);
+			else
+				sbl_serdes_firmware_validation(sbl, fw, sbus_addr, result, sbus_ring);
+
+			release_firmware(fw);
+		}
+
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+
+		/* Now, try reloading the sbus master FW */
+		rc = sbl_sbm_firmware_flash_ring(sbl, sbus_ring, sbus_ring, true);
+		if (rc)
+			sbl_dev_err(sbl->dev, "r%d: SBM FW flash failed (%d)!", sbus_ring, rc);
+		else
+			sbl_dev_info(sbl->dev, "r%d: SBM FW flash succeeded", sbus_ring);
+
+		sbl->reload_sbm_fw[sbus_ring] = false;
+	}
+	mutex_unlock(SBM_FW_MTX(sbl, sbus_ring));
+
+	/* Finally, retry the SerDes FW reload */
+	rc = sbl_serdes_firmware_flash(sbl, port_num, true);
+	if (rc != 0)
+		sbl_dev_err(sbl->dev,
+			    "p%d: SerDes FW flash failed (%d) despite SBM reload!",
+			port_num, rc);
+	else
+		sbl_dev_info(sbl->dev, "p%d: SerDes FW flash succeeded", port_num);
+
+	/* Regardless of the success/failure of the initial flash and recovery
+	 * attempt, we return the status of the final serdes firmware flash,
+	 * which is the true metric of if this function was successful.
+	 */
+	return rc;
+}
+
+int sbl_serdes_firmware_flash(struct sbl_inst *sbl, int port_num, bool force)
+{
+	bool flash_needed;
+	int serdes = 0;
+	int sr, err = 0;
+	int fw_rev, fw_build;
+	int port = port_num;
+	int first_port, last_port;
+	const struct firmware *fw = NULL;
+
+	/* Lock sbm_fw_mtx to ensure we don't reload the sbus master FW
+	 * while reloading the SerDes FW
+	 */
+	if (port_num == SBL_ALL_PORTS) {
+		for (sr = 0; sr < sbl->switch_info->num_sbus_rings; ++sr)
+			mutex_lock(SBM_FW_MTX(sbl, sr));
+	} else {
+		sr = sbl->switch_info->ports[port_num].serdes[0].sbus_ring;
+		mutex_lock(SBM_FW_MTX(sbl, sr));
+	}
+
+	if (!force) {
+		err = sbl_parse_version_string(sbl, sbl->iattr.serdes_fw_fname,
+					       &fw_rev, &fw_build);
+		if (err) {
+			sbl_dev_err(sbl->dev,
+				    "Failed to parse version string %s [%d]",
+				sbl->iattr.serdes_fw_fname, err);
+			goto out;
+		}
+
+		/* Check SerDes firmware versions */
+		flash_needed = false;
+		if (port_num == SBL_ALL_PORTS) {
+			first_port = 0;
+			last_port = sbl->switch_info->num_ports - 1;
+		} else {
+			first_port = port_num;
+			last_port = port_num;
+		}
+		for (port = first_port; port <= last_port; ++port) {
+			for (serdes = 0; serdes < sbl->switch_info->num_serdes;
+			     ++serdes) {
+				if (sbl_validate_serdes_fw_vers(sbl, port,
+								serdes, fw_rev,
+								fw_build)) {
+					sbl_dev_info(sbl->dev, "port %d serdes: %d firmware out of date! Flash required",
+						     port, serdes);
+					flash_needed = true;
+					break;
+				}
+			}
+			if (flash_needed)
+				break;
+		}
+	} else {
+		flash_needed = true;
+	}
+
+	if (flash_needed) {
+		err = request_firmware(&fw, sbl->iattr.serdes_fw_fname, sbl->dev);
+		if (err) {
+			sbl_dev_err(sbl->dev, "firmware request failed [%d]",
+				    err);
+			goto out;
+		}
+
+		err = sbl_serdes_firm_upload(sbl, port_num, fw->size, fw->data);
+		if (err) {
+			sbl_dev_err(sbl->dev, "%d: serdes firmware upload failed [%d]", port_num, err);
+			if (port_num == SBL_ALL_PORTS)
+				sbl_send_serdes_fw_corruption_alert(sbl, 0, 0);
+			else
+				sbl_send_serdes_fw_corruption_alert(sbl, port, serdes);
+			goto out;
+		} else {
+			if (port_num == SBL_ALL_PORTS)
+				sbl_dev_dbg(sbl->dev, "All SerDes firmware flashed successfully.");
+			else
+				sbl_dev_dbg(sbl->dev, "p%d SerDes firmware flashed successfully.", port_num);
+		}
+	} else {
+		/* Serdes firmware reload skipped as the firmware validation succeeded */
+		for (port = first_port; port <= last_port; ++port)
+			sbl_link_counters_incr(sbl, port, serdes_fw_reload_skip);
+	}
+
+ out:
+	release_firmware(fw);
+
+	if (port_num == SBL_ALL_PORTS) {
+		for (sr = 0; sr < sbl->switch_info->num_sbus_rings; ++sr)
+			mutex_unlock(SBM_FW_MTX(sbl, sr));
+	} else {
+		mutex_unlock(SBM_FW_MTX(sbl, sr));
+	}
+	return err;
+}
+
+int sbl_validate_sbm_fw_vers(struct sbl_inst *sbl, u32 sbus_ring,
+			     int fw_rev, int fw_build)
+{
+	u32 curr_fw_rev = 0, curr_fw_build = 0;
+	u32 sbus_addr = SBUS_ADDR(sbus_ring, SBUS_BCAST_SBM_SPICO);
+
+	DEV_TRACE2(sbl->dev,
+		   "sbus_addr: 0x%x, desired rev: 0x%x, desired build: 0x%x",
+		   sbus_ring, fw_rev, fw_build);
+
+	/* SBUS Critical Section */
+	mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));
+
+	if (sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_REV_ID,
+			      SPICO_INT_DATA_NONE, &curr_fw_rev)) {
+		/* Failure expected when Spico is in reset */
+		sbl_dev_warn(sbl->dev, "r%d: Failed to read SBM firmware rev from 0x%x",
+			     sbus_ring, sbus_addr);
+	}
+	if (sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_BUILD_ID,
+			      SPICO_INT_DATA_NONE, &curr_fw_build)) {
+		/* Failure expected when Spico is in reset */
+		sbl_dev_warn(sbl->dev, "r%d: Failed to read SBM firmware build from 0x%x",
+			     sbus_ring, sbus_addr);
+	}
+
+	mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+
+	if (((int)curr_fw_rev == fw_rev) && ((int)curr_fw_build == fw_build)) {
+		sbl_dev_dbg(sbl->dev, "r%d: Found expected SBM rev: 0x%x_%x",
+			    sbus_ring, curr_fw_rev, curr_fw_build);
+		return 0;
+	}
+	sbl_dev_warn(sbl->dev,
+		     "r%d: Expected rev: 0x%x_%x Current SBM rev: 0x%x_%x",
+			sbus_ring, fw_rev, fw_build, curr_fw_rev, curr_fw_build);
+	return -1;
+}
+
+int sbl_validate_serdes_fw_crc(struct sbl_inst *sbl, int port, int serdes)
+{
+	u16 crc_result;
+	int err;
+
+	err = sbl_serdes_spico_int(sbl, port, serdes, SPICO_INT_CM4_CRC,
+				   SPICO_INT_DATA_NONE, &crc_result,
+					SPICO_INT_RETURN_RESULT);
+	if (err)
+		return err;
+
+	/* CRC failure can be injected for test purposes */
+	sbl_test_manipulate_serdes_fw_crc_result(&crc_result);
+
+	if (crc_result != SPICO_RESULT_SERDES_CRC_PASS) {
+		sbl_dev_dbg(sbl->dev,
+			    "p%ds%d: CRC check fail (result 0x%x, expected 0x%x)!",
+			port, serdes, crc_result, SPICO_RESULT_SERDES_CRC_PASS);
+		return -EBADE;
+	}
+
+	return 0;
+}
+
+int sbl_validate_serdes_fw_vers(struct sbl_inst *sbl, int port_num, int serdes,
+				int fw_rev, int fw_build)
+{
+	u16 curr_fw_rev = 0, curr_fw_build = 0;
+	int err;
+
+	DEV_TRACE2(sbl->dev, "p%ds%d: desired rev: 0x%x, desired build: 0x%x",
+		   port_num, serdes, fw_rev, fw_build);
+
+	if (!sbl->is_hw)
+		return 0;
+
+	if (sbl_serdes_spico_int(sbl, port_num, serdes, SPICO_INT_CM4_REV_ID,
+				 SPICO_INT_DATA_NONE, &curr_fw_rev,
+				 SPICO_INT_RETURN_RESULT)) {
+		/* Failure expected when Spico is in reset */
+		sbl_dev_dbg(sbl->dev, "p%ds%d: Failed to read firmware rev!",
+			    port_num, serdes);
+	}
+	if (sbl_serdes_spico_int(sbl, port_num, serdes, SPICO_INT_CM4_BUILD_ID,
+				 SPICO_INT_DATA_NONE, &curr_fw_build,
+				 SPICO_INT_RETURN_RESULT)) {
+		/* Failure expected when Spico is in reset */
+		sbl_dev_dbg(sbl->dev, "p%ds%d: Failed to read firmware build!",
+			    port_num, serdes);
+	}
+
+	err = sbl_validate_serdes_fw_crc(sbl, port_num, serdes);
+	if (err) {
+		sbl_dev_warn(sbl->dev, "p%ds%d: Failed CRC check",
+			     port_num, serdes);
+		return -1;
+	}
+
+	if (((int)curr_fw_rev == fw_rev) && ((int)curr_fw_build == fw_build)) {
+		sbl_dev_dbg(sbl->dev, "p%ds%d: Found expected rev: 0x%x_%x",
+			    port_num, serdes, curr_fw_rev, curr_fw_build);
+		return 0;
+	}
+	sbl_dev_warn(sbl->dev, "p%ds%d: Expected rev: 0x%x_%x Current rev: 0x%x_%x",
+		     port_num, serdes, fw_rev, fw_build,
+			curr_fw_rev, curr_fw_build);
+	return -1;
+}
+
+/* does the CRC check */
+int sbl_sbm_firm_upload(struct sbl_inst *sbl, int sbus_ring,
+			size_t fw_size, const u8 *fw_data)
+{
+	u32 sbus_addr, unused, crc_result;
+	int err;
+
+	if (!sbl->is_hw)
+		return 0;
+
+	/* SBUS Critical Section */
+	mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));
+
+	sbus_addr = SBUS_ADDR(sbus_ring, SBUS_BCAST_SBM_SPICO);
+
+	err = sbl_sbus_op_aux(sbl, sbus_addr, SPICO_SBR_ADDR_IP_IDCODE,
+			      SBUS_IFACE_DST_CORE | SBUS_CMD_RESET,
+				   SPICO_SBR_DATA_NONE, &unused);
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_CTL,
+			  SPICO_SBR_DATA_RESET_HIGH);
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_CTL,
+			  SPICO_SBR_DATA_RESET_LOW);
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_CTL,
+			  SPICO_SBR_DATA_IMEM_CNTL_EN);
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_IMEM,
+			  SPICO_SBR_DATA_NONE);
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_IMEM,
+			  SPICO_SBR_DATA_SET_BURST_WR);
+	if (err)
+		goto err_out;
+
+	err = sbl_spico_burst_upload(sbl, sbus_addr,
+				     SPICO_SBR_ADDR_IMEM_BURST_DATA,
+					  fw_size, fw_data);
+	if (err) {
+		sbl_dev_err(sbl->dev, "Upload failed!");
+		goto err_out;
+	}
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_IMEM,
+			  SPICO_SBR_DATA_SET_BURST_WR | fw_size);
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_IMEM,
+			  SPICO_SBR_DATA_SET_BURST_WR |
+			       (fw_size + 1));
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_IMEM,
+			  SPICO_SBR_DATA_SET_BURST_WR |
+			       (fw_size + 2));
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_IMEM,
+			  SPICO_SBR_DATA_SET_BURST_WR |
+			       (fw_size + 3));
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_CTL,
+			  SPICO_SBR_DATA_IMEM_CNTL_DIS);
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_ECC,
+			  SPICO_SBR_DATA_ECC_EN);
+	if (err)
+		goto err_out;
+
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_CTL,
+			  SPICO_SBR_DATA_SPICO_EN);
+	if (err)
+		goto err_out;
+
+	err = sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_DO_CRC,
+				SPICO_INT_DATA_NONE, &crc_result);
+	if (err)
+		goto err_out;
+
+	if (crc_result != SPICO_RESULT_SBR_CRC_PASS) {
+		sbl_dev_err(sbl->dev, "0x%x: CRC check fail (result 0x%x, expected 0x%x)!",
+			    sbus_addr, crc_result, SPICO_RESULT_SBR_CRC_PASS);
+		err = -EBADE;
+	}
+
+	/* Increment sbus master fw reload counter */
+	atomic_inc(&sbl->sbm_fw_reload_count[sbus_ring]);
+
+err_out:
+	mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+	return err;
+}
+
+int sbl_serdes_firm_upload(struct sbl_inst *sbl, int port_num, size_t fw_size,
+			   const u8 *fw_data)
+{
+	int serdes;
+	u32 sbus_addr;
+	u64 core_status_value;
+	int sbus_ring;
+	int err = -1;
+	int port, first_port, last_port, first_ring, last_ring;
+	int first_serdes, last_serdes;
+	unsigned long last_jiffy;
+
+	if (port_num == SBL_ALL_PORTS) {
+		sbl_dev_dbg(sbl->dev, "Loading SerDes firmware for all ports...");
+		first_port = 0;
+		last_port = sbl->switch_info->num_ports - 1;
+		first_serdes = 0; /* force to a single iteration */
+		last_serdes = 0;
+		first_ring = 0;
+		last_ring = sbl->switch_info->num_sbus_rings - 1;
+	} else {
+		sbl_dev_dbg(sbl->dev, "p%d: Loading SerDes firmware...", port_num);
+		first_port = port_num;
+		last_port = port_num;
+		first_serdes = 0;
+		last_serdes = sbl->switch_info->num_serdes - 1;
+		/* All serdes for a given port are always on the same ring, so
+		   just use serdes 0 to determine the ring. */
+		first_ring = sbl->switch_info->ports[port_num].serdes[0].sbus_ring;
+		last_ring = sbl->switch_info->ports[port_num].serdes[0].sbus_ring;
+	}
+	for (port = first_port; port <= last_port; ++port) {
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			err = sbl_serdes_soft_reset(sbl, port, serdes);
+			if (err)
+				return err;
+		}
+	}
+
+	/* Don't allow SPICO interrupts while we are reloading firmware */
+	for (port = first_port; port <= last_port; ++port)
+		mutex_lock(&sbl->link[port].serdes_mtx);
+
+	sbl_dev_dbg(sbl->dev, "p%d: Flashing SerDes firmware...", port_num);
+	for (sbus_ring = first_ring; sbus_ring <= last_ring; ++sbus_ring) {
+
+		/* SBUS Critical Section */
+		mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));
+
+		for (serdes = first_serdes; serdes <= last_serdes; ++serdes) {
+			if (port_num == SBL_ALL_PORTS)
+				sbus_addr = SBUS_ADDR(sbus_ring, SBUS_BCAST_CM4_SERDES_SPICO);
+			else
+				sbus_addr = SBUS_ADDR(sbl->switch_info->ports[port_num].serdes[serdes].sbus_ring,
+						      sbl->switch_info->ports[port_num].serdes[serdes].rx_addr);
+
+			err = sbl_sbus_wr(sbl, sbus_addr,
+					  SPICO_SERDES_ADDR_RESET_EN,
+				       SPICO_SERDES_DATA_SET_GLOBAL_RESET);
+			if (err)
+				break;
+
+			err = sbl_sbus_wr(sbl, sbus_addr,
+					  SPICO_SERDES_ADDR_RESET_EN,
+				       SPICO_SERDES_DATA_CLR_GLOBAL_RESET);
+			if (err)
+				break;
+
+			err = sbl_sbus_wr(sbl, sbus_addr,
+					  SPICO_SERDES_ADDR_INTR_DIS,
+				       SPICO_SERDES_DATA_SET_INTR_DIS);
+			if (err)
+				break;
+
+			err = sbl_sbus_wr(sbl, sbus_addr,
+					  SPICO_SERDES_ADDR_IMEM,
+				       SPICO_SERDES_DATA_SET_IMEM_CNTL_EN);
+			if (err)
+				break;
+
+			err = sbl_spico_burst_upload(sbl, sbus_addr,
+						     SPICO_SERDES_ADDR_IMEM_BURST,
+						  fw_size, fw_data);
+			if (err) {
+				sbl_dev_err(sbl->dev, "Upload failed!");
+				break;
+			}
+
+			err = sbl_sbus_wr(sbl, sbus_addr,
+					  SPICO_SERDES_ADDR_IMEM,
+				       SPICO_SERDES_DATA_CLR_IMEM_CNTL_EN);
+			if (err)
+				break;
+
+			err = sbl_sbus_wr(sbl, sbus_addr,
+					  SPICO_SERDES_ADDR_ECC,
+				       SPICO_SERDES_DATA_SET_ECC_EN);
+			if (err)
+				break;
+
+			err = sbl_sbus_wr(sbl, sbus_addr,
+					  SPICO_SERDES_ADDR_ECCLOG,
+				       SPICO_SERDES_DATA_CLR_ECC_ERR);
+			if (err)
+				break;
+
+			err = sbl_sbus_wr(sbl, sbus_addr,
+					  SPICO_SERDES_ADDR_RESET_EN,
+				       SPICO_SERDES_DATA_SET_SPICO_EN);
+			if (err)
+				break;
+
+			err = sbl_sbus_wr(sbl, sbus_addr,
+					  SPICO_SERDES_ADDR_INTR_DIS,
+				       SPICO_SERDES_DATA_SET_INTR_EN);
+			if (err)
+				break;
+		}
+
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+
+		if (err)
+			break;
+	}
+
+	for (port = first_port; port <= last_port; ++port)
+		mutex_unlock(&sbl->link[port].serdes_mtx);
+
+	/* If any errors occurred above, return now we've unlocked all mutexes. */
+	if (err)
+		return err;
+
+	/* Increment SerDes firmware reload counters */
+	if (port_num != SBL_ALL_PORTS)
+		for (serdes = first_serdes; serdes <= last_serdes; ++serdes)
+			sbl_link_counters_incr(sbl, port_num, serdes0_fw_reload + serdes);
+
+	if (!sbl->is_hw)
+		return 0;
+
+	sbl_dev_dbg(sbl->dev, "p%d: Validating flash..", port_num);
+	for (port = first_port; port <= last_port; ++port) {
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			sbus_addr =
+				SBUS_ADDR(sbl->switch_info->ports[port].serdes[serdes].sbus_ring,
+					  sbl->switch_info->ports[port].serdes[serdes].rx_addr);
+			last_jiffy = jiffies + msecs_to_jiffies(1000 *
+								 sbl->iattr.core_status_rd_timeout);
+			do {
+				core_status_value = sbl_read64(sbl, SBL_PML_BASE(port) |
+							       SBL_PML_SERDES_CORE_STATUS_OFFSET(serdes));
+				if (core_status_value &
+				    SERDES_CORE_STATUS_SPICO_READY_MASK) {
+					break;
+				}
+				msleep(sbl->iattr.core_status_rd_poll_interval);
+			} while (time_is_after_jiffies(last_jiffy));
+
+			if (!(core_status_value & (1 << 5))) {
+				sbl_dev_err(sbl->dev, "p%ds%d Timeout reading o_core_status (timeout:%ds)",
+					    port_num, serdes, sbl->iattr.core_status_rd_timeout);
+				return -ETIME;
+			}
+
+			err = sbl_validate_serdes_fw_crc(sbl, port, serdes);
+			if (err)
+				return err;
+
+		}
+	}
+	sbl_dev_dbg(sbl->dev, "p%d: FW upload complete!", port_num);
+
+	return 0;
+}
+
+static int sbl_get_serdes_tuning_params(struct sbl_inst *sbl, int port_num,
+					struct sbl_tuning_params *tps)
+{
+	int i, serdes, err;
+
+	if (!tps)
+		return -EINVAL;
+
+	tps->magic = SBL_TUNING_PARAM_MAGIC;
+	tps->version = SBL_TUNING_PARAM_VERSION;
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+
+		for (i = 0; i < NUM_CTLE_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_CTLE_BASE | i,
+					&tps->params[serdes].ctle[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: CTLE[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].ctle[i]);
+		}
+		for (i = 0; i < NUM_FFE_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_FFE_BASE | i,
+					&tps->params[serdes].ffe[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: FFE[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].ffe[i]);
+		}
+		for (i = 0; i < NUM_DFE_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_DFE_BASE | i,
+					&tps->params[serdes].dfe[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: DFE[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].dfe[i]);
+		}
+		for (i = 0; i < NUM_RXVS_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_RXVS_BASE |
+						(i + SPICO_INT_DATA_HAL_RXVS_OFFSET),
+					&tps->params[serdes].rxvs[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: RXVS[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].rxvs[i]);
+		}
+		for (i = 0; i < NUM_RXVC_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_RXVC_BASE | i,
+					&tps->params[serdes].rxvc[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: RXVC[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].rxvc[i]);
+		}
+		for (i = 0; i < NUM_RSDO_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_RSDO_BASE | i,
+					&tps->params[serdes].rsdo[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: RSDO[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].rsdo[i]);
+		}
+		for (i = 0; i < NUM_RSDC_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_RSDC_BASE | i,
+					&tps->params[serdes].rsdc[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: RSDC[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].rsdc[i]);
+		}
+		for (i = 0; i < NUM_RSTO_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_RSTO_BASE | i,
+					&tps->params[serdes].rsto[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: RSTO[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].rsto[i]);
+		}
+		for (i = 0; i < NUM_RSTC_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_RSTC_BASE | i,
+					&tps->params[serdes].rstc[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: RSTC[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].rstc[i]);
+		}
+		for (i = 0; i < NUM_EH_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_EH_BASE | i,
+					&tps->params[serdes].eh[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: EH[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].eh[i]);
+		}
+		for (i = 0; i < NUM_GTP_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_GTP_BASE | i,
+					&tps->params[serdes].gtp[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: GTP[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].gtp[i]);
+		}
+		for (i = 0; i < NUM_DCCD_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_DCCD_BASE | i,
+					&tps->params[serdes].dccd[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: DCCD[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].dccd[i]);
+		}
+		for (i = 0; i < NUM_P4LV_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_P4LV_BASE | i,
+					&tps->params[serdes].p4lv[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: P4LV[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].p4lv[i]);
+		}
+
+		if (sbl_validate_serdes_fw_vers(sbl, port_num, serdes,
+						SBL_KNOWN_FW0_REV,
+					SBL_KNOWN_FW0_BUILD)) {
+			return -EADDRNOTAVAIL;
+		}
+
+		for (i = 0; i < NUM_AFEC_PARAMS; ++i) {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_MEM_READ |
+						(SBUS_AFE_CTRL_KNOWN_FW0_BASE + i), 0x0,
+					&tps->params[serdes].afec[i],
+					SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: AFEC[%d]: %d",
+				    port_num, serdes, i,
+					tps->params[serdes].afec[i]);
+		}
+	}
+
+	return 0;
+}
+
+int sbl_check_serdes_tuning_params(struct sbl_inst *sbl, int port_num)
+{
+	int i, serdes, err;
+	struct sbl_tuning_params *tps;
+	int min, max;
+	int num_oob_params;
+	int max_oob_params = SBL_MAX_OOB_SERDES_PARAMS;
+
+	tps = kzalloc(sizeof(struct sbl_tuning_params), GFP_KERNEL);
+	if (!tps)
+		return -ENOMEM;
+
+	/* debug adjustment to number of oob tuning params allowed */
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_BAD_PARAM_1))
+		max_oob_params += 1;
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_BAD_PARAM_2))
+		max_oob_params += 2;
+
+	err = sbl_get_serdes_tuning_params(sbl, port_num, tps);
+	if (err) {
+		kfree(tps);
+		return err;
+	}
+
+	if (!sbl->is_hw) {
+		kfree(tps);
+		return 0;
+	}
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+
+		num_oob_params = 0;
+		for (i = 0; i < NUM_CTLE_PARAMS; ++i) {
+			switch (i) {
+			case CTLE_HF_OFFSET:
+				min = SBL_CTLE_HF_MIN;
+				max = SBL_CTLE_HF_MAX;
+				break;
+			case CTLE_LF_OFFSET:
+				min = SBL_CTLE_LF_MIN;
+				max = SBL_CTLE_LF_MAX;
+				break;
+			case CTLE_DC_OFFSET:
+				min = SBL_CTLE_DC_MIN;
+				max = SBL_CTLE_DC_MAX;
+				break;
+			case CTLE_BW_OFFSET:
+				min = SBL_CTLE_BW_MIN;
+				max = SBL_CTLE_BW_MAX;
+				break;
+			case CTLE_GS1_OFFSET:
+				min = SBL_CTLE_GS1_MIN;
+				max = SBL_CTLE_GS1_MAX;
+				break;
+			case CTLE_GS2_OFFSET:
+				min = SBL_CTLE_GS2_MIN;
+				max = SBL_CTLE_GS2_MAX;
+				break;
+			case CTLE_SCE_OFFSET:
+				min = SBL_CTLE_SCE_MIN;
+				max = SBL_CTLE_SCE_MAX;
+				break;
+			case CTLE_HF_MIN_OFFSET:
+				min = SBL_CTLE_HF_MIN_MIN;
+				max = SBL_CTLE_HF_MIN_MAX;
+				break;
+			case CTLE_HF_MAX_OFFSET:
+				min = SBL_CTLE_HF_MAX_MIN;
+				max = SBL_CTLE_HF_MAX_MAX;
+				break;
+			case CTLE_LF_MIN_OFFSET:
+				min = SBL_CTLE_LF_MIN_MIN;
+				max = SBL_CTLE_LF_MIN_MAX;
+				break;
+			case CTLE_LF_MAX_OFFSET:
+				min = SBL_CTLE_LF_MAX_MIN;
+				max = SBL_CTLE_LF_MAX_MAX;
+				break;
+			default:
+				continue;
+			}
+			if ((tps->params[serdes].ctle[i] < min) ||
+			    (tps->params[serdes].ctle[i] > max)) {
+				sbl_dev_warn(sbl->dev, "p%ds%d: CTLE[%d] value(%d) out of bounds(%d:%d)!",
+					     port_num, serdes, i,
+					 tps->params[serdes].ctle[i], min, max);
+				num_oob_params++;
+			} else {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: CTLE[%d] value(%d) within bounds(%d:%d)",
+					    port_num, serdes, i,
+					 tps->params[serdes].ctle[i], min, max);
+			}
+		}
+
+		for (i = 0; i < NUM_FFE_PARAMS; ++i) {
+			switch (i) {
+			case FFE_PRE2_OFFSET:
+				min = SBL_FFE_PRE2_MIN;
+				max = SBL_FFE_PRE2_MAX;
+				break;
+			case FFE_PRE1_OFFSET:
+				min = SBL_FFE_PRE1_MIN;
+				max = SBL_FFE_PRE1_MAX;
+				break;
+			case FFE_POST1_OFFSET:
+				min = SBL_FFE_POST1_MIN;
+				max = SBL_FFE_POST1_MAX;
+				break;
+			case FFE_BFLF_OFFSET:
+				min = SBL_FFE_BFLF_MIN;
+				max = SBL_FFE_BFLF_MAX;
+				break;
+			case FFE_BFHF_OFFSET:
+				min = SBL_FFE_BFHF_MIN;
+				max = SBL_FFE_BFHF_MAX;
+				break;
+			case FFE_DATARATE_OFFSET:
+				min = SBL_FFE_DATARATE_MIN;
+				max = SBL_FFE_DATARATE_MAX;
+				break;
+			case FFE_SCE_OFFSET:
+				min = SBL_FFE_SCE_MIN;
+				max = SBL_FFE_SCE_MAX;
+				break;
+			case FFE_PRE1_MIN_OFFSET:
+				min = SBL_FFE_PRE1_MIN_MIN;
+				max = SBL_FFE_PRE1_MIN_MAX;
+				break;
+			case FFE_PRE1_MAX_OFFSET:
+				min = SBL_FFE_PRE1_MAX_MIN;
+				max = SBL_FFE_PRE1_MAX_MAX;
+				break;
+			case FFE_PRE2_MIN_OFFSET:
+				min = SBL_FFE_PRE2_MIN_MIN;
+				max = SBL_FFE_PRE2_MIN_MAX;
+				break;
+			case FFE_PRE2_MAX_OFFSET:
+				min = SBL_FFE_PRE2_MAX_MIN;
+				max = SBL_FFE_PRE2_MAX_MAX;
+				break;
+			case FFE_BFLF_ICAL_OFFSET:
+				min = SBL_FFE_BFLF_ICAL_MIN;
+				max = SBL_FFE_BFLF_ICAL_MAX;
+				break;
+			case FFE_POST1_MIN_OFFSET:
+				min = SBL_FFE_POST1_MIN_MIN;
+				max = SBL_FFE_POST1_MIN_MAX;
+				break;
+			case FFE_POST1_MAX_OFFSET:
+				min = SBL_FFE_POST1_MAX_MIN;
+				max = SBL_FFE_POST1_MAX_MAX;
+				break;
+			default:
+				continue;
+			}
+			if ((tps->params[serdes].ffe[i] < min) ||
+			    (tps->params[serdes].ffe[i] > max)) {
+				sbl_dev_warn(sbl->dev, "p%ds%d: FFE[%d] value(%d) out of bounds(%d:%d)!",
+					     port_num, serdes, i,
+					 tps->params[serdes].ffe[i], min, max);
+				num_oob_params++;
+			} else {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: FFE[%d] value(%d) within bounds(%d:%d)",
+					    port_num, serdes, i,
+					 tps->params[serdes].ffe[i], min, max);
+			}
+		}
+		for (i = 0; i < NUM_DFE_PARAMS; ++i) {
+			switch (i) {
+			case DFE_GT1_OFFSET:
+				min = SBL_DFE_GT1_MIN;
+				max = SBL_DFE_GT1_MAX;
+				break;
+			case DFE_GT2_OFFSET:
+				min = SBL_DFE_GT2_MIN;
+				max = SBL_DFE_GT2_MAX;
+				break;
+			case DFE_G2_OFFSET:
+				min = SBL_DFE_G2_MIN;
+				max = SBL_DFE_G2_MAX;
+				break;
+			case DFE_G3_OFFSET:
+				min = SBL_DFE_G3_MIN;
+				max = SBL_DFE_G3_MAX;
+				break;
+			case DFE_G4_OFFSET:
+				min = SBL_DFE_G4_MIN;
+				max = SBL_DFE_G4_MAX;
+				break;
+			case DFE_G5_OFFSET:
+				min = SBL_DFE_G5_MIN;
+				max = SBL_DFE_G5_MAX;
+				break;
+			case DFE_G6_OFFSET:
+				min = SBL_DFE_G6_MIN;
+				max = SBL_DFE_G6_MAX;
+				break;
+			case DFE_G7_OFFSET:
+				min = SBL_DFE_G7_MIN;
+				max = SBL_DFE_G7_MAX;
+				break;
+			case DFE_G8_OFFSET:
+				min = SBL_DFE_G8_MIN;
+				max = SBL_DFE_G8_MAX;
+				break;
+			case DFE_G9_OFFSET:
+				min = SBL_DFE_G9_MIN;
+				max = SBL_DFE_G9_MAX;
+				break;
+			case DFE_G10_OFFSET:
+				min = SBL_DFE_G10_MIN;
+				max = SBL_DFE_G10_MAX;
+				break;
+			case DFE_G11_OFFSET:
+				min = SBL_DFE_G11_MIN;
+				max = SBL_DFE_G11_MAX;
+				break;
+			case DFE_G12_OFFSET:
+				min = SBL_DFE_G12_MIN;
+				max = SBL_DFE_G12_MAX;
+				break;
+			case DFE_G13_OFFSET:
+				min = SBL_DFE_G13_MIN;
+				max = SBL_DFE_G13_MAX;
+				break;
+			default:
+				continue;
+			}
+			if ((tps->params[serdes].dfe[i] < min) ||
+			    (tps->params[serdes].dfe[i] > max)) {
+				sbl_dev_warn(sbl->dev, "p%ds%d: DFE[%d] value(%d) out of bounds(%d:%d)!",
+					     port_num, serdes, i,
+					 tps->params[serdes].dfe[i], min, max);
+				num_oob_params++;
+			} else {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: DFE[%d] value(%d) within bounds(%d:%d)",
+					    port_num, serdes, i,
+					 tps->params[serdes].dfe[i], min, max);
+			}
+		}
+
+		if (num_oob_params > max_oob_params) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Too many tuning params out of bounds(%d, max %d)!",
+				    port_num, serdes, num_oob_params, max_oob_params);
+			return -EDQUOT;
+		} else if (num_oob_params > 0) {
+			sbl_dev_info(sbl->dev, "p%ds%d: Some tuning params out of bounds(%d, max %d)",
+				     port_num, serdes, num_oob_params, max_oob_params);
+		}
+	}
+
+	kfree(tps);
+	return 0;
+}
+
+int sbl_save_serdes_tuning_params(struct sbl_inst *sbl, int port_num)
+{
+	int err;
+
+	sbl->link[port_num].tuning_params.tp_state_hash0 =
+		sbl_get_tp_hash0(sbl, port_num);
+	sbl->link[port_num].tuning_params.tp_state_hash1 =
+		sbl_get_tp_hash1(sbl, port_num);
+	sbl_dev_dbg(sbl->dev, "Updated hash0 to 0x%llx, hash1 to 0x%llx",
+		    sbl->link[port_num].tuning_params.tp_state_hash0,
+		sbl->link[port_num].tuning_params.tp_state_hash1);
+
+	err = sbl_get_serdes_tuning_params(sbl, port_num,
+					   &sbl->link[port_num].tuning_params);
+
+	return err;
+}
+
+int sbl_apply_serdes_tuning_params(struct sbl_inst *sbl, int port_num,
+				   int serdes)
+{
+	int i, err;
+	u16 result;
+
+	sbl_dev_dbg(sbl->dev, "p%ds%d: applying saved tuning params", port_num, serdes);
+
+	DEV_TRACE2(sbl->dev, "CTLE params");
+	for (i = 0; i < NUM_CTLE_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].ctle[i]);
+	}
+	DEV_TRACE2(sbl->dev, "RXFFE params");
+	for (i = 0; i < NUM_FFE_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].ffe[i]);
+	}
+	DEV_TRACE2(sbl->dev, "DFE params");
+	for (i = 0; i < NUM_DFE_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].dfe[i]);
+	}
+	DEV_TRACE2(sbl->dev, "RXVS params");
+	for (i = 0; i < NUM_RXVS_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].rxvs[i]);
+	}
+	DEV_TRACE2(sbl->dev, "RXVC params");
+	for (i = 0; i < NUM_RXVC_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].rxvc[i]);
+	}
+	DEV_TRACE2(sbl->dev, "RSDO params");
+	for (i = 0; i < NUM_RSDO_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].rsdo[i]);
+	}
+	DEV_TRACE2(sbl->dev, "RSDC params");
+	for (i = 0; i < NUM_RSDC_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].rsdc[i]);
+	}
+	DEV_TRACE2(sbl->dev, "RSTO params");
+	for (i = 0; i < NUM_RSTO_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].rsto[i]);
+	}
+	DEV_TRACE2(sbl->dev, "RSTC params");
+	for (i = 0; i < NUM_RSTC_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].rstc[i]);
+	}
+	DEV_TRACE2(sbl->dev, "EH params");
+	for (i = 0; i < NUM_EH_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].eh[i]);
+	}
+	DEV_TRACE2(sbl->dev, "GTP params");
+	for (i = 0; i < NUM_GTP_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].gtp[i]);
+	}
+	DEV_TRACE2(sbl->dev, "DCCD params");
+	for (i = 0; i < NUM_DCCD_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].dccd[i]);
+	}
+	DEV_TRACE2(sbl->dev, "P4LV params");
+	for (i = 0; i < NUM_P4LV_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].p4lv[i]);
+	}
+	DEV_TRACE2(sbl->dev, "AFEC params");
+	for (i = 0; i < NUM_AFEC_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "%d ",
+			   sbl->link[port_num].tuning_params.params[serdes].afec[i]);
+	}
+
+	for (i = 0; i < NUM_CTLE_PARAMS; ++i) {
+		/* GS1/GS2 are "config values" - don't apply them from saved
+		   "turning params", as this will override the desired config */
+		if (((SPICO_INT_DATA_HAL_CTLE_BASE | i) ==
+		     SPICO_INT_DATA_HAL_CTLE_GS1) ||
+		    ((SPICO_INT_DATA_HAL_CTLE_BASE | i) ==
+		     SPICO_INT_DATA_HAL_CTLE_GS2)) {
+			continue;
+		}
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_CTLE_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating CLTE param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].ctle[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].ctle[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating CTLE[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+	for (i = 0; i < NUM_FFE_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_FFE_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating FFE param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].ffe[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].ffe[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating FFE[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+	for (i = 0; i < NUM_DFE_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_DFE_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating DFE param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].dfe[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].dfe[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating DFE[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_RXVS_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_RXVS_BASE |
+							(i + SPICO_INT_DATA_HAL_RXVS_OFFSET),
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating RXVS param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].rxvs[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].rxvs[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating RXVS[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_RXVC_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_RXVC_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating RXVC param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].rxvc[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].rxvc[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating RXVC[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_RSDO_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_RSDO_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating RSDO param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].rsdo[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].rsdo[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating RSDO[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_RSDC_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_RSDC_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating RSDC param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].rsdc[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].rsdc[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating RSDC[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_RSTO_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_RSTO_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating RSTO param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].rsto[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].rsto[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating RSTO[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_RSTC_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_RSTC_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating RSTC param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].rstc[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].rstc[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating RSTC[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_EH_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_EH_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating EH param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].eh[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].eh[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating EH[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_GTP_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_GTP_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating GTP param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].gtp[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].gtp[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating GTP[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_DCCD_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_DCCD_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating DCCD param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].dccd[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].dccd[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating DCCD[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	for (i = 0; i < NUM_P4LV_PARAMS; ++i) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_HAL_P4LV_BASE | i,
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev, "Updating P4LV param %d from 0x%x to 0x%x",
+			   i, result, sbl->link[port_num].tuning_params.params[serdes].p4lv[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						sbl->link[port_num].tuning_params.params[serdes].p4lv[i],
+						&result, SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed updating P4LV[%d] tuning param!",
+				    port_num, serdes, i);
+			return -EBADE;
+		}
+	}
+
+	if (sbl_validate_serdes_fw_vers(sbl, port_num, serdes,
+					SBL_KNOWN_FW0_REV,
+									SBL_KNOWN_FW0_BUILD)) {
+		return -EADDRNOTAVAIL;
+	}
+	for (i = 0; i < NUM_AFEC_PARAMS; ++i) {
+		DEV_TRACE2(sbl->dev, "Updating AFEC param %d to 0x%x",
+			   i, sbl->link[port_num].tuning_params.params[serdes].afec[i]);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_MEM_WRITE |
+							(SBUS_AFE_CTRL_KNOWN_FW0_BASE + i),
+						sbl->link[port_num].tuning_params.params[serdes].afec[i],
+						&result, SPICO_INT_IGNORE_RESULT);
+		if (err)
+			return err;
+	}
+
+	/* Apply values */
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_CALL,
+					SPICO_INT_DATA_HAL_CTLE_APPLY, NULL,
+					SPICO_INT_IGNORE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_CALL,
+					SPICO_INT_DATA_HAL_FFE_APPLY, NULL,
+					SPICO_INT_IGNORE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_CALL,
+					SPICO_INT_DATA_HAL_DFE_APPLY, NULL,
+					SPICO_INT_IGNORE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_CALL,
+					SPICO_INT_DATA_HAL_RXV_APPLY, NULL,
+					SPICO_INT_IGNORE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_CALL,
+					SPICO_INT_DATA_HAL_DC_APPLY, NULL,
+					SPICO_INT_IGNORE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_CALL,
+					SPICO_INT_DATA_HAL_TC_APPLY, NULL,
+					SPICO_INT_IGNORE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_CALL,
+					SPICO_INT_DATA_HAL_PCAL_SETUP, NULL,
+					SPICO_INT_IGNORE_RESULT);
+	if (err)
+		return err;
+
+	DEV_TRACE2(sbl->dev, "rc: 0");
+
+	return 0;
+}
+
+int sbl_get_eye_heights(struct sbl_inst *sbl, int port_num, int serdes,
+			int *eye_heights)
+{
+	u16 result;
+	int err;
+
+	if (!eye_heights) {
+		sbl_dev_err(sbl->dev, "Bad args");
+		return -EINVAL;
+	}
+
+	DEV_TRACE2(sbl->dev, "p%ds%d", port_num, serdes);
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_GET_RX_EQ,
+					SPICO_INT_DATA_RXEQ_EH_THLE, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%ds%d: Failed to read setting!", port_num, serdes);
+		return err;
+	}
+	eye_heights[0] = result;
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_GET_RX_EQ,
+					SPICO_INT_DATA_RXEQ_EH_THME, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%ds%d: Failed to read setting!", port_num, serdes);
+		return err;
+	}
+	eye_heights[1] = result;
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_GET_RX_EQ,
+					SPICO_INT_DATA_RXEQ_EH_THUE, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%ds%d: Failed to read setting!", port_num, serdes);
+		return err;
+	}
+	eye_heights[2] = result;
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_GET_RX_EQ,
+					SPICO_INT_DATA_RXEQ_EH_THLO, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%ds%d: Failed to read setting!", port_num, serdes);
+		return err;
+	}
+	eye_heights[3] = result;
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_GET_RX_EQ,
+					SPICO_INT_DATA_RXEQ_EH_THMO, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%ds%d: Failed to read setting!", port_num, serdes);
+		return err;
+	}
+	eye_heights[4] = result;
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_GET_RX_EQ,
+					SPICO_INT_DATA_RXEQ_EH_THUO, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%ds%d: Failed to read setting!", port_num, serdes);
+		return err;
+	}
+	eye_heights[5] = result;
+
+	DEV_TRACE2(sbl->dev, "rc: 0");
+
+	return 0;
+}
+
+int sbl_serdes_soft_reset(struct sbl_inst *sbl, int port_num, int serdes)
+{
+	u32 unused;
+	int err;
+	u32 sbus_ring = sbl->switch_info->ports[port_num].serdes[serdes].sbus_ring;
+	u32 sbus_addr =
+		SBUS_ADDR(sbus_ring,
+			  sbl->switch_info->ports[port_num].serdes[serdes].rx_addr);
+
+	DEV_TRACE2(sbl->dev, "p%ds%d", port_num, serdes);
+
+	/* Don't allow SPICO interrupts while we are resetting the SerDes */
+	mutex_lock(&sbl->link[port_num].serdes_mtx);
+	/* SBUS Critical Section */
+	mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));
+
+	/* Reset high */
+	err = sbl_sbus_op_aux(sbl, sbus_addr, SPICO_SERDES_ADDR_IMEM,
+			      SBUS_IFACE_DST_CORE | SBUS_CMD_RESET,
+				   SPICO_SERDES_DATA_RESET, &unused);
+	if (err) {
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+		mutex_unlock(&sbl->link[port_num].serdes_mtx);
+		return err;
+	}
+
+	/* Reset low */
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SERDES_ADDR_RESET_EN,
+			  SPICO_SERDES_DATA_CLR_GLOBAL_RESET);
+	if (err) {
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+		mutex_unlock(&sbl->link[port_num].serdes_mtx);
+		return err;
+	}
+
+	/* Enable ECC */
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SERDES_ADDR_ECC,
+			  SPICO_SERDES_DATA_SET_ECC_EN);
+	if (err) {
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+		mutex_unlock(&sbl->link[port_num].serdes_mtx);
+		return err;
+	}
+
+	/* Clear any ECC errors that occurred previously */
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SERDES_ADDR_ECCLOG,
+			  SPICO_SERDES_DATA_CLR_ECC_ERR);
+	if (err) {
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+		mutex_unlock(&sbl->link[port_num].serdes_mtx);
+		return err;
+	}
+
+	/* Enable SPICO */
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SERDES_ADDR_RESET_EN,
+			  SPICO_SERDES_DATA_SET_SPICO_EN);
+	if (err) {
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+		mutex_unlock(&sbl->link[port_num].serdes_mtx);
+		return err;
+	}
+
+	/* Enable interrupts */
+	err = sbl_sbus_wr(sbl, sbus_addr, SPICO_SERDES_ADDR_INTR_DIS,
+			  SPICO_SERDES_DATA_SET_INTR_EN);
+	if (err) {
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+		mutex_unlock(&sbl->link[port_num].serdes_mtx);
+		return err;
+	}
+
+	mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+	mutex_unlock(&sbl->link[port_num].serdes_mtx);
+
+	DEV_TRACE2(sbl->dev, "rc: 0");
+
+	sbl->link[port_num].pcal_running = false;
+	return 0;
+}
+
+int sbl_serdes_init(struct sbl_inst *sbl, int port_num, int serdes,
+		    int encoding, int divisor, int width)
+{
+	int err;
+	bool tx_en, rx_en;
+
+	DEV_TRACE2(sbl->dev, "p%ds%d: encoding: %d divisor: %d width: %d",
+		   port_num, serdes, encoding, divisor, width);
+
+	err = sbl_set_tx_rx_enable(sbl, port_num, serdes, false, false,
+				   false);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_PLL_RECAL,
+					SPICO_INT_DATA_NONE, NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_TX_PHASE_CAL,
+					SPICO_INT_DATA_NONE, NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_TX_BAUD,
+					(divisor & SPICO_INT_DIVIDER_MASK) |
+					SPICO_INT_DATA_TXTX_RC_NOT_SS,
+					NULL, SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_WIDTH_MODE,
+					encoding | width |
+					SPICO_INT_DATA_TXRX_FC_IGNORE, NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	/* tx/rx based on link mode, and always configuing physical lane 0 */
+	if (tx_serdes_required_for_link_mode(sbl, port_num, serdes))
+		tx_en = true;
+	else
+		tx_en = false;
+
+	if (rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+		rx_en = true;
+	else
+		rx_en = false;
+
+	err = sbl_set_tx_rx_enable(sbl, port_num, serdes, tx_en, rx_en,
+				   false);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_PCIE_SLICES,
+					SPICO_INT_DATA_TX_OVERRIDE, NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_PCIE_SLICES,
+					SPICO_INT_DATA_RX_EID_EN, NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	/* Reset signal_ok */
+	sbl_serdes_mem_rmw(sbl, port_num, serdes, SERDES_MEM_ADDR_O_CORE_STATUS,
+			   0, SERDES_CORE_STATUS_RX_SIG_OK_MASK);
+
+	/* Set PRBS for loopback mode - will be changed later */
+	if (sbl->link[port_num].loopback_mode == SBL_LOOPBACK_MODE_LOCAL) {
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_PRBS_CTRL,
+						SPICO_INT_DATA_PRBS31_AS_TXGEN, NULL,
+						SPICO_INT_VALIDATE_RESULT);
+		if (err)
+			return err;
+
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_PRBS_CTRL,
+						SPICO_INT_DATA_PRBS31_AS_RXGEN, NULL,
+						SPICO_INT_VALIDATE_RESULT);
+		if (err)
+			return err;
+	}
+	DEV_TRACE2(sbl->dev, "rc: 0");
+
+	return 0;
+}
+
+int sbl_serdes_polarity_ctrl(struct sbl_inst *sbl, int port_num, int serdes,
+			     int encoding, bool an)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u32 datapath = 0;
+	int err;
+
+	DEV_TRACE2(sbl->dev, "p%ds%d: encoding:0x%x", port_num, serdes, encoding);
+
+	/* Set Polarity Inversions */
+	switch (sbl->link[port_num].loopback_mode) {
+	case SBL_LOOPBACK_MODE_REMOTE:
+	case SBL_LOOPBACK_MODE_OFF:
+		if (sbl->switch_info->ports[port_num].serdes[serdes].txinv)
+			datapath |= SPICO_INT_DATA_SET_TXINV;
+		else
+			datapath |= SPICO_INT_DATA_CLR_TXINV;
+
+		if (sbl->switch_info->ports[port_num].serdes[serdes].rxinv)
+			datapath |= SPICO_INT_DATA_SET_RXINV;
+		else
+			datapath |= SPICO_INT_DATA_CLR_RXINV;
+
+		break;
+	case SBL_LOOPBACK_MODE_LOCAL:
+		datapath |= SPICO_INT_DATA_CLR_TXINV;
+		datapath |= SPICO_INT_DATA_CLR_RXINV;
+		break;
+	default:
+		sbl_dev_warn(sbl->dev, "%d: Unsupported loopback mode (%d)",
+			     port_num, sbl->link[port_num].loopback_mode);
+		return -EINVAL;
+	}
+
+	/* Set Precode */
+	if (encoding == SBL_ENC_PAM4) {
+		link->precoding_enabled = get_serdes_precoding(sbl, port_num);
+		if (link->precoding_enabled)
+			datapath |= SPICO_INT_DATA_SET_PRECODE;
+		else
+			datapath |= SPICO_INT_DATA_CLR_PRECODE;
+	} else {
+		datapath |= SPICO_INT_DATA_CLR_PRECODE;
+	}
+
+	/* Set Graycode & Swizzle */
+	if (an || (encoding == SBL_ENC_NRZ))
+		datapath |= SPICO_INT_DATA_CLR_GRAY_SWZ;
+	else
+		datapath |= SPICO_INT_DATA_SET_GRAY_SWZ;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_POLARITY_CTRL,
+					datapath, NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+int sbl_set_tx_rx_enable(struct sbl_inst *sbl, int port_num, int serdes,
+			 bool tx_en, bool rx_en, bool txo_en)
+{
+	u32 int_data = 0;
+	u64 core_status_value;
+	int tx_rdy, rx_rdy;
+	unsigned long last_jiffy;
+	int err;
+
+	DEV_TRACE2(sbl->dev, "p%ds%d: tx_en: %d rx_en: %d txo_en: %d",
+		   port_num, serdes, tx_en, rx_en, txo_en);
+
+	if (!sbl->is_hw)
+		return 0;
+
+	if (tx_en)
+		int_data |= SPICO_INT_DATA_SET_TX_EN;
+
+	if (rx_en)
+		int_data |= SPICO_INT_DATA_SET_RX_EN;
+
+	if (txo_en)
+		int_data |= SPICO_INT_DATA_SET_TXO_EN;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_SERDES_EN,
+					int_data, NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	/* Wait for tx_rdy and rx_rdy to be set. */
+	last_jiffy = jiffies + msecs_to_jiffies(1000 * sbl->iattr.serdes_en_timeout);
+	do {
+		core_status_value = sbl_read64(sbl, SBL_PML_BASE(port_num) |
+					       SBL_PML_SERDES_CORE_STATUS_OFFSET(serdes));
+		tx_rdy = (core_status_value & SERDES_CORE_STATUS_TX_RDY_MASK) ? 1 : 0;
+		rx_rdy = (core_status_value & SERDES_CORE_STATUS_RX_RDY_MASK) ? 1 : 0;
+		if ((tx_rdy == tx_en) && (rx_rdy == rx_en))
+			break;
+		msleep(sbl->iattr.serdes_en_poll_interval);
+	} while (time_is_after_jiffies(last_jiffy));
+
+	if ((tx_rdy != tx_en) || (rx_rdy != rx_en)) {
+		sbl_dev_err(sbl->dev,
+			    "p%ds%d: Timeout setting tx/rx/txo enable! tx_en:%d rx_en:%d txo_en:%d tx_rdy:%d rx_rdy:%d (timeout:%ds)",
+			    port_num, serdes, tx_en, rx_en, txo_en, tx_rdy, rx_rdy,
+			    sbl->iattr.serdes_en_timeout);
+		return -ETIME;
+	}
+	DEV_TRACE2(sbl->dev, "rc 0");
+
+	return 0;
+}
+
+int sbl_set_tx_eq(struct sbl_inst *sbl, int port_num, int serdes,
+		  int atten, int pre, int post, int pre2, int pre3)
+{
+	int err, rc = 0;
+
+	DEV_TRACE2(sbl->dev,
+		   "p%ds%d: atten: %d pre: %d post: %d pre2: %d pre3: %d",
+		   port_num, serdes, atten, pre, post, pre2, pre3);
+
+	if ((atten < TXEQ_ATTEN_MIN) || (atten > TXEQ_ATTEN_MAX)) {
+		sbl_dev_err(sbl->dev,
+			    "Invalid value for atten(%d) Expected in the range of %d to %d",
+			atten, TXEQ_ATTEN_MIN, TXEQ_ATTEN_MAX);
+		return -EINVAL;
+	}
+	if ((pre < TXEQ_PRE1_MIN) || (pre > TXEQ_PRE1_MAX)) {
+		sbl_dev_err(sbl->dev,
+			    "Invalid value for pre(%d) Expected in the range of %d to %d",
+			pre, TXEQ_PRE1_MIN, TXEQ_PRE1_MAX);
+		return -EINVAL;
+	}
+	if ((post < TXEQ_POST_MIN) || (post > TXEQ_POST_MAX)) {
+		sbl_dev_err(sbl->dev,
+			    "Invalid value for post(%d) Expected in the range of %d to %d",
+			post, TXEQ_POST_MIN, TXEQ_POST_MAX);
+		return -EINVAL;
+	}
+	if ((pre2 < TXEQ_PRE2_MIN) || (pre2 > TXEQ_PRE2_MAX)) {
+		sbl_dev_err(sbl->dev,
+			    "Invalid value for pre2(%d) Expected in the range of %d to %d",
+			pre2, TXEQ_PRE2_MIN, TXEQ_PRE2_MAX);
+		return -EINVAL;
+	}
+	if ((pre3 < TXEQ_PRE3_MIN) || (pre3 > TXEQ_PRE3_MAX)) {
+		sbl_dev_err(sbl->dev,
+			    "Invalid value for pre3(%d) Expected in the range of %d to %d",
+			pre3, TXEQ_PRE3_MIN, TXEQ_PRE3_MAX);
+		return -EINVAL;
+	}
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_TXEQ_LOAD,
+					SPICO_INT_DATA_SET_TXEQ_ATTEN |
+						(atten & SPICO_INT_DATA_TXEQ_DATA_MASK), NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_TXEQ_LOAD,
+					SPICO_INT_DATA_SET_TXEQ_PRE1 |
+						(pre & SPICO_INT_DATA_TXEQ_DATA_MASK), NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_TXEQ_LOAD,
+					SPICO_INT_DATA_SET_TXEQ_POST |
+						(post & SPICO_INT_DATA_TXEQ_DATA_MASK), NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_TXEQ_LOAD,
+					SPICO_INT_DATA_SET_TXEQ_PRE2 |
+						(pre2 & SPICO_INT_DATA_TXEQ_DATA_MASK), NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_TXEQ_LOAD,
+					SPICO_INT_DATA_SET_TXEQ_PRE3 |
+						(pre3 & SPICO_INT_DATA_TXEQ_DATA_MASK), NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	DEV_TRACE2(sbl->dev, "rc: %d", rc);
+
+	return rc;
+}
+
+int sbl_set_gs(struct sbl_inst *sbl, int port_num, int serdes, int gs1, int gs2)
+{
+	int err;
+	u16 result;
+
+	DEV_TRACE2(sbl->dev, "port: %d gs1: %d gs2: %d", port_num, gs1, gs2);
+
+	if ((gs1 < RXEQ_DFE_GS1_MIN) || (gs1 > RXEQ_DFE_GS1_MAX)) {
+		sbl_dev_err(sbl->dev,
+			    "Invalid value for gs1(%d) Expected in the range of %d to %d",
+			gs1, RXEQ_DFE_GS1_MIN, RXEQ_DFE_GS1_MAX);
+		return -EINVAL;
+	}
+	if ((gs2 < RXEQ_DFE_GS2_MIN) || (gs2 > RXEQ_DFE_GS2_MAX)) {
+		sbl_dev_err(sbl->dev,
+			    "Invalid value for gs2(%d) Expected in the range of %d to %d",
+			gs2, RXEQ_DFE_GS2_MIN, RXEQ_DFE_GS2_MAX);
+		return -EINVAL;
+	}
+
+	if (!sbl->is_hw)
+		return 0;
+
+	/* Write GS1 */
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_CTLE_GS1,
+					&result,
+					SPICO_INT_RETURN_RESULT);
+	if (err)
+		return err;
+
+	DEV_TRACE2(sbl->dev,
+		   "p%ds%d: Updating GS1 from 0x%x to 0x%x",
+		   port_num, serdes, result, gs1);
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_WRITE,
+					gs1, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err)
+		return err;
+
+	if (result != SPICO_INT_CM4_HAL_READ) {
+		sbl_dev_err(sbl->dev,
+			    "p%ds%d: Failed updating gs1 (0x%x)!",
+			port_num, serdes, gs1);
+		return -EBADE;
+	}
+
+	/* Write GS2 */
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_HAL_CTLE_GS2,
+					&result,
+					SPICO_INT_RETURN_RESULT);
+	if (err)
+		return err;
+
+	DEV_TRACE2(sbl->dev,
+		   "p%ds%d: Updating GS2 from 0x%x to 0x%x",
+		   port_num, serdes, result, gs2);
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_WRITE,
+					gs2, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err)
+		return err;
+
+	if (result != SPICO_INT_CM4_HAL_READ) {
+		sbl_dev_err(sbl->dev,
+			    "p%ds%d: Failed updating gs2 (0x%x)!",
+			port_num, serdes, gs2);
+		return -EBADE;
+	}
+
+	DEV_TRACE2(sbl->dev, "rc: 0");
+
+	return 0;
+}
+
+int sbl_set_tx_data_sel(struct sbl_inst *sbl, int port_num, int serdes,
+			int data_sel)
+{
+	int err;
+	u16 result;
+	int retry_cnt = 0;
+
+	DEV_TRACE2(sbl->dev, "p%ds%d data_sel: %d", port_num, serdes, data_sel);
+
+	if (!sbl->is_hw)
+		return 0;
+
+	if (data_sel == SBL_DS_CORE) {
+		do {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_PRBS_CTRL,
+						SPICO_INT_DATA_DISABLE_TXRXGEN,
+						&result,
+						SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			if (result == SPICO_INT_DATA_PRBS_SUCCESS)
+				return 0;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: attempt %d tx data sel returned %d",
+				    port_num, serdes, retry_cnt, result);
+			usleep_range(1000, 2000);
+		} while (retry_cnt++ < SPICO_INT_DATA_PRBS_RETRY_LIMIT);
+	} else { /* SBL_DS_PRBS */
+		do {
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_PRBS_CTRL,
+						SPICO_INT_DATA_PRBS31_AS_TXGEN,
+						&result,
+						SPICO_INT_RETURN_RESULT);
+			if (err)
+				return err;
+
+			if (result == SPICO_INT_DATA_PRBS_SUCCESS)
+				return 0;
+
+			sbl_dev_dbg(sbl->dev, "p%ds%d: attempt %d tx data sel returned %d",
+				    port_num, serdes, retry_cnt, result);
+			usleep_range(1000, 2000);
+		} while (retry_cnt++ < SPICO_INT_DATA_PRBS_RETRY_LIMIT);
+	}
+
+	sbl_dev_err(sbl->dev, "p%ds%d: Failed to set TX data select (%d)!",
+		    port_num, serdes, data_sel);
+	return -EBADE;
+}
+
+int sbl_set_prbs_rx_mode(struct sbl_inst *sbl, int port_num, int serdes)
+{
+	int err;
+	/* Avago_serdes_data_qual_t qual; */
+
+	DEV_TRACE2(sbl->dev, "p%ds%d", port_num, serdes);
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_DFE_CTRL,
+					SPICO_INT_DATA_NONE, NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	err = sbl_serdes_dfe_tune_wait(sbl, port_num);
+	if (err)
+		return err;
+
+	DEV_TRACE2(sbl->dev, "rc: 0");
+
+	return 0;
+}
+
+int sbl_apply_sbus_divider(struct sbl_inst *sbl, int divider)
+{
+	int sbus_ring, err;
+	u32 sbus_addr;
+
+	/* Force divider to either SPEEDUP or DFLT */
+	if (divider == SBL_SBUS_DIVIDER_SPEEDUP) {
+		sbl_dev_dbg(sbl->dev, "Applying SBUS speedup.");
+	} else {
+		sbl_dev_dbg(sbl->dev, "Disabling SBUS speedup.");
+		divider = SBL_SBUS_DIVIDER_DFLT;
+	}
+
+	/* increase SBUS ring clock frequency */
+	for (sbus_ring = 0; sbus_ring < sbl->switch_info->num_sbus_rings; ++sbus_ring) {
+		sbus_addr = SBUS_ADDR(sbus_ring, SBUS_BCAST_SBM);
+		DEV_TRACE2(sbl->dev, "ring: %d divider_exp: %d", sbus_ring,
+			   divider);
+		/* SBUS Critical Section */
+		mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));
+		err = sbl_sbus_wr(sbl, sbus_addr, SBM_CRM_ADDR_CLK_DIV, divider);
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+		if (err)
+			return err;
+	}
+
+	/* adjust op flags */
+	if (divider == SBL_SBUS_DIVIDER_SPEEDUP)
+		sbl->sbus_op_flags = sbl->iattr.sbus_op_flags_fast;
+	else /* SBL_SBUS_DIVIDER_DFLT */
+		sbl->sbus_op_flags = sbl->iattr.sbus_op_flags_slow;
+
+	sbl_dev_dbg(sbl->dev, "SBus divider update complete");
+	return 0;
+}
+
+/* Note - cannot do broadcast here! */
+int sbl_serdes_dfe_tune_start(struct sbl_inst *sbl, int port_num, int serdes,
+			      bool is_retune)
+{
+	int err;
+	u16 result;
+	struct sbl_link *link = sbl->link + port_num;
+
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_GET_RX_EQ,
+					SPICO_INT_DATA_RXEQ_STS_DFE_STS,
+					&result, SPICO_INT_RETURN_RESULT);
+	if (err) {
+		sbl_dev_err(sbl->dev, "p%ds%d: Failed checking status of DFE tune!",
+			    port_num, serdes);
+		return -EIO;
+	}
+	if (result == DFE_CAL_DONE) {
+		sbl_dev_dbg(sbl->dev, "p%ds%d: DFE done before we started",
+			    port_num, serdes);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_SET_RX_EQ,
+					SPICO_INT_DATA_RXEQ_STS_DFE_STS | 0x0,
+					NULL, SPICO_INT_IGNORE_RESULT);
+		if (err) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed to clear DFE sts!",
+				    port_num, serdes);
+			return err;
+		}
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_GET_RX_EQ,
+					SPICO_INT_DATA_RXEQ_STS_DFE_STS,
+					&result, SPICO_INT_RETURN_RESULT);
+		if (err) {
+			sbl_dev_err(sbl->dev,
+				    "p%ds%d: Failed checking status of DFE tune!",
+				port_num, serdes);
+			return -EIO;
+		}
+		if (result == DFE_CAL_DONE) {
+			sbl_dev_err(sbl->dev, "p%ds%d: DFE done before we started!",
+				    port_num, serdes);
+			return -ENOMSG;
+		}
+	}
+
+	DEV_TRACE2(sbl->dev, "p%ds%d is_retune:%d", port_num, serdes,
+		   is_retune);
+
+	/* Set effort level */
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_READ,
+					SPICO_INT_DATA_ICAL_EFFORT_SEL, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err)
+		return err;
+
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_FORCE_MAX_EFFORT)) {
+		link->ical_effort = SPICO_INT_DATA_ICAL_MAX_EFFORT;
+	} else if (sbl_debug_option(sbl, port_num, SBL_DEBUG_FORCE_MED_EFFORT)) {
+		link->ical_effort = SPICO_INT_DATA_ICAL_MED_EFFORT;
+	} else if (sbl_debug_option(sbl, port_num, SBL_DEBUG_FORCE_MIN_EFFORT)) {
+		link->ical_effort = SPICO_INT_DATA_ICAL_MIN_EFFORT;
+	} else if (link->blattr.options & SBL_OPT_DFE_ALWAYS_MAX_EFFORT) {
+		link->ical_effort = SPICO_INT_DATA_ICAL_MAX_EFFORT;
+	} else if (link->blattr.options & SBL_OPT_DFE_ALWAYS_MED_EFFORT) {
+		link->ical_effort = SPICO_INT_DATA_ICAL_MED_EFFORT;
+	} else if (link->blattr.options & SBL_OPT_DFE_ALWAYS_MIN_EFFORT) {
+		link->ical_effort = SPICO_INT_DATA_ICAL_MIN_EFFORT;
+	} else if (link->dfe_tune_count < 3) {
+		/* medium effort for first few attempts */
+		link->ical_effort = SPICO_INT_DATA_ICAL_MED_EFFORT;
+	} else {
+		/* rest full effort */
+		link->ical_effort = SPICO_INT_DATA_ICAL_MAX_EFFORT;
+	}
+	/* sync with sysfs */
+	mb();
+
+	if (!sbl->is_hw)
+		return 0;
+
+	DEV_TRACE2(sbl->dev, "p%ds%d: Updating ICAL effort from 0x%x to 0x%x",
+		   port_num, serdes, result, link->ical_effort);
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_HAL_WRITE,
+					link->ical_effort, &result,
+					SPICO_INT_RETURN_RESULT);
+	if (err)
+		return err;
+
+	if (result != SPICO_INT_CM4_HAL_READ) {
+		sbl_dev_err(sbl->dev, "p%ds%d: Failed updating ICAL effort (0x%x)!",
+			    port_num, serdes, link->ical_effort);
+		return -EBADE;
+	}
+	sbl_dev_dbg(sbl->dev, "p%ds%d: Setup ICAL effort 0x%x",
+		    port_num, serdes, link->ical_effort);
+
+	/* Initiate DFE tune */
+	err = sbl_serdes_spico_int(sbl, port_num, serdes,
+				   SPICO_INT_CM4_DFE_CTRL,
+					SPICO_INT_DATA_DFE_ICAL, NULL,
+					SPICO_INT_VALIDATE_RESULT);
+	if (err)
+		return err;
+
+	DEV_TRACE2(sbl->dev, "rc: 0");
+	return 0;
+}
+
+int sbl_serdes_dfe_tune_wait(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	u16 result;
+	int err, serdes;
+	u8 in_progress_mask, serdes_mask, tuned_mask = 0;
+	unsigned long last_jiffy;
+
+	serdes_mask = get_serdes_rx_mask(sbl, port_num);
+	in_progress_mask = serdes_mask;
+
+	DEV_TRACE2(sbl->dev, "p%d serdes_mask:0x%x", port_num, serdes_mask);
+
+	last_jiffy = jiffies + msecs_to_jiffies(1000 * link->blattr.dfe_timeout);
+	do {
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+				continue;
+
+			if (!((1 << serdes) & in_progress_mask))
+				continue;
+
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_GET_RX_EQ,
+							SPICO_INT_DATA_RXEQ_STS_DFE_STS,
+							&result, SPICO_INT_RETURN_RESULT);
+			if (err) {
+				sbl_dev_err(sbl->dev, "p%ds%d: Failed checking status of DFE tune!",
+					    port_num, serdes);
+				return -EIO;
+			}
+			if (!sbl->is_hw)
+				result = DFE_CAL_DONE;
+
+			if (result & DFE_LOS_MASK) {
+				sbl_dev_warn(sbl->dev, "p%ds%d: Loss of signal when in DFE tune!",
+					     port_num, serdes);
+				return -ENOMSG;
+			} else if (result & DFE_CAL_RUN_IN_PRGRS_MASK) {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: DFE still in progress", port_num,
+					    serdes);
+			} else if (result & DFE_CAL_DONE) {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: DFE done", port_num,
+					    serdes);
+				tuned_mask      |= (1 << serdes);
+				in_progress_mask &= ~(1 << serdes);
+			} else {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: DFE complete", port_num, serdes);
+				tuned_mask      |= (1 << serdes);
+				in_progress_mask &= ~(1 << serdes);
+			}
+		}
+		if (!in_progress_mask)
+			break;
+
+		msleep(link->blattr.dfe_poll_interval);
+	} while (time_is_after_jiffies(last_jiffy) &&
+		 !sbl_start_timeout(sbl, port_num) &&
+		 !sbl_base_link_start_cancelled(sbl, port_num));
+
+	if (serdes_mask == tuned_mask)
+		return 0;
+
+	if (sbl_base_link_start_cancelled(sbl, port_num))
+		return -ECANCELED;
+
+	if (sbl_start_timeout(sbl, port_num)) {
+		sbl_dev_dbg(sbl->dev, "p%d: start timeout waiting for DFE to tune to complete\n",
+			    port_num);
+		return -ETIMEDOUT;
+	}
+
+	/* just didnt finish */
+	sbl_dev_dbg(sbl->dev, "p%d serdes_mask:0x%x: Timeout waiting for DFE to complete (timeout:%ds)",
+		    port_num, serdes_mask, link->blattr.dfe_timeout);
+	return -ETIME;
+}
+
+int sbl_port_dfe_tune_start(struct sbl_inst *sbl, int port_num, bool is_retune)
+{
+	int err, serdes;
+
+	sbl_dev_dbg(sbl->dev, "p%d: DFE tune retune:%d", port_num, is_retune);
+
+	/* DFE Tune */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		err = sbl_serdes_dfe_tune_start(sbl, port_num, serdes,
+						is_retune);
+		if (err) {
+			sbl_dev_err(sbl->dev, "p%d: Failed to start DFE tune!",
+				    port_num);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+int sbl_port_dfe_tune_wait(struct sbl_inst *sbl, int port_num)
+{
+	int err;
+
+	/* DFE Tune */
+	err = sbl_serdes_dfe_tune_wait(sbl, port_num);
+	if (err) {
+		switch (err) {
+		case -ECANCELED:
+			sbl_dev_dbg(sbl->dev, "p%d: DFE wait cancelled", port_num);
+			break;
+		case -ETIMEDOUT:
+			sbl_dev_dbg(sbl->dev, "p%d: DFE wait start timeout", port_num);
+			break;
+		case -ETIME:
+			sbl_dev_dbg(sbl->dev, "p%d: DFE wait timed out", port_num);
+			break;
+		default:
+			sbl_dev_err(sbl->dev, "p%d: DFE wait failed [%d]", port_num, err);
+		}
+		return err;
+	}
+
+	/* extra checks */
+	if (sbl->link[port_num].loopback_mode != SBL_LOOPBACK_MODE_LOCAL) {
+
+		/* Eye height check (without pcal active) */
+		err = sbl_port_check_eyes(sbl, port_num);
+		if (err) {
+			sbl_dev_dbg(sbl->dev, "p%d: some eyes bad", port_num);
+			return err;
+		}
+		sbl_dev_dbg(sbl->dev, "p%d: all eyes good", port_num);
+
+		/* Validate tuning params */
+		err = sbl_check_serdes_tuning_params(sbl, port_num);
+		if (err) {
+			sbl_dev_err(sbl->dev, "p%d: some tuning params bad", port_num);
+			sbl->link[port_num].tune_param_oob_count++;
+			return -ELNRNG;
+		}
+		sbl_dev_dbg(sbl->dev, "p%d: all tuning params good", port_num);
+		sbl->link[port_num].tune_param_oob_count = 0;
+
+		/* Set up PCAL */
+		/*   (This can reduce the eye heights but increase the eye widths).
+		     Future eye height checks will be held off for a period while
+		     the pcal process settles */
+		if (sbl->link[port_num].blattr.options & SBL_OPT_ENABLE_PCAL) {
+			if (sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_PCAL)) {
+				sbl_dev_warn(sbl->dev, "p%d: pcal inhibited\n", port_num);
+			} else {
+				err = sbl_port_start_pcal(sbl, port_num);
+				if (err)
+					return err;
+			}
+		} else {
+			sbl_dev_dbg(sbl->dev, "p%d: PCAL is disabled!", port_num);
+		}
+	}
+
+	return 0;
+}
+
+void sbl_log_port_eye_heights(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int eye, num_eyes = 0;
+	int eye_heights[NUM_PAM4_EYES];
+	int serdes;
+
+	switch (link->link_mode) {
+	default:
+	case SBL_LINK_MODE_BJ_100G: /* NRZ */
+		num_eyes = NUM_NRZ_EYES;
+		break;
+	case SBL_LINK_MODE_CD_50G:
+	case SBL_LINK_MODE_CD_100G:
+	case SBL_LINK_MODE_BS_200G: /* PAM4 */
+		num_eyes = NUM_PAM4_EYES;
+		break;
+	}
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+		if (sbl_get_eye_heights(sbl, port_num, serdes, eye_heights)) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed to read eye heights",
+				    port_num, serdes);
+			return;
+		}
+		for (eye = 0; eye < num_eyes; ++eye) {
+			sbl_dev_info(sbl->dev, "p%ds%d eye[%d] height: 0x%x",
+				     port_num, serdes, eye, eye_heights[eye]);
+		}
+	}
+}
+
+int sbl_port_check_eyes(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int min_eye_height, max_eye_height;
+	int eye, num_eyes = 0;
+	int eye_heights[NUM_PAM4_EYES];
+	unsigned long holdoff_end_jiffies;
+	int serdes;
+
+	/* pcal can generate bad eyes temporarily when its starting up so
+	   if its not settled yet ignore this test */
+	if (link->pcal_running && link->blattr.pcal_eyecheck_holdoff) {
+		holdoff_end_jiffies = link->pcal_start_jiffies +
+				msecs_to_jiffies(link->blattr.pcal_eyecheck_holdoff);
+		if (time_is_after_jiffies(holdoff_end_jiffies)) {
+			sbl_dev_info(sbl->dev, "p%d: holding off eye checks",
+				     port_num);
+			return 0;
+		}
+	}
+
+	if (!sbl->is_hw)
+		return 0;
+
+	/* setup test criteria */
+	switch (link->link_mode) {
+	default:
+	case SBL_LINK_MODE_BJ_100G: /* NRZ */
+		num_eyes = NUM_NRZ_EYES;
+		min_eye_height =
+			link->blattr.nrz_min_eye_height;
+		max_eye_height =
+			link->blattr.nrz_max_eye_height;
+		break;
+	case SBL_LINK_MODE_CD_50G:
+	case SBL_LINK_MODE_CD_100G:
+	case SBL_LINK_MODE_BS_200G: /* PAM4 */
+		num_eyes = NUM_PAM4_EYES;
+		min_eye_height =
+			link->blattr.pam4_min_eye_height;
+		max_eye_height =
+			link->blattr.pam4_max_eye_height;
+		break;
+	}
+
+	/* check eye height */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+
+		sbl_dev_dbg(sbl->dev, "p%ds%d: checking eye height(s)", port_num, serdes);
+		if (sbl_get_eye_heights(sbl, port_num, serdes, eye_heights)) {
+			sbl_dev_err(sbl->dev, "p%ds%d: Failed to read eye heights",
+				    port_num, serdes);
+			return -EIO;
+		}
+
+		for (eye = 0; eye < num_eyes; ++eye) {
+			sbl_dev_dbg(sbl->dev, "p%ds%d eye[%d] height: 0x%x",
+				    port_num, serdes, eye, eye_heights[eye]);
+			if (eye_heights[eye] < min_eye_height) {
+				sbl_dev_dbg(sbl->dev,
+					    "p%ds%d eye[%d] height (0x%x) less than requirement (0x%x)!",
+					    port_num, serdes, eye, eye_heights[eye],
+					    min_eye_height);
+				return -ECHRNG;
+			} else if ((sbl->link[port_num].loopback_mode !=
+				    SBL_LOOPBACK_MODE_LOCAL) &&
+				   (eye_heights[eye] > max_eye_height)) {
+				sbl_dev_dbg(sbl->dev,
+					    "p%ds%d eye[%d] height (0x%x) greater than max (0x%x)!",
+					    port_num, serdes, eye, eye_heights[eye],
+					    max_eye_height);
+				return -ECHRNG;
+			}
+		}
+	}
+
+	return 0;
+}
+
+/* Constructs maps of */
+/* - active serdes (ones in use for this mode)
+   - serdes not reporting electrical idle (i.e. seeing a signal)
+   - serdes with all good eyes (i.e. data can be extracted from the signal) */
+
+/* Only called on Rosetta */
+/* active map is always valid and returned
+   other maps only valid if function succeeds otherwise zero */
+
+/* Electrical idle detect seems fast to respond but sometimes shows unexpected
+   and probably wrong, electrical idle. */
+
+/* TODO investigate EID filtering - if its fast enough? */
+
+/* Eye height measurements seem to be very slow at being updated after a change to the
+   serdes. BRCM say this is because the PLL takes a long time to unlock
+   There is an optional delay that can be added to give the eye heights time
+   to be updated. */
+
+int sbl_port_get_serdes_state_maps(struct sbl_inst *sbl, int port_num, u8 *active_map,
+				   u8 *not_idle_map, u8 *ok_eye_map)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int min_eye_height, max_eye_height;
+	int eye, num_eyes = 0;
+	u64 core_status;
+	int eye_heights[NUM_PAM4_EYES];
+	int err;
+	int serdes;
+
+	if (!active_map || !not_idle_map || !ok_eye_map)
+		return -EINVAL;
+
+	*active_map = *not_idle_map = *ok_eye_map = 0;
+
+	/* always build active serdes map */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes)
+		if (rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			*active_map  |= (1 << serdes);
+
+	/* must be configured to get criteria from attributes */
+	if (!link->blconfigured)
+		return -EUCLEAN;
+
+	/* get eye test criteria */
+	switch (link->link_mode) {
+	case SBL_LINK_MODE_BJ_100G: /* NRZ */
+		num_eyes = NUM_NRZ_EYES;
+		min_eye_height = link->blattr.nrz_min_eye_height;
+		max_eye_height = link->blattr.nrz_max_eye_height;
+		break;
+	case SBL_LINK_MODE_CD_50G:
+	case SBL_LINK_MODE_CD_100G:
+	case SBL_LINK_MODE_BS_200G: /* PAM4 */
+		num_eyes = NUM_PAM4_EYES;
+		min_eye_height = link->blattr.pam4_min_eye_height;
+		max_eye_height = link->blattr.pam4_max_eye_height;
+		break;
+	default:
+		sbl_dev_dbg(sbl->dev, "%d: get_serdes_state_maps, unrecognised link mode (%d)",
+			    port_num, link->link_mode);
+		return -ENODATA;
+	}
+
+	/* check electrical idle not asserted */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+
+		core_status = sbl_read64(sbl, SBL_PML_BASE(port_num) |
+		       SBL_PML_SERDES_CORE_STATUS_OFFSET(serdes));
+
+		/* TODO fix to use normal address map macro */
+		if (!(core_status & SERDES_CORE_STATUS_RX_IDLE_DETECT_MASK))
+			*not_idle_map |= 1 << serdes;
+	}
+
+	/* optionally wait a little to allow current eye heights to be available */
+	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_SERDES_MAP_DELAY))
+		msleep(150);
+
+	/* check eyes */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+
+		/* assume good if serdes is used */
+		if (rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			*ok_eye_map |= (1 << serdes);
+		else
+			continue;
+
+		/* get eyes */
+		err = sbl_get_eye_heights(sbl, port_num, serdes, eye_heights);
+		if (err) {
+			sbl_dev_dbg(sbl->dev, "%d: get_serdes_state_maps, get_eye_heights failed [%d]",
+				    port_num, err);
+			*not_idle_map = *ok_eye_map = 0;
+			return err;
+		}
+
+		/* All eyes must be good
+		   drop from map if any bad eyes found */
+		for (eye = 0; eye < num_eyes; ++eye) {
+
+			if (eye_heights[eye] < min_eye_height) {
+				*ok_eye_map &= ~(1 << serdes);
+				break;
+			} else if ((link->loopback_mode != SBL_LOOPBACK_MODE_LOCAL) &&
+				   (eye_heights[eye] > max_eye_height)) {
+				*ok_eye_map &= ~(1 << serdes);
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+
+int sbl_port_start_pcal(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int serdes, err;
+
+	if (link->pcal_running)
+		return 0;
+
+	sbl_dev_dbg(sbl->dev, "p%d: starting PCAL", port_num);
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_DFE_CTRL,
+						SPICO_INT_DATA_DFE_CONT_PCAL,
+						NULL,
+						SPICO_INT_VALIDATE_RESULT);
+		if (err)
+			return err;
+	}
+	link->pcal_running = true;
+	link->pcal_start_jiffies = jiffies;
+
+	return 0;
+}
+
+int sbl_port_stop_pcal(struct sbl_inst *sbl, int port_num)
+{
+	int serdes, err;
+
+	if (!sbl->link[port_num].pcal_running)
+		return 0;
+
+	sbl_dev_dbg(sbl->dev, "p%d: stopping PCAL", port_num);
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_DFE_CTRL,
+						SPICO_INT_DATA_DFE_PAUSE_PCAL,
+						NULL,
+						SPICO_INT_VALIDATE_RESULT);
+		if (err)
+			return err;
+	}
+
+	sbl->link[port_num].pcal_running = false;
+	return 0;
+}
+
+int sbl_port_dfe_tune(struct sbl_inst *sbl, int port_num, bool is_retune)
+{
+	int err;
+
+	sbl_dev_dbg(sbl->dev, "p%d: Starting DFE %stune...", port_num,
+		    is_retune ? "re" : "");
+
+	sbl_link_tune_begin(sbl, port_num);
+
+	err = sbl_port_dfe_tune_start(sbl, port_num, is_retune);
+	if (err) {
+		sbl_dev_dbg(sbl->dev, "p%d: Failed to start DFE tune!", port_num);
+		goto out;
+	}
+
+	sbl_dev_dbg(sbl->dev, "p%d: Waiting for DFE tuning to complete...", port_num);
+	err = sbl_port_dfe_tune_wait(sbl, port_num);
+	if (err) {
+		sbl_dev_dbg(sbl->dev, "p%d: DFE tune failed!", port_num);
+		goto out;
+	}
+
+out:
+	sbl_link_tune_update_total_timespec(sbl, port_num);
+	return err;
+}
+
+int sbl_serdes_minitune_setup(struct sbl_inst *sbl, int port_num)
+{
+	int err;
+	u16 result;
+	int serdes;
+
+	err = sbl_serdes_config(sbl, port_num, false);
+	if (err) {
+		sbl_dev_err(sbl->dev,
+			    "mt: SerDes config failed for port %d with err %d",
+			port_num, err);
+		return err;
+	}
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+		/* Set effort level */
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_ICAL_EFFORT_SEL,
+						&result,
+						SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev,
+			   "p%ds%d: mt: Updating ICAL effort from 0x%x to 0x%x",
+			   port_num, serdes, result,
+			   SPICO_INT_DATA_ICAL_EFFORT_0);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						SPICO_INT_DATA_ICAL_EFFORT_0,
+						&result,
+						SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev,
+				    "p%ds%d: mt: Failed updating ICAL effort (0x%x)!",
+				port_num, serdes, SPICO_INT_DATA_ICAL_EFFORT_0);
+			return -EBADE;
+		}
+		/* Enable EID based on DFE tuning */
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_EID_FILTER_SEL,
+						&result,
+						SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		DEV_TRACE2(sbl->dev,
+			   "p%ds%d: mt: Updating EID Filter from 0x%x to 0x%x",
+			   port_num, serdes, result,
+			   SPICO_INT_DATA_EID_FILTER_DFE);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						SPICO_INT_DATA_EID_FILTER_DFE,
+						&result,
+						SPICO_INT_RETURN_RESULT);
+		if (err)
+			return err;
+
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev,
+				    "p%ds%d: mt: Failed updating EID Filter (0x%x)!",
+				port_num, serdes,
+				SPICO_INT_DATA_EID_FILTER_DFE);
+			return -EBADE;
+		}
+	}
+
+	return 0;
+}
+
+int sbl_serdes_minitune_block(struct sbl_inst *sbl, int port_num)
+{
+	u64 core_status_value;
+	u8 sig_ok_mask = 0;
+	u8 tgt_serdes = 0;
+	u16 result;
+	int serdes;
+	int err;
+	u8 serdes_mask;
+	unsigned long last_jiffy;
+
+	serdes_mask = get_serdes_rx_mask(sbl, port_num);
+
+	/* Wait for signal OK */
+	last_jiffy = jiffies + msecs_to_jiffies(1000 * sbl->link[port_num].blattr.lpd_timeout);
+	do {
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+				continue;
+			tgt_serdes = 1 << serdes;
+
+			if (tgt_serdes & sig_ok_mask)
+				continue;
+
+			core_status_value = sbl_read64(sbl,
+						       SBL_PML_BASE(port_num) |
+			       SBL_PML_SERDES_CORE_STATUS_OFFSET(serdes));
+			if (((core_status_value &
+			      SERDES_CORE_STATUS_RX_IDLE_DETECT_MASK) == 0) &&
+			    ((core_status_value &
+			      SERDES_CORE_STATUS_RX_SIG_OK_MASK) == 0)) {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: mt: Found EID 0 or SIG OK 0", port_num, serdes);
+				sig_ok_mask |= 1 << serdes;
+				continue;
+			} else {
+				DEV_TRACE2(sbl->dev, "p%ds%d: mt: Waiting for EID==0(%d) or SIG OK==0(%d)",
+					   port_num, serdes,
+						(core_status_value & SERDES_CORE_STATUS_RX_IDLE_DETECT_MASK) ? 1 : 0,
+						(core_status_value & SERDES_CORE_STATUS_RX_SIG_OK_MASK) ? 1 : 0);
+			}
+		}
+
+		if (sig_ok_mask == serdes_mask)
+			break;
+		if (sbl_base_link_start_cancelled(sbl, port_num))
+			break;
+		if (sbl_start_timeout(sbl, port_num))
+			break;
+
+		msleep(sbl->link[port_num].blattr.lpd_poll_interval);
+	} while (time_is_after_jiffies(last_jiffy));
+
+	/* Disable EID filter */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_READ,
+						SPICO_INT_DATA_EID_FILTER_SEL,
+						&result,
+						SPICO_INT_RETURN_RESULT);
+		if (err) {
+			sbl_dev_err(sbl->dev,
+				    "p%ds%d: mt block exit@1: sbl_serdes_spico_int failed [%d]",
+				port_num, serdes, err);
+			return err;
+		}
+		DEV_TRACE2(sbl->dev,
+			   "p%ds%d: Updating EID Filter from 0x%x to 0x%x",
+			   port_num, serdes, result,
+			   SPICO_INT_DATA_EID_FILTER_OFF);
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_HAL_WRITE,
+						SPICO_INT_DATA_EID_FILTER_OFF,
+						&result,
+						SPICO_INT_RETURN_RESULT);
+		if (err) {
+			sbl_dev_err(sbl->dev,
+				    "p%ds%d: mt block exit@2: sbl_serdes_spico_int failed [%d]",
+				port_num, serdes, err);
+			return err;
+		}
+		if (result != SPICO_INT_CM4_HAL_READ) {
+			sbl_dev_err(sbl->dev,
+				    "p%ds%d: mt: Failed updating EID Filter (0x%x)!",
+				port_num, serdes,
+				SPICO_INT_DATA_EID_FILTER_OFF);
+			return -EBADE;
+		}
+	}
+	/* Make sure all tunes are complete */
+	err = sbl_serdes_dfe_tune_wait(sbl, port_num);
+	if (err) {
+		sbl_dev_dbg(sbl->dev, "%d: mt: Failed to detect with link partner!",
+			    port_num);
+	}
+
+	if (sbl_base_link_start_cancelled(sbl, port_num))
+		return -ECANCELED;
+	if (sbl_start_timeout(sbl, port_num))
+		return -ETIMEDOUT;
+
+	if (sig_ok_mask != serdes_mask) {
+		sbl_dev_dbg(sbl->dev,
+			    "p%ds<mask>0x%x: mt: SerDes signal ok not detected (timeout:%ds)",
+			    port_num, (serdes_mask & ~sig_ok_mask),
+			    sbl->link[port_num].blattr.lpd_timeout);
+		return -ETIME;
+	}
+
+	return err;
+}
+
+int sbl_serdes_config(struct sbl_inst *sbl, int port_num, bool allow_an)
+{
+	int err, encoding, divisor, width, serdes, j;
+	struct sbl_sc_values values = {0};
+	u16 result;
+	u32 rx_phase_slip_cnt;
+	u32 rx_phase_slip_reapply;
+	bool use_default_tx_eq, use_default_gs;
+	bool tx_en, rx_en, txo_en;
+
+	if (allow_an && (sbl->link[port_num].blattr.config_target != SBL_BASE_LINK_CONFIG_PEC)) {
+		sbl_dev_err(sbl->dev, "%d: AN allowed but has no config", port_num);
+		return -ENAVAIL;
+	}
+
+	/* Stop continuous tune */
+	err = sbl_port_stop_pcal(sbl, port_num);
+	if (err) {
+		sbl_dev_warn(sbl->dev, "%d: serdes config: stop pcal failed [%d]",
+			     port_num, err);
+		return err;
+	}
+
+	/* Handle requested speed */
+	if (allow_an) {
+		switch (sbl->link[port_num].blattr.pec.an_mode) {
+		case SBL_AN_MODE_FIXED:
+		case SBL_AN_MODE_ON:
+			encoding = SBL_ENC_NRZ;
+			divisor  = SBL_DIV_AN;
+			width    = SBL_WID_AN;
+			break;
+		case SBL_AN_MODE_OFF:
+		default:
+			sbl_dev_warn(sbl->dev, "%d: Unsupported an mode (%d)",
+				     port_num, sbl->link[port_num].blattr.pec.an_mode);
+			return -EINVAL;
+
+		}
+	} else {
+		switch (sbl->link[port_num].link_mode) {
+		case SBL_LINK_MODE_BJ_100G:
+			encoding = SBL_ENC_NRZ;
+			divisor  = SBL_DIV_25G;
+			width    = SBL_WID_25G;
+			break;
+		case SBL_LINK_MODE_CD_50G:
+		case SBL_LINK_MODE_CD_100G:
+		case SBL_LINK_MODE_BS_200G:
+			encoding = SBL_ENC_PAM4;
+			divisor  = SBL_DIV_50G;
+			width    = SBL_WID_50G;
+			break;
+		default:
+			sbl_dev_warn(sbl->dev, "%d: Unsupported link mode (%d)",
+				     port_num, sbl->link[port_num].link_mode);
+			return -EINVAL;
+		}
+	}
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		err = sbl_serdes_init(sbl, port_num, serdes, encoding,
+				      divisor, width);
+		if (err)
+			return err;
+	}
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		err = sbl_serdes_polarity_ctrl(sbl, port_num, serdes,
+					       encoding, allow_an);
+		if (err)
+			return err;
+	}
+
+	/* Set Rx Termination */
+	switch (sbl->link[port_num].blattr.link_partner) {
+	case SBL_LINK_PARTNER_SWITCH:
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+			      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+				continue;
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_INT_RX_TERM,
+						SPICO_INT_DATA_RXT_FLOAT, NULL,
+						SPICO_INT_VALIDATE_RESULT);
+			if (err)
+				return err;
+		}
+		break;
+	case SBL_LINK_PARTNER_NIC:
+	case SBL_LINK_PARTNER_NIC_C2:
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+			      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+				continue;
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_INT_RX_TERM,
+						SPICO_INT_DATA_RXT_AVDD, NULL,
+						SPICO_INT_VALIDATE_RESULT);
+			if (err)
+				return err;
+		}
+		break;
+	default:
+		sbl_dev_warn(sbl->dev, "p%d: Unsupported link partner mode (enum %d)!",
+			     port_num, sbl->link[port_num].blattr.link_partner);
+		return -EINVAL;
+	}
+
+	/* Handle requested loopback mode */
+	switch (sbl->link[port_num].loopback_mode) {
+	case SBL_LOOPBACK_MODE_LOCAL:
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+			      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+				continue;
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_LOOPBACK,
+						SPICO_INT_DATA_ILB, NULL,
+						SPICO_INT_VALIDATE_RESULT);
+			if (err)
+				return err;
+		}
+		break;
+	case SBL_LOOPBACK_MODE_REMOTE:
+	case SBL_LOOPBACK_MODE_OFF:
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+			      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+				continue;
+			err = sbl_serdes_spico_int(sbl, port_num, serdes,
+						   SPICO_INT_CM4_LOOPBACK,
+						SPICO_INT_DATA_ELB, NULL,
+						SPICO_INT_VALIDATE_RESULT);
+			if (err)
+				return err;
+		}
+		break;
+	default:
+		sbl_dev_warn(sbl->dev, "Unsupported loopback mode (enum %d)!",
+			     sbl->link[port_num].loopback_mode);
+		return -EINVAL;
+	}
+
+	/* Set port config values */
+	if (!allow_an) {
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+			      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+				continue;
+			use_default_tx_eq = false;
+			use_default_gs    = false;
+			err = sbl_get_serdes_config_values(sbl, port_num,
+							   serdes,
+								&values);
+			if (err) {
+				sbl_dev_warn(sbl->dev,
+						     "p%ds%d: Unable to read config list!",
+						     port_num, serdes);
+				use_default_tx_eq = true;
+				use_default_gs    = true;
+			}
+			/* Apply tx eq values */
+			if (!use_default_tx_eq) {
+				err = sbl_set_tx_eq(sbl, port_num, serdes,
+						    values.atten,
+							 values.pre,
+							 values.post,
+							 values.pre2,
+							 values.pre3);
+				if (err) {
+					sbl_dev_warn(sbl->dev,
+						     "Bad settings for port %d! Applying defaults.",
+						     port_num);
+					use_default_tx_eq = true;
+				}
+			}
+			if (use_default_tx_eq) {
+				err = sbl_set_tx_eq(sbl, port_num, serdes,
+						    SBL_DFLT_PORT_CONFIG_ATTEN,
+						 SBL_DFLT_PORT_CONFIG_PRE,
+						 SBL_DFLT_PORT_CONFIG_POST,
+						 SBL_DFLT_PORT_CONFIG_PRE2,
+						 SBL_DFLT_PORT_CONFIG_PRE3);
+				if (err) {
+					sbl_dev_err(sbl->dev, "Default serdes atten/pre/post settings failed!");
+					return err;
+				}
+			}
+			/* Apply gainshape values */
+			if (!use_default_gs) {
+				err = sbl_set_gs(sbl, port_num, serdes,
+						 values.gs1,
+						      values.gs2);
+				if (err) {
+					sbl_dev_warn(sbl->dev,
+						     "Bad gs1/gs2 settings for port %d! Applying defaults.",
+						     port_num);
+					use_default_gs = true;
+				}
+			}
+			if (use_default_gs) {
+				err = sbl_set_gs(sbl, port_num, serdes,
+						 SBL_DFLT_PORT_CONFIG_GS1,
+					      SBL_DFLT_PORT_CONFIG_GS2);
+				if (err) {
+					sbl_dev_err(sbl->dev,
+						    "Default serdes gainshape settings failed!");
+					return err;
+				}
+			}
+
+			if (values.num_intr) {
+				sbl_dev_dbg(sbl->dev,
+					    "p%ds%d: Applying %d interrupts",
+					port_num, serdes, values.num_intr);
+			}
+			for (j = 0; j < values.num_intr; ++j) {
+				sbl_dev_dbg(sbl->dev,
+					    "p%d: Applying interrupt 0x%x with data 0x%x",
+				port_num, values.intr_val[j],
+				values.data_val[j]);
+				err = sbl_serdes_spico_int(sbl, port_num,
+							   serdes, values.intr_val[j],
+						values.data_val[j], &result,
+						SPICO_INT_RETURN_RESULT);
+				if (err) {
+					sbl_dev_warn(sbl->dev,
+						     "p%ds%d: interrupt 0x%x data 0x%x failed!",
+						     port_num, serdes, values.intr_val[j],
+						     values.data_val[j]);
+				}
+				if (result != values.intr_val[j]) {
+					sbl_dev_dbg(sbl->dev,
+						    "p%ds%d: interrupt:0x%x data:0x%x result:0x%x != code:0x%x. This is okay in some cases.",
+						 port_num, serdes, values.intr_val[j], values.data_val[j], result, values.intr_val[j]);
+				}
+			}
+		}
+	}
+	/* TODO - Set PRBS here */
+
+	/* Set Tx Phase Cal */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_TX_PHASE_CAL,
+						SPICO_INT_DATA_TPCE, NULL,
+						SPICO_INT_VALIDATE_RESULT);
+		if (err)
+			return err;
+	}
+
+	/* Set Rx Phase Slip */
+	if (sbl->link[port_num].loopback_mode == SBL_LOOPBACK_MODE_LOCAL)
+		rx_phase_slip_reapply = 1;
+	else
+		rx_phase_slip_reapply = 0;
+
+	rx_phase_slip_cnt = sbl->iattr.rx_phase_slip_cnt;
+	if (rx_phase_slip_cnt > SPICO_INT_DATA_RX_PHASE_MAX) {
+		sbl_dev_warn(sbl->dev,
+			     "Invalid value for rx_phase_slip_cnt (0x%x). Setting to 0x%x",
+			 rx_phase_slip_cnt, SPICO_INT_DATA_RX_PHASE_MAX);
+		rx_phase_slip_cnt = SPICO_INT_DATA_RX_PHASE_MAX;
+	}
+	sbl_dev_dbg(sbl->dev, "p%d: rx_phase_slip_cnt: 0x%x", port_num,
+		    rx_phase_slip_cnt);
+	sbl_dev_dbg(sbl->dev, "p%d: rx_phase_slip_reapply: 0x%x", port_num,
+		    rx_phase_slip_reapply);
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_RX_PHASE_SLIP,
+						(rx_phase_slip_reapply << SPICO_INT_DATA_RXP_APPLY_OFFSET) |
+						(rx_phase_slip_cnt << SPICO_INT_DATA_RX_PHASE_OFFSET), NULL,
+						SPICO_INT_VALIDATE_RESULT);
+		if (err)
+			return err;
+	}
+
+	switch (sbl->link[port_num].loopback_mode) {
+	case SBL_LOOPBACK_MODE_LOCAL:
+		/* Disable TX and RX */
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			err = sbl_set_tx_rx_enable(sbl, port_num, serdes,
+						   false, false, false);
+			if (err)
+				return err;
+		}
+		break;
+	case SBL_LOOPBACK_MODE_REMOTE:
+	case SBL_LOOPBACK_MODE_OFF:
+		/* Disable TX */
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+				rx_en = true;
+			else
+				rx_en = false;
+			err = sbl_set_tx_rx_enable(sbl, port_num, serdes,
+						   false, rx_en, false);
+			if (err)
+				return err;
+		}
+		break;
+	default:
+		sbl_dev_warn(sbl->dev, "Unsupported loopback mode (enum %d)!",
+			     sbl->link[port_num].loopback_mode);
+		return -EINVAL;
+	}
+
+	msleep(20);
+
+	/* Enable tx on physical lane 0 - this has the clock for all serdes and
+	   is always required. */
+	/* rx based on link mode */
+	if (rx_serdes_required_for_link_mode(sbl, port_num, 0))
+		rx_en = true;
+	else
+		rx_en = false;
+	/* txo based on link mode */
+	if (get_serdes_tx_mask(sbl, port_num) & (1 << 0))
+		txo_en = true;
+	else
+		txo_en = false;
+	err = sbl_set_tx_rx_enable(sbl, port_num, 0,
+				   true, rx_en, txo_en);
+	if (err)
+		return err;
+
+	usleep_range(1000, 2000);
+
+	/* Enable lane 1 2 3 as needed */
+	for (serdes = 1; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			rx_en = true;
+		else
+			rx_en = false;
+		if (tx_serdes_required_for_link_mode(sbl, port_num, serdes)) {
+			tx_en = true;
+			txo_en = true;
+		} else {
+			tx_en = false;
+			txo_en = false;
+		}
+		err = sbl_set_tx_rx_enable(sbl, port_num, serdes,
+					   tx_en, rx_en, txo_en);
+		if (err)
+			return err;
+	}
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		if (sbl->link[port_num].blattr.tuning_pattern ==
+		    SBL_TUNING_PATTERN_CORE) {
+			err = sbl_set_tx_data_sel(sbl, port_num, serdes,
+						  SBL_DS_CORE);
+			if (err)
+				return err;
+		} else {
+			err = sbl_set_tx_data_sel(sbl, port_num, serdes,
+						  SBL_DS_PRBS);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
+int sbl_serdes_tuning(struct sbl_inst *sbl, int port_num)
+{
+	struct sbl_link *link = sbl->link + port_num;
+	int err = 0;
+	int serdes;
+	bool is_retune;
+	int j;
+
+	sbl_dev_dbg(sbl->dev, "SerDes tuning for port %d", port_num);
+
+	mutex_lock(&link->tuning_params_mtx);
+	if (!(link->blattr.options & SBL_OPT_FABRIC_LINK)) {
+		sbl_dev_dbg(sbl->dev,
+			    "p%d: Saved tuning params disabled for edge links",
+				port_num);
+		is_retune = false;
+	} else if (link->tune_param_oob_count >= SBL_MAX_TUNE_PARAM_OOB_FAILS) {
+		sbl_dev_dbg(sbl->dev,
+			    "p%d: Ignoring saved param load - too many params oob!",
+				port_num);
+		link->tune_param_oob_count = 0;
+		is_retune = false;
+	} else if ((link->blattr.options & SBL_OPT_USE_SAVED_PARAMS) &&
+			(link->loopback_mode != SBL_LOOPBACK_MODE_LOCAL) &&
+			!sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_USE_SAVED_TP)) {
+		is_retune = sbl_is_retune(sbl, port_num);
+	} else {
+		sbl_dev_dbg(sbl->dev,
+			    "p%d: Usage of saved tuning params is disabled!",
+				port_num);
+		is_retune = false;
+	}
+
+	if (is_retune) {
+		sbl_dev_dbg(sbl->dev, "p%d: Applying saved tuning params",
+			    port_num);
+		for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+			if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+				continue;
+			err = sbl_apply_serdes_tuning_params(sbl, port_num, serdes);
+			if (err) {
+				sbl_dev_err(sbl->dev, "p%ds%d: Failed to apply saved tuning params!",
+					    port_num, serdes);
+				mutex_unlock(&link->tuning_params_mtx);
+				return err;
+			}
+			sbl_dev_dbg(sbl->dev, "p%ds%d: saved tuning params applied", port_num, serdes);
+		}
+	} else {
+		sbl_dev_dbg(sbl->dev, "p%d: No saved tuning params found", port_num);
+	}
+	mutex_unlock(&link->tuning_params_mtx);
+
+	/* If we have applied saved params then the serdes should work straight away,
+	   we do not need to tune again. However we will start PCAL as normal.
+	   We mark the tune count to indicate we have done this */
+	if (is_retune) {
+		sbl_link_tune_zero_total_timespec(sbl, port_num);
+		link->dfe_tune_count = SBL_DFE_USED_SAVED_PARAMS;
+		link->serr = 0;
+
+		if (link->blattr.options & SBL_OPT_ENABLE_PCAL) {
+			if (sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_PCAL)) {
+				sbl_dev_warn(sbl->dev, "%d: pcal inhibited\n", port_num);
+			} else {
+				err = sbl_port_start_pcal(sbl, port_num);
+				if (err)
+					return err;
+			}
+		} else {
+			sbl_dev_warn(sbl->dev, "p%d PCAL is disabled with SerDes saved params enabled!", port_num);
+		}
+
+		return link->serr;
+	}
+
+	/* There is already a delay after starting (configuring) the serdes to allow the
+	   optics to lock..
+	   This extra delay is about waiting for the link partner to start as we currently
+	   have no way of knowing this */
+	if (link->blattr.dfe_pre_delay) {
+		sbl_dev_dbg(sbl->dev, "p%d: pre delay of %d seconds...", port_num,
+			    link->blattr.dfe_pre_delay);
+		link->dfe_predelay_active = true;
+		for (j = 0; j < link->blattr.dfe_pre_delay; ++j) {
+			if (sbl_base_link_start_cancelled(sbl, port_num)) {
+				link->dfe_predelay_active = false;
+				return -ECANCELED;
+			}
+			if (sbl_start_timeout(sbl, port_num)) {
+				link->dfe_predelay_active = false;
+				return -ETIMEDOUT;
+			}
+			msleep(1000);
+		}
+		link->dfe_predelay_active = false;
+	}
+
+	/* Try to tune, keep going unless error, cancelled, timeout
+	   or too many failed param checks.
+	   In the latter case this is possibly because the saved tuning
+	   params are not good and we keep tuning to a bad place. We therefore
+	   need to fail here and reset the serdes on the next cycle to clear out
+	   the current tuning params */
+	sbl_dev_dbg(sbl->dev, "p%d: DFE %stune starting", port_num,
+		    is_retune ? "re" : "");
+
+	sbl_link_tune_zero_total_timespec(sbl, port_num);
+	link->dfe_tune_count = -1;
+	while (true) {
+		link->dfe_tune_count++;
+		link->serr = sbl_port_dfe_tune(sbl, port_num, is_retune);
+
+		switch (link->serr) {
+		case 0:
+			sbl_dev_dbg(sbl->dev, "p%d: dfe %stune good\n", port_num,
+				    is_retune ? "re" : "");
+
+			/* Setup the current tuning params for next time */
+			if (link->blattr.options & SBL_OPT_DFE_SAVE_PARAMS) {
+				sbl_dev_dbg(sbl->dev, "p%d: Saving tuning params...", port_num);
+				mutex_lock(&link->tuning_params_mtx);
+				err = sbl_save_serdes_tuning_params(sbl, port_num);
+				if (err) {
+					sbl_dev_warn(sbl->dev, "p%d: Failed to save tuning params [%d]",
+						     port_num, err);
+					/* not a fatal error */
+				}
+				mutex_unlock(&link->tuning_params_mtx);
+				sbl_dev_dbg(sbl->dev, "p%d: Saved tuning params", port_num);
+			}
+
+			if (sbl->link[port_num].blattr.tuning_pattern ==
+			    SBL_TUNING_PATTERN_PRBS) {
+				for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+					if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+						continue;
+					err = sbl_set_prbs_rx_mode(sbl, port_num, serdes);
+					if (err)
+						return err;
+
+				}
+			}
+			goto out;
+
+		case -ELNRNG:   /* tuning params out of range */
+			if (link->tune_param_oob_count >= SBL_MAX_TUNE_PARAM_OOB_FAILS) {
+				sbl_dev_info(sbl->dev, "%d: too many params oob fails\n", port_num);
+				/* give up and return error
+				   The calling framework should reset the spico to delete any
+				   applied tuning params so we can do a full tune */
+				goto out;
+			}
+			fallthrough;
+
+		case -ETIME:    /* tuning did not complete */
+		case -ECHRNG:   /* eye heights bad */
+
+			/*  try to tune again */
+
+			break;
+
+		case -ECANCELED:
+			sbl_dev_dbg(sbl->dev, "p%d: %stune cancelled\n", port_num,
+				    is_retune ? "re" : "");
+			goto out;
+
+		case -ETIMEDOUT:
+			sbl_dev_dbg(sbl->dev, "p%d: %stune timed out\n", port_num,
+				    is_retune ? "re" : "");
+			goto out;
+
+		default:
+			sbl_dev_dbg(sbl->dev, "p%d: %stune failed [%d]\n", port_num,
+				    is_retune ? "re" : "", link->serr);
+			goto out;
+		}
+	}
+
+out:
+	sbl_dev_dbg(sbl->dev, "p%d: SerDes tuning complete", port_num);
+	return link->serr;
+}
+
+int sbl_spico_reset(struct sbl_inst *sbl, int port_num)
+{
+	int serdes;
+	int err = 0;
+	int pass;
+	u32 sbus_addr;
+	u32 sbus_ring;
+	u32 result[SBL_SERDES_LANES_PER_PORT];
+	unsigned long last_jiffy;
+
+	sbl_dev_dbg(sbl->dev, "p%d: spico reset start", port_num);
+
+	sbus_ring = sbl->switch_info->ports[port_num].serdes[0].sbus_ring;
+	if (mutex_is_locked(SBUS_RING_MTX(sbl, sbus_ring)))
+		sbl_dev_dbg(sbl->dev, "spico_reset: Sbus contention detected, sbus_ring_mtx[%d] locked", sbus_ring);
+
+	/* SBUS Critical Section */
+	mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));
+
+	/* Issue the reset */
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_PROC_RESET,
+				SPICO_INT_DATA_PROC_RESET, NULL,
+				SPICO_INT_IGNORE_RESULT);
+		if (err) {
+			mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+			sbl_dev_err(sbl->dev, "s%d: sbl_serdes_spico_int failed %d", sbus_ring, err);
+			return err;
+		}
+
+		/* Increment SPICO reset counter */
+		sbl_link_counters_incr(sbl, port_num, serdes0_spico_reset + serdes);
+	}
+
+	/* Check that each lane has been reset */
+	last_jiffy = jiffies + msecs_to_jiffies(SPICO_PROC_RESET_RETRY_TIMEOUT_MS);
+	pass = 0;
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		sbus_addr = SBUS_ADDR(sbl->switch_info->ports[port_num].serdes[serdes].sbus_ring,
+				      sbl->switch_info->ports[port_num].serdes[serdes].rx_addr);
+		do {
+			err = sbl_sbus_rd(sbl, sbus_addr,
+					  SBM_CRM_ADDR_PROC_STS,
+					       &result[serdes]);
+			if (err) {
+				mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+				return err;
+			}
+
+			if (!sbl->is_hw)
+				result[serdes] = SPICO_STATE_PAUSE;
+
+			if ((result[serdes] & SPICO_STATE_MASK) == SPICO_STATE_PAUSE) {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: SPICO reset PAUSE: pass %d",
+					    port_num, serdes, pass);
+				break;
+			} else if ((result[serdes] & SPICO_STATE_MASK) == SPICO_STATE_ERROR) {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: SPICO reset ERROR: pass %d",
+					    port_num, serdes, pass);
+				/* NOTE: I've seen the transition form ERROR -> PAUSE successfully */
+			} else {
+				sbl_dev_dbg(sbl->dev, "p%ds%d: SPICO reset OTHER 0x%x: pass %d",
+					    port_num, serdes, result[serdes], pass);
+			}
+			pass++;
+			/* No delay here, as we could miss the PAUSE state */
+		} while (time_is_after_jiffies(last_jiffy));
+
+	}
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
+		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
+			continue;
+		if ((result[serdes] & SPICO_STATE_MASK) != SPICO_STATE_PAUSE) {
+			sbl_dev_err(sbl->dev, "p%ds%d: SPICO reset failed! result: 0x%x after passes: %d",
+				    port_num, serdes, result[serdes], pass);
+			err = -ETIME;
+		}
+	}
+	if (err) {
+		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+		return -ETIME;
+	}
+
+	sbl->link[port_num].pcal_running = false;
+
+	mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
+
+	sbl_dev_dbg(sbl->dev, "p%d: spico reset done", port_num);
+	return 0;
+}
+
+
+#define SPICO_INT_DATA_PLL_RESET     0xffff
+
+int sbl_reset_serdes_plls(struct sbl_inst *sbl, int port_num)
+{
+	int serdes;
+	int err;
+
+	sbl_dev_info(sbl->dev, "p%d: resetting serdes PLLs", port_num);
+
+	for (serdes = 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
+		if (!rx_serdes_required_for_link_mode(sbl, port_num, serdes))
+			continue;
+
+		err = sbl_serdes_spico_int(sbl, port_num, serdes,
+					   SPICO_INT_CM4_DFE_CTRL,
+				SPICO_INT_DATA_PLL_RESET, NULL,
+				SPICO_INT_VALIDATE_RESULT);
+		if (err) {
+			sbl_dev_err(sbl->dev, "p%ds%d: serdes PLL reset failed!", port_num, serdes);
+			return err;
+		}
+
+		/* Increment PLL reset counter */
+		sbl_link_counters_incr(sbl, port_num, serdes0_pll_reset + serdes);
+	}
+
+	return 0;
+}
+

-- 
2.56.0

