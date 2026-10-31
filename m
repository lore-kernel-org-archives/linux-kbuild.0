Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793475350;
	b=PINg5kP2vrZHdxdbXhHXPymELLNUo9GQHEfUPzuMcpuWfLdEpEFZ/JHBx+hrvGCx0uf7
	 Ufh7WxX8TL73Qa29Zjx4qIUxmPli1MoTve3uiDXjKf8h8hFOlbixdou1xhYPEQ19O9CJ+
	 mMKo226TC2sc4SdVRFLr1x8tMb4T2nBGxUQK12Uqp6t+kIknUhkcz36fP10ZlGi6zPvs6
	 XcYWIUfNCzC9QTSmd8XRvsurMmohJQGIx974OcfJA0kT99GiVy6MrxkUAKz6bQK9QcvHY
	 qIzztjGU1cq/Pbze67vAPuNF+WXKm7HdvCBeg+JlrgRiNE9IEwmq1pjpvxzIhRYd5sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793475350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:Content-Language:From:Organization:
	 In-Reply-To:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p2HtxLFBnwMjP9gbL2jR18iWAgLrPByZNsro+UUPkVo=;
	b=hvfGm9YLivU4m5uE3k6aMWBO8Kf6dsqwrnV1dLbfkvjwrDmRa83/Pp8nPoBENvaJGvRN
	 dFWhsRmImO7JBf0D/gp0v2Kdssuh9NLcafAQGHgb5GsOD1Y4QZZuOH9XttTpWGE+xwImQ
	 je9xEHDh2OHVczCYv+R/8OWBmyWXvmyOYKtcu8EWeohOVk5IxKrxJaUl7Pg3U/Jfsojbr
	 IfqDZbLj3b8O4Xy8ezN1CzKQU/l/bdvGKiuvugQZ1D0TQQUZa+sn1HPIIp4OmK/3M0C3z
	 Ofr3QA6Hg0E1K8ede7piEJYIosrzJoO9kLIdTeG2NrxAodyWDcJqdDk2tvLEiv/LkQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=GV+FZ1Bm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.147.86
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93071606A31A;
	Sat, 31 Oct 2026 19:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93071606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=GV+FZ1Bm
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJEp8o4164462;
	Sat, 31 Oct 2026 19:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps0720; bh=p2HtxLFBnwMjP9gbL2jR18iWAg
	LrPByZNsro+UUPkVo=; b=GV+FZ1BmG+0U5zDeufG/qMq32ZmNhVdb6Xa4yX02w/
	aomyyx9GHwuOe9/3v2GQZKuGXYBl8LV0H4Hs2g6pdqpXUEWE+Uov35VUjzZv0ShD
	s30vtFXKd/xOEwOTKf1QhT/s7r6su+X2ifksQo3Fzn7tcvcB+owgFhcC8ZL2OGdk
	PA8gUNC2FuRVibt4oa1b84v1fEZ8tzIoWLfgbW2L1kn1Q8Ds+Ij+ZqMblIkolFcJ
	9tima9pStdRS3Yza3UtB3iQtwVJ6i2OJAtXk9dHAMDskkJOx8ov3Xlq3/XJRPCim
	f721oilvr5VdgnYI0kTjpi8eLuhEYjk80tLg0LaX2qtQ==
Received: from p1lg14881.it.hpe.com (p1lg14881.it.hpe.com [16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hn9qewhmf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 31 Oct 2026 19:35:20 +0000 (GMT)
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id 8AB378047AC;
	Sat, 31 Oct 2026 19:35:19 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 31 Oct 2026 07:35:13 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sat, 31 Oct 2026 07:35:07 -1200
Received: from DM2PR0701CU001.outbound.protection.outlook.com (192.58.206.35)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 31 Oct 2026 19:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=en/PxQ/RF851NWYtQK2PQz7byxp0Q9/dFMGsm5nvFga/26zDfuDETSkw/tr0y6G55TQveOzdXQWkmXzjyvXhG36XdpcF0cyuu4Hx8OQRcpipSChx3T/y1c4x1dlGcU/nCWdWCXL0gSFR+roVCk+v9pIleIbJtD/v4fjrVW+SR4X8AlCT785p6Kk36osJmpLb09P6DQLBsvMWbeUFhmiQN843d7M0eBwUx8WcYBFexwkEovm2lJ/A2JHRwUoHMBHtU1X6ffJkbh0K5aZOPgu+P+OL5biquZ3UEs0A8iSf2Mecr1NWcrAkutYvBhnJ1FroW/9bVjrNddEknNSuxSSbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2HtxLFBnwMjP9gbL2jR18iWAgLrPByZNsro+UUPkVo=;
 b=vGFIYRCVMGLU5hfRJ9o55USAOg0+DI4UNwnyAqypsq2kC4KRloZo/NwzZCH1NAaOUViG4to3TRB3Fdup2OZqd6AGMjzEB2ck4uoT+k8ML+RSnZpX3FYMy4r/2T5BHy+C+ClagfzMrSGn1AgNybUn0YG0pFW9gDQxbrnzUPLehab+642IyxXFCTVPE8mZ1Zrhl/yKmgaCiIvfTTOzq+QH/3kGkdfnaBm9V1bmncEV9+ybGUxRb0DVuu9o4M5z8XzzOc+7tQ0CHWJC3TU/jG118g2TlQ24bHkBNzyeGQGTAufXJnjBmnOaeh+6g+0BLsUoB/UpxkofeSKoR8M8KZS83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by MW5PR84MB1891.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sat, 31 Oct
 2026 19:35:03 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.010; Sat, 31 Oct 2026
 19:35:03 +0000
Message-ID: <7305d93b-2130-4a76-8c08-0b2a36b66ea7@hpe.com>
Date: Sat, 31 Oct 2026 12:34:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] net: hpe: ss1: add the Cassini headers
To: Andrew Lunn <andrew@lunn.ch>
CC: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Guenter Roeck <linux@roeck-us.net>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
        Sandeep Bhoot <sandeep.bhoot@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-1-8c2c391cc283@hpe.com>
 <531c7d63-548f-467e-95df-187214ff344d@lunn.ch>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <531c7d63-548f-467e-95df-187214ff344d@lunn.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IHXzlZg3f8asfvxU9D3bHoOy"
X-ClientProxiedBy: CH0PR03CA0414.namprd03.prod.outlook.com
 (2603:10b6:610:11b::32) To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: DM4PR84MB3970:EE_|MW5PR84MB1891:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6c7af1-8683-40ce-09ea-08df37860f1c
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|4143699003|56012099006|261009223027099003|261028144727099003|261026121527099003|261021121427099003|261021123027099003|261021135927099003|261021130227099003|261022105027099003|261026140227099003|261022115727099003|261022075727099003|261022113327099003|261026130827099003|10067099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 7OUm5hV9hrOY9zFIWVsjEhtwmgOK+i6FqMSD1YahC5Q32yx92yxZON+xROCUrLzAI2mF4b6f5Tir4Uu9eLmH3i8QbQ/kEmA4k5KfBTi65WBWKqmNqe3+KRc0YeRGlY0KT82oso03jlr9UY4kA40GFYoVOx+eQGb5CXVLqSWdhu89DFePXpL6UrfFWkQRSvcIQvlgqOwgQxBeiZ+fhTCmOQrRDjL0agTb8e7UDjM5zB4aP0TuGXS699rEPA4S5BdhCYJoHwU+PibwR4Vzli0s6bfEiIyPF90VP22mbBL1pvu0/br10cvDVWu0zVAFX35tYXsalYgHCpPYx+0WwNqoN9UO3476DM3ROM1MuBX3hEU5SvQvuzS7exvCtl1+cagOpdajwcWsskWI9OBffHmaw7TYaWzG8a92t4yjDJv5ksmurIAERRIRyhsohYJfLCQpZAHRGqZyrZoqkt3/UAipdZIyxhaU/jl8qhlRmESdymbO0G9opuKwNl5hgGfTtKSvK6Y7LkJviKFuVBmRIItr3xUMbkUPm+IGtjDtiCPyLtWWHQXXz9F2/VWnYVQCoSkuELtfsQn7J2QWDp+ic9KVC/LBl23ZGFmZYYFoDqsegrbEbby0GsvY/f2erfua4Nbi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261021121427099003)(261021123027099003)(261021135927099003)(261021130227099003)(261022105027099003)(261026140227099003)(261022115727099003)(261022075727099003)(261022113327099003)(261026130827099003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THBnVDhsUFZ6UzQzRWowaDFtS2x2dWN2NmlxRmcrVTJDYmFoY1JNZlZRYUVP?=
 =?utf-8?B?TklTUytDN1Zia2xaZ2xhenovZDBXME9VaktVa2FnNk4xZDVrR1ZXRTRnN3V0?=
 =?utf-8?B?ckVDU0c3a01uK2pZcFpjNHVpYmdlNktYOHZ5a2dYSDQwSHJRS0RzZXVsSGRI?=
 =?utf-8?B?VjhkQmRZTzBKYjNGVGlNdWFXT0tkL01PaXYzdzNzN0lrYmRWSU5TQ0Rkb1lh?=
 =?utf-8?B?ZGxrNldmNEZyMHlGU2haUHAxZlNSUHBxcmJqZzNScnhuOWlSNzFxV0ZXU1Ax?=
 =?utf-8?B?R2xMTnhtRjMrWnNSOG9ycHdLQUEwVjUrSTJwWXZickMwTWtDUXRIdWtnOEpD?=
 =?utf-8?B?YzRzVW1wTWZDTW9wVnhwZTRSOS9HTXpZWFNBd0N4cG55N2kwVUNtSlpUeFFo?=
 =?utf-8?B?a3BNUFFCZGltVkxPaUs1MEZEL2Q1L1hpQVo3Q3ZHSlJuNHVuLzVtN0hZWVBn?=
 =?utf-8?B?bmlobFVIdU5MUnhJalExc0kyamxaLzhXeVEyeDdjNWxDTGxGUzRvd0trT1RE?=
 =?utf-8?B?YTlMT1k5ZUovV29TN2hvb2pUZTBSN2hCdWpJYVYwQ1pxYlIyZXBkL1h1OXN3?=
 =?utf-8?B?SjZvVjVCUmhDZ29wa05xZzM2YnZmL0VnN3hSdG5lL0tjK00wQTFkS0syWFk4?=
 =?utf-8?B?M1ZWR3VObG5rZkpMd3pmTmpoVWY0OTVjWkdsVmRudUdyalpZMWE5MysvbVpa?=
 =?utf-8?B?dm1iSUJKTkt4SVo1d2xINi8xQlpDdWZtK2wwa0YrelYyUzNFblplYjR3UWxs?=
 =?utf-8?B?WERKZjZHYmFIZG9raHBNVW8wc2YyNnRENFNWOHdHckRNWUZ2UjF2ZFpFSU4v?=
 =?utf-8?B?YUhhN2pVUkJsTXAzeGYxYmFNekhCd0ZJUEhtWmJ3UVV3V01oT2NMZjZtMm0y?=
 =?utf-8?B?cnkzeXFIRGs5eGdpbmVmOHpFOUxEVHFCUTNDSjVaYW96Q3ZOdHRIb2FncWZL?=
 =?utf-8?B?dlc2MUJtV0laNnVzR3RIeFB6aGJkYnExbkhPN29kK2RlbVpYc0JGMkYycWtB?=
 =?utf-8?B?b053UzhqbjN5M3lNbUF2Uk91QldNaTBFamZuZmcvS1NDS1o0MnpVc2NEaERL?=
 =?utf-8?B?Qk1SVHFSYlFQU0pFampTR3B1TENOdm5oUkV4SWJsdVdtbGlqR3ZESXdGUjN4?=
 =?utf-8?B?SVlQcEc3dmhKUnZUWmVIMS9rSmJwczI1ZzNWZk9yODg3MTRxV0lFbkE4TnE4?=
 =?utf-8?B?dnA4R2tFMHUvR3hHL3lYZ2ExcjlndW1nSDk5ZzBlVCtqdUZwL2tzNitnSVVj?=
 =?utf-8?B?K3hYczNjQVNzOWR1ZnBHb1ZtYzFiN0MzT0NsQVFYMmsvNEVrejJQQUN3NThN?=
 =?utf-8?B?VmErUHMwdGJSenh6cWRmNis5eWRyMXE1WnYzRUhLWTlvbi9lczlubFdjeDhI?=
 =?utf-8?B?ZE5PRDJtaWFNQzlRYU9ZRkk3cnBaZkpRTEJ3S2l1OEl2eUdlWHcwVU9GWVpv?=
 =?utf-8?B?NmZweG94U0YvSnlwRWY3S01lWFo0VDBqOFY4cjVROGdoN1lEc3NKdFBCMXZi?=
 =?utf-8?B?VUJ0V3ZzMHpZaGtEQ2lLa1RSeHpnS1hkamFTMmVRZnpPcHljWkN3ZmhocnMw?=
 =?utf-8?B?dG14Y05PUCtockdGSThqR1pJMk1ObC9ySDVoOUFnNkJ2VVdNQzlDL1VRckd0?=
 =?utf-8?B?K0FLTkNBZmNlQ0dRQTI5ekhveEJreWpYNnV6TmpiRWlSYWRnQ1piaTJTYVFv?=
 =?utf-8?B?SW5jbmtWcGloZ3lVM3pzclpmNm9PakhIUUh2U2VsWE5HUzJ5NWdFakcxWjND?=
 =?utf-8?B?RDFEYmRLNHBoODc4TXhvejZBRjEwNmlkaXBnV1BST21NbkFpWW0wMW1WZEF3?=
 =?utf-8?B?ZndXZXFtdGNQWW93R3hPRExmSWt5dXhPNG0vVHltOXhHVnlrYjhNSklFYmlZ?=
 =?utf-8?B?K2lnSEpRTXlScGFsUEw3N0ptUXEzb2FmbWYzZi9LOUZ3cGZyY203VnVBM2tp?=
 =?utf-8?B?dzRzOUYvdFpXNlY1dUlhcFFDeVd5U2psWDZoVGlNdDNUVzNoM1dtUzRUSFJD?=
 =?utf-8?B?bks3UzdMZW9xWHFlRURxY2F6MkhhSUlsWmxtNmlFekpnNEU4VU1rV251dG5H?=
 =?utf-8?B?YW82RWRjYjBBeFpQWnM4R1grM2wxWVByS2RjcThpNkcva3d5TUFVUzlHdDNz?=
 =?utf-8?B?cVBQMC8vWGEyM2NZN0xDTS9MV1ozQWlib1dMdnRsbVQwY2F6TW1WcWlhcG9r?=
 =?utf-8?B?QTZLVGZwQXN3Nmo0WUl3R2FRUDFobjQ5a0ZJakJUNlJRbDNySmNPQ3lxVmJI?=
 =?utf-8?B?aHYxMkF3YWVQUUVHcG9YU0FUSlRvdHFJMCt6aGd0OUphb1Qva25MMW04VkdO?=
 =?utf-8?B?OVUxRkdobHNaSGdHbkUvd2poMmdHQllwbzZiejNidnJSVnpHd0c0Zz09?=
X-Exchange-RoutingPolicyChecked: rAsdQQwfqngGeUyDinkaf5HqkiKU6CefLQ0MRqLacDHQYCO0tOANNDqGZETK/VYmwdpF2retX016S7hFOy3XGl/rJ7qqt1hSbLR4t9o0GtNJBpIb/ucl5Bj5pywVl6ceZC1JisymCIsJQnx1k4u36apOIOJacChEVokrSMSA39rNZHRKmNcaQxn0bfjVn1weqMXd6pxZ3pcmeIR/PXZ/L9iNwxeuNfMlYUpGgIdLjt8ectRzLEt/v99I9EAQzNmvFosMcAfGnlmBA5UeSvgQHhPLsqpH1ARrmcdtMzRqKd8btDOu392gDSjMUAA1i9r5xFBY6SG+f55fcxA7AIcJzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6c7af1-8683-40ce-09ea-08df37860f1c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2026 19:35:02.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLCqov2Bc7bm8mPriRar84tySHhF2Br4ifCGyz9QCz5SJzsVxHR6dm/yYgu5G5EzTgaujp/H2IIZuOEEPXanKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1891
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: V0j91Y8Wm3aToBViWhRb15q0cc-ID8yY
X-Proofpoint-GUID: V0j91Y8Wm3aToBViWhRb15q0cc-ID8yY
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ae642f8 cx=c_pps
 a=FAnPgvRYq/vnBSvlTDCQOQ==:117 a=FAnPgvRYq/vnBSvlTDCQOQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=ModqzXLkJJ0tFyq98apW:22
 a=VwQbUJbxAAAA:8 a=MvuuwTCpAAAA:8 a=3_BFGIgQrkfGZQEvdkwA:9 a=QEXdDO2ut3YA:10
 a=VO-IzC5-1J_lAJOrtp4A:9 a=FfaGCDsud1wA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA3NyBTYWx0ZWRfX6odLkiNOaKW0
 gxjT7kgk39CW4Q+uJz8Ps3ySR4YWrQvpjinYaR/tCja7MudGghtAvvJOOR8CB1a8wqOlMHT6mQB
 9CNQPKsHJK4fJLSoGVITVwoYkBemFgGAwuFJvQfILfpewE4uy3RtCV/LEvBjnzixyP5Lpf4ktSt
 MdJVhHyLWPcLJZOXHwdfH5qmPVFCFZkOoeOKTdJosvy4aOWAsr7q4HsFMbLZnlrJy/mQ3hD0Ank
 jIW7qFX3Ouyijj/zWuKF1tSmLXNcXqylQZMq2YRRJkiVLTL3ePXvTVAfofTXfes3cpd9flXhgO3
 WAvEnAZAWqKS8CSnyApupqngpJ2efJDErw+1lb5TnmuuOZDU8GgXJEde88YusiQ7G/V0W9d3+NT
 8jjMqov/DrNV5vLwDLqGrvYDDKReCjXZhs8tqkzvyG8KsM1mBTKAq2WSo++ML9WQGcrodzPa1xf
 KYPnB28oEqymYdFKGYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA3NyBTYWx0ZWRfX0z1wIIlD6oNk
 t+h+KFvXDdnLEHyvY6w8PYKeEylNf9rOadZUs9k924FmgRoQq+MZ99gfDA9/QqE326R8f7WA/Hj
 jnKaf5kLtcsiNdN7m7AXvNOa/Kk5Yqs=
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310077

--------------IHXzlZg3f8asfvxU9D3bHoOy
Content-Type: multipart/mixed; boundary="------------HqR0UAhZFUVe83FrdU7Ez8ax";
 protected-headers="v1"; hp="clear"
Message-ID: <7305d93b-2130-4a76-8c08-0b2a36b66ea7@hpe.com>
Date: Sat, 31 Oct 2026 12:34:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] net: hpe: ss1: add the Cassini headers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Sandeep Bhoot <sandeep.bhoot@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-1-8c2c391cc283@hpe.com>
 <531c7d63-548f-467e-95df-187214ff344d@lunn.ch>
Content-Language: en-US
From: Doug Ledford <doug.ledford@hpe.com>
Organization: Hewlett Packard Enterprise
In-Reply-To: <531c7d63-548f-467e-95df-187214ff344d@lunn.ch>

--------------HqR0UAhZFUVe83FrdU7Ez8ax
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/31/26 6:58 AM, Andrew Lunn wrote:
> On Fri, Oct 30, 2026 at 01:58:57PM -0700, Doug Ledford wrote:
>> Start the Cassini core driver (cxi-ss1) with its headers: the register=

>> and counter definitions, error definitions, telemetry item tables, and=

>> the CXI interface (cxi.h, cxi_prov_hw.h, libcassini.h) through which
>> client drivers use the NIC.
>>
>> The cassini_* headers are generated from the hardware description and
>> are not meant to be edited by hand, so they carry the generator's
>> formatting.  cassini_user_defs.h is shared byte-for-byte with the user=

>> space libraries and is therefore under include/uapi/ethernet.
>=20
> You want to keep the UAPI as small as possible, because once this is
> merged, it can never change in ways that break backwards
> compatibility.=20
>=20
> We also strongly discourage APIs that allow user space drivers, which,
> at first glance, such definitions would allow.

The fact that we have headers in uapi/ethernet/* is a holdover from
internal issues and for all files except cassini_user_defs.h, which is
legitimately shared with the user space cxiverbs driver, can be moved to
the linux/hpe/* include directories.  That will be part of the V2
patchset.  The cassini_user_defs.h file could go into uapi/rdma instead,
but I figured that wouldn't fly with the netdev community as the
Ethernet driver legitimately needs that header to compile in the kernel,
and the sole current user space consumer is the user space cxiverbs
provider we have added to the rdma-core user space package (we have our
own libcxi and pycxi that will possibly use it in the future...they use
the one from the internal repos today).  So in that sense, it's an rdma
needed header, but it's needed in the Ethernet kernel driver, so we
didn't think you would want it in the uapi/rdma directory.

The rdma kernel portion of the driver went upstream yesterday FWIW:
RDMA/cxi: add the HPE Cassini verbs driver
https://lore.kernel.org/linux-rdma/20261030-cxi-for-next-v1-0-bc6e49e0703=
7@hpe.com/T/#t

And the user space rdma-core portion of the driver went upstream today:
cxiverbs: add the HPE Cassini verbs provider
https://lore.kernel.org/linux-rdma/20261031-cxi-for-next-v1-0-93ce01907ce=
2@hpe.com/T/#t

>=20
>> It
>> provides inline accessors that need errno.h, string.h and size_t,
>> which a standalone UAPI header cannot assume, so this patch excludes
>> it from the UAPI header self-test.
>=20
> Does any other driver do this? If you are doing something which no
> other driver does, it is probably broken.

You need to be more specific.  Do you mean have a uapi at all for an
Ethernet device (I think I explained this part above well enough), or
have a uapi header file with embedded items that necessitate an
exclusion from the hdr test?  If it's the latter, that is now flagged as
a V2 fix.  The header file is a generated file and we need to fix the
generator.  Once fixed, the header is still needed by user space code
and hence still needs to be in the uapi structure somewhere, but will be
able to pass the hdr test in the kernel.

>> checkpatch --strict (100 columns) still reports the following in this
>> patch.
>=20
> netdev prefers 80.

Is 80 mandated, or just preferred?  I can make the change if it's a
must, but prefer not to make that much code churn if I don't have to, as
I expect that formatting only change would be a huge number of lines.

>> They need coordination with the internal repositories this code
>> is maintained in and will be fixed in V2:
>=20
> Your internal repos don't matter. Once this is merged it has a life of
> its own.

While I don't expect upstream to care about our internal repos, that
they matter to us should be no surprise.  This driver is 6 years old, so
obviously a mature driver, and it powers the top 3 US supercomputers (it
used to be the top 3 period, but a new one came online recently in China
that took the top spot).  We have contractual obligations to support
those systems, and I don't see them jumping from our provided driver
stack to the upstream kernel on a whim.  So our development plan (mostly
done, but still a bit to go) is simply to bring our internal driver and
the driver we are submitting to the upstream kernel into enough
similarity that we can use github actions and copybara to keep the repos
mostly in sync in an automated fashion and only requiring human
intervention for things that have true conflicts.  We are well aware of
the fact that once this driver lands in upstream, we won't be the only
ones making changes to it.  Our intent is to have a two way sync,
keeping our own development efforts up to date in both repos, and
pulling in upstream changes made to our code into our internal repo as
well.  My comment was not to say that I expected upstream to care about
our internal repos or some such, just explaining that it is taking us
some time to adapt everything and we are still in that process.

Which brings up a point that I guess people on this list wouldn't be
aware of.  We are coordinating our work with the Ultra Ethernet
Consortium's work.  As you are no doubt aware, code with no consumer is
not allowed to be merged into the kernel.  The UET group finished their
patches and submitted them to the linux-rdma community about two weeks
ago.  Those patches define a new queue pair type, but there are no
consumers/users of those new elements.  Our rdma kernel submission is
dependent on their patchset and on this patchset and is the first
consumer of the new queue pair type.  Between sashiko findings,
checkpatch findings, internal coordination, etc. we simply didn't get
everything done in the two week window.  But I felt it was necessary to
go ahead and get our V1 patch in front of people since the UET patch set
was waiting on us as their first consumer and as actual hardware using
their code.  Plus the next development window is opening next week too
and I wanted to get our V1 out by when it opened.

--=20
Doug Ledford <doug.ledford@hpe.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D

--------------HqR0UAhZFUVe83FrdU7Ez8ax--

--------------IHXzlZg3f8asfvxU9D3bHoOy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAmrmQuMFAwAAAAAACgkQuCajMw5XL92+
ZQ/+JVOfsx+tvWWoc7DG2lDukrwYn6Q7kL4LKOxbDXyT5gpTs1H/XDVTvM+lFl455l/6/iE58qYA
Cy88TSyjkLaPPiGukgXKjjkkVHcD0IG/lil3DoxM7UW1X4AOv8KMDRKoGhYX12AMrQGUINOIHC58
bHfp2pS/kydB0Z8tlYKyxhyJ76PNOZzOKuyvlkOhdMldRdDYWCoXYQ9rSjGgAgQS0y8BXaEzeXyz
hgMiVZkC7TPCml9QQ80I5+GZLpDIAk5pge97ws53fIoseG6NUHP34Cgs3DVj7b2TO7YOm0uw5h5E
OO+4D4Fj4W4bd6aBkYe5xaHvdzL0jkY/2tvIeM03WpvfBPSaXghEj8pJXywt2szthYaZor020lM0
h+rBY+/g1czpUiobzOWmJL9VbQed/uib9BxAvdMko5tpPh7nms6srrvcWKZSLrgOMTbhFM+4+b00
HTcT6z+e34r97j8HZ6aCV2jf3vklU32bzH8coSP9Ov0WUeThkKIlnzh5zm1EfoZSh4jbbw9Porif
VON29bvlEElBiGmQwE2R69cexrZDVj/qDJ+5QDnKKgbpXIdeVqWuFPY1tW4HsWOluV3ZknfRknYp
uE89PEns8PZbWcaTXOhAOzZZYTAatianBwXW2NnemC4qIUZv7oQidHLEtAZ13L50sJtJ6z1inHgz
eWI=
=2QiK
-----END PGP SIGNATURE-----

--------------IHXzlZg3f8asfvxU9D3bHoOy--
