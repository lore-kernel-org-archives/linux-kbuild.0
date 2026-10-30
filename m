Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394123;
	b=qZvr0aA1eK6TDCIWcHS7hz8rJgRsA48Gi3E0zTijFqJTw+TXAN6a/i37FM85HDMTsAL0
	 z0cwflKcyavAanrJ2Do3niEQ2Acx0Pi3fbFJaPZMO6H0tWBp6NHpWGtbjB2P4z1/o+daR
	 OIGoIauvCLZYPK8NLEt948/HBOIymOcK2ChtJiFCOlXwg5CnHuGJCwsqIRkLvcVE4QVCt
	 VUwH9sozaq/EnP1Cury+/FkSvgo/pXqeFNbPELpB1/ryh08cQqZRL1LJzos+GoXLuo4C5
	 vDV0IkGl+SaGa97u2R5WnBQB+ZGn9DkfOeu3If2Qtz6pdvaj/RSKJh0pxlHv9vMiIjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394123;
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
	bh=glYih1KdXSVlb7Y50F8ciAnEDKk1L+V1yqvFvcjQufo=;
	b=dKLacxjSizgJsXxSEg8tbVBr5J+41vvXE4DG8NK1l907zryqH4dKHgS44GNNepzLl1by
	 CoeEoJpUeF8umrJjzrvl6w062IUNQGiaUqR9xJPtVN8zGtxHLMD8eBk/W8wD16yISrQm+
	 BqOvxz42KZCxp6miOUDYZki03BT9jonnmazlUC5p8j388NyVTSUBLiIUzsiVChsWpheZk
	 NEPPrVaR4Wk38ANJhNWCc2IZIpGijz1dic0K8Cv8TxeGgNyyOVsoKxreGYfLAYr9Q9q3A
	 +/SLekrhXA4ZU6fZHLi/zsvqCFvusH2g09fW+A+OVkxDe8H1zzOXHa/vsQn0Vm7WAPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Zfd45EOi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A3F606B6C2;
	Fri, 30 Oct 2026 21:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16A3F606B6C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Zfd45EOi
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UKVufE974114;
	Fri, 30 Oct 2026 21:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=gl
	Yih1KdXSVlb7Y50F8ciAnEDKk1L+V1yqvFvcjQufo=; b=Zfd45EOiM+s7vTkmEf
	X8b0p99h9lgvyX6Z9MUYEa244/KB5VBDLMSbjmK/JpglO5KxfeVpCJdgN33TdTaD
	U8wDLbGQI9DauQ1efXybWu+3dDn+mzdosBPtRebad1gDBMFhVzJpBNTBYcxx/m38
	LMhGK8EgwFvJL8YtTjWFRpq3FGcNEcDketuKyc1qiA25HH3xyKlNqC6ya3IvhEfz
	t5YeMF/TWVPUAxf+/6nofKrQ6HKqtTHUM63NuAoT1FzqgqpUJ5adbsgldp0F1kef
	tVGTC0vHJJCUHx2Nlft2zhH+qWx6CTWYEDoYcNpx6p+Ti1iY9rJI1jEUiO5AI+wo
	6H6g==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hn28b0a98-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:01:40 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id E1AAB800EE0;
	Fri, 30 Oct 2026 21:01:38 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 09:01:26 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 09:01:26 -1200
Received: from BYAPR08CU003.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 09:01:25 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+ucTEKttiUTsqo7g+4fscrG7+LA86TIjIScbBbMzUCVQeJDi8caJYkCwAKBZoE8mnZtBN3mH4AtZCFW9pXFC54BVfnwZf+Nm40taVWdZO5lNa4JUGxBNZbHOVHwrkPp5+RxmHiyHxnDx7gbms1Mc+6W9GSyyWc1Ke2tG1QdnJf4t9wJZIPfN9qeMXQtsYkBxOBZd8gKizfKas5juLqMwOTWtpCJs6w1NuzQnbefAGfwdN6ybFx+mw4hHgnm+tRfSF0h3JzqpcIaJpEvNGiIof7J37L3PW7L/Q4kTUlB7Efq+dr+Ppq2nmsTYL3pFqH7VU46jlgGRy78q5N5qWTKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glYih1KdXSVlb7Y50F8ciAnEDKk1L+V1yqvFvcjQufo=;
 b=D/T7WAkZlrmvtLwcclCl46jp1pFGNOPrjyx82ZVUko/YrfHJeY9w82AH8kozwiJX3uGacsLDQyDwiRBPI9q72lrLt0v8LF+ZmskXjoyGx71aIHcd5mXQFs0C7m2dUsYtED4j4s/OGnqplMpnCkN9HFGxWlTUitJ6TgJSzTjEBntNdGhFsczfX22B4mT5pJykIi9YXzD3UW6yV+2oKtvKjtDmUZQTFKVLlLMZ0kBVdwi/GZP/WBMcozEnX/SU72X3XhYspOpFBAOneGPoDlMs29aZU5r7wA5DrdbGjTbq8Hke7cmdMiELM/iDoiT3/vXJHvuIzJgJ6Oz1aJBPaO9UfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by IA4PR84MB951192.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:207:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:01:23 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 21:01:23 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:59:19 -0700
Subject: [PATCH 23/23] net: hpe: wire up the Slingshot NIC drivers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-23-8c2c391cc283@hpe.com>
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
        <linux-kbuild@vger.kernel.org>, Doug Ledford <doug.ledford@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: MN0PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:208:52d::29) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 8e02afaa-cde4-4c16-7a58-08df36c8f43b
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|18002099003|22082099003|921020|56012099006|5023799004|261021121427099003|261028144727099003|261026121527099003|10067099003|261026140227099003|261022075727099003|261022105027099003|261021135927099003|261009223027099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: NU1pc5YS/hMDK8phzIo6/52SPj+2UOvAWOAa+zhRVQ8fv4ed4oqfj6CulAxC5byrUAOqKJ6OI+BBDBcWmjpgLwPj/GMZIPxgwhT2vXiHyhla4NAjEEsZ7wa+eKlMGj5eyzHiZYeiD9r+vWqBPpwbXb1SEip6nQW9r/+EuWvAR0PDCZh61LfSQGAGkhkXVvY9QcIy8Kvo5rGWLHdZM+lZ+Ro/2g9BOwTtv5OLFl9XiIFw1gFkjTikkyeUmF2coRYXBENDCifoiIEP0HV/HWd/+Z+vTlddT0+xuzbUAK/zY56SCr2KJqw+G2LctQv57V6bZ7OlxFWZBmud893qBY7Hxspn6NvvAsU5bci5rIUlW7sgjvYF6tR7aV+WLyGLEdVL2hvm2EHk7GXte8xpxQvv+/gy1qFhYM8KIWRkKWV+ULyGfw0hpvIvttfQTt3pY522+N299Pmnj33AJT6Bi6JGyodQaQyn/UA09rjn0Cl8eUlLdINjPRyOSKjogcx+6GuD0JKEIelFE1QTI99eTFFBX6JAnP6VzKM1VuM75Xa1Vzm9Uro+xp7HFmDYphAJKOSah8X728EjG0ZvPWt8P4w3MDXLC+Mhp8QYz2bkbvRzDL95eLDi8uB8CXXpLHFrdeRdAF26TUSG75vEDtuoiCJzf7oBu5iirN0RvHBtneHkMGMS4+TTlh2z5L/TPDVJuCXAk+3yuOAqAcmHTNQ6XsVCdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(5023799004)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021135927099003)(261009223027099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTAyT0RMV1pzbW8xSGdXSjBDZC9DeXJmckxuNVFlSFBVQ0U1YjJrSWJNZmNh?=
 =?utf-8?B?ck9hd1ZKRS9iYnlUdXd4ZlF3QjYzc1doNC84cE5kMHBxNlZORnk2SkVEbmRy?=
 =?utf-8?B?NFIvZXV2UWRjNjZodkdGc0hhNnZBQWZwWlBnZFZBK0FrUXAwUG00Y2E5NHRq?=
 =?utf-8?B?eDh0cHNDYVFnUlAvdVBweHI4cUx2L285KzFTa1RkUjE3TUxBL3czRXdGZm9L?=
 =?utf-8?B?Z0ZYZHQ1OUN6T2J3d0F0Zk5oTjEyQUpDbDZ3Mldqc1F1cW5zaTBQcmVRUHc2?=
 =?utf-8?B?OWNkbVd1TTRYaEgvTHJyZmZyM0U5dUpGczhQSExMRzJMWWhIN0o2Q1Z5RE5I?=
 =?utf-8?B?eUxRazBvL0RNR1FzN2tKL0FteTFnWThmV3lBVjNJcVFSZ29RWXpzckZ5SXpr?=
 =?utf-8?B?TzdMRC9PSmhPd2N3aTBwanE1WDhrNzFodDhzWWRSTDdabVZSeXFrODI5eEwr?=
 =?utf-8?B?RVpmN3lUZ1BDdmNXOGJNT0VEZDRNQmxBTFh2d3ZYREFxRytYQm5vQ0FWK21m?=
 =?utf-8?B?OFYwZEFMaUc3MHpYVExCbW9NdDlDK256cVF3cS9nVklhN3lhZmQ0SVREVVRP?=
 =?utf-8?B?dEFvMVhWUFc1cTBzYlBLYjhSSW02M09xTFlZRDV1bXBreDViRGF5Ris5Tllo?=
 =?utf-8?B?VVdHKytVMW9QTnI0WDhQWHZnUUxoTVhMU1FldlRRaFlBc3NGR3Z1WnU0MWg1?=
 =?utf-8?B?WDRsY1VuRGN2cWlEK1RjdVJTTmVNNmFGYjAzVi90QjdQemVmVWVCR21iRFpx?=
 =?utf-8?B?czg5ODNuMGEwNW9rUEROSlhPZzBPeHVUaXFROUdsVUo2QnVmaWxrYmZtWVRD?=
 =?utf-8?B?SUJVRk5QOGpOYXBqR2djaFIwejNpRDlXNDRuclZzY2MycUEzMllWeGV1d01j?=
 =?utf-8?B?TE51OVkrR1doS0tXVldFQVNrcUF4M2RCbWRMbk9uRFdaSUowL094YXR4bUMz?=
 =?utf-8?B?VjliYS9mMU0wTitvZ2dwMmRVOERRSDJ5Z016Z3BQYnlITEFyMWdLYmJsTDcx?=
 =?utf-8?B?NWRMQTJDMldRd3pETklmT0ZvU0g3NFRnbEtzWEZETityT0ZBZEh0WTNCSElJ?=
 =?utf-8?B?NFE1OFdxS0M5cDJ0c3Jma2QyRkVzcE9SRlNEVzdwMkRBR0VMVk9hVTYwNHov?=
 =?utf-8?B?QkdxOW0yN3h1MW5UREE1RWJzbFJrUS9xN2czY2ZlK2ZMS1NGd045Tk90NXRY?=
 =?utf-8?B?VzR5dHVkSXZEa1dCUDcyU1JvZ2FRTDNGcDVJYjZDa1Ezb2h6OTJBSVVvZDBM?=
 =?utf-8?B?WXBvU0lSQlZHeFNnYmxuYUFwYjJWME5ONWpvQ2hZbmZmcjlyTVNUbmNPakRn?=
 =?utf-8?B?TCtpUUFNWWI1OTZnc0lCNFpzL09wekczdVRGdDZqQnRJWS9CUmRhYnB5amJH?=
 =?utf-8?B?aEwyalNianRrTU1IV05YVVBQVFhRNDZ6MGpyZFpNV3kxVVRiQ1BFQkUwdXVp?=
 =?utf-8?B?eXBqdGxUUjN5d0p5NDVoQ2hsRGIwREZKWUt3RHFaclpGN3B3SEN1dWx3KzVt?=
 =?utf-8?B?a0Z0RXVJc09JVysyV3Y1TVNQMlYvcGk3NXo1RGVibnJRaDNtWGg5RkdBOFB4?=
 =?utf-8?B?Mm4vOVhqeUpoMk41YW12MzNBSE8rZWJjTnNVd2FQZzQ3bWxOL3NyTWRJUy95?=
 =?utf-8?B?UFJoemIrdU16Y3JvSTkzU0JIbkdMaGlESWtIVFkzNlJYY2pIUFhkL0RMMVls?=
 =?utf-8?B?RHRUQmt1bnhGT1YvaDhrYXEzVWNQSFlpdmxKbW00dnFaZDhMRkZVdzhHUEti?=
 =?utf-8?B?S0pHdXhPVzZOb0c4dlo0T0N5VnpIV2lDRGt3WVdaclRTdHlGOVZ4c2hJWG9t?=
 =?utf-8?B?UzFCNkExblFaaVRFZVVQT1p3YmhnZS9HWnAzR3g0Mk83a0pqcStCQ091WFJl?=
 =?utf-8?B?dENBR3hYSTlhSEJMWUlhV2RrZlVEcGtQaUZSQmZtbXkxbEJKQi9jYjRpeHpr?=
 =?utf-8?B?NjlqTDc2Ym5JUHNmcFdBa25lL0dLcHlDLzUxNDl1TkxUSmhYUVBLUkRValhG?=
 =?utf-8?B?eGNNQzRVdm9ZcEZSR1JSM3dFTUg2UjJGYzJwUmJ5dHMrQ3lWZUN0TjlOUmln?=
 =?utf-8?B?MGEvN0FUd2V3WmxNRXRmeHJKN3g0L1VxbFJmODk4a3Ura252L0RLMjRONG45?=
 =?utf-8?B?Z29mai8xNCtMSkVqWlFCUEJjbjdBZGUyNkE5cVNhcVovZUdUN3ZvZGtBUGIw?=
 =?utf-8?B?RHpmcGRpczcvVDRocWZLZDZ1SmdLQjJTSnR0NTJZcEZ2Q3hqbnp1amZERHZX?=
 =?utf-8?B?cTk4SmpVcktZL1JYdWNEOU02bnVJNFVjV3pRS3NpNmUvUUhyVU5yQytUb2Fi?=
 =?utf-8?B?MW9qWE5LM3dNZUl6WThteVNzTHJmMHJIT3FnN3pSZm1zMmh5TVAwdz09?=
X-Exchange-RoutingPolicyChecked: JHftUfgsUFVzEWCLtQ1HAmDDqYljJxTZgdfW35LcdF+ld5qz31J4RCUp07bEiJ+GkKHruDpeSE2DOLxiQzRgSLJlKGQu1gGjjlg5B2afJQVfS6sX2ahL5l2pRU1Myzcq6C6t5VmrlY9m8MiVowZgpU20Qjr1YAbb50uxRslhqGjxKCNlYsj4h8SwI834ov82WH2yvIW5GnGwBCWXUhNvBtv1wszOxKKSRTaJxOw1WbHXL2mxFKlZ+x7WJ/B3Xy5x138t9uxLSjTxWsvVAm20xwCFqaHG+NwA5jkhaACYB9D5w8utlr//O+iEqQu1O6EFHA3VAUWtI6fr6lsFvu1Hlg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e02afaa-cde4-4c16-7a58-08df36c8f43b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:01:23.1355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/GSTbWVfXXrfCBZlQ0W0rX4VWAknck4fTZBxEcGXgjJVFTnaBKhEkVBi50h70DRyjmf0rz8os0oEJ8CRu3lfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR84MB951192
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXyfPi2Wuuonoe
 b01/+EsBezhS86PrSaHspZ3++uLffMCXjra73/IpD6tfTT7m9Yd53q9bjLJR1AgonDGxRIj/jQZ
 kFfBYeGCTwDpQmudi9CGAfJj65WUTNGB9UQ0PA8qWbKTJGjQ/QA1hNvaro8aJ2wLyofzt9tdnlN
 pqHRio1DBOgOX6C2rnmRJbm+58sVze5UnbBfOTayYeTlAphLkmkXwDmdcd4T1XtJCJDm8kJEQyg
 kvKlxPTdxmEsJdc87mgcX7G28++oDpKQdmbxThWct0EEoKy+ZDPGl8Aag08iviChlA50BwGEy9w
 5fBI/Q8eTgL9lMfE6or69YURplrUbtKMU+0K5gSEHzUEWUNmHxGYysUwdYezbxP3Vth8olV4VWd
 7tcgsWzNHnStq7APhQaleacjueYPOti81qVEIZDfgPLDWDze7cOK1EV6QptkxqW33KHXSpL5/98
 cadGaGOJWEq0/RuBvRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfX3wW54osXGFou
 xhbrZkiCKofplpmJMcZTf7zVIRuruI4IXCycgXavNC08rCh+OPhgYhjDLPVkUBh/CeohQID6ulX
 khBjynvLB0eONnR5SokarCR46EGsrg8=
X-Proofpoint-ORIG-GUID: _5Pjn1F6N2jndptphOJY02j9xQUQeVif
X-Authority-Analysis: v=2.4 cv=P8+vFSAu c=1 sm=1 tr=0 ts=6ae505b4 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=ZSrvDirOKP4VPF05hnFf:22 a=MvuuwTCpAAAA:8 a=VwQbUJbxAAAA:8 a=XYAwZIGsAAAA:8
 a=8LlqpicVDpu9xyEvNHUA:9 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: _5Pjn1F6N2jndptphOJY02j9xQUQeVif
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Hook the SBL, SL and SS1 drivers into the build and add the MAINTAINERS
entry.

 - NET_VENDOR_HPE gates the vendor menu; CONFIG_HPE_SS1 builds cxi-ss1
   (the core driver) and cxi-eth (the Ethernet personality) and
   selects HPE_SBL (cxi-sbl, 200 Gb/s link) and HPE_SL (cxi-sl, 400 Gb/s
   link), because the core driver picks the link layer at run time
   according to the NIC generation
 - the module names keep the cxi- prefix used by the existing user
   space tools and udev rules

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- WARNING: MAINTAINERS_STYLE (1)

Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 MAINTAINERS                           |   7 ++
 drivers/net/ethernet/Kconfig          |   1 +
 drivers/net/ethernet/Makefile         |   1 +
 drivers/net/ethernet/hpe/Kconfig      |  26 +++++++
 drivers/net/ethernet/hpe/Makefile     |   8 ++
 drivers/net/ethernet/hpe/sbl/Kconfig  |  15 ++++
 drivers/net/ethernet/hpe/sbl/Makefile |  21 +++++
 drivers/net/ethernet/hpe/sl/Kconfig   |  15 ++++
 drivers/net/ethernet/hpe/sl/Makefile  | 140 ++++++++++++++++++++++++++++++++++
 drivers/net/ethernet/hpe/ss1/Kconfig  |  35 +++++++++
 drivers/net/ethernet/hpe/ss1/Makefile |  28 +++++++
 11 files changed, 297 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7336600952c8..4974717d22c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11608,6 +11608,13 @@ S:	Supported
 F:	Documentation/watchdog/hpwdt.rst
 F:	drivers/watchdog/hpwdt.c
 
+HEWLETT PACKARD ENTERPRISE SLINGSHOT NIC DRIVER
+M:	Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	include/linux/hpe
+F:	drivers/net/ethernet/hpe
+
 HEWLETT-PACKARD SMART ARRAY RAID DRIVER (hpsa)
 M:	Don Brace <don.brace@microchip.com>
 L:	storagedev@microchip.com
diff --git a/drivers/net/ethernet/Kconfig b/drivers/net/ethernet/Kconfig
index c2b0161d0bec..c6f3c722ca98 100644
--- a/drivers/net/ethernet/Kconfig
+++ b/drivers/net/ethernet/Kconfig
@@ -65,6 +65,7 @@ source "drivers/net/ethernet/freescale/Kconfig"
 source "drivers/net/ethernet/fungible/Kconfig"
 source "drivers/net/ethernet/google/Kconfig"
 source "drivers/net/ethernet/hisilicon/Kconfig"
+source "drivers/net/ethernet/hpe/Kconfig"
 source "drivers/net/ethernet/huawei/Kconfig"
 source "drivers/net/ethernet/i825xx/Kconfig"
 source "drivers/net/ethernet/ibm/Kconfig"
diff --git a/drivers/net/ethernet/Makefile b/drivers/net/ethernet/Makefile
index a306dae23bcb..65e00a93049b 100644
--- a/drivers/net/ethernet/Makefile
+++ b/drivers/net/ethernet/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_NET_VENDOR_FREESCALE) += freescale/
 obj-$(CONFIG_NET_VENDOR_FUNGIBLE) += fungible/
 obj-$(CONFIG_NET_VENDOR_GOOGLE) += google/
 obj-$(CONFIG_NET_VENDOR_HISILICON) += hisilicon/
+obj-$(CONFIG_NET_VENDOR_HPE) += hpe/
 obj-$(CONFIG_NET_VENDOR_HUAWEI) += huawei/
 obj-$(CONFIG_NET_VENDOR_IBM) += ibm/
 obj-$(CONFIG_NET_VENDOR_INTEL) += intel/
diff --git a/drivers/net/ethernet/hpe/Kconfig b/drivers/net/ethernet/hpe/Kconfig
new file mode 100644
index 000000000000..c43172a62cf6
--- /dev/null
+++ b/drivers/net/ethernet/hpe/Kconfig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# HPE/Cray driver configuration
+# Copyright 2025 Hewlett Packard Enterprise Development LP
+
+config NET_VENDOR_HPE
+	bool "Hewlett Packard Enterprise/Cray devices"
+	default n
+	depends on PCI
+	help
+	  If you have a network (Ethernet or RDMA) manufactured by HPE/Cray,
+	  say Y.
+
+	  Note that the answer to this question doesn't directly affect the
+	  kernel: saying N will just cause the configurator to skip all
+	  the questions about HPE cards. If you say Y, you will be asked
+	  for your specific card in the following questions.
+
+if NET_VENDOR_HPE
+
+source "drivers/net/ethernet/hpe/sbl/Kconfig"
+source "drivers/net/ethernet/hpe/sl/Kconfig"
+source "drivers/net/ethernet/hpe/ss1/Kconfig"
+
+
+endif # NET_VENDOR_HPE
diff --git a/drivers/net/ethernet/hpe/Makefile b/drivers/net/ethernet/hpe/Makefile
new file mode 100644
index 000000000000..692886cac9ef
--- /dev/null
+++ b/drivers/net/ethernet/hpe/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for HPE/Cray device drivers.
+# Copyright 2025 Hewlett Packard Enterprise Development LP
+
+obj-$(CONFIG_HPE_SBL)	+= sbl/
+obj-$(CONFIG_HPE_SL)	+= sl/
+obj-$(CONFIG_HPE_SS1)	+= ss1/
diff --git a/drivers/net/ethernet/hpe/sbl/Kconfig b/drivers/net/ethernet/hpe/sbl/Kconfig
new file mode 100644
index 000000000000..929224e44a43
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+#
+# Slingshot base link module Kconfig
+#
+
+config HPE_SBL
+	tristate "HPE/Cray Slingshot 200Gbs Link Support"
+	depends on HPE_SS1
+	help
+	  Compile the cxi-sbl module, which provides link management support
+	  for Slingshot 200Gbs devices/fabrics.
+
+	  The cxi-ss1 driver automatically enables this driver whenever
+	  it is enabled.
diff --git a/drivers/net/ethernet/hpe/sbl/Makefile b/drivers/net/ethernet/hpe/sbl/Makefile
new file mode 100644
index 000000000000..9f61e04fe7bf
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/Makefile
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Slingshot base link 200Gbs module
+#
+
+subdir-ccflags-y := -I$(src)
+
+obj-$(CONFIG_HPE_SBL)	:= cxi-sbl.o
+
+# These base modules work for both NIC and Switch parts
+cxi-sbl-$(CONFIG_HPE_SBL)	:= sbl_pml_pcs.o sbl_link.o \
+	sbl_link_an.o sbl_media.o sbl_pml.o sbl_pml_mac.o \
+	sbl_pml_llr.o sbl_timers.o sbl_debug.o sbl_serdes_fn.o \
+	sbl_test.o sbl_sbm_serdes.o sbl_counters.o sbl_fec.o \
+	sbl_serdes.o sbl_inst.o sbl_pml_serdes_op.o sbl_misc.o \
+	sbl_internal.o
+# Everything after here is specific to NICs
+cxi-sbl-$(CONFIG_HPE_SBL)	+= \
+	sbl_pml_pcs_nic.o sbl_module_nic.o sbl_link_nic.o \
+	sbl_media_nic.o sbl_inst_nic.o sbl_sbm_serdes_nic.o \
+	sbl_fec_nic.o sbl_link_an_nic.o sbl_pml_llr_nic.o
diff --git a/drivers/net/ethernet/hpe/sl/Kconfig b/drivers/net/ethernet/hpe/sl/Kconfig
new file mode 100644
index 000000000000..2935fec855f8
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+#
+# Slingshot link 400Gbs module Kconfig
+#
+
+config HPE_SL
+	tristate "HPE/Cray Slingshot 400Gbs Link Support"
+	depends on HPE_SS1
+	help
+	  Compile the cxi-sl module, which provides link management support
+	  for Slingshot 400Gbs devices/fabrics.
+
+	  The cxi-ss1 driver automatically enables this driver whenever
+	  it is enabled.
diff --git a/drivers/net/ethernet/hpe/sl/Makefile b/drivers/net/ethernet/hpe/sl/Makefile
new file mode 100644
index 000000000000..1930da475e59
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sl/Makefile
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Slingshot base link 400Gbs module makefile
+#
+
+CAS_DEFINES := -DCONFIG_SL_BUILD_NAME="cassini" -DSL_NAME=cxi-sl
+
+subdir-ccflags-y += -I$(src) -I$(src)/nic -I$(src)/core/hw/nic \
+	-I$(src)/log -I$(src)/media -I$(src)/ctrl -I$(src)/sysfs \
+	-I$(src)/core $(CAS_DEFINES)
+
+obj-$(CONFIG_HPE_SL)	:= cxi-sl.o
+
+# These base modules work for both NIC and Switch parts
+cxi-sl-$(CONFIG_HPE_SL)	:= sl_module.o sl_ldev.o sl_lgrp.o sl_link.o \
+	sl_llr.o sl_mac.o sl_media.o sl_fec.o
+cxi-sl-$(CONFIG_HPE_SL)	+= media/sl_media_lgrp.o \
+	media/sl_media_ldev.o \
+	media/sl_media_jack.o \
+	media/data/sl_media_data_ldev.o \
+	media/data/sl_media_data_lgrp.o \
+	media/data/sl_media_data_lgrp_trace.o \
+	media/data/sl_media_data_jack.o \
+	media/data/sl_media_data_cable_db_ops.o \
+	media/base/sl_media_eeprom.o
+cxi-sl-$(CONFIG_HPE_SL)	+= core/sl_core_ldev.o \
+	core/sl_core_lgrp.o \
+	core/sl_core_link.o \
+	core/sl_core_link_an.o \
+	core/sl_core_link_fec.o \
+	core/sl_core_mac.o \
+	core/sl_core_llr.o \
+	core/sl_core_str.o \
+	core/base/sl_core_timer_link.o \
+	core/base/sl_core_timer_llr.o \
+	core/data/sl_core_data_ldev.o \
+	core/data/sl_core_data_lgrp.o \
+	core/data/sl_core_data_lgrp_trace.o \
+	core/data/sl_core_data_link.o \
+	core/data/sl_core_data_llr.o \
+	core/data/sl_core_data_mac.o \
+	core/hw/sl_core_hw_intr.o \
+	core/hw/sl_core_hw_intr_llr.o \
+	core/hw/sl_core_hw_sbus.o \
+	core/hw/sl_core_hw_pmi.o \
+	core/hw/sl_core_hw_sbus_pmi.o \
+	core/hw/sl_core_hw_uc_ram.o \
+	core/hw/sl_core_hw_serdes.o \
+	core/hw/sl_core_hw_serdes_fw.o \
+	core/hw/sl_core_hw_serdes_core.o \
+	core/hw/sl_core_hw_serdes_link.o \
+	core/hw/sl_core_hw_serdes_lane.o \
+	core/hw/sl_core_hw_serdes_lane_tx.o \
+	core/hw/sl_core_hw_serdes_lane_rx.o \
+	core/hw/sl_core_hw_link.o \
+	core/hw/sl_core_hw_an.o \
+	core/hw/sl_core_hw_an_lp.o \
+	core/hw/sl_core_hw_an_up.o \
+	core/hw/sl_core_hw_pcs.o \
+	core/hw/sl_core_hw_mac.o \
+	core/hw/sl_core_hw_llr.o \
+	core/hw/sl_core_hw_reset.o
+
+cxi-sl-$(CONFIG_HPE_SL)	+= ctrl/sl_ctrl_ldev.o \
+	ctrl/sl_ctrl_lgrp.o \
+	ctrl/sl_ctrl_lgrp_notif.o \
+	ctrl/sl_ctrl_link.o \
+	ctrl/sl_ctrl_link_priv.o \
+	ctrl/sl_ctrl_link_fec.o \
+	ctrl/sl_ctrl_link_fec_priv.o \
+	ctrl/sl_ctrl_link_counters.o \
+	ctrl/sl_ctrl_mac.o \
+	ctrl/sl_ctrl_mac_counters.o \
+	ctrl/sl_ctrl_llr.o \
+	ctrl/sl_ctrl_llr_counters.o \
+	ctrl/sl_ctrl_media_counters.o \
+	ctrl/data/sl_ctrl_data_lgrp.o \
+	ctrl/data/sl_ctrl_data_lgrp_trace.o \
+	ctrl/data/sl_ctrl_data_link.o \
+	ctrl/data/sl_ctrl_data_llr.o
+
+cxi-sl-$(CONFIG_HPE_SL)	+= log/sl_log.o \
+	sysfs/sl_sysfs_ldev.o \
+	sysfs/sl_sysfs_lgrp.o \
+	sysfs/sl_sysfs_lgrp_policy.o \
+	sysfs/sl_sysfs_lgrp_config.o \
+	sysfs/sl_sysfs_link.o \
+	sysfs/sl_sysfs_link_policy.o \
+	sysfs/sl_sysfs_link_fec_mon_check.o \
+	sysfs/sl_sysfs_link_fec_up_check.o \
+	sysfs/sl_sysfs_link_config.o \
+	sysfs/sl_sysfs_link_degrade.o \
+	sysfs/sl_sysfs_link_pml_rec.o \
+	sysfs/sl_sysfs_link_caps.o \
+	sysfs/sl_sysfs_link_fec.o \
+	sysfs/sl_sysfs_link_fec_current.o \
+	sysfs/sl_sysfs_link_fec_up.o \
+	sysfs/sl_sysfs_link_fec_down.o \
+	sysfs/sl_sysfs_link_counters.o \
+	sysfs/sl_sysfs_pmi.o \
+	sysfs/sl_sysfs_pmi_rd.o \
+	sysfs/sl_sysfs_pmi_wr.o \
+	sysfs/sl_sysfs_sbus.o \
+	sysfs/sl_sysfs_sbus_rd.o \
+	sysfs/sl_sysfs_sbus_wr.o \
+	sysfs/sl_sysfs_sbus_rst.o \
+	sysfs/sl_sysfs_sbus_pmi.o \
+	sysfs/sl_sysfs_sbus_pmi_rd.o \
+	sysfs/sl_sysfs_sbus_pmi_wr.o \
+	sysfs/sl_sysfs_serdes.o \
+	sysfs/sl_sysfs_serdes_settings.o \
+	sysfs/sl_sysfs_serdes_eye.o \
+	sysfs/sl_sysfs_serdes_lol.o \
+	sysfs/sl_sysfs_serdes_los.o \
+	sysfs/sl_sysfs_serdes_state.o \
+	sysfs/sl_sysfs_serdes_swizzle.o \
+	sysfs/sl_sysfs_llr.o \
+	sysfs/sl_sysfs_llr_config.o \
+	sysfs/sl_sysfs_llr_counters.o \
+	sysfs/sl_sysfs_llr_policy.o \
+	sysfs/sl_sysfs_llr_loop_time.o \
+	sysfs/sl_sysfs_mac.o \
+	sysfs/sl_sysfs_mac_counters.o \
+	sysfs/sl_sysfs_media.o \
+	sysfs/sl_sysfs_media_counters.o
+
+# Everything after here is specific to NICs
+cxi-sl-$(CONFIG_HPE_SL)	+= nic/sl_ldev.o nic/sl_media.o \
+	media/nic/sl_media_io.o media/nic/sl_media_jack.o \
+	media/nic/sl_media_ldev.o \
+	media/data/nic/sl_media_data_ldev.o \
+	media/data/nic/sl_media_data_jack.o \
+	media/data/nic/sl_media_data_jack_emu.o \
+	core/hw/nic/sl_core_hw_fec.o \
+	core/hw/nic/sl_core_hw_llr.o \
+	core/hw/nic/sl_core_hw_an.o \
+	core/hw/nic/sl_core_hw_mac.o \
+	core/hw/nic/sl_core_hw_pcs.o \
+	core/data/nic/sl_core_data_link.o \
+	core/data/nic/sl_core_data_mac.o
diff --git a/drivers/net/ethernet/hpe/ss1/Kconfig b/drivers/net/ethernet/hpe/ss1/Kconfig
new file mode 100644
index 000000000000..d154506749d1
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/Kconfig
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Kernel config for HPE/Cray Net Cassini Slingshot 200/400Gbs hardware
+# Copyright 2025 Hewlett Packard Enterprise Development LP
+
+config HPE_SS1
+	tristate "HPE/Cray Slingshot 200/400Gbs NIC driver"
+	depends on PCI && ETHERNET && NETDEVICES && INET
+	depends on (ARM64 && CPU_LITTLE_ENDIAN) || X86_64
+	select HPE_SBL
+	select HPE_SL
+	select CONFIGFS_FS
+	select AUXILIARY_BUS
+	help
+	  Core and Ethernet driver for the HPE/Cray Cassini network
+	  interface cards, used with Slingshot 200 and 400 Gbs fabrics.
+
+	  This builds the cxi-ss1 core driver and the cxi-eth Ethernet
+	  personality. The link layer modules cxi-sbl (200 Gbs) and
+	  cxi-sl (400 Gbs) are selected as well. Other drivers, such as
+	  the CXI RDMA driver, attach to cxi-ss1 as auxiliary devices.
+
+	  To compile this driver as modules, choose M here: the modules
+	  will be called cxi-ss1 and cxi-eth. If unsure, say N.
+
+config HPE_SS1_P2P_DMABUF
+	bool "Enable Peer-2-Peer dmabuf support"
+	depends on HPE_SS1 && PCI_P2PDMA
+	help
+	  Enable PCI Peer-2-Peer dmabuf support. This allows the NIC to
+	  DMA directly to and from device memory, such as GPU memory,
+	  that is exported through dma-buf, without staging it in
+	  host memory. It requires a PCI P2P DMA capable platform.
+
+	  If unsure, say N.
diff --git a/drivers/net/ethernet/hpe/ss1/Makefile b/drivers/net/ethernet/hpe/ss1/Makefile
new file mode 100644
index 000000000000..538ac762cff2
--- /dev/null
+++ b/drivers/net/ethernet/hpe/ss1/Makefile
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for HPE/Cray Net Cassini Slingshot version 200/400Gbs hardware
+# Copyright 2025 Hewlett Packard Enterprise Development LP
+
+subdir-ccflags-y += -I$(src)
+
+obj-$(CONFIG_HPE_SS1) += cxi-ss1.o cxi-eth.o
+
+cxi-ss1-objs := cxi_core.o cass_core.o cass_lni.o cass_rmu.o cass_eq.o \
+		cass_cpt.o cass_cq.o cass_pt.o cass_atu.o cass_ct.o \
+		cass_errors.o cass_sriov.o cass_nta.o cass_ptp.o \
+		cass_hni.o cass_eth.o cass_rmu_eth.o cass_ats.o cass_uc.o \
+		cass_hmm.o cxi_qos_profiles.o cass_tc.o cass_svc.o \
+		cass_telem.o cxi_link.o cass_sbl.o cass_sl.o \
+		cass_sl_io.o cass_sysfs.o cass_sbus.o cass_phy.o \
+		cass_dmac.o cass_link.o cass_link_misc.o cass_port_misc.o \
+		cass_lmon.o cass_ixe.o cass_irq.o cass_cable.o \
+		cass_odp_decouple.o cass_ats_inval.o cass_pcie_mon.o \
+		cxi_ac_entry_list.o cass_dev_info.o cxi_rxtx_profile_list.o \
+		cass_rx_tx_profile.o cxi_rxtx_profile.o cxi_config.o \
+		cxi_rx_profile.o cxi_tx_profile.o \
+		cass_rgroup.o cxi_rgroup.o cass_rgid.o cxi_aux_dev.o cass_vf_notif.o \
+		cass_vf.o
+cxi-ss1-$(CONFIG_DEBUG_FS) += cass_ss1_debugfs.o
+cxi-ss1-$(CONFIG_HPE_SS1_P2P_DMABUF) += cass_p2p.o cass_dma_buf.o
+cxi-eth-objs := cxi_eth.o cxi_eth_ops.o cxi_ethtool.o cxi_eth_ioctl.o
+cxi-eth-$(CONFIG_DEBUG_FS) += cxi_eth_debugfs.o

-- 
2.56.0

