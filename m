Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793394056;
	b=JbNS74qe3QiEN6OuRhWO3zSbhkB1XuvLZdfuk411OIV9LUVMXBNj6IUmd0jjAnwvKXfJ
	 65jL2qBd3f4mr8GM5/Lph9qWkFQcqq6ZggIRqRuc0BFr/W2suFI9eImtM1D0XLy7t34/C
	 EnCscnVAGtikgKXJSTxcqUJoxCQ7+O2+O/ZLsOaGbxeOooFJHlzYL93bnvcshzSR/VAV/
	 0vYqzTbDedK9p6yirQsOveej6StqWSwnMzQciHkbyJN2ChKWPz+HmCPWsjPjtG+WGac7E
	 UF8tnQZ5cZMYtCxp7t89O/TAfspIZu/SC4D5gbDEgHgrfd4dKXsgh7G52A4Xh1zX8Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394056;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-HPE-SCL:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MhsOkA/66kWtatyWXia0/AoBg+wbJKEAE0/ENYYgPAk=;
	b=tnzmYoWbpKQ36s7iA50n7X4CF/zenb8MptHaMiz3t8H2fYN/F8QfyiG4fO1sPD4m81jn
	 loituqyXBfNmR1XFVXm06MjVeNrQrO8shrcimQjVhfvSH+l/hHjDG62ZF5JGlrVKfJYkY
	 mQBmnmNdRYggwSZEA03Ddz/36KntceRWNacTsHrGsEVQnDyiX9sLp4V66Y8ion5EzZZxi
	 jHQ4dfA1R/qDILX6YswAOW2dwzTiB2lKDxz6SGiE1xr9COmXIau/b1sR3cOTEA7KBQhX4
	 j5aqeQM1yXp3fg8evW0J6jBX/d4k1pcknnB1/x+NbhYlzMG6Ai015IoGncnqYm2uYKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=OAQBVfkr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8639E60A261F;
	Fri, 30 Oct 2026 21:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8639E60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=OAQBVfkr
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvXpK765658;
	Fri, 30 Oct 2026 21:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps0720; bh=Mh
	sOkA/66kWtatyWXia0/AoBg+wbJKEAE0/ENYYgPAk=; b=OAQBVfkrarWTO1jXSZ
	HiBTFUF1xp6a1+Ukm398m98XiUPyUu5szBPVPX+iMbnvnwJ0icHsvvRR8AtXS0Dj
	F+20oMpwZDTyWQm37bqOAP80NoseW1zXdp4rzNlt8keR/xfZdznOARFV87chZzUm
	xEj73A7YSvJ8OJ9TcVej9kn/Yf+ivJNJdVISPjNvEMGMk1YDvU4CB7GWzfrFnPSt
	HG88DUfb/+FKPNszbKj29sB9cNXaDw8nIZyU6BCAoqwS2G6DlEAQga2rL0OvNJE7
	Z++9RU1dj9Gii2g2z7mCSlEHNdTy5zq4peR4CnDSBVGW7Ej9loS2Q4cskklOqMiH
	FGRQ==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hmwtmkxrp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 21:00:28 +0000 (GMT)
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 47BD0800EFF;
	Fri, 30 Oct 2026 21:00:27 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 30 Oct 2026 08:59:59 -1200
Received: from p1wg14919.americas.hpqcorp.net (16.230.19.122) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 30 Oct 2026 08:59:59 -1200
Received: from CY3PR08CU001.outbound.protection.outlook.com (192.58.206.35) by
 edge.it.hpe.com (16.230.19.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 30 Oct
 2026 08:59:59 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2/9Ba5uOkWspaH6d0WplKq7eiZg8qUWBD1CkgNLpW6fJdlNX32E+PQGKKjsCugyfXfRmosLcYqBkrNB0BXxGFIjuiQakIH2GiUyBpsWuEmcYAN9v1xys9zmi6EsTKIa7zV5jTxXtWbxoCSzO58ka/X9awuP4VdrXx7pe5xHMwTZ1QDHeR40gm4dedNim4bD8FnLmf4vD/E/+PzIheY1uPCu4USLEnuOqpB0QaL+n/uIV5BdJUHwHNR+oP7G1Td2Mh+WPcF1pD7mX+YkWDQ+X1GiO1JrZp3mFzukwxYtBCvZc/TN13Z5UtBqd9i7oUNEL5Wy2lpxGODTo8ICteoMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhsOkA/66kWtatyWXia0/AoBg+wbJKEAE0/ENYYgPAk=;
 b=U51uOlJOhrzyyq0P7qTB5bn27izZ46CjUSDg0KErcMb31QoLTorCL8nyLXW8P2Y4ROwZI3iCj6ohKb0lQRQBrX0haIuNoDxakWUwywfoAwl3qZqmvLYZcWlFCoJOz6UHK+vrGsJJPfcRPJB6/PRS9fkBp1eRFoPOMR7sALFBp58eHtly+Fh5B7eQA2rqvRMByqFVqHQj4hJwqnshzQZ0NIxErVZFN/Cv0FBKZqJJkfTR7/dPWwF04qic4g2rrpIVTlHkDi3UsUa/k6I6KvHgB0NQJcu+CInsbzhIuv94hBXV3bGyt/0UOwO+s+iykHjJOp9oKT97AMs7TPWFYaTTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
 by LV3PR84MB3767.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 20:59:54 +0000
Received: from DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8]) by DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d136:e75e:53c5:73d8%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 20:59:54 +0000
From: Doug Ledford <doug.ledford@hpe.com>
Date: Fri, 30 Oct 2026 13:58:58 -0700
Subject: [PATCH 02/23] net: hpe: sbl: add the Slingshot Base Link headers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-cxi-netdev-submission-v1-2-8c2c391cc283@hpe.com>
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
        Iraimani P <iraimani.pavadai@hpe.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: DSSP221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::7)
 To DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:225::20)
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
X-MS-Office365-Filtering-Correlation-Id: f9a5c787-ebbe-4750-e2a5-08df36c8bf47
X-LD-Processed: 105b2061-b669-4b31-92ac-24d304d195dc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|261022075727099003|261026135527099003|261022113327099003|261022115727099003|261022105027099003|261021133027099003|261028144727099003|261021123027099003|261021135927099003|261021130227099003|261021121427099003|261009223027099003|261009221227099003|261026121527099003|261026130827099003|261026140227099003|10067099003|56012099006|260925021311599003|260925021911599003|260925022911599003|6133799003|3023799007|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: xB/Wi5sPvsW95oe2bVY8VlaMfdElqyVpBkJkp80KlDVs7mVgGSn2GPouAqAcc4Dj5zYFMVI50no5QwWHSHgN/WIZDG501dAtZD7zVD+mrCelM+uMFaiXQMY2YY+cr7Vtz9YMCL/55H3iiWt79yrnE5eNM9LjKvqxXwG/jzai05TcaGVg+awc7l4DsX0+0I/xyP41LlZgfSeyuNY7KbTYbKarAiX1nMx8p/VVquLu3KNswH/QxQpoMpoo8deIppAEYqbmp/9pC/JrofvvJcEnftyl2kWW6w8yUIeJTXqMbZcs8lMzThDXhKqG7jzbAS73viFA/1vpQimCUtbisPjfsxHDFyW5EQJ9k9kNUES8VyzsQLL3Z1aiYnPp/X8up5tIK7eAZ4oxyQSCb94Z0S3IJUI3P8R9oWFoegiwPVfkKN3bwBcbJQ0TQYsBecCcOkEyP0L6RTjufE1EC4ndx1zSmsc29+4rtotDRVR3CSvXMuH9zVQCQDYJWNzUDvoCCefuIq9WHiYzRpe5dJSgMDXYCaUOgO6iOjc7aDVzmpIZyblM9XNW1W5Y7dK6AjrLvmEa9Vp9Kkmw+QceealEjutSw1yUi/FIBzErq6Qm0aTdGZCLRAE2TMUQju7ibnF0RacuFnRf3yPhixzruzSHE+0kKD9+/HZB/KgSu9ziG01eQaQmOjU9DCit2/MS85IUt04dc6RlXvWgps2wsa43n+RfOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(261022075727099003)(261026135527099003)(261022113327099003)(261022115727099003)(261022105027099003)(261021133027099003)(261028144727099003)(261021123027099003)(261021135927099003)(261021130227099003)(261021121427099003)(261009223027099003)(261009221227099003)(261026121527099003)(261026130827099003)(261026140227099003)(10067099003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(6133799003)(3023799007)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZEOVJhSENjcUdGc3hsTjlCM1A1b2pkTkVwcjVRUm5aZ0Z5VHY0VGVIKytm?=
 =?utf-8?B?NU1ITFFuYUMxS2FKVE5uVlRTWnRLVGlxaVh1Z3ZvUUlGNEs5Nit5VGZmY1lr?=
 =?utf-8?B?MFVFK1BZbExRV1lOTkFlUUpVTUJ5dHhLTnpwQlIrRVZtVUlYUTBvVEpEcGVF?=
 =?utf-8?B?T25oSTNWM0IyTkdhb1VKdDkvZGpqbEcxQWdPYUdZK0pEU2NaMG5iTGEzTU0w?=
 =?utf-8?B?cHRxb3RnWCttZ3BUU05QVFVLQ3JzRlA3SmRvSWhCQmF0cGQwcDdrYW80THlW?=
 =?utf-8?B?TUFtQWpWYlV1NEE3Z1BpcjY1MFZQYUcyUWk1bk8zaTJ2dEZzcXNOYkgvWFhQ?=
 =?utf-8?B?aUluVUszUlRwUHhScC9vUHRMS2VxbDBJeHY5eE9iRXBQU3Q3dGNuWlJLYlpZ?=
 =?utf-8?B?dzhUblgwK1ZhWTliVjR0dUxyQkNubkg0UUNDTXY2dEpxSG5jcjUwQ0QzK2xj?=
 =?utf-8?B?a0RwZ1hLU2FMbWJpVVZzOHdMTzBVRGR2Ynh4UitKdHNreXo4WnZXWW5sN2hq?=
 =?utf-8?B?M3FyTVBKMmY3MXBSZTFkaHZSUVZvQTBFMmZoL09GQmFkc3VaQ1ZsdVZ6cnJa?=
 =?utf-8?B?SkkvZzkxek1sTVFZVDA2OTBhTTE1a0twMW5rOEdVS1JQdUtHdHI4SFBmcjNj?=
 =?utf-8?B?UU9kblVQN3RFdUs0MG5NZmdkNjVNLy9TZW5LSW9hdkZ0RnJpeEFTZ0VuYk9J?=
 =?utf-8?B?T3ZBZG9WQ0IzbmdRVmZYbVlvd04zWWVQRDBQcjJSdVAvM1d0bk9CRGVEbmMx?=
 =?utf-8?B?eElPUWVGSmV2R0wxTkowcHZVc2hKeGVnTCsrTUY0SEtVekcyZkhtbWx5eFRm?=
 =?utf-8?B?WFFOS2FSMzRxNHF1ckJ3Ylp3YXJ5SzdpU3dTZmYzOUVJVnNMbHdXbjd5dG5w?=
 =?utf-8?B?d2tJRVJDQWJIU3Fuck9JTDY0UW1ibm5BSDF6OVYrUEswS3RyNG1LYmRNd2VK?=
 =?utf-8?B?aEgrWVJZWFlxNVVHRzVxb3ljaHVRcGloZTdqZG9RbG5ubnVEdTF2YnlTTldx?=
 =?utf-8?B?elA4WW5aOVAxcXJBaWJ5Q2piek8xd3dtempNZ1FDbWVEeTJoZGwvdzhKNXVV?=
 =?utf-8?B?K1B6a09uZ1lsSjBZUml3NFJmaTgzbVFoNE5Oc1dBalhITzd2YkFnQ2FOYkI3?=
 =?utf-8?B?YVB4ajZMRDFRWTFzOFllSUVKZ2NuN2lpMUxyb243SWhPbGxXUUZOYkhnUU9n?=
 =?utf-8?B?NjJRRlNPUENvRytwWFFMcndZbjhZVXBWcE5QblQrUDRYYkNrOGh6OU1SSjFk?=
 =?utf-8?B?NnoyTjlKeUl1RmM2Mlk4TDhUOHdKWVJtaldYNFFGSG5mYVNucEQ2clMzdDFO?=
 =?utf-8?B?KzlrMGJEMDdEMHlsTjVGclAzOGIrWXpqZUZROUcrZVJjRmY5Ry9rMU1ab01G?=
 =?utf-8?B?VFFhbC8vWGZXTDVWc3ZKOHl0WW9OVTdZWlBGKzcwWEU1SExqNUZqS2ExVTZ1?=
 =?utf-8?B?VXMwNzVoRmdVVmFFbThkQjdzTmdvRWVaci9sM1pzR2FqYnZtOWFGL2pjaWFn?=
 =?utf-8?B?THY1dWsvWGxkTFkwdXRUU1RIeml0bmtIRU1nb3NSYmJHVE9lclRHVlJtWnZT?=
 =?utf-8?B?R1AvTVJTU0JxZXRMK3lnSlFjMlBjbkZ1dHV0VU9ZSWpvMEFhaUxYMEFXYjNB?=
 =?utf-8?B?MmFNZEFITEozOEhFZWJmNkVENGZkNEgzcGtvSGJadnIwejF2cCtWby96b2Nh?=
 =?utf-8?B?a3VPZDY0WndGMEoxQldsRUZod2tUeDRJMUJKblVFVDY5c3ZjaEt4cE9wS0l6?=
 =?utf-8?B?d2xKTEIwL0dMMXFNUDhNNFFtaTczUm5ubmRDcnUraHlTdVF5S2thd3J0OWg5?=
 =?utf-8?B?dUxWV1NPdFgxUk1oRm8xci9VMmdZZ2p0NnI5VGZQbVlybjJUVVlZWDhQZzg0?=
 =?utf-8?B?M0JrL1ZMT0FoSEorNlJIZ0J4MUFCYzYzY3RDejh5SUs4WWQrV1ZYTEFKK3h0?=
 =?utf-8?B?QWxiSEJiZzhQMHo2a3AzU01xTmxhQzdFeVlNUm53TnYzeU81aTVZeXFUc1FY?=
 =?utf-8?B?cDkyUDBuMnVQcDZiQVpLRUlsWHpSYnlhZjdqVjltL05nMzl2UDJkZjM5QWtH?=
 =?utf-8?B?aGptQzltYXFub205am1EYjB4WWVxRm9ic1UzZzJVTzJ6aW5sbUtOTnFTWFE5?=
 =?utf-8?B?ZVFWOXljbUE2UXg2QjZjTjk3RzJQbnd0QWY2b3lEcEFnN0t3cVBPK3EwdENU?=
 =?utf-8?B?Rml2Yk1DMWF2U0tDRjR0LzFaaytGQ1B5ajBuSUlYbXh4Y0M1anp3YThPdEZH?=
 =?utf-8?B?ZHdldHMrUnM5Ym0yM1Q1RG5DWVlkc3E4TFZwRmEvVk9TUERCYk1uR3hZUmRG?=
 =?utf-8?B?cHdXZGpQbnphRGUvVnBoTmVsc1p1eVE5V1NtZ3BGdTZYYUtJZWxudz09?=
X-Exchange-RoutingPolicyChecked: PzD3foCSzQ2cHW338jSMIUsUiygwz9IvZ6h/F/5SsMC51kXsnEe8PnJZDzQZuZ/GiPBOCx7GMSgxpdOGtxoIkGA1vWlHkxBt9vSm6FpCU6Ua/x+r+h2/vdsAnCUl8wRC7Upr8dcqNdONxLfzbWMTBp2Q6ZDmlgjNWb3mhLvNLefW0kja+lflLkMEJOw1Sfnh4In0pSFoYZsIqn499aBP2vk2WCE+c8wxQRm+7GBwisijItW2KGg9RpmN4wa3w13Wp04cP132nuI506SMmbqYoPcfB9gRRpSE067A8a5HviF6sRcMLchQF025PMemg6lnAm2iYMPkv9uNj04UH4SXIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a5c787-ebbe-4750-e2a5-08df36c8bf47
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB3970.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 20:59:54.7484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdNzSYr1J9GbJNvPGlkta2t32Y3d7F6gGCyoiYX5HXiCammB2Hg38ZNPjWwApG0cMykYo4MqZ7FSNr/wfYkE+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3767
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXzch3zabAZ5FL
 vL3d1WXZFbgGqPeObOgfpcF2dY5NMZRke98YMRTxU2P2aALP6zDYRpX5wI4ACksWGaNdmHw73rw
 3JzrW+vaVW0TG/imtL9HYHKpSyqvvRY=
X-Proofpoint-ORIG-GUID: T9EUGk1Jz5PH2AVBnpDaJBECBA88o_wi
X-Authority-Analysis: v=2.4 cv=B+4sQ+tM c=1 sm=1 tr=0 ts=6ae5056c cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=k7r4yCLl9DVLXMiQTbtC:22 a=MvuuwTCpAAAA:8 a=6WnnpXNI8CMgCTu-YrgA:9
 a=PP5x82DE6RUvqc48:21 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MyBTYWx0ZWRfXwGYWAMUWL6IN
 sO068YVoR2yfZGhejg1KPfjGECfro6J0Y9JEfz/5bn018QofC1BxyOTbXg8lRot+NKgN3vzxHF+
 K82PGaYjRgt6rZZthVOWo2s85P3k/sKU7NuJCa2HNtBq9JQDhDXqbGEcGIEzIqIn4rF15937wEi
 YhiRrmF1se5qS8QHqBrTXpSx+QC2WdE8l1PjVtmyBCPTSedF848Jf9UsFTp7Kd9shfwOdykbb+k
 VrMhDYZpGWy15IjEyW5Amnr8UPDvep8ToL0g0uOBE3g/8dyZM/O5vY8r6XOajEnk7seZfNY7iJ8
 1UYL1PkLNaWzy5YrbJALYLvhG32gvGJJWN9sb705jTud0usUuAeG1a0lQBjwEoHoZKwwQZnCMjd
 OYjnOnm+mjU+Ls4rQ3+XiXcMWDrTy+00ecsQ18gifCNmxUCSEz50OKzkZ+7/npRnYRcl+Spvqpj
 bA9q1uQcHsqIHupgPcw==
X-Proofpoint-GUID: T9EUGk1Jz5PH2AVBnpDaJBECBA88o_wi
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300083

Add the headers for the Slingshot Base Link (SBL) driver, the 200 Gb/s
link layer used by the first generation Cassini NIC.  SBL owns link
bring-up for the PML (MAC/PCS/LLR), SerDes and auto-negotiation blocks
and exposes its interface to the NIC driver through sbl.h.

sbl-abi.h and sbl_serdes.h live in include/uapi/ethernet because the
same files are shared with user space tools that query the link; the
SerDes helpers that are not part of that ABI sit in the kernel-only
include/linux/hpe/sbl/sbl.h.

Every header of the driver, including those private to one layer, is
added here so that each later patch, which adds the sources of one
layer, compiles on its own.

The Kconfig and Makefile hookup for this driver is deliberately the
last patch of the driver group, so that every earlier patch adds
sources without changing what the tree builds.

checkpatch --strict (100 columns) still reports the following in this
patch. They need coordination with the internal repositories this code
is maintained in and will be fixed in V2:
- ERROR: COMPLEX_MACRO (1)
- WARNING: LONG_LINE_COMMENT (60), MACRO_ARG_UNUSED (18), LONG_LINE
  (16), BLOCK_COMMENT_STYLE (4)
- CHECK: SPACING (119), LINE_SPACING (47), BIT_MACRO (31),
  PARENTHESIS_ALIGNMENT (23), MACRO_ARG_PRECEDENCE (22), MACRO_ARG_REUSE
  (5), PREFER_KERNEL_TYPES (2), BRACES (1)

Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
Co-developed-by: Iraimani P <iraimani.pavadai@hpe.com>
Signed-off-by: Iraimani P <iraimani.pavadai@hpe.com>
Signed-off-by: Doug Ledford <doug.ledford@hpe.com>
---
 drivers/net/ethernet/hpe/sbl/sbl_config_list.h |   61 ++
 drivers/net/ethernet/hpe/sbl/sbl_constants.h   |  352 ++++++++
 drivers/net/ethernet/hpe/sbl/sbl_internal.h    |  279 ++++++
 drivers/net/ethernet/hpe/sbl/sbl_link.h        |   44 +
 drivers/net/ethernet/hpe/sbl/sbl_platform.h    |   35 +
 drivers/net/ethernet/hpe/sbl/sbl_pml_fn.h      |  132 +++
 drivers/net/ethernet/hpe/sbl/sbl_sbm.h         |   73 ++
 drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.h  |  152 ++++
 drivers/net/ethernet/hpe/sbl/sbl_serdes.h      |   94 +++
 drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.h   |  151 ++++
 drivers/net/ethernet/hpe/sbl/sbl_serdes_map.h  |   10 +
 include/linux/hpe/sbl/sbl.h                    |  436 ++++++++++
 include/linux/hpe/sbl/sbl_an.h                 |  174 ++++
 include/linux/hpe/sbl/sbl_csr_common.h         |   63 ++
 include/linux/hpe/sbl/sbl_fec.h                |   88 ++
 include/linux/hpe/sbl/sbl_kconfig.h            |   33 +
 include/linux/hpe/sbl/sbl_mb.h                 |   77 ++
 include/linux/hpe/sbl/sbl_platform.h           |   35 +
 include/linux/hpe/sbl/sbl_pml.h                | 1081 ++++++++++++++++++++++++
 include/linux/hpe/sbl/sbl_test.h               |   20 +
 include/uapi/ethernet/sbl-abi.h                |  648 ++++++++++++++
 include/uapi/ethernet/sbl_cassini.h            |   21 +
 include/uapi/ethernet/sbl_counters.h           |  152 ++++
 include/uapi/ethernet/sbl_platform_config.h    |   13 +
 include/uapi/ethernet/sbl_sbm_constants.h      |  330 ++++++++
 include/uapi/ethernet/sbl_serdes.h             |  390 +++++++++
 include/uapi/ethernet/sbl_serdes_defaults.h    |   66 ++
 include/uapi/ethernet/sbl_serdes_map.h         |   41 +
 include/uapi/ethernet/sbl_serdes_map_init.h    |   65 ++
 29 files changed, 5116 insertions(+)

diff --git a/drivers/net/ethernet/hpe/sbl/sbl_config_list.h b/drivers/net/ethernet/hpe/sbl/sbl_config_list.h
new file mode 100644
index 000000000000..568e5fdeccd0
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_config_list.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP. All rights reserved. */
+
+#ifndef SBL_CONFIG_LIST_H
+#define SBL_CONFIG_LIST_H
+
+#include <uapi/ethernet/sbl_serdes.h>
+#include <uapi/ethernet/sbl_serdes_defaults.h>
+
+/* A SerDes configuration list entry specifies a set of config values which
+ * are selected to get the SerDes to tune reliably for a given setup. Some default
+ * entries are statically defined - additional entries can be added and removed from the
+ * list dynamically
+ *
+ * To add a static serdes configuration
+ * 1. create an initializer as below
+ * 2. create an static structure in sbl_init.c
+ * 3. Add the structure into sbl_setup_serdes_configs()
+ *
+ */
+struct sbl_serdes_config {
+	u64 tp_state_mask0;         /* State lookup mask */
+	u64 tp_state_mask1;         /* State lookup mask */
+	u64 tp_state_match0;        /* match values after masking */
+	u64 tp_state_match1;        /* match values after masking */
+	u64 port_mask;              /* applicable ports */
+	u8  serdes_mask;            /* applicable serdes */
+	struct sbl_sc_values vals;  /* Configuration values */
+
+	struct list_head list;
+	bool is_default;            /* Default configuration */
+	u32 tag;                    /* tag for debugging */
+};
+
+/* Default serdes config initializer */
+#define SBL_SERDES_CONFIG_INITIALIZER					\
+{									\
+	/*                   --mlmlmtlmtplblp           */              \
+	.tp_state_mask0	 = 0x0000000000000000,				\
+	/*                   mvmvmvmvmvmvmvmv           */              \
+	.tp_state_mask1	 = 0x0000000000000000,				\
+	.tp_state_match0 = 0x0000000000000000,				\
+	.tp_state_match1 = 0x0000000000000000,				\
+	.port_mask	 = 0xffffffffffffffff,				\
+	.serdes_mask	 = 0xf,						\
+	.vals = {							\
+		.magic		= SBL_SERDES_CONFIG_MAGIC,		\
+		.atten		= SBL_DFLT_PORT_CONFIG_ATTEN,		\
+		.pre		= SBL_DFLT_PORT_CONFIG_PRE,		\
+		.post		= SBL_DFLT_PORT_CONFIG_POST,		\
+		.pre2		= SBL_DFLT_PORT_CONFIG_PRE2,		\
+		.pre3		= SBL_DFLT_PORT_CONFIG_PRE3,		\
+		.gs1		= SBL_DFLT_PORT_CONFIG_GS1_OPTICAL,	\
+		.gs2		= SBL_DFLT_PORT_CONFIG_GS2_OPTICAL,	\
+		.num_intr	= SBL_DFLT_PORT_CONFIG_NUM_INTR,	\
+		.intr_val	= SBL_DFLT_PORT_CONFIG_INTR_VAL,	\
+		.data_val	= SBL_DFLT_PORT_CONFIG_DATA_VAL,	\
+	},								\
+}
+
+#endif /* SBL_CONFIG_LIST_H */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_constants.h b/drivers/net/ethernet/hpe/sbl/sbl_constants.h
new file mode 100644
index 000000000000..a21a43f84a04
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_constants.h
@@ -0,0 +1,352 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2020-2026 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_CONSTANTS_H_
+#define _SBL_CONSTANTS_H_
+
+#ifdef TRACE2
+#define dev_trace2 dev_dbg
+#endif /* TRACE2 */
+
+#ifdef TRACE3
+#define dev_trace3 dev_dbg
+#endif /* TRACE3 */
+
+#define SBL_MODEL_ROS_COLORADO "sc-ros"
+#define SBL_MODEL_ROS_COLUMBIA "sc-ros-tor"
+#define SBL_MODEL_ROS_TEXAS "sc-ros-tex"
+
+#define SBUS_ADDR(ring, rx_addr)        ((ring << 8) | rx_addr)
+#define SBUS_RING(sbus_addr)            ((sbus_addr & 0x300) >> 8)
+#define SBUS_RX_ADDR(sbus_addr)         (sbus_addr & 0xff)
+
+#define SBL_FW_REV_LEN		4
+#define SBL_FW_BUILD_LEN	4
+
+#define LEVEL_ERR                            4
+#define LEVEL_WARN                           3
+#define LEVEL_INFO                           2
+#define LEVEL_DBG                            1
+
+#define SERDES_OP_TIMEOUT_MS          1000
+#define SBUS_OP_TIMEOUT_MS            1000
+#define SERDES_OP_FLAGS               (SBL_FLAG_INTERVAL_1MS | SBL_FLAG_DELAY_5US)
+
+#define SBL_ALL_PORTS                 -1
+
+#define SBL_CONFIG_RX_PHASE_SLIP_CNT_DFLT    0xc
+#define SBL_CONFIG_DFE_PRE_DELAY_DFLT        0x0
+#define SBL_CONFIG_DFE_TIMEOUT_MS_DFLT       5000
+#define SBL_CONFIG_DFE_RETRY_CNT_DFLT        2
+#define SBL_CONFIG_NRZ_MIN_EYE_HEIGHT_DFLT   0xc0
+#define SBL_CONFIG_PAM4_MIN_EYE_HEIGHT_DFLT  0x10
+
+#define SBL_PORT_CONFIG_LINK_PARTNER_DFLT         0
+#define SBL_PORT_CONFIG_TUNING_PATTERN_DFLT       0
+#define SBL_PORT_CONFIG_LOOPBACK_MODE_DFLT        0
+#define SBL_PORT_CONFIG_LINK_MODE_DFLT            0
+
+/* Provided by SI */
+#define SBL_ENC_NRZ                 SPICO_INT_DATA_ENC_NRZ
+#define SBL_DIV_25G                 165
+#define SBL_WID_25G                 SPICO_INT_DATA_WIDTH_25G
+#define SBL_ENC_PAM4                SPICO_INT_DATA_ENC_PAM4
+#define SBL_DIV_50G                 170
+#define SBL_WID_50G                 SPICO_INT_DATA_WIDTH_50G
+#define SBL_DIV_AN                  8
+#define SBL_WID_AN                  SPICO_INT_DATA_WIDTH_2_5G
+
+#define SBL_RX_TERM_AGND            0
+#define SBL_RX_TERM_AVDD            1
+#define SBL_RX_TERM_FLOAT           2
+
+#define SBL_DS_CORE                 0
+#define SBL_DS_PRBS                 1
+
+#define SBL_SERDES_REFCLK           126250000
+
+#define SBL_SBUS_DIVIDER_DFLT       3 /* clock divider of 8 */
+#define SBL_SBUS_DIVIDER_SPEEDUP    1 /* clock divider of 2 */
+
+#define SPICO_SBR_DATA_NONE                0x00000000
+#define SPICO_SBR_DATA_SET_BURST_WR        0x80000000
+#define SPICO_SBR_DATA_RESET_HIGH          0x000000c0
+#define SPICO_SBR_DATA_RESET_LOW           0x00000040
+#define SPICO_SBR_DATA_IMEM_CNTL_EN        0x00000240
+#define SPICO_SBR_DATA_IMEM_CNTL_EN_RD     0x00000340
+#define SPICO_SBR_DATA_IMEM_CNTL_DIS       0x00000040
+#define SPICO_SBR_DATA_ECC_EN              0x000c0000
+#define SPICO_SBR_DATA_SPICO_EN            0x00000140
+#define SPICO_SBR_DATA_BE_012              0xc0000000
+#define SPICO_SBR_DATA_BE_01               0x80000000
+#define SPICO_SBR_DATA_BE_0                0x40000000
+
+#define SPICO_SBR_DATA_W0_OFFSET           0
+#define SPICO_SBR_DATA_W1_OFFSET           10
+#define SPICO_SBR_DATA_W2_OFFSET           20
+
+#define SPICO_SERDES_DATA_SET_GLOBAL_RESET  0x00000011
+#define SPICO_SERDES_DATA_CLR_GLOBAL_RESET  0x00000010
+#define SPICO_SERDES_DATA_SET_INTR_DIS      0x00000030
+#define SPICO_SERDES_DATA_SET_IMEM_CNTL_EN  0xc0000000
+#define SPICO_SERDES_DATA_CLR_IMEM_CNTL_EN  0x00000000
+#define SPICO_SERDES_DATA_SET_ECC_EN        0x000c0000
+#define SPICO_SERDES_DATA_CLR_ECC_ERR       0xc0000000
+#define SPICO_SERDES_DATA_SET_SPICO_EN      0x00000002
+#define SPICO_SERDES_DATA_SET_INTR_EN       0x00000000
+#define SPICO_SERDES_DATA_RESET             0x00000000
+
+#define SPICO_STATE_RESET                   0x00000000
+#define SPICO_STATE_PAUSE                   0x00000012
+#define SPICO_STATE_ERROR                   0x0000001f
+#define SPICO_STATE_MASK                    0x0000001f
+
+#define SPICO_INT_DATA_NONE             0x0000
+#define SPICO_INT_DATA_SERDES_EN_OFF    0x0000
+#define SPICO_INT_DATA_BR_1_25          0x9008
+#define SPICO_INT_DATA_ELB              0x0100
+#define SPICO_INT_DATA_ILB              0x0101
+#define SPICO_INT_DATA_WM_20NRZ         0x0011
+#define SPICO_INT_DATA_TPCE             0x0001 /* TX Phase Cal Enable */
+#define SPICO_INT_DATA_STRUCT_OFFSET    0x8
+#define SPICO_INT_DATA_MEMBER_OFFSET    0x0
+#define SPICO_INT_DATA_STRUCT_CLTE      0x09
+#define SPICO_INT_DATA_HF_MIN           0x07
+#define SPICO_INT_DATA_HF_MAX           0x08
+#define SPICO_INT_DATA_SET_TX_EN        0x0001
+#define SPICO_INT_DATA_SET_RX_EN        0x0002
+#define SPICO_INT_DATA_SET_TXO_EN       0x0004
+#define SPICO_INT_DATA_ENC_NRZ          0x0000
+#define SPICO_INT_DATA_ENC_PAM4         0x0088
+#define SPICO_INT_DATA_WIDTH_2_5G       0x0022
+#define SPICO_INT_DATA_WIDTH_25G        0x0033 /* width-mode: 40 */
+#define SPICO_INT_DATA_WIDTH_50G        0x0077 /* width-mode: 80 */
+#define SPICO_INT_DATA_TX_OVERRIDE      0x0020
+#define SPICO_INT_DATA_RX_EID_EN        0x0040
+#define SPICO_INT_DATA_SET_TXINV        0x0101
+#define SPICO_INT_DATA_CLR_TXINV        0x0100
+#define SPICO_INT_DATA_SET_RXINV        0x0210
+#define SPICO_INT_DATA_CLR_RXINV        0x0200
+#define SPICO_INT_DATA_SET_PRECODE      0x0344
+#define SPICO_INT_DATA_CLR_PRECODE      0x0300
+#define SPICO_INT_DATA_SET_GRAY_SWZ     0x0caa
+#define SPICO_INT_DATA_CLR_GRAY_SWZ     0x0c00
+#define SPICO_INT_DATA_RXT_AGND         0x0000
+#define SPICO_INT_DATA_RXT_AVDD         0x0001
+#define SPICO_INT_DATA_RXT_FLOAT        0x0002
+#define SPICO_INT_DATA_SET_LOOPBACK     0x0101
+#define SPICO_INT_DATA_CLR_LOOPBACK     0x0100
+#define SPICO_INT_DATA_PRBS31_AS_TXGEN  0x0125
+#define SPICO_INT_DATA_PRBS31_AS_RXGEN  0x0235
+#define SPICO_INT_DATA_DISABLE_TXRXGEN  0x03ff
+#define SPICO_INT_DATA_TXTX_RC_NOT_SS   0x9000
+#define SPICO_INT_DATA_TXRX_FC_IGNORE   0x8800
+#define SPICO_INT_DATA_DFE_ICAL         0x0001
+#define SPICO_INT_DATA_DFE_CONT_PCAL    0x0006
+#define SPICO_INT_DATA_DFE_PAUSE_PCAL   0x0002
+#define SPICO_INT_DATA_DFE_READ_PARAMS  0x5b00
+#define SPICO_INT_DATA_SET_TXEQ_PRE1    0x0000
+#define SPICO_INT_DATA_SET_TXEQ_PRE2    0xc000
+#define SPICO_INT_DATA_SET_TXEQ_PRE3    0x3000
+#define SPICO_INT_DATA_SET_TXEQ_POST    0x8000
+#define SPICO_INT_DATA_SET_TXEQ_ATTEN   0x4000
+#define SPICO_INT_DATA_GET_TXEQ_PRE1    0x0100
+#define SPICO_INT_DATA_GET_TXEQ_PRE2    0xc100
+#define SPICO_INT_DATA_GET_TXEQ_PRE3    0x3100
+#define SPICO_INT_DATA_GET_TXEQ_POST    0x8100
+#define SPICO_INT_DATA_GET_TXEQ_ATTEN   0x4100
+#define SPICO_INT_DATA_TXEQ_DATA_MASK   0x00ff
+#define SPICO_INT_DATA_RXEQ_VAL_MASK    0x00ff
+#define SPICO_INT_DATA_PRBS_SUCCESS     0x0002
+#define SPICO_INT_DATA_PRBS_RETRY       0x0000
+#define SPICO_INT_DATA_PROC_RESET       0x0001
+
+#define SPICO_INT_DATA_RXEQ_STS_DFE_ST  0x0a00
+#define SPICO_INT_DATA_RXEQ_STS_DFE_STS 0x0b00
+#define SPICO_INT_DATA_RXEQ_FFE_PRE2    0x1000
+#define SPICO_INT_DATA_RXEQ_FFE_PRE1    0x1100
+#define SPICO_INT_DATA_RXEQ_FFE_POST1   0x1200
+#define SPICO_INT_DATA_RXEQ_FFE_BFLF    0x1300
+#define SPICO_INT_DATA_RXEQ_FFE_BFHF    0x1400
+#define SPICO_INT_DATA_RXEQ_FFE_DRATE   0x1500
+#define SPICO_INT_DATA_RXEQ_CTLE_HF     0x2000
+#define SPICO_INT_DATA_RXEQ_CTLE_LF     0x2100
+#define SPICO_INT_DATA_RXEQ_CTLE_BW     0x2200
+#define SPICO_INT_DATA_RXEQ_CTLE_GS1    0x2400
+#define SPICO_INT_DATA_RXEQ_CTLE_GS2    0x2500
+#define SPICO_INT_DATA_RXEQ_DFE_GAIN    0x3000
+#define SPICO_INT_DATA_RXEQ_DFE_GAIN2   0x3100
+#define SPICO_INT_DATA_RXEQ_DFE_2       0x3200
+#define SPICO_INT_DATA_RXEQ_DFE_3       0x3300
+#define SPICO_INT_DATA_RXEQ_DFE_4       0x3400
+#define SPICO_INT_DATA_RXEQ_DFE_5       0x3500
+#define SPICO_INT_DATA_RXEQ_DFE_6       0x3600
+#define SPICO_INT_DATA_RXEQ_DFE_7       0x3700
+#define SPICO_INT_DATA_RXEQ_DFE_8       0x3800
+#define SPICO_INT_DATA_RXEQ_DFE_9       0x3900
+#define SPICO_INT_DATA_RXEQ_DFE_A       0x3a00
+#define SPICO_INT_DATA_RXEQ_DFE_B       0x3b00
+#define SPICO_INT_DATA_RXEQ_DFE_C       0x3c00
+#define SPICO_INT_DATA_RXEQ_EH_THLE     0x4000
+#define SPICO_INT_DATA_RXEQ_EH_THME     0x4100
+#define SPICO_INT_DATA_RXEQ_EH_THUE     0x4200
+#define SPICO_INT_DATA_RXEQ_EH_THLO     0x4300
+#define SPICO_INT_DATA_RXEQ_EH_THMO     0x4400
+#define SPICO_INT_DATA_RXEQ_EH_THUO     0x4500
+
+#define SPICO_INT_DATA_RXEQ_SIGN_MASK   0x8000
+#define SPICO_INT_DATA_RXEQ_VAL_MASK    0x00ff
+
+#define SPICO_INT_DATA_HAL_DFE_APPLY    0x0018
+#define SPICO_INT_DATA_HAL_CTLE_APPLY   0x0015
+#define SPICO_INT_DATA_HAL_FFE_APPLY    0x0012
+#define SPICO_INT_DATA_HAL_RXV_APPLY    0x0003
+#define SPICO_INT_DATA_HAL_DC_APPLY     0x000a
+#define SPICO_INT_DATA_HAL_TC_APPLY     0x000d
+#define SPICO_INT_DATA_HAL_PCAL_SETUP   0x003f
+#define SPICO_INT_DATA_HAL_CTLE_HF      0x0900
+#define SPICO_INT_DATA_HAL_CTLE_LF      0x0901
+#define SPICO_INT_DATA_HAL_CTLE_DC      0x0902
+#define SPICO_INT_DATA_HAL_CTLE_BW      0x0903
+#define SPICO_INT_DATA_HAL_CTLE_GS1     0x0904
+#define SPICO_INT_DATA_HAL_CTLE_GS2     0x0905
+#define SPICO_INT_DATA_HAL_CTLE_SCE     0x0906
+#define SPICO_INT_DATA_HAL_FFE_PRE2     0x0d00
+#define SPICO_INT_DATA_HAL_FFE_PRE1     0x0d01
+#define SPICO_INT_DATA_HAL_FFE_POST1    0x0d02
+#define SPICO_INT_DATA_HAL_FFE_4        0x0d03
+#define SPICO_INT_DATA_HAL_FFE_5        0x0d04
+#define SPICO_INT_DATA_HAL_FFE_6        0x0d05
+#define SPICO_INT_DATA_HAL_FFE_7        0x0d06
+#define SPICO_INT_DATA_HAL_DFE_GT1      0x0b00
+#define SPICO_INT_DATA_HAL_DFE_GT2      0x0b01
+#define SPICO_INT_DATA_HAL_DFE_G2       0x0b02
+#define SPICO_INT_DATA_HAL_DFE_G3       0x0b03
+#define SPICO_INT_DATA_HAL_DFE_G4       0x0b04
+#define SPICO_INT_DATA_HAL_DFE_G5       0x0b05
+#define SPICO_INT_DATA_HAL_DFE_G6       0x0b06
+#define SPICO_INT_DATA_HAL_DFE_G7       0x0b07
+#define SPICO_INT_DATA_HAL_DFE_G8       0x0b08
+#define SPICO_INT_DATA_HAL_DFE_G9       0x0b09
+#define SPICO_INT_DATA_HAL_DFE_G10      0x0b0a
+#define SPICO_INT_DATA_HAL_DFE_G11      0x0b0b
+#define SPICO_INT_DATA_HAL_DFE_G12      0x0b0c
+#define SPICO_INT_DATA_HAL_DFE_G13      0x0b0d
+#define SPICO_INT_DATA_HAL_GTP_CTLE_FX  0x0108
+#define SPICO_INT_DATA_HAL_GTP_FFE_FX   0x0109
+#define SPICO_INT_DATA_HAL_GTP_DFE_FX   0x010a
+#define SPICO_INT_DATA_HAL_GTP_VER_FX   0x0115
+#define SPICO_INT_DATA_HAL_CTLE_BASE    0x0900
+#define SPICO_INT_DATA_HAL_FFE_BASE     0x0d00
+#define SPICO_INT_DATA_HAL_DFE_BASE     0x0b00
+#define SPICO_INT_DATA_HAL_RXVS_BASE    0x0300 /* Rx clock vernier settings */
+#define SPICO_INT_DATA_HAL_RXVS_OFFSET  0x0005 /* Rx clock vernier settings */
+#define SPICO_INT_DATA_HAL_RXVC_BASE    0x2f00 /* Rx clock vernier cals */
+#define SPICO_INT_DATA_HAL_RSDO_BASE    0x0f00
+#define SPICO_INT_DATA_HAL_RSDC_BASE    0x1100
+#define SPICO_INT_DATA_HAL_RSTO_BASE    0x1200
+#define SPICO_INT_DATA_HAL_RSTC_BASE    0x1400
+#define SPICO_INT_DATA_HAL_EH_BASE      0x1700
+#define SPICO_INT_DATA_HAL_GTP_BASE     0x0100
+#define SPICO_INT_DATA_HAL_DCCD_BASE    0x2c00
+#define SPICO_INT_DATA_HAL_P4LV_BASE    0x1f00
+
+#define SPICO_INT_DATA_ICAL_EFFORT_SEL  0x0118
+#define SPICO_INT_DATA_ICAL_EFFORT_0    0x0000 /* Min effort */
+#define SPICO_INT_DATA_ICAL_EFFORT_1    0x0001 /* Max effort */
+#define SPICO_INT_DATA_ICAL_EFFORT_2    0x0002 /* Min effort w/o vernier rst */
+#define SPICO_INT_DATA_ICAL_EFFORT_10   0x0010 /* Med effort */
+
+#define SPICO_INT_DATA_ICAL_MAX_EFFORT  SPICO_INT_DATA_ICAL_EFFORT_1
+#define SPICO_INT_DATA_ICAL_MED_EFFORT  SPICO_INT_DATA_ICAL_EFFORT_10
+#define SPICO_INT_DATA_ICAL_MIN_EFFORT  SPICO_INT_DATA_ICAL_EFFORT_0
+
+#define SPICO_INT_DATA_EID_FILTER_SEL   0x011c
+#define SPICO_INT_DATA_EID_FILTER_DFE   0x0155
+#define SPICO_INT_DATA_EID_FILTER_OFF   0x0000
+
+#define SBUS_AFE_CTRL_KNOWN_FW0_BASE     0x039e /* Different for each FW build */
+
+#define TXEQ_PRE1_MIN                   -31
+#define TXEQ_PRE1_MAX                   31
+#define TXEQ_PRE2_MIN                   -31
+#define TXEQ_PRE2_MAX                   31
+#define TXEQ_PRE3_MIN                   -1
+#define TXEQ_PRE3_MAX                   1
+#define TXEQ_POST_MIN                   -31
+#define TXEQ_POST_MAX                   31
+#define TXEQ_ATTEN_MIN                  0
+#define TXEQ_ATTEN_MAX                  31
+#define RXEQ_DFE_GS1_MIN                0
+#define RXEQ_DFE_GS1_MAX                3
+#define RXEQ_DFE_GS2_MIN                0
+#define RXEQ_DFE_GS2_MAX                3
+
+#define DFE_LOS_MASK                    0x0200
+#define DFE_CAL_RUN_IN_PRGRS_MASK       0x0037
+#define DFE_CAL_DONE                    0x0080
+
+#define SERDES_MEM_ADDR_O_CORE_STATUS   0x26
+
+#define SPICO_INT_DATA_CTLE_MIN \
+	((SPICO_INT_DATA_STRUCT_CLTE << SPICO_INT_DATA_STRUCT_OFFSET) | \
+	 (SPICO_INT_DATA_HF_MIN << SPICO_INT_DATA_MEMBER_OFFSET))
+#define SPICO_INT_DATA_CTLE_HF_MIN_VAL  0x3
+#define SPICO_INT_DATA_CTLE_MAX \
+	((SPICO_INT_DATA_STRUCT_CLTE << SPICO_INT_DATA_STRUCT_OFFSET) | \
+	 (SPICO_INT_DATA_HF_MAX << SPICO_INT_DATA_MEMBER_OFFSET))
+#define SPICO_INT_DATA_CTLE_HF_MAX_VAL  0x7
+
+#define SPICO_INT_DATA_RXP_APPLY_OFFSET 15
+#define SPICO_INT_DATA_RX_PHASE_OFFSET  8
+#define SPICO_INT_DATA_RX_PHASE_MAX     0x3f
+
+#define SPICO_RESULT_SERDES_CRC_PASS    0
+#define SPICO_RESULT_SERDES_CRC_FAIL    0xff
+
+#define SPICO_RESULT_SBR_CRC_PASS       1
+#define SPICO_RESULT_SBR_CRC_FAIL       0xffff
+
+#define SBUS_INT_LOOP_LIMIT             2000
+#define SERDES_EN_LOOP_LIMIT            20
+#define SERDES_EN_LOOP_DELAY            1
+
+#define SERDES_CORE_STATUS_TX_RDY_MASK		0x400000000
+#define SERDES_CORE_STATUS_RX_RDY_MASK		0x200000000
+#define SERDES_CORE_STATUS_RX_IDLE_DETECT_MASK  0x100000000
+#define SERDES_CORE_STATUS_CORE_STS_MASK	0x0ffffffff
+#define SERDES_CORE_STATUS_RX_SIG_OK_MASK       0x000000010
+#define SERDES_CORE_STATUS_SPICO_READY_MASK     0x000000020
+
+#define TUNE_DATA_PRBS                  0
+#define TUNE_DATA_CORE                  1
+#define TUNE_DATA                       TUNE_DATA_CORE
+
+#define BDC_SERDES_RATE_UNINITIALIZED   0
+#define BDC_SERDES_RATE_DOWN_MIN        (BDC_SERDES_RATE_UNINITIALIZED + 1)
+#define BDC_SERDES_RATE_DOWN_MAX        1000
+#define BDC_SERDES_RATE_25G_NRZ_MIN     (BDC_SERDES_RATE_DOWN_MAX + 1)
+#define BDC_SERDES_RATE_25G_NRZ_MAX     30000
+#define BDC_SERDES_RATE_50G_PAM4_MIN    (BDC_SERDES_RATE_25G_NRZ_MAX + 1)
+#define BDC_SERDES_RATE_50G_PAM4_MAX    60000
+
+#define ROS_ETH_SERDES_SBUS_BCAST       0xee
+
+#define ROSHMS_PORT_UNAVAILABLE         0
+#define ROSHMS_PORT_AVAILABLE           1
+
+#define NUM_PAM4_EYES                   6
+#define NUM_NRZ_EYES                    1
+
+#define SBL_BER_DWELL               2
+#define SBL_CORE_STATUS_RD_RETRY_DELAY  1
+
+#define SPICO_INT_DATA_PRBS_RETRY_LIMIT 8
+#define SPICO_INT_DATA_PRBS_RETRY_DELAY 1
+
+#define SPICO_PROC_RESET_RETRY_TIMEOUT_MS 2000
+
+#define SERDES_POST_FLASH_READY_CNT     50
+
+#endif /* _SBL_CONSTANTS_H_ */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_internal.h b/drivers/net/ethernet/hpe/sbl/sbl_internal.h
new file mode 100644
index 000000000000..690c327e2961
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_internal.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2019-2023,2025 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_INTERNAL_H_
+#define _SBL_INTERNAL_H_
+
+#include <linux/version.h>
+#include <linux/completion.h>
+
+#include <uapi/ethernet/sbl_serdes.h>
+
+#ifdef TRACE2
+#define DEV_TRACE2(dev, format, args...) dev_dbg(dev, format, ## args)
+#else
+#define DEV_TRACE2(dev, format, args...) dev_ignore(dev, format, ## args)
+#endif /* TRACE2 */
+
+#ifdef TRACE3
+#define DEV_TRACE3(dev, format, args...) dev_dbg(dev, format, ## args)
+#else
+#define DEV_TRACE3(dev, format, args...) dev_ignore(dev, format, ## args)
+#endif /* TRACE3 */
+
+#ifndef fallthrough
+#define fallthrough __attribute__((__fallthrough__))
+#endif
+
+#define SBL_AN_MAX_TX_PAGES             3
+
+/* Max number of times we can tune using saved params and find params out-of-bounds
+ * before we give up and do a full tune without saved params
+ */
+#define SBL_MAX_TUNE_PARAM_OOB_FAILS   4
+
+/* The amount of time SBL waits before reloading firmware
+ * when firmware corruption is detected.
+ */
+#define SBL_SERDES_STATE_DUMP_DELAY 200 /* ms */
+
+/* approximate time for signal to travel 1m (for copper cables) */
+#define SBL_MEDIA_NS_PER_M                              4
+/* approximate time for signal to travel 1m (for optical cables) */
+#define SBL_MEDIA_OPTICAL_NS_PER_M                      5
+/* approximate time for signal to pass through an optical transceiver */
+#define SBL_MEDIA_OPTICAL_TRANCEIVER_DELAY             35  /* ns */
+/* approximate time for packet to pass from PCS to Serdes */
+#define SBL_ASIC_TX_DELAY                              25  /* ns */
+#define SBL_ASIC_RX_DELAY                              91  /* ns */
+
+#define SBL_PML_REC_POLL_INTERVAL                       4  /* ms */
+#define SBL_PML_REC_LLR_TIMEOUT_OFFSET                  8  /* ms */
+
+#ifndef timer_container_of
+#define timer_container_of from_timer
+#endif
+
+struct sbl_pml_recovery {
+	struct sbl_inst *sbl;
+	struct timer_list timer;
+	spinlock_t lock;      /* protects enabled, started and timer arming */
+	bool  enabled;        /* new recovery may start or rearm */
+	bool  started;
+	u32 port_num;
+	u32 timeout;
+	enum sbl_link_down_origin down_origin;
+	u64 init_jiffies;
+	u64 last_poll_jiffies;
+	u64 rl_window_start;
+	int rl_time_remaining;
+};
+
+void sbl_pml_recovery_init(struct sbl_pml_recovery *recovery);
+void sbl_pml_recovery_enable(struct sbl_inst *sbl, int port_num);
+
+/* link database record */
+struct sbl_link {
+	int num;                                  /* link/port number */
+	spinlock_t lock;                          /* Data lock */
+
+	struct sbl_media_attr     mattr;          /* physical media properties */
+	bool mconfigured;                         /* is the media attr configured */
+	struct sbl_base_link_attr blattr;         /* link related configuration */
+	bool blconfigured;                        /* is the base-link attr configured */
+
+	u32 sstate;                               /* serdes state */
+	u32 serr;                                 /* serdes error number */
+	u32 blstate;                              /* base link state */
+	u32 blerr;                                /* base link error number */
+	u32 link_info;                            /* misc informative bits describing links internal state */
+
+	struct mutex busy_mtx;                    /* held when starting/stopping */
+
+	spinlock_t timeout_lock;                  /* protect timing values */
+	unsigned long last_start_jiffy;           /* last jiffy before link start time out */
+
+	u32 start_timeout;                        /* active start timeout */
+	ktime_t start_time_begin;                 /* start timestamp (for sysfs) */
+	struct timespec64 start_time;             /* time for start to complete (link up time) (for sysfs) */
+	ktime_t up_time_begin;                    /* timestamp when an/lpd completed (for sysfs) */
+	struct timespec64 up_time;                /* time for link to come up after an/lpd (for sysfs) */
+	ktime_t tune_time_begin;                  /* timestamp when serdes started tuning (for sysfs) */
+	struct timespec64 tune_time;              /* time for serdes tuning attempt to complete (for sysfs) */
+	struct timespec64 total_tune_time;        /* total time for serdes tuning to complete (for sysfs) */
+
+	u32 active_rx_lanes;                      /* pcs rx lanes in use for the current mode */
+	u32 active_fec_lanes;                     /* fec lanes in use for the current mode */
+	bool pcs_config;                          /* is the pcs hw configured */
+
+	u64 an_tx_page[SBL_AN_MAX_TX_PAGES];      /* pages to send during autoneg */
+	int an_tx_count;                          /* count of autoneg pages to send */
+	u64 an_rx_page[SBL_AN_MAX_RX_PAGES];      /* pages received during autoneg */
+	int an_rx_count;                          /* count of autoneg pages received */
+	u32 an_try_count;                         /* number of autoneg attempts */
+	u32 an_nonce;                             /* The nonce used for autoneg */
+	struct completion an_hw_change;           /* signal an hw err flag has been set */
+	bool an_timeout_active;                   /* are we using the autoneg timeout */
+	bool an_100cr4_fixup_applied;             /* have applied this fixup */
+	u32 an_options;                           /* actual an options received */
+	int lp_subtype;                           /* link partner subtype */
+
+	bool reload_serdes_fw;                    /* do we need to reload the serdes fw */
+	bool lp_detected;                         /* has link partner been detected */
+	int lpd_try_count;                        /* count of lp detect attempts */
+
+	int dfe_tune_count;                       /* track the number of dfe tuning attempts */
+	bool optical_delay_active;                /* waiting in dfe-pre-delay before serdes tuning */
+	bool dfe_predelay_active;                 /* waiting in dfe-pre-delay before serdes tuning */
+	bool pcal_running;                        /* periodic calibration running */
+	u32 tune_param_oob_count;                 /* number of consecutive tunes with bad tuning params */
+	unsigned long pcal_start_jiffies;         /* time pcal started */
+	u32 ical_effort;                          /* serdes tuning effort level */
+	struct sbl_tuning_params tuning_params;   /* saved serdes tuning parameters */
+	struct mutex tuning_params_mtx;           /* lock tuning params */
+	bool start_cancelled;                     /* starting procedure was cancelled */
+
+	u32 link_mode;                            /* actual link mode to use after AN */
+	u32 ifg_config;                           /* actual ifg config */
+	u32 loopback_mode;                        /* actual loopback mode to use */
+	bool precoding_enabled;                   /* Is precoding on */
+	u32 llr_mode;                             /* actual llr mode used */
+	u32 llr_options;                          /* actual llr options used */
+	u64 llr_loop_time;                        /* the measured llr round trip time (ns) */
+
+	u64 intr_err_flgs;                        /* error flags registered with handler */
+	struct mutex serdes_mtx;                  /* lock for serdes operations */
+	atomic_t debug_config;                    /* debug flags */
+
+	bool       pcs_recovery_flag;             /* PCS recovery flag */
+	spinlock_t pcs_recovery_lock;             /* PCS recovery lock */
+
+	struct sbl_pml_recovery pml_recovery;     /* PML recovery fields */
+
+	bool is_degraded;                         /* link is degraded flag */
+	spinlock_t is_degraded_lock;              /* link is degraded lock */
+
+	atomic_t *counters;                       /* SBL link counters */
+
+	struct fec_data *fec_data;
+	bool fec_monitor_enabled;                 /* protected by lock */
+	unsigned long fec_discard_time;               /* fec mon discard trigger time */
+	enum sbl_fec_discard_type fec_discard_type;   /* fec mon discard trigger type */
+	spinlock_t fec_discard_lock;                  /* fec mon discard trigger lock */
+};
+
+/* debug support */
+bool sbl_debug_option(struct sbl_inst *sbl, int port_num, u32 flags);
+void dev_ignore(struct device *dev, const char *format, ...) __printf(2, 3);
+
+void sbl_fec_monitor_start(struct sbl_inst *sbl, int port_num);
+void sbl_fec_monitor_stop(struct sbl_inst *sbl, int port_num);
+
+/* access the single char dev */
+struct device *sbl_get_device(void);
+
+/* serdes */
+u32 sbl_serdes_get_config_tag(void);
+
+/* timing and timeouts */
+void sbl_link_init_start_timeout(struct sbl_inst *sbl, int port_num);
+void sbl_link_update_start_timeout(struct sbl_inst *sbl, int port_num,
+				   unsigned int timeout_ms);
+bool sbl_start_timeout(struct sbl_inst *sbl, int port_num);
+void sbl_start_timeout_ensure_remaining(struct sbl_inst *sbl, int port_num,
+					unsigned int remaining_s);
+u32  sbl_get_start_timeout(struct sbl_inst *sbl, int port_num);
+int  sbl_link_start_elapsed(struct sbl_inst *sbl, int port_num);
+void sbl_link_start_record_timespec(struct sbl_inst *sbl, int port_num);
+void sbl_link_up_begin(struct sbl_inst *sbl, int port_num);
+void sbl_link_up_record_timespec(struct sbl_inst *sbl, int port_num);
+void sbl_link_tune_begin(struct sbl_inst *sbl, int port_num);
+int  sbl_link_tune_elapsed(struct sbl_inst *sbl, int port_num);
+void sbl_link_tune_zero_total_timespec(struct sbl_inst *sbl, int port_num);
+void sbl_link_tune_update_total_timespec(struct sbl_inst *sbl, int port_num);
+int sbl_switch_info_get(struct sbl_inst *sbl, struct sbl_init_attr *init_attr);
+
+/* misc */
+int sbl_validate_port_num(struct sbl_inst *sbl, int port_num);
+const char *sbl_an_state_str(int state);
+const char *sbl_an_get_sm_state(struct sbl_inst *sbl, int port_num);
+
+/* These functions are provides by the calling framework
+ *
+ * register access
+ */
+static inline u32  sbl_read32(struct sbl_inst *sbl, long offset)
+{
+	return (*sbl->ops.sbl_read32)(sbl->pci_accessor, offset);
+}
+
+static inline u64  sbl_read64(struct sbl_inst *sbl, long offset)
+{
+	return (*sbl->ops.sbl_read64)(sbl->pci_accessor, offset);
+}
+
+static inline void sbl_write32(struct sbl_inst *sbl, long offset, u32 val)
+{
+	(*sbl->ops.sbl_write32)(sbl->pci_accessor, offset, val);
+}
+
+static inline void sbl_write64(struct sbl_inst *sbl, long offset, u64 val)
+{
+	(*sbl->ops.sbl_write64)(sbl->pci_accessor, offset, val);
+}
+
+/* sbus access */
+static inline int sbl_sbus_op(struct sbl_inst *sbl, int ring, u32 req_data,
+			      u8 data_addr, u8 rx_addr, u8 command,
+		u32 *rsp_data, u8 *result_code, u8 *overrun,
+		int timeout, unsigned int flags)
+{
+	return (*sbl->ops.sbl_sbus_op)(sbl->accessor, ring, req_data,
+				       data_addr, rx_addr, command,
+			rsp_data, result_code, overrun,
+			timeout, flags);
+}
+
+static inline int sbl_sbus_op_reset(struct sbl_inst *sbl, int ring)
+{
+	return (*sbl->ops.sbl_sbus_op_reset)(sbl->accessor, ring);
+}
+
+/* misc other functions */
+static inline bool sbl_is_fabric_link(struct sbl_inst *sbl, int port_num)
+{
+	return (*sbl->ops.sbl_is_fabric_link)(sbl->accessor, port_num);
+}
+
+static inline int sbl_get_max_frame_size(struct sbl_inst *sbl, int port_num)
+{
+	return (*sbl->ops.sbl_get_max_frame_size)(sbl->accessor, port_num);
+}
+
+static inline void sbl_async_alert(struct sbl_inst *sbl, int port_num, int alert_type,
+				   void *alert_data, int size)
+{
+	(*sbl->ops.sbl_async_alert)(sbl->accessor, port_num, alert_type, alert_data, size);
+}
+
+void sbl_llr_max_data_get(struct sbl_inst *sbl, int port_num,
+			  u64 *cap_data_max, u64 *cap_seq_max);
+int sbl_frame_size(struct sbl_inst *sbl, int port_num);
+u64 sbl_llr_edge_cap_data_max_get(void);
+u64 sbl_llr_edge_cap_seq_max_get(void);
+void sbl_an_send_next_page(struct sbl_inst *sbl, int port_num) __maybe_unused;
+void sbl_an_setup_next_page(struct sbl_inst *sbl, int port_num, int page_idx) __maybe_unused;
+void sbl_an_setup_null_page(struct sbl_inst *sbl, int port_num)  __maybe_unused;
+int sbl_an_page_exchange(struct sbl_inst *sbl, int port_num, unsigned long remaining_jiffies);
+bool sbl_an_is_next_page(struct sbl_inst *sbl, int port_num) __maybe_unused;
+void sbl_an_dump_state(struct sbl_inst *sbl, int port_num) __maybe_unused;
+void sbl_an_version_read(struct sbl_inst *sbl, int port_num);
+int  sbl_an_hw_wait_prepare(struct sbl_inst *sbl, int port_num)  __maybe_unused;
+bool sbl_an_next_is_complete(struct sbl_inst *sbl, int port_num) __maybe_unused;
+/* SBL counter functions */
+int sbl_link_counters_init(struct sbl_link *link);
+void sbl_link_counters_term(struct sbl_link *link);
+int sbl_link_counters_incr(struct sbl_inst *sbl, int port_num, u16 counter);
+
+#endif /* _SBL_INTERNAL_H_ */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_link.h b/drivers/net/ethernet/hpe/sbl/sbl_link.h
new file mode 100644
index 000000000000..f8d51b1215f5
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_link.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2019-2022,2025 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_LINK_H_
+#define _SBL_LINK_H_
+
+/* link mode auto negotiation */
+int sbl_link_autoneg(struct sbl_inst *sbl, int port_num);
+
+/* state info flags for trace/debug */
+enum sbl_link_info_flags {
+	SBL_LINK_INFO_LP_DET       = (1 << 0),  /* trying to detect lp */
+	SBL_LINK_INFO_PCS_ANEG     = (1 << 1),  /* pcs configured for autoneg */
+	SBL_LINK_INFO_PCS_TX_AM    = (1 << 2),  /* pcs is sending AM */
+	SBL_LINK_INFO_PCS_ALIGN_EN = (1 << 3),  /* pcs alignment enabled */
+	SBL_LINK_INFO_PCS_A_WAIT   = (1 << 4),  /* pcs waiting for alignment */
+	SBL_LINK_INFO_PCS_TX_RF    = (1 << 5),  /* pcs is sending remote fault */
+	SBL_LINK_INFO_PCS_F_WAIT   = (1 << 6),  /* pcs waiting for faults to clear */
+	SBL_LINK_INFO_PCS_UP       = (1 << 7),  /* pcs is up and aligned */
+	SBL_LINK_INFO_MAC_OP       = (1 << 8),  /* MAC is operational */
+	SBL_LINK_INFO_OS           = (1 << 9),  /* sending ordered sets */
+	SBL_LINK_INFO_LLR_LOOP     = (1 << 10), /* llr can measure loop time */
+	SBL_LINK_INFO_LLR_DETECT   = (1 << 11), /* llr detect */
+	SBL_LINK_INFO_LLR_MEASURE  = (1 << 12), /* llr measuring loop time */
+	SBL_LINK_INFO_LLR_WAIT     = (1 << 13), /* waiting for llr to be ready */
+	SBL_LINK_INFO_LLR_RUN      = (1 << 14), /* llr is operational */
+	SBL_LINK_INFO_LLR_DISABLED = (1 << 15), /* llr is setup but disabled */
+	SBL_LINK_INFO_FAULT_MON    = (1 << 16), /* link fault detection is operational */
+};
+
+void sbl_link_info_set(struct sbl_inst *sbl, int port_num, u32 flag);
+void sbl_link_info_clear(struct sbl_inst *sbl, int port_num, u32 flag);
+
+/* sysfs */
+#ifdef CONFIG_SYSFS
+int sbl_pml_pcs_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_pml_pcs_lane_degrade_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+#endif
+
+/* debug */
+void sbl_link_lock_dbg(struct sbl_inst *sbl, int port_num, char *text);
+
+#endif /* _SBL_LINK_H_ */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_platform.h b/drivers/net/ethernet/hpe/sbl/sbl_platform.h
new file mode 100644
index 000000000000..d47630f9e84a
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_platform.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_PLATFORM_H_
+#define _SBL_PLATFORM_H_
+
+#define SBUS_RING_MTX(sbl, ring) ((sbl)->sbus_ring_mtx)
+#define SBM_FW_MTX(sbl, ring) ((sbl)->sbm_fw_mtx)
+
+#define sbl_dev_log(_logfn, _dev, _fmt, ...)						\
+	do {									\
+		char __sbl_inst[sizeof(sbl->iattr.inst_name)];			\
+		char __sbl_eth[sizeof(sbl->iattr.eth_if_name)];		\
+		sbl_inst_names_get(sbl, __sbl_inst, __sbl_eth);			\
+		_logfn((_dev), "%s[%s]: " _fmt, __sbl_inst, __sbl_eth, ##__VA_ARGS__);	\
+	} while (0)
+
+#define sbl_dev_err(_dev, _fmt, ...) sbl_dev_log(dev_err, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_dbg(_dev, _fmt, ...) sbl_dev_log(dev_dbg, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_warn(_dev, _fmt, ...) sbl_dev_log(dev_warn, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_info(_dev, _fmt, ...) sbl_dev_log(dev_info, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_err_ratelimited(_dev, _fmt, ...) \
+	sbl_dev_log(dev_err_ratelimited, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_dbg_ratelimited(_dev, _fmt, ...) \
+	sbl_dev_log(dev_dbg_ratelimited, _dev, _fmt, ##__VA_ARGS__)
+/* Configuration passing into SBL init */
+struct sbl_init_attr {
+	u32 magic;
+	u32 uc_nic;
+	u32 uc_platform;
+	bool is_hw;
+};
+
+#endif /* _SBL_PLATFORM_H_ */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml_fn.h b/drivers/net/ethernet/hpe/sbl/sbl_pml_fn.h
new file mode 100644
index 000000000000..cfe12f0da980
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_pml_fn.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2019-2023 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_PML_FN_H_
+#define _SBL_PML_FN_H_
+
+/* min time to bring up pml block */
+#define SBL_PML_MIN_START_TIME                2 /* s */
+
+/* pcs alignment */
+#define SBL_PML_PCS_ALIGN_TIMEOUT          1000 /* ms */
+#define SBL_PML_PCS_ALIGN_SLOW_POLL_DELAY  1000 /* ms */
+
+/* number of times we see no fault to decide pcs is up */
+#define SBL_PML_REQUIRED_NO_FAULT_COUNT       2
+
+/* number of llr timing measurements required */
+#define SBL_PML_LLR_TIMING_LOOPS              10
+
+/* delay for llr measurement to complete (us) */
+#define SBL_PML_LLR_TIMING_MEASURE_DELAY      50
+
+/* llr capacity calc nums */
+#define SBL_PML_LLR_MIN_LOOP_TIME       60ULL /* ns per spec                 */
+#define SBL_PML_LLR_MAX_LOOP_TIME     3000ULL /* ns max 100m cable           */
+#define SBL_PML_LLR_NUM_FRAMES           2ULL /* frame multiplier            */
+
+/* delay after unsuccessful measurement attempt (ms) */
+#define SBL_PML_LLR_TIMING_PERIOD        2000ULL /* ns for 200m */
+#define SBL_PML_LLR_TIMING_RETRY_DELAY       200
+
+/* LLR detect timing */
+#define SBL_PML_LLR_DETECT_DELAY    100 /* ms */
+#define SBL_PML_LLR_DETECT_TIMEOUT 1000 /* ms */
+
+/* LLR options */
+#define SBL_PML_LLR_OPTION_HPC_WIH_LLR (1 << 0)
+
+/* Max number of Physical Lanes available on Tx/Rx */
+#define MAX_PLS_AVAILABLE 0xF
+
+/* Timeout for Health Markers. We'll surely receive health markers in 100 us, if any */
+#define HM_TIMEOUT 100
+
+/* the PML error flags that can be generated by the various blocks */
+#define SBL_PML_ALL_PCS_ERR_FLGS              0x0001fff800000000ULL
+#define SBL_PML_ALL_MAC_ERR_FLGS              0x0006000000000000ULL
+#define SBL_PML_ALL_LLR_ERR_FLGS              0x1ff8000000000000ULL
+
+/* PML error flags monitored during autoneg */
+#define SBL_AUTONEG_ERR_FLGS	 (SBL_PML_ERR_FLG_AUTONEG_COMPLETE_SET(1ULL) | \
+				  SBL_PML_ERR_FLG_AUTONEG_PAGE_RECEIVED_SET(1ULL))
+
+/* PML error flags monitored for link faults */
+#define SBL_PML_FAULT_ERR_FLAGS		(SBL_PML_ERR_FLG_PCS_LINK_DOWN_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_HI_SER_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_LLR_REPLAY_AT_MAX_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_TX_DEGRADE_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_RX_DEGRADE_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_TX_DEGRADE_FAILURE_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_RX_DEGRADE_FAILURE_SET(1ULL))
+
+#define SBL_PML_REC_FAULT_ERR_FLAGS	(SBL_PML_ERR_FLG_PCS_LINK_DOWN_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_HI_SER_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_TX_DEGRADE_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_RX_DEGRADE_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_TX_DEGRADE_FAILURE_SET(1ULL) | \
+					 SBL_PML_ERR_FLG_PCS_RX_DEGRADE_FAILURE_SET(1ULL))
+
+/* general PML */
+int  sbl_pml_start(struct sbl_inst *sbl, int port_num);
+int  sbl_pml_link_down(struct sbl_inst *sbl, int port_num);
+void sbl_pml_set_defaults(struct sbl_inst *sbl, int port_num);
+bool sbl_pml_err_flgs_test(struct sbl_inst *sbl, int port_num, u64 err_flgs);
+void sbl_pml_err_flgs_clear(struct sbl_inst *sbl, int port_num, u64 err_flgs);
+void sbl_pml_err_flgs_clear_all(struct sbl_inst *sbl, int port_num);
+void sbl_pml_link_down_async_alert(struct sbl_inst *sbl, int port_num,
+				   enum sbl_link_down_origin down_origin);
+
+/* interrupts */
+int sbl_pml_install_intr_handler(struct sbl_inst *sbl, int port_num, u64 err_flags);
+int sbl_pml_enable_intr_handler(struct sbl_inst *sbl, int port_num, u64 err_flags);
+int sbl_pml_disable_intr_handler(struct sbl_inst *sbl, int port_num, u64 err_flags);
+int sbl_pml_remove_intr_handler(struct sbl_inst *sbl, int port_num);
+
+/* PCS */
+int   sbl_pml_pcs_am_start(struct sbl_inst *sbl, int port_num);
+bool  sbl_pml_pcs_high_serdes_error(struct sbl_inst *sbl, int port_num);
+bool  sbl_pml_pcs_up(struct sbl_inst *sbl, int port_num);
+void  sbl_pml_pcs_enable_alignment(struct sbl_inst *sbl, int port_num);
+void  sbl_pml_pcs_disable_alignment(struct sbl_inst *sbl, int port_num);
+int   sbl_pml_pcs_wait(struct sbl_inst *sbl, int port_num);
+void  sbl_pml_pcs_start(struct sbl_inst *sbl, int port_num);
+void  sbl_pml_pcs_stop(struct sbl_inst *sbl, int port_num);
+void  sbl_pml_pcs_ordered_sets(struct sbl_inst *sbl, int port_num, int enable);
+void  sbl_pml_pcs_set_tx_rf(struct sbl_inst *sbl, int port_num);
+void  sbl_pml_pcs_clear_tx_rf(struct sbl_inst *sbl, int port_num);
+char *sbl_pml_pcs_state_str(struct sbl_inst *sbl, int port_num, char *buf, int len);
+void  sbl_pml_pcs_enable_auto_lane_degrade(struct sbl_inst *sbl, int port_num);
+bool  sbl_pml_rx_pls_available(struct sbl_inst *sbl, int port_num);
+bool  sbl_pml_lp_pls_available(struct sbl_inst *sbl, int port_num);
+bool  sbl_pml_recovery_no_faults(struct sbl_inst *sbl, int port_num);
+void  sbl_pml_recovery_log_pcs_status(struct sbl_inst *sbl, int port_num);
+
+/* MAC */
+int  sbl_pml_mac_config(struct sbl_inst *sbl, int port_num);
+void sbl_pml_mac_hw_status(struct sbl_inst *sbl, int port_num, bool *tx_op,
+			   bool *rx_op, u32 *ifg_mode, u32 *ifg_adjustment);
+void sbl_pml_mac_hpc_set(struct sbl_inst *sbl, int port_num);
+
+/* LLR */
+void sbl_pml_llr_config(struct sbl_inst *sbl, int port_num);
+int  sbl_pml_llr_start(struct sbl_inst *sbl, int port_num);
+u64  sbl_pml_llr_link_down_behaviour(struct sbl_inst *sbl, int port_num);
+
+/* TODO: update the values below to reflect changes in the draft
+ * standard
+ */
+#define SBL_PCS_200_CM                        0xD6D9B56505264A9A
+#define SBL_PCS_200_UM0                         0x733F4C298CC0B3
+#define SBL_PCS_200_UM1                         0x8121A5987EDE5A
+#define SBL_PCS_200_UM2                         0xA90CC10156F33E
+#define SBL_PCS_200_UM3                         0x2F7F797BD08086
+#define SBL_PCS_200_UM4                         0x0DAED5E6F2512A
+#define SBL_PCS_200_UM5                         0x2EB0EDB1D14F12
+#define SBL_PCS_200_UM6                         0x5E63BD11A19C42
+#define SBL_PCS_200_UM7                         0xA48929CD5B76D6
+#define SBL_PCS_200_CM_MATCH_MSK                          0x3F3F
+#define SBL_PCS_200_UM_MATCH_MSK                          0x3F3F
+
+#endif  /* _SBL_PML_FN_H_ */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_sbm.h b/drivers/net/ethernet/hpe/sbl/sbl_sbm.h
new file mode 100644
index 000000000000..73b97081a5d7
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_sbm.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP. All rights reserved. */
+
+#ifndef SBL_SBM_H
+#define SBL_SBM_H
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+
+#include <linux/hpe/sbl/sbl.h>
+
+#include "sbl_internal.h"
+
+#define SBL_ERR(dev, format, args...)    sbl_dev_err(dev, format, ## args)
+#define SBL_WARN(dev, format, args...)   sbl_dev_warn(dev, format, ## args)
+#define SBL_INFO(dev, format, args...)   sbl_dev_info(dev, format, ## args)
+#define SBL_TRACE1(dev, format, args...) dev_dbg(dev, format, ## args)
+#define SBL_TRACE2(dev, format, args...) DEV_TRACE2(dev, format, ## args)
+#define SBL_TRACE3(dev, format, args...) DEV_TRACE3(dev, format, ## args)
+
+inline int sbl_sbm_sbus_op(struct sbl_inst *sbl, int ring, u32 req_data,
+			     u8 data_addr, u8 rx_addr, u8 command,
+			     u32 *rsp_data, u8 *result_code, u8 *overrun,
+			     int timeout, u32 flags)
+{
+	return sbl_sbus_op(sbl, ring, req_data, data_addr, rx_addr, command,
+			   rsp_data, result_code, overrun, timeout, flags);
+}
+
+inline int sbl_sbm_sbus_op_reset(struct sbl_inst *sbl, int ring)
+{
+	return sbl_sbus_op_reset(sbl, ring);
+}
+
+inline int sbl_sbm_pml_serdes_op(struct sbl_inst *sbl, int port_num,
+				   u64 serdes_sel, u64 op, u64 data,
+				   u16 *result, int timeout, u32 flags)
+{
+	return sbl_pml_serdes_op(sbl, port_num, serdes_sel, op, data, result,
+				 timeout, flags);
+}
+
+inline int sbl_sbm_get_sbus_op_timeout_ms(struct sbl_inst *sbl)
+{
+	return sbl->iattr.sbus_op_timeout_ms;
+}
+
+inline int sbl_sbm_get_sbus_int_timeout(struct sbl_inst *sbl)
+{
+	return sbl->iattr.sbus_int_timeout;
+}
+
+inline int sbl_sbm_get_sbus_int_poll_interval(struct sbl_inst *sbl)
+{
+	return sbl->iattr.sbus_int_poll_interval;
+}
+
+inline int sbl_sbm_get_serdes_op_timeout_ms(struct sbl_inst *sbl)
+{
+	return sbl->iattr.serdes_op_timeout_ms;
+}
+
+inline int sbl_sbm_get_sbus_op_flags(struct sbl_inst *sbl)
+{
+	return sbl->sbus_op_flags;
+}
+
+inline int sbl_sbm_get_serdes_op_flags(struct sbl_inst *sbl)
+{
+	return sbl->iattr.serdes_op_flags;
+}
+#endif /* SBL_SBM_H */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.h b/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.h
new file mode 100644
index 000000000000..dc52632b77a7
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP. All rights reserved. */
+
+#ifndef SBL_SBM_SERDES_H
+#define SBL_SBM_SERDES_H
+
+/**
+ * @brief Returns true if the sbus_addr is a CM4 SerDes
+ *
+ * @param sbus_addr address describing a serdes ring and rxaddr
+ *
+ * @return true if match, else false
+ */
+bool is_cm4_serdes_addr(u32 sbus_addr);
+
+/**
+ * @brief Returns true if the sbus_addr is a PCIe SerDes
+ *
+ * @param sbus_addr address describing a serdes ring and rxaddr
+ *
+ * @return true if match, else false
+ */
+bool is_pcie_serdes_addr(u32 sbus_addr);
+
+/**
+ * @brief Returns true if the sbus_addr is a Sbus Master Controller Receiver
+ *         Memory
+ *
+ * @param sbus_addr address describing a serdes ring and rxaddr
+ *
+ * @return true if match, else false
+ */
+bool is_sbm_crm_addr(u32 sbus_addr);
+
+/**
+ * @brief Returns true if the sbus_addr is a Spico processor
+ *
+ * @param sbus_addr address describing a serdes ring and rxaddr
+ *
+ * @return true if match, else false
+ */
+bool is_sbm_spico_addr(u32 sbus_addr);
+
+/**
+ * @brief Issue an interrupt to read SerDes memory
+ *
+ * @param port target port number
+ * @param serdes target serdes lane
+ * @param addr memory address to read
+ * @param data location to store read result
+ *
+ * @return 0 on success, -1 on failure
+ */
+int sbl_serdes_mem_rd(void *sbl, u32 port, u32 serdes, u32 addr,
+		      u16 *data);
+
+/**
+ * @brief Issue an interrupt to write SerDes memory
+ *
+ * @param port target port number
+ * @param serdes target serdes lane
+ * @param addr memory address to write
+ * @param data write data
+ *
+ * @return 0 on success, -1 on failure
+ */
+int sbl_serdes_mem_wr(void *sbl, u32 port, u32 serdes, u32 addr,
+		      u16 data);
+
+/**
+ * @brief Issue an interrupt to read-modify-write SerDes memory
+ *
+ * @param port target port number
+ * @param serdes target serdes lane
+ * @param addr memory address to write
+ * @param data write data
+ * @param mask write mask
+ *
+ * @return 0 on success, -1 on failure
+ */
+int sbl_serdes_mem_rmw(void *sbl, u32 port, u32 serdes, u32 addr,
+		       u16 data, u16 mask);
+
+/**
+ * @brief Convenience function to issue an SBus op and check the result_code
+ *	 and overrun against the original command
+ *
+ * @param sbus_ring target sbus ring
+ * @param reg_addr target sbus register address
+ * @param command 8-bit sbus command field
+ * @param sbus_data target sbus data
+ * @param result location to store result of command (for reads)
+ *
+ * @return 0 on success, -1 on failure
+ */
+int sbl_sbus_wr(void *sbl, u32 sbus_addr, u8 reg_addr,
+		u32 sbus_data);
+int sbl_sbus_rd(void *sbl, u32 sbus_addr, u8 reg_addr,
+		u32 *result);
+int sbl_sbus_op_aux(void *sbl, u32 sbus_addr, u8 reg_addr,
+		    u8 command, u32 sbus_data, u32 *result);
+
+/**
+ * @brief upload rom to target sbus address
+ *
+ * @param sbus_ring target sbus ring
+ * @param reg_addr target sbus register address
+ * @param fw_size byte size of firmware image
+ * @param fw_data byte array of size fw_size
+ *
+ * @return 0 on success, -1 on failure
+ */
+int sbl_spico_burst_upload(void *sbl, u32 sbus, u32 reg,
+			   size_t fw_size, const u8 *fw_data);
+
+/**
+ * @brief Write an interrupt request to a target SBM Spico
+ *
+ * @param sbus_addr address describing a serdes ring and rxaddr
+ * @param code interrupt command
+ * @param data interrupt data
+ * @param result location to store result of interrupt
+ *
+ * @return 0 on success, -1 on failure
+ */
+int sbl_sbm_spico_int(void *sbl, u32 sbus_addr, int code,
+		      int data, u32 *result);
+
+/**
+ * @brief Write an interrupt request to a set of SerDes Spicos
+ *
+ * @param config_entry address list describing SerDes lanes
+ * @param interrupt command
+ * @param data interrupt data
+ * @param result pointer to store result in.
+ * @param result_action ignore the interrupt result, store it to the result
+ *		      pointer, or validate it matches code
+ *
+ * @return 0 if all results are the same, else -1
+ */
+int sbl_serdes_spico_int(void *sbl, u32 port, u32 serdes,
+			 int code, int data, u16 *result, u8 result_action);
+/**
+ * @param sbus_addr address describing a serdes ring and rxaddr
+ */
+int sbl_serdes_spico_int2(void *sbl, u32 sbus_addr, int code,
+			  int data, u16 *result, u8 result_action);
+void sbl_sbus_addr_get(u32 *sbus_addr);
+bool is_pcie_serdes_pcs_addr(u32 sbus_addr);
+void sbus_addr_to_string(u32 sbus_addr, char *data_str);
+
+#endif /* SBL_SBM_SERDES_H */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_serdes.h b/drivers/net/ethernet/hpe/sbl/sbl_serdes.h
new file mode 100644
index 000000000000..77db5e042e8c
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_serdes.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2019-2020,2022-2023 Hewlett Packard Enterprise Development LP. All rights reserved. */
+
+#ifndef _SBL_SERDES_H_
+#define _SBL_SERDES_H_
+
+/**
+ * @brief SerDes test function
+ *
+ * @param sbl sbl_inst pointer containing target config and state
+ *
+ * @return 0 on success or negative errno on failure
+ */
+int sbl_serdes_test(struct sbl_inst *sbl);
+
+/**
+ * @brief SerDes initial load function
+ *
+ *  To be called after the Rosetta power cycle or the controller boots
+ *  Applyies the SBus speedup and flashes all SBM/SerDes firmware images
+ *
+ * @param sbl sbl_inst pointer containing target config and state
+ * @param port_num target port number
+ * @param force reset and flash even if current fw is at the correct
+ *        rev and build number
+ *
+ * @return 0 on success or negative errno on failure
+ */
+int sbl_serdes_load(struct sbl_inst *sbl, int port_num, bool force);
+
+/**
+ * @brief SerDes link partner detection
+ *
+ * This blocking function will use the Serdes to determine if the
+ * link partner is present ant trying to come up.
+ *
+ * @param sbl sbl_inst pointer containing target config and state
+ * @param port_num target port number
+ *
+ * @return 0 on success or negative errno on failure
+ */
+int sbl_serdes_lp_detect(struct sbl_inst *sbl, int port_num);
+
+/**
+ * @brief Start the SerDes lanes for a given port
+ *
+ * @param sbl sbl_inst pointer containing target config and state
+ * @param port_num target port number
+ *
+ * @return 0 on success or negative errno on failure
+ */
+int sbl_serdes_start(struct sbl_inst *sbl, int port_num);
+
+/**
+ * @brief Stops the SerDes lanes for a given port
+ *
+ * @param sbl sbl_inst pointer containing target config and state
+ * @param port_num target port number
+ *
+ * @return 0 on success or negative errno on failure
+ */
+int sbl_serdes_stop(struct sbl_inst *sbl, int port_num);
+
+/**
+ * @brief Resets all SerDes lanes for a given port
+ *
+ * @param sbl sbl_inst pointer containing target config and state
+ * @param port_num target port number
+ *
+ * @return 0 on success or negative errno on failure
+ */
+int sbl_serdes_reset(struct sbl_inst *sbl, int port_num);
+
+/**
+ * @brief Sets up the serdes at the correct speed to perform autonegotiation
+ *
+ * @param sbl sbl_inst pointer containing target config and state
+ * @param port_num target port number
+ *
+ * @return 0 on success or negative errno on failure
+ */
+int sbl_an_serdes_start(struct sbl_inst *sbl, int port_num);
+
+/**
+ * @brief Stops the SerDes lanes for a given port
+ *
+ * @param sbl sbl_inst pointer containing target config and state
+ * @param port_num target port number
+ *
+ * @return 0 on success or negative errno on failure
+ */
+int sbl_an_serdes_stop(struct sbl_inst *sbl, int port_num);
+
+#endif /* _SBL_SERDES_H_ */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.h b/drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.h
new file mode 100644
index 000000000000..b72a6acb8c93
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP */
+#ifndef SBL_SERDES_FN_H
+#define SBL_SERDES_FN_H
+
+#include <linux/hpe/sbl/sbl.h>
+
+/* Get SBM firmware version from the given SBUS ring. */
+void sbl_sbm_get_fw_vers(struct sbl_inst *sbl, int sbus_ring, uint *fw_rev,
+			 uint *fw_build);
+
+/* Get serdes firmware version for the specified port and serdes lane. */
+void sbl_serdes_get_fw_vers(struct sbl_inst *sbl, int port_num, int serdes,
+			    uint *fw_rev, uint *fw_build);
+
+/* Sbus Master firmware flash - all rings */
+int sbl_sbm_firmware_flash(struct sbl_inst *sbl);
+
+/* Sbus Master firmware flash */
+int sbl_sbm_firmware_flash_ring(struct sbl_inst *sbl, int first_ring,
+				int last_ring, bool force);
+
+/* SerDes firmware flash */
+int sbl_serdes_firmware_flash(struct sbl_inst *sbl, int port_num, bool force);
+
+/* SerDes firmware flash with auto-recovery attempt */
+int sbl_serdes_firmware_flash_safe(struct sbl_inst *sbl, int port_num,
+				   bool force);
+
+/* Check if CRC for target serdes lane is valid */
+int sbl_validate_serdes_fw_crc(struct sbl_inst *sbl, int port_num, int serdes);
+
+/* Check if SerDes desired_rev matches flashed version */
+int sbl_validate_serdes_fw_vers(struct sbl_inst *sbl, int port_num, int serdes,
+				int fw_rev, int fw_build);
+
+/* Check if SerDes desired_rev matches flashed version */
+int sbl_validate_sbm_fw_vers(struct sbl_inst *sbl, u32 sbus_ring,
+			     int fw_rev, int fw_build);
+
+/* Upload target firmware image to single location */
+int sbl_serdes_firm_upload(struct sbl_inst *sbl, int port_num, size_t fw_size,
+			   const u8 *fw_data);
+
+/* Upload target firmware image to multiple locations */
+int sbl_sbm_firm_upload(struct sbl_inst *sbl, int sbus_ring,
+			size_t fw_size, const u8 *fw_data);
+
+/* Ensures most tuning parameters for a given port are within range. */
+int sbl_check_serdes_tuning_params(struct sbl_inst *sbl, int port_num);
+
+/* Gets a given SerDes' tuning params */
+int sbl_save_serdes_tuning_params(struct sbl_inst *sbl, int port_num);
+
+/* Set a given SerDes tuning params */
+int sbl_apply_serdes_tuning_params(struct sbl_inst *sbl, int port, int serdes);
+
+/* Perfrom dfe tune on a particular serdes */
+int sbl_serdes_dfe_tune_start(struct sbl_inst *sbl, int port_num, int serdes,
+			      bool is_retune);
+
+/* Wait for a particular serdes to complete its DFE tune */
+int sbl_serdes_dfe_tune_wait(struct sbl_inst *sbl, int port_num);
+
+/* Perfrom dfe tune on a port */
+int sbl_port_dfe_tune_start(struct sbl_inst *sbl, int port_num, bool is_retune);
+
+/* Wait for a port to complete its DFE tune */
+int sbl_port_dfe_tune_wait(struct sbl_inst *sbl, int port_num);
+
+/* Read and validate eye heights for a port */
+int sbl_port_check_eyes(struct sbl_inst *sbl, int port_num);
+
+/* Return maps of serdes status for a port */
+int sbl_port_get_serdes_state_maps(struct sbl_inst *sbl, int port_num,
+				   u8 *active_map, u8 *not_idle_map, u8 *ok_eye_map);
+
+/* Updates the state in the sbl struct from the tgt values */
+void sbl_update_internal_state(struct sbl_inst *sbl, int port_num);
+
+/* DFE tune a port */
+int sbl_port_dfe_tune(struct sbl_inst *sbl, int port_num, bool is_retune);
+
+/* Get the 6 eye heights */
+int sbl_get_eye_heights(struct sbl_inst *sbl, int port_num, int serdes,
+			int *eye_heights);
+
+/* Issues a soft SBus reset */
+int sbl_serdes_soft_reset(struct sbl_inst *sbl, int port_num, int serdes);
+
+/* Runs SerDes initization */
+int sbl_serdes_init(struct sbl_inst *sbl, int port_num, int serdes,
+		    int encoding, int divisor, int width);
+
+/* Applies tx/rx polarity inversion and other config */
+int sbl_serdes_polarity_ctrl(struct sbl_inst *sbl, int port_num, int serdes,
+			     int encoding, bool an);
+
+/* Enables/Disabled SerDes Tx/Rx */
+int sbl_set_tx_rx_enable(struct sbl_inst *sbl, int port_num, int serdes,
+			 bool tx_en, bool rx_en, bool txo_en);
+
+/* Sets the CTLE parameters */
+int sbl_set_gs(struct sbl_inst *sbl, int port_num, int serdes, int gs1,
+	       int gs2);
+
+/* Sets the TX data select */
+int sbl_set_tx_data_sel(struct sbl_inst *sbl, int port_num, int serdes,
+			int data_sel);
+
+/* Sets the TX data select */
+int sbl_set_tx_eq(struct sbl_inst *sbl, int port_num, int serdes,
+		  int atten, int pre, int post, int pre2, int pre3);
+
+/* Sets the Rx compare mode and data, qualification, and performs an
+ *	error reset
+ */
+int sbl_set_prbs_rx_mode(struct sbl_inst *sbl, int port_num, int serdes);
+
+/* Set SBM clock divider */
+int sbl_apply_sbus_divider(struct sbl_inst *sbl, int value);
+
+/* Begin continuous adaptive tuning on all enabled lanes for this port */
+int sbl_port_start_pcal(struct sbl_inst *sbl, int port_num);
+
+/* Stop continuous adaptive tuning on all enabled lanes for this port */
+int sbl_port_stop_pcal(struct sbl_inst *sbl, int port_num);
+
+/* Setup to perform a SerDes mini-tune */
+int sbl_serdes_minitune_setup(struct sbl_inst *sbl, int port_num);
+
+/* Block until a SerDes mini-tune completes, fails or times out */
+int sbl_serdes_minitune_block(struct sbl_inst *sbl, int port_num);
+
+/* Configure the SerDes lanes for a given port */
+int sbl_serdes_config(struct sbl_inst *sbl, int port_num, bool allow_an);
+
+/* Tune the SerDes lanes for a given port */
+int sbl_serdes_tuning(struct sbl_inst *sbl, int port_num);
+
+/* Reset SPICO micro */
+int sbl_spico_reset(struct sbl_inst *sbl, int port_num);
+
+/* Reset the PLLs on a serdes */
+int sbl_reset_serdes_plls(struct sbl_inst *sbl, int port_num);
+
+/* Log port eye heights */
+void sbl_log_port_eye_heights(struct sbl_inst *sbl, int port_num);
+
+#endif /* SBL_SERDES_FN_H */
diff --git a/drivers/net/ethernet/hpe/sbl/sbl_serdes_map.h b/drivers/net/ethernet/hpe/sbl/sbl_serdes_map.h
new file mode 100644
index 000000000000..f2ea2129a4cb
--- /dev/null
+++ b/drivers/net/ethernet/hpe/sbl/sbl_serdes_map.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP. All rights reserved. */
+#ifndef SBL_SERDES_MAP_H
+#define SBL_SERDES_MAP_H
+
+#include <linux/hpe/sbl/sbl_kconfig.h>
+#include <uapi/ethernet/sbl_serdes_map.h>
+#include <uapi/ethernet/sbl_serdes_map_init.h>
+
+#endif /* SBL_SERDES_MAP_H */
diff --git a/include/linux/hpe/sbl/sbl.h b/include/linux/hpe/sbl/sbl.h
new file mode 100644
index 000000000000..e4f1063ba88f
--- /dev/null
+++ b/include/linux/hpe/sbl/sbl.h
@@ -0,0 +1,436 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_H_
+#define _SBL_H_
+
+#include <linux/types.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/firmware.h>
+
+#include <uapi/ethernet/sbl-abi.h>
+#include <uapi/ethernet/sbl_serdes.h>
+#include <uapi/ethernet/sbl_counters.h>
+
+#include "sbl_platform.h"
+
+#define SBL_VERSION_MAJOR		      3
+#define SBL_VERSION_MINOR		     22
+#define SBL_VERSION_INC			     24
+
+#define SBL_MAGIC		     0x6273696c  /* sbli */
+#define SBL_INIT_ATTR_MAGIC	     0x62736965  /* sbla */
+
+#define SBL_AN_MAX_RX_PAGES		     20
+#define SBL_DFE_USED_SAVED_PARAMS	     -2
+
+/* min size of buffer for pcs state string */
+#define SBL_PCS_STATE_STR_LEN		     64
+
+/* min size of buffer for base link state string */
+#define SBL_BASE_LINK_STATE_STR_LEN	     (SBL_PCS_STATE_STR_LEN + 16)
+
+struct sbl_tuning_params;
+struct sbl_sc_values;
+struct sbl_serdes_config;
+
+
+/* Reasons for taking the link down asynchronously */
+enum sbl_link_down_origin {
+	SBL_LINK_DOWN_ORIGIN_UNKNOWN = 0,
+	SBL_LINK_DOWN_ORIGIN_LINK_DOWN,
+	SBL_LINK_DOWN_ORIGIN_LOCAL_FAULT,
+	SBL_LINK_DOWN_ORIGIN_REMOTE_FAULT,
+	SBL_LINK_DOWN_ORIGIN_ALIGN,
+	SBL_LINK_DOWN_ORIGIN_HISER,
+	SBL_LINK_DOWN_ORIGIN_LLR_MAX,
+	SBL_LINK_DOWN_ORIGIN_DEGRADE_FAILURE,
+	SBL_LINK_DOWN_ORIGIN_UCW,		/* FEC - high uncorrected fec error rate */
+	SBL_LINK_DOWN_ORIGIN_CCW,		/* FEC - high corrected fec error rate */
+	SBL_LINK_DOWN_ORIGIN_LLR_TX_REPLAY,	/* FEC - high llr_tx_replay fec error rate */
+};
+
+
+/* Internal llr state machine states
+ * (missing from pml header)
+ */
+enum sbl_pml_llr_state_e {
+	SBL_PML_LLR_STATE_UNKNOWN = 0,
+	SBL_PML_LLR_STATE_OFF,
+	SBL_PML_LLR_STATE_INIT,
+	SBL_PML_LLR_STATE_ADVANCE,
+	SBL_PML_LLR_STATE_HALT,
+	SBL_PML_LLR_STATE_REPLAY,
+	SBL_PML_LLR_STATE_DISCARD,
+	SBL_PML_LLR_STATE_MONITOR,
+};
+
+
+/**
+ * @brief Inter-frame gap config
+ */
+enum sbl_ifg_mode {
+	SBL_IFG_MODE_INVALID = 0,
+	SBL_IFG_MODE_UNKNOWN,
+	SBL_IFG_MODE_HPC,	  /**< Fabric link  */
+	SBL_IFG_MODE_IEEE,	  /**< Use IEEE standard */
+};
+
+
+/**
+ * @brief IEEE inter-frame gap adjustment
+ */
+enum sbl_ifg_ieee_adjustment {
+	SBL_IFG_IEEE_ADJUSTMENT_INVALID = 0,
+	SBL_IFG_IEEE_ADJUSTMENT_UNKNOWN,
+	SBL_IFG_IEEE_ADJUSTMENT_200G,	      /**< IEEE 200G adjustment */
+	SBL_IFG_IEEE_ADJUSTMENT_100G,	      /**< IEEE 100G adjustment */
+	SBL_IFG_IEEE_ADJUSTMENT_50G,	      /**< IEEE 50G adjustment */
+	SBL_IFG_IEEE_ADJUSTMENT_NONE,	      /**< No adjustment */
+};
+
+
+/**
+ * @brief Async alert types
+ */
+enum sbl_async_alert_type {
+	SBL_ASYNC_ALERT_INVALID		     = 0, /**< Invalid alert */
+	SBL_ASYNC_ALERT_LINK_DOWN	     = 1, /**< Link down alert */
+	SBL_ASYNC_ALERT_SERDES_FW_CORRUPTION = 2, /**< SerDes firmware corruption alert */
+	SBL_ASYNC_ALERT_TX_DEGRADE	     = 3, /**< TX lane degrade alert */
+	SBL_ASYNC_ALERT_RX_DEGRADE	     = 4, /**< RX lane degrade alert */
+	SBL_ASYNC_ALERT_TX_DEGRADE_FAILURE   = 5, /**< TX lane degrade failure alert */
+	SBL_ASYNC_ALERT_RX_DEGRADE_FAILURE   = 6, /**< RX lane degrade failure alert */
+	SBL_ASYNC_ALERT_SBM_FW_LOAD_FAILURE  = 7, /**< SBus master fw load failure alert */
+};
+
+
+/**
+ * @brief event triggers to discard fec window
+ */
+enum sbl_fec_discard_type {
+	SBL_FEC_DISCARD_TYPE_INVALID = 0,	/**< Invalid discard reason */
+	SBL_FEC_DISCARD_TYPE_RX_DEGRADE,	/**< RX lane degraded */
+	SBL_FEC_DISCARD_TYPE_PML_REC_START,	/**< PML recovery started */
+	SBL_FEC_DISCARD_TYPE_PML_REC_END,	/**< PML recovery ended */
+};
+
+
+/**
+ * @brief Link Partner Type
+ */
+enum sbl_lp_subtype {
+	SBL_LP_SUBTYPE_INVALID	  = -1,    /**< Invalid - uninitialized		*/
+	SBL_LP_SUBTYPE_UNKNOWN	  = 0,	   /**< Link is up, but type is Unknown */
+	SBL_LP_SUBTYPE_CASSINI_V1 = 1,	   /**< Type is Cassini V1		*/
+	SBL_LP_SUBTYPE_CASSINI_V2 = 2	   /**< Type is Cassini V2		*/
+};
+
+
+/* Operations provided by the calling framework */
+struct sbl_ops {
+	/* register access */
+	u32  (*sbl_read32)(void *pci_accessor, long offset);
+	u64  (*sbl_read64)(void *pci_accessor, long offset);
+	void (*sbl_write32)(void *pci_accessor, long offset, u32 val);
+	void (*sbl_write64)(void *pci_accessor, long offset, u64 val);
+
+	/* sbus access */
+	int (*sbl_sbus_op)(void *accessor, int ring, u32 req_data,
+			u8 data_addr, u8 rx_addr, u8 command,
+			u32 *rsp_data, u8 *result_code, u8 *overrun,
+			int timeout, unsigned int flags);
+	int (*sbl_sbus_op_reset)(void *accessor, int ring);
+
+	/* external state */
+	bool (*sbl_is_fabric_link)(void *accessor, int port_num);
+	int  (*sbl_get_max_frame_size)(void *accessor, int port_num);
+
+	/* pml block intr support */
+	int  (*sbl_pml_install_intr_handler)(void *accessor, int port_num, u64 err_flags);
+	int  (*sbl_pml_enable_intr_handler)(void *accessor, int port_num, u64 err_flags);
+	int  (*sbl_pml_disable_intr_handler)(void *accessor, int port_num, u64 err_flags);
+	int  (*sbl_pml_remove_intr_handler)(void *accessor, int port_num, u64 err_flags);
+
+	/* async alert */
+	void (*sbl_async_alert)(void *accessor, int port_num, int alert_type, void *alert_data, int size);
+};
+
+struct lane_degrade {
+	u64 tx;
+	u64 rx;
+};
+
+struct fec_data {
+	struct sbl_fec *fec_prmts;	/* fec parameters */
+	struct timer_list fec_timer;	/* Fec timer */
+	struct sbl_inst *sbl;
+	int port_num;
+	struct work_struct fec_timer_work;
+};
+
+/* A slingshot base link device instance */
+struct sbl_inst {
+	int magic;
+	int id;
+	struct device *dev;			 /* shared linux device */
+
+	void *accessor;				 /* accessor for calling framework */
+	void *pci_accessor;			 /* accessor for pci io */
+	struct sbl_ops ops;			 /* table of external operations provided by caller */
+	struct sbl_instance_attr iattr;		 /* instance attributes */
+	spinlock_t name_lock;			 /* iattr name writers vs log snapshots */
+	struct sbl_switch_info *switch_info;
+
+	u32 sbus_op_flags;			 /* active sbus op flags */
+
+	struct list_head serdes_config_list;	 /* list of serdes configurations */
+	spinlock_t serdes_config_lock;		 /* lock serdes configurations list */
+
+	struct sbl_link *link;			 /* link database */
+
+	struct mutex *sbus_ring_mtx;		 /* locks for sbus critical section management */
+
+	struct mutex *sbm_fw_mtx;		 /* locks for sbus master firmware load */
+
+	bool *reload_sbm_fw;			 /* do we need to reload the sbm fw for each ring */
+
+	atomic_t *sbm_fw_reload_count;		 /* counter to track sbus master fw reload */
+
+	struct workqueue_struct *workq;
+
+	bool is_hw;
+};
+
+static inline void sbl_inst_names_get(struct sbl_inst *sbl, char *inst_name,
+				      char *eth_if_name)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&sbl->name_lock, flags);
+	memcpy(inst_name, sbl->iattr.inst_name, sizeof(sbl->iattr.inst_name));
+	memcpy(eth_if_name, sbl->iattr.eth_if_name, sizeof(sbl->iattr.eth_if_name));
+	spin_unlock_irqrestore(&sbl->name_lock, flags);
+
+	inst_name[sizeof(sbl->iattr.inst_name) - 1] = '\0';
+	eth_if_name[sizeof(sbl->iattr.eth_if_name) - 1] = '\0';
+}
+
+static inline int sbl_validate_instance(struct sbl_inst *sbl)
+{
+	if (!sbl)
+		return -EINVAL;
+	else if (sbl->magic != SBL_MAGIC)
+		return -EINVAL;
+	else
+		return 0;
+}
+
+void sbl_get_version(int *major, int *minor, int *inc);
+
+int sbl_get_num_sbus_rings(struct sbl_inst *sbl);
+
+/* Instance management */
+struct sbl_inst *sbl_new_instance(void *accessor, void *pci_accessor,
+				  const struct sbl_ops *ops,
+				  struct sbl_init_attr *init_attr);
+void   sbl_set_eth_name(struct sbl_inst *sbl, const char *name);
+int    sbl_delete_instance(struct sbl_inst *sbl);
+int    sbl_initialise_instance(struct sbl_inst *sbl, struct sbl_instance_attr *attr);
+int    sbl_restore_instance(struct sbl_inst *sbl);
+
+/* media management */
+int  sbl_media_config(struct sbl_inst *sbl, int port_num,
+		struct sbl_media_attr *attr);
+int  sbl_media_unconfig(struct sbl_inst *sbl, int port_num);
+bool sbl_media_check_mode_supported(struct sbl_inst *sbl, int port_num,
+		u32 mode);
+bool sbl_media_check_headshell_reset_supported(struct sbl_inst *sbl, int port_num);
+int  sbl_media_validate_config(struct sbl_inst *sbl, int port_num);
+int  sbl_media_calc_loop_time(struct sbl_inst *sbl, int port_num, u64 *min_loop_time);
+u64  sbl_media_get_loop_time_ns(struct sbl_inst *sbl, int port_num,
+		bool require_measurement);
+u32 sbl_media_get_len_cm(struct sbl_inst *sbl, int port_num, u64 len);
+
+/* Base link control */
+int  sbl_get_lp_subtype(struct sbl_inst *sbl, int port_num, enum sbl_lp_subtype *lp_subtype);
+int  sbl_base_link_config(struct sbl_inst *sbl, int port_num,
+		struct sbl_base_link_attr *blattr);
+int  sbl_base_link_start(struct sbl_inst *sbl, int port_num);
+int  sbl_base_link_enable_start(struct sbl_inst *sbl, int port_num);
+int  sbl_base_link_cancel_start(struct sbl_inst *sbl, int port_num);
+bool sbl_base_link_start_cancelled(struct sbl_inst *sbl, int port_num);
+int  sbl_base_link_stop(struct sbl_inst *sbl, int port_num);
+int  sbl_base_link_reset(struct sbl_inst *sbl, int port_num);
+int  sbl_base_link_get_status(struct sbl_inst *sbl, int port_num,
+		int *blstate, int *blerr, int *sstate, int *serr,
+		int *media_type, int *link_mode);
+void sbl_base_link_try_start_fail_cleanup(struct sbl_inst *sbl,
+		int port_num);
+char *sbl_base_link_state_str(struct sbl_inst *sbl, int port_num, char *buf, int len);
+int  sbl_base_link_dump_attr(struct sbl_inst *sbl, int port_num,
+		char *buf, size_t size);
+
+/* fec thresholds */
+int  sbl_link_get_fec_thresholds(struct sbl_inst *sbl, int port_num,
+		int *ucw_bad, int *ccw_bad, int *fecl_warn);
+u64  sbl_link_get_ucw_thresh_ieee(struct sbl_inst *sbl, int port_num);
+u64  sbl_link_get_ucw_thresh_hpe(struct sbl_inst *sbl, int port_num);
+u64  sbl_link_get_ccw_thresh_ieee(struct sbl_inst *sbl, int port_num);
+u64  sbl_link_get_ccw_thresh_hpe(struct sbl_inst *sbl, int port_num);
+u64  sbl_link_get_stp_ccw_thresh_ieee(struct sbl_inst *sbl, int port_num);
+u64  sbl_link_get_stp_ccw_thresh_hpe(struct sbl_inst *sbl, int port_num);
+
+/* serdes tuning params */
+int sbl_serdes_get_tuning_params(struct sbl_inst *sbl, int port_num,
+		struct sbl_tuning_params *tuning_params);
+int sbl_serdes_set_tuning_params(struct sbl_inst *sbl, int port_num,
+		struct sbl_tuning_params *tuning_params);
+int sbl_serdes_invalidate_tuning_params(struct sbl_inst *sbl, int port_num);
+int sbl_serdes_invalidate_all_tuning_params(struct sbl_inst *sbl);
+
+/* Timing flags */
+int sbl_flags_get_poll_interval_from_flags(unsigned int flags);
+int sbl_flags_get_delay_from_flags(unsigned int flags);
+
+/* serdes configurations */
+int  sbl_serdes_add_config(struct sbl_inst *sbl, u64 tp_state_mask0,
+		u64 tp_state_mask1, u64 tp_state_match0,
+		u64 tp_state_match1, u64 port_mask, u8 serdes_mask,
+		struct sbl_sc_values *vals, bool is_default);
+int  sbl_serdes_del_config(struct sbl_inst *sbl, u64 tp_state_mask0,
+		u64 tp_state_mask1, u64 tp_state_match0, u64 tp_state_match1,
+		u64 port_mask, u8  serdes_mask);
+int sbl_serdes_clear_all_configs(struct sbl_inst *sbl, bool clr_default);
+void sbl_serdes_dump_configs(struct sbl_inst *sbl);
+struct sbl_switch_info *sbl_get_switch_info(int *size);
+
+/* pml block intr handler */
+int sbl_pml_hdlr(struct sbl_inst *sbl, int port_num, void *data);
+void sbl_pml_recovery_cancel(struct sbl_inst *sbl, int port_num);
+
+/* serdes operations (using core interrupt mechanism) */
+int sbl_pml_serdes_op_timing(struct sbl_inst *sbl, int port_num, u64 capture,
+		u64 clear, u64 set);
+int sbl_pml_serdes_op(struct sbl_inst *sbl, int port_num, u64 serdes_sel,
+		u64 op, u64 data, u16 *result, int timeout, unsigned int flags);
+
+/* MAC */
+void sbl_pml_mac_start(struct sbl_inst *sbl, int port_num);
+void sbl_pml_mac_stop(struct sbl_inst *sbl, int port_num);
+
+/* misc */
+void sbl_pml_llr_stop(struct sbl_inst *sbl, int port_num);
+void sbl_pml_llr_disable(struct sbl_inst *sbl, int port_num);
+void sbl_pml_llr_enable(struct sbl_inst *sbl, int port_num);
+bool sbl_pml_llr_check_is_ready(struct sbl_inst *sbl, int port_num, unsigned int timeout_ms);
+u32  sbl_pml_llr_get_state(struct sbl_inst *sbl, int port_num);
+int  sbl_get_an_pages(struct sbl_inst *sbl, int port_num, int *count, u64 *pages);
+bool sbl_pml_pcs_aligned(struct sbl_inst *sbl, int port_num);
+void sbl_pml_pcs_recovery_enable(struct sbl_inst *sbl, int port_num);
+void sbl_pml_pcs_recovery_disable(struct sbl_inst *sbl, int port_num);
+void sbl_ignore_save_tuning_param(struct sbl_inst *sbl, int port_num, bool ignore);
+void sbl_enable_opt_lane_degrade(struct sbl_inst *sbl, int port_num, bool enable);
+void sbl_disable_pml_recovery(struct sbl_inst *sbl, int port_num, bool disable);
+void sbl_pml_recovery_log_link_down(struct sbl_inst *sbl, int port_num);
+void sbl_set_degraded_flag(struct sbl_inst *sbl, int port_num);
+void sbl_clear_degraded_flag(struct sbl_inst *sbl, int port_num);
+bool sbl_get_degraded_flag(struct sbl_inst *sbl, int port_num);
+
+/* sysfs support */
+#ifdef CONFIG_SYSFS
+int sbl_media_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_media_type_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_serdes_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_serdes_fw_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_pml_pcs_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_pml_pcs_lane_degrade_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_pml_pcs_speed_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_base_link_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_base_link_llr_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_base_link_loopback_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_debug_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+int sbl_sbm_fw_sysfs_sprint(struct sbl_inst *sbl, int ring, char *buf, size_t size);
+int sbl_fec_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, size_t size);
+#endif
+
+/* debug support */
+void sbl_debug_clear_config(struct sbl_inst *sbl, int port_num);
+void sbl_debug_update_config(struct sbl_inst *sbl, int port_num,
+		u32 clear_flags, u32 set_flags);
+int sbl_debug_get_config(struct sbl_inst *sbl, int port_num, u32 *options);
+
+/* pretty printing */
+const char *sbl_link_state_str(enum sbl_base_link_status state);
+const char *sbl_link_len_str(enum sbl_link_len len);
+const char *sbl_link_vendor_str(enum sbl_link_vendor vendor);
+const char *sbl_link_media_str(enum sbl_link_media media);
+const char *sbl_an_mode_str(enum sbl_an_mode mode);
+const char *sbl_link_mode_str(enum sbl_link_mode mode);
+const char *sbl_rs_mode_str(enum sbl_rs_mode mode);
+const char *sbl_ifg_mode_str(enum sbl_ifg_mode mode);
+const char *sbl_ifg_config_str(enum sbl_ifg_config config);
+const char *sbl_llr_mode_str(enum sbl_llr_mode mode);
+const char *sbl_llr_down_behaviour_str(enum sbl_llr_down_behaviour behaviour);
+const char *sbl_loopback_mode_str(enum sbl_loopback_mode state);
+const char *sbl_serdes_effort_str(u32 effort);
+const char *sbl_serdes_state_str(enum sbl_serdes_status state);
+const char *sbl_async_alert_str(enum sbl_async_alert_type alert_type);
+const char *sbl_fec_discard_str(enum sbl_fec_discard_type discard_type);
+const char *sbl_down_origin_str(enum sbl_link_down_origin down_origin);
+
+/* SBL counter get functions */
+int sbl_link_counters_get(struct sbl_inst *sbl, int port_num,
+						int *counters, u16 first, u16 count);
+int sbl_link_counters_read(struct sbl_inst *sbl, int port_num, u16 counter);
+
+/*
+ * Function to generate a hash of the given state configuration.
+ * The function can be used to create either match values or match masks
+ *     hash0:
+ *     link_partner:	0x00000000000000ff
+ *     loopback_mode:	0x000000000000ff00
+ *     tuning_pattern:	0x0000000000ff0000
+ *     link_mode:	0x00000000ff000000
+ *     media_type:	0x000000ff00000000
+ *     media_vendor:	0x00ffff0000000000
+ *     hash1:
+ *     media_len:	0xffffffffffffffff
+ *     e.g. If the configuration applies for all LPs and TPs, and for LB off,
+ *          LM of BJ_100, 1m copper cables for all vendors, then set the
+ *          following:
+ *     hash0 = 0x00ff010201ff04ff
+ *     hash1 = 0x0000000000000020
+ *
+ */
+static inline u64 sbl_create_tp_hash0(u8 link_partner_mask,
+					u8 loopback_mode_mask,
+					u8 tuning_pattern_mask,
+					u8 link_mode_mask,
+					u8 media_type_mask,
+					u16 media_vendor_mask)
+{
+	u64 hash = 0;
+
+	SBL_TPH_LP_SET(hash, link_partner_mask);
+	SBL_TPH_LB_SET(hash, loopback_mode_mask);
+	SBL_TPH_TP_SET(hash, tuning_pattern_mask);
+	SBL_TPH_LM_SET(hash, link_mode_mask);
+	SBL_TPH_MT_SET(hash, media_type_mask);
+	SBL_TPH_MV_SET(hash, media_vendor_mask);
+
+	return hash;
+}
+static inline u64 sbl_create_tp_hash1(u64 media_len_mask)
+{
+	u64 hash = 0;
+
+	SBL_TPH_ML_SET(hash, media_len_mask);
+
+	return hash;
+}
+
+#endif /* _SBL_H_ */
diff --git a/include/linux/hpe/sbl/sbl_an.h b/include/linux/hpe/sbl/sbl_an.h
new file mode 100644
index 000000000000..09b30743636f
--- /dev/null
+++ b/include/linux/hpe/sbl/sbl_an.h
@@ -0,0 +1,174 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP */
+
+/* This header file includes definitions relating to the autonegotiation
+   feature. This information comes largely from Clause 73 of 802.3-2015 */
+
+
+#ifndef SBL_AN_H
+#define SBL_AN_H
+
+/* See section 73.6 of the IEEE 802.3-2015 standard for an explanation of the link
+   codeword encoding */
+
+/* Control word (base page) structure */
+
+/* Selector Field */
+/* Bits D0:D4/S0:S4 */
+#define AN_CW_S_BASE_BIT            0
+#define AN_CW_S_MASK                0x1F
+#define AN_CW_S_802_3               1
+
+/* Echoed Nonce */
+/* Bits D5:D9/E0:E4 */
+#define AN_CW_E_BASE_BIT            5
+#define AN_CW_E_MASK                (0x1FL << AN_CW_E_BASE_BIT)
+
+/* Pause Ability */
+/* Bits D10:D12/C0:C2 */
+#define AN_CW_C_BASE_BIT            10
+#define AN_CW_C_MASK                (0x7L << AN_CW_C_BASE_BIT)
+#define AN_CW_C_SYMMETRIC_BIT       0
+#define AN_CW_C_SYMMETRIC           (1L << AN_CW_C_SYMMETRIC_BIT)
+#define AN_CW_C_ASYMMETRIC_BIT      1
+#define AN_CW_C_ASYMMETRIC          (1L << AN_CW_C_ASYMMETRIC_BIT)
+/* C2 is reserved */
+
+/* Remote Fault */
+/* Bit D13 */
+#define AN_CW_RF_BIT                13
+#define AN_CW_RF_MASK               (1L << AN_CW_RF_BIT)
+
+/* Ack */
+/* Bit D14 */
+#define AN_CW_ACK_BIT               14
+#define AN_CW_ACK_MASK              (1L << AN_CW_ACK_BIT)
+
+/* Next Page */
+/* Bit D15 */
+#define AN_CW_NP_BIT                15
+#define AN_CW_NP_MASK               (1L << AN_CW_NP_BIT)
+
+/* Transmitted Nonce */
+/* Bits D16:D20/T0:T4 */
+#define AN_CW_T_BASE_BIT            16
+#define AN_CW_T_MASK                (0x1FL << AN_CW_T_BASE_BIT)
+
+/* Technology Ability */
+/* Bits D21:D43/A0:A22 */
+/* NB top 2 bits moved into Fec ability field in updated spec ???? */
+#define AN_CW_A_BASE_BIT            21
+#define AN_CW_A_MASK                (0x1FFFFFL << AN_CW_A_BASE_BIT)
+#define AN_CW_A_1000BASE_KX_BIT     0
+#define AN_CW_A_1000BASE_KX         (1L << AN_CW_A_1000BASE_KX_BIT)
+#define AN_CW_A_10GBASE_KX4_BIT     1
+#define AN_CW_A_10GBASE_KX4         (1L << AN_CW_A_10GBASE_KX4_BIT)
+#define AN_CW_A_10GBASE_KR_BIT      2
+#define AN_CW_A_10GBASE_KR          (1L << AN_CW_A_10GBASE_KR_BIT)
+#define AN_CW_A_40GBASE_KR4_BIT     3
+#define AN_CW_A_40GBASE_KR4         (1L << AN_CW_A_40GBASE_KR4_BIT)
+#define AN_CW_A_40GBASE_CR4_BIT     4
+#define AN_CW_A_40GBASE_CR4         (1L << AN_CW_A_40GBASE_CR4_BIT)
+#define AN_CW_A_100GBASE_CR10_BIT   5
+#define AN_CW_A_100GBASE_CR10       (1L << AN_CW_A_100GBASE_CR10_BIT)
+#define AN_CW_A_100GBASE_KP4_BIT    6
+#define AN_CW_A_100GBASE_KP4        (1L << AN_CW_A_100GBASE_KP4_BIT)
+#define AN_CW_A_100GBASE_KR4_BIT    7
+#define AN_CW_A_100GBASE_KR4        (1L << AN_CW_A_100GBASE_KR4_BIT)
+#define AN_CW_A_100GBASE_CR4_BIT    8
+#define AN_CW_A_100GBASE_CR4        (1L << AN_CW_A_100GBASE_CR4_BIT)
+#define AN_CW_A_25GBASE_KR_S_BIT    9
+#define AN_CW_A_25GBASE_KR_S        (1L << AN_CW_A_25GBASE_KR_S_BIT)
+#define AN_CW_A_25GBASE_KR_BIT      10
+#define AN_CW_A_25GBASE_KR          (1L << AN_CW_A_25GBASE_KR_BIT)
+#define AN_CW_A_2P5GBASE_KX_BIT     11
+#define AN_CW_A_2P5GBASE_KX         (1L << AN_CW_A_2P5GBASE_KX_BIT)
+#define AN_CW_A_5GBASE_KR_BIT       12
+#define AN_CW_A_5GBASE_KR           (1L << AN_CW_A_5GBASE_KR_BIT)
+#define AN_CW_A_50GBASE_KR_BIT      13
+#define AN_CW_A_50GBASE_KR          (1L << AN_CW_A_50GBASE_KR_BIT)
+#define AN_CW_A_50GBASE_CR_BIT      AN_CW_A_50GBASE_KR_BIT
+#define AN_CW_A_50GBASE_CR          AN_CW_A_50GBASE_KR
+#define AN_CW_A_100GBASE_KR2_BIT    14
+#define AN_CW_A_100GBASE_KR2        (1L << AN_CW_A_100GBASE_KR2_BIT)
+#define AN_CW_A_100GBASE_CR2_BIT    AN_CW_A_100GBASE_KR2_BIT
+#define AN_CW_A_100GBASE_CR2        AN_CW_A_100GBASE_KR2
+#define AN_CW_A_200GBASE_KR4_BIT    15
+#define AN_CW_A_200GBASE_KR4        (1ULL << AN_CW_A_200GBASE_KR4_BIT)
+#define AN_CW_A_200GBASE_CR4_BIT    AN_CW_A_200GBASE_KR4_BIT
+#define AN_CW_A_200GBASE_CR4        AN_CW_A_200GBASE_KR4
+/* Bits 16-22 are reserved for future use */
+
+/* FEC Capability */
+/* Bits D46:D47/F0:F1, D44:D45/F2:F3 */
+#define AN_CW_F_BASE_BIT            44
+#define AN_CW_F_MASK                (0xFL << AN_CW_F_BASE_BIT)
+#define AN_CW_F_10G_ABILITY_BIT     2
+#define AN_CW_F_10G_ABILITY         (1L << AN_CW_F_10G_ABILITY_BIT)
+#define AN_CW_F_10G_REQUESTED_BIT   3
+#define AN_CW_F_10G_REQUESTED       (1L << AN_CW_F_10G_REQUESTED_BIT)
+#define AN_CW_F_25G_RS_REQ_BIT      0
+#define AN_CW_F_25G_RS_REQ          (1L << AN_CW_F_25G_RS_REQ_BIT)
+#define AN_CW_F_25G_BASER_REQ_BIT   1
+#define AN_CW_F_25G_BASER_REQ       (1L << AN_CW_F_25G_BASER_REQ_BIT)
+
+/* Next page structure */
+
+/* Next page (same as CW) */
+/* Bit D15 */
+#define AN_NP_NP_MASK               AN_CW_NP_MASK
+
+/* Toggle */
+/* Bit D11 */
+#define AN_NP_T_BIT                 11
+#define AN_NP_T_MASK                (1L << AN_NP_T_BIT)
+
+/* Message page */
+/* Bit D13 */
+#define AN_NP_MP_BIT                13
+#define AN_NP_MP_MASK               (1 << AN_NP_MP_BIT)
+
+/* Message code */
+/* Bits D0:D10,M0:M10 */
+#define AN_NP_MSG_BASE_BIT          0x0L
+#define AN_NP_MSG_MASK              (0x7ffULL << AN_NP_MSG_BASE_BIT)
+
+/* Unformatted code field */
+/* Bits D16:D47,U0:U31 */
+#define AN_NP_UCF_BASE_BIT          16
+#define AN_NP_UCF_MASK              (0xffffffffULL << AN_NP_UCF_BASE_BIT)
+
+/* OUI field */
+/* Bits D16:D39,U0:U23 */
+#define AN_NP_OUI_BASE_BIT          16
+#define AN_NP_OUI_MASK              (0xffffffULL << AN_NP_OUI_BASE_BIT)
+
+/* user defined data field */
+/* Bits D40:D47,U24:U31 */
+#define AN_NP_USR_BASE_BIT          40
+#define AN_NP_USR_MASK              (0xffULL << AN_NP_USR_BASE_BIT)
+
+/* Message codes */
+#define AN_NP_CODE_NULL_MSG         0x1ULL
+#define AN_NP_CODE_OUI_MSG          0x5ULL   /* Organizationally Unique Identifier Tagged Message            */
+#define AN_NP_CODE_OUI_EXTENDED_MSG 0xBULL   /* Organizationally Unique Identifier Tagged Message (Extended) */
+
+/* HPE OUI */
+#define AN_NP_OUI_HPE               (0xEC9B8BULL << AN_NP_OUI_BASE_BIT)
+#define AN_NP_OUI_VER_0_1           (0x01ULL << AN_NP_UCF_BASE_BIT)
+#define AN_NP_OUI_VER_MASK          (0xFFULL << AN_NP_UCF_BASE_BIT)
+
+/* AN options */
+#define AN_OPT_LLR                  (1ULL << 0)
+#define AN_OPT_ETHER_LLR            (1ULL << 1)
+#define AN_OPT_HPC_WITH_LLR         (1ULL << 2)
+/* TODO: add IPV4 option */
+#define AN_OPT_BASE_BIT             (AN_NP_UCF_BASE_BIT + 8)
+#define AN_OPT_MASK                 (AN_OPT_ETHER_LLR | AN_OPT_HPC_WITH_LLR | AN_OPT_LLR)
+
+/* Cassini */
+#define AN_LP_SUBTYPE_BASE_BIT      (AN_OPT_BASE_BIT + 8)
+#define AN_LP_SUBTYPE_MASK          (0x7ULL)
+
+#endif /* SBL_AN_H */
diff --git a/include/linux/hpe/sbl/sbl_csr_common.h b/include/linux/hpe/sbl/sbl_csr_common.h
new file mode 100644
index 000000000000..f8229b992436
--- /dev/null
+++ b/include/linux/hpe/sbl/sbl_csr_common.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Common utility defines.
+ * Copyright 2020 Cray Inc. All rights reserved
+ */
+#ifndef _SBL_CSR_COMMON_H_
+#define _SBL_CSR_COMMON_H_
+
+/* Extra massaging of Cassini definitions */
+#define C_CSR_MASK(type, member)      \
+	({                            \
+		uint64_t mask = 0;    \
+		union type t = { 0 }; \
+		t.member = -1;        \
+		mask = t.qw;          \
+		mask;                 \
+	})
+#define C_CSR_WORD_MASK(type, member, word) \
+	({                                  \
+		uint64_t mask = 0;          \
+		union type t = { 0 };       \
+		t.member = -1;              \
+		mask = t.qw[word];          \
+		mask;                       \
+	})
+#define C_CSR_OFFSET(type, member)                    \
+	({                                            \
+		int offset = 0;                       \
+		union type t = { 0 };                 \
+		t.member = 1;                         \
+		while (((t.qw >> offset) & 1) == 0) { \
+			offset++;                     \
+		}                                     \
+		offset;                               \
+	})
+#define C_CSR_WORD_OFFSET(type, member, word)               \
+	({                                                  \
+		int offset = 0;                             \
+		union type t = { 0 };                       \
+		t.member = 1;                               \
+		while (((t.qw[word] >> offset) & 1) == 0) { \
+			offset++;                           \
+		}                                           \
+		offset;                                     \
+	})
+
+/* UPDATE defines */
+#define C_UPDATE(val, value, type, member) \
+	(((val) & (~C_CSR_MASK(type, member))) | C_SET(value, type, member))
+
+/* SET defines */
+#define C_SET(value, type, member)                                       \
+	((((unsigned long long)(value)) << C_CSR_OFFSET(type, member)) & \
+	 C_CSR_MASK(type, member))
+
+/* GET defines */
+#define C_GET(value, type, member) \
+	(((value) & C_CSR_MASK(type, member)) >> C_CSR_OFFSET(type, member))
+#define C_WORD_GET(value, type, member, word)               \
+	(((value) & C_CSR_WORD_MASK(type, member, word)) >> \
+	 C_CSR_WORD_OFFSET(type, member, word))
+
+#endif /* _SBL_CSR_COMMON_H_ */
diff --git a/include/linux/hpe/sbl/sbl_fec.h b/include/linux/hpe/sbl/sbl_fec.h
new file mode 100644
index 000000000000..23594d79a91a
--- /dev/null
+++ b/include/linux/hpe/sbl/sbl_fec.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2024 Hewlett Packard Enterprise Development LP */
+
+/* FEC up check */
+#define SBL_FEC_UP_SETTLE_PERIOD	 250	   /* ms */
+#define SBL_FEC_UP_WINDOW		 250	   /* ms */
+#define SBL_FEC_UP_COUNT_FABRIC		 4
+#define SBL_FEC_UP_COUNT_EDGE		 1
+#define SBL_FEC_MON_PERIOD		 1000	   /* 1sec*/
+#define SBL_FEC_LLR_TX_REPLAY_THRESH	 100000	   /* llr_tx_replays/s */
+#define SBL_PCS_NUM_FECL_CNTRS		 8
+#define SBL_MAX_FEC_WARNINGS		 3	   /* number of warnings issued */
+
+struct sbl_pcs_fec_cntrs {
+	u64 ccw;				  /* corrected code words */
+	u64 ucw;				  /* uncorrected code words */
+	u64 llr_tx_replay;			  /* llr_tx_replay_event count */
+	u64 fecl[SBL_PCS_NUM_FECL_CNTRS];	  /* lane errors */
+	unsigned long time;			  /* either abs or interval */
+};
+
+
+
+struct sbl_inst;
+
+struct sbl_fec {
+	struct sbl_pcs_fec_cntrs *fec_curr_cnts;   /* current fec counters */
+	struct sbl_pcs_fec_cntrs *fec_prev_cnts;   /* previous fec counts */
+	struct sbl_pcs_fec_cntrs *fec_rates;	   /* current fec rates */
+	struct sbl_pcs_fec_cntrs fec_cntrs[2];
+	spinlock_t fec_cnt_lock;		   /* locks above pointers */
+
+	u64 fec_ucw_thresh;			   /* uncorrected codewords link up threshold */
+	u32 fec_ucw_up_thresh_adj;		   /* debug: percentage adjustment for link up threshold */
+	u32 fec_ucw_down_thresh_adj;		   /* percentage adjustment for link down threshold */
+	u32 fec_ucw_hwm;			   /* highest value measured */
+
+	u64 fec_ccw_thresh;			   /* corrected codewords link up threshold */
+	u32 fec_ccw_up_thresh_adj;		   /* debug: percentage adjustment for link up threshold */
+	u64 fec_stp_ccw_thresh;			   /* corrected codewords link up threshold when STP is used */
+	u32 fec_stp_ccw_up_thresh_adj;		   /* percentage adjustment for link up threshold when STP is used */
+	u32 fec_ccw_down_thresh_adj;		   /* percentage adjustment for link down threshold */
+	u32 fec_ccw_hwm;			   /* highest value measured */
+
+	u64 fec_llr_tx_replay_thresh;		   /* LLR TX Replay threshold */
+	u32 fec_llr_tx_replay_hwm;		   /* highest value measured */
+	u32 fecl_warn;				   /* corrected codewords per fec lane warning threshold */
+	spinlock_t fec_cw_lock;			   /* lock above thresholds */
+};
+
+
+/**
+ * @brief link monitor flags for setting fec thresholds
+ *
+ *	  Can be used in place of explicit threshold values
+ *
+ */
+
+enum sbl_link_fec_flags {
+	SBL_LINK_FEC_INVALID	=  0,	/**< invalid */
+	SBL_LINK_FEC_OFF	= -1,	/**< disable monitoring */
+	SBL_LINK_FEC_IEEE	= -2,	/**< Use IEEE value for link mode and media */
+	SBL_LINK_FEC_HPE	= -3,	/**< Use HPE value for link mode and media */
+	SBL_LINK_FEC_DEFAULT	= SBL_LINK_FEC_HPE,
+};
+
+void sbl_fec_thresholds_clear(struct sbl_inst *sbl, int port_num);
+int sbl_fec_adjustments_set(struct sbl_inst *sbl, int port_num,
+		u32 ucw_adj, u32 ccw_adj);
+
+int sbl_fec_thresholds_set(struct sbl_inst *sbl, int port_num,
+		s32 ucw_in, s32 ccw_in);
+
+void sbl_fec_counts_get(struct sbl_inst *sbl, int port_num, struct sbl_pcs_fec_cntrs *cntrs);
+int sbl_fec_up_check(struct sbl_inst *sbl, int port_num);
+void sbl_zero_all_fec_counts(struct sbl_inst *sbl, int port_num);
+void sbl_fec_timer(struct timer_list *timer);
+void sbl_fec_hwms_clear(struct sbl_inst *sbl, int port_num);
+void sbl_fec_dump(struct sbl_inst *sbl, int port_num);
+void sbl_fec_modify_adjustments(struct sbl_inst *sbl, int port_num,
+		u32 *ucw_up_adj, u32 *ccw_up_adj, u32 *ucw_down_adj, u32 *ccw_down_adj, u32 *stp_ccw_up_adj);
+int sbl_fec_txr_rate_set(struct sbl_inst *sbl, int port_num,
+		u32 txr_rate);
+void sbl_fec_timer_work(struct work_struct *work);
+void sbl_fec_ccw_bad_get(struct sbl_fec *fec_prmts, bool use_stp_thresh,
+			u64 *ccw_bad, u64 *ccw_hwm);
+void sbl_fec_ucw_bad_get(struct sbl_fec *fec_prmts, u64 *ucw_bad, u64 *ucw_hwm);
diff --git a/include/linux/hpe/sbl/sbl_kconfig.h b/include/linux/hpe/sbl/sbl_kconfig.h
new file mode 100644
index 000000000000..87a312716906
--- /dev/null
+++ b/include/linux/hpe/sbl/sbl_kconfig.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP. All rights reserved. */
+/*   Kconfig fixup for external modules
+ *
+ *   It is not possible to use the normal Kconfig infrastructure for
+ *   externally built modules
+ *
+ *   When building out-of-tree we define an SBL_EXTERNAL_BUILD=1 environment
+ *   variable and we use this to setup the configuration
+ *
+ *   We must also define one of the following target platforms:
+ *    PLATFORM_ROSETTA_HW=1
+ *    PLATFORM_CASSINI_HW=1
+ *
+ *   If we ever need to build in-tree then constructing a Kconfig
+ *   file should be simple
+ *
+ */
+
+#ifndef _SBL_KCONFIG_H_
+#define _SBL_KCONFIG_H_
+
+/* currently unused config options we don't want to forget about */
+#undef  SBL_FAST_AUTONEG
+#undef  SBL_MAC_PCS_EMU
+
+/* Share platform-specific build constants with exported UAPI users. */
+#include <uapi/ethernet/sbl_platform_config.h>
+
+#undef SBL_PLATFORM_ROS_HW
+#undef SBL_PLATFORM_CAS_HW
+
+#endif /* _SBL_KCONFIG_H_ */
diff --git a/include/linux/hpe/sbl/sbl_mb.h b/include/linux/hpe/sbl/sbl_mb.h
new file mode 100644
index 000000000000..0805e4e389cc
--- /dev/null
+++ b/include/linux/hpe/sbl/sbl_mb.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Platform-specific definitions of SBL_* macros.
+ * Copyright 2020 Cray Inc. All rights reserved
+ */
+#ifndef _SBL_MB_H_
+#define _SBL_MB_H_
+
+#include <uapi/ethernet/cassini_user_defs.h>
+#include "sbl_csr_common.h"
+
+/* BASE defines */
+#define SBL_MB_MB_BASE C_MB_BASE
+
+/* OFFSET defines */
+#define SBL_MB_DBG_CFG_SBUS_MASTER_OFFSET(a) C_MB_DBG_CFG_SBUS_MASTER_OFFSET
+#define SBL_MB_DBG_STS_SBUS_MASTER_OFFSET(a) C_MB_DBG_STS_SBUS_MASTER_OFFSET
+
+/* UPDATE defines */
+
+/* DFLT defines */
+
+/* SET defines */
+#define SBL_MB_DBG_STS_SBUS_MASTER_OVERRUN_SET(a) \
+	C_SET(a, c_mb_dbg_sts_sbus_master, overrun)
+#define SBL_MB_DBG_STS_SBUS_MASTER_WRITE_ERROR_SET(a) \
+	C_SET(a, c_mb_dbg_sts_sbus_master, write_error)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_DATA_SET(a) \
+	C_SET(a, c_mb_dbg_cfg_sbus_master, data)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_DATA_ADDRESS_SET(a) \
+	C_SET(a, c_mb_dbg_cfg_sbus_master, data_address)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_RECEIVER_ADDRESS_SET(a) \
+	C_SET(a, c_mb_dbg_cfg_sbus_master, receiver_address)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_COMMAND_SET(a) \
+	C_SET(a, c_mb_dbg_cfg_sbus_master, command)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_STOP_ON_WRITE_ERROR_SET(a) \
+	C_SET(a, c_mb_dbg_cfg_sbus_master, stop_on_write_error)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_STOP_ON_OVERRUN_SET(a) \
+	C_SET(a, c_mb_dbg_cfg_sbus_master, stop_on_overrun)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_MODE_SET(a) \
+	C_SET(a, c_mb_dbg_cfg_sbus_master, mode)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_RCV_DATA_VALID_SEL_SET(a) \
+	C_SET(a, c_mb_dbg_cfg_sbus_master, rcv_data_valid_sel)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_EXECUTE_SET(a) \
+	C_SET(a, c_mb_dbg_cfg_sbus_master, execute)
+#define SBL_MB_DBG_CFG_SBUS_MASTER_SET(DATA, DATA_ADDRESS, RECEIVER_ADDRESS, \
+				       COMMAND, STOP_ON_WRITE_ERROR,         \
+				       STOP_ON_OVERRUN, MODE,                \
+				       RCV_DATA_VALID_SEL, EXECUTE)          \
+	(SBL_MB_DBG_CFG_SBUS_MASTER_DATA_SET(DATA) |                         \
+	 SBL_MB_DBG_CFG_SBUS_MASTER_DATA_ADDRESS_SET(DATA_ADDRESS) |         \
+	 SBL_MB_DBG_CFG_SBUS_MASTER_RECEIVER_ADDRESS_SET(RECEIVER_ADDRESS) | \
+	 SBL_MB_DBG_CFG_SBUS_MASTER_COMMAND_SET(COMMAND) |                   \
+	 SBL_MB_DBG_CFG_SBUS_MASTER_STOP_ON_WRITE_ERROR_SET(                 \
+		 STOP_ON_WRITE_ERROR) |                                      \
+	 SBL_MB_DBG_CFG_SBUS_MASTER_STOP_ON_OVERRUN_SET(STOP_ON_OVERRUN) |   \
+	 SBL_MB_DBG_CFG_SBUS_MASTER_MODE_SET(MODE) |                         \
+	 SBL_MB_DBG_CFG_SBUS_MASTER_RCV_DATA_VALID_SEL_SET(                  \
+		 RCV_DATA_VALID_SEL) |                                       \
+	 SBL_MB_DBG_CFG_SBUS_MASTER_EXECUTE_SET(EXECUTE))
+
+/* GET defines */
+#define SBL_MB_DBG_STS_SBUS_MASTER_DATA_GET(a) \
+	C_GET(a, c_mb_dbg_sts_sbus_master, data)
+#define SBL_MB_DBG_STS_SBUS_MASTER_RESULT_CODE_GET(a) \
+	C_GET(a, c_mb_dbg_sts_sbus_master, result_code)
+#define SBL_MB_DBG_STS_SBUS_MASTER_OVERRUN_GET(a) \
+	C_GET(a, c_mb_dbg_sts_sbus_master, overrun)
+#define SBL_MB_DBG_STS_SBUS_MASTER_RCV_DATA_VALID_GET(a) \
+	C_GET(a, c_mb_dbg_sts_sbus_master, rcv_data_valid)
+#define SBL_MB_DBG_STS_SBUS_MASTER_WRITE_ERROR_GET(a) \
+	C_GET(a, c_mb_dbg_sts_sbus_master, write_error)
+
+/* Other defines */
+#define SBL_MB_DBG_CFG_SBUS_MASTER_ENTRIES 1
+
+#endif /* _SBL_MB_H_ */
diff --git a/include/linux/hpe/sbl/sbl_platform.h b/include/linux/hpe/sbl/sbl_platform.h
new file mode 100644
index 000000000000..d47630f9e84a
--- /dev/null
+++ b/include/linux/hpe/sbl/sbl_platform.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2025 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_PLATFORM_H_
+#define _SBL_PLATFORM_H_
+
+#define SBUS_RING_MTX(sbl, ring) ((sbl)->sbus_ring_mtx)
+#define SBM_FW_MTX(sbl, ring) ((sbl)->sbm_fw_mtx)
+
+#define sbl_dev_log(_logfn, _dev, _fmt, ...)						\
+	do {									\
+		char __sbl_inst[sizeof(sbl->iattr.inst_name)];			\
+		char __sbl_eth[sizeof(sbl->iattr.eth_if_name)];		\
+		sbl_inst_names_get(sbl, __sbl_inst, __sbl_eth);			\
+		_logfn((_dev), "%s[%s]: " _fmt, __sbl_inst, __sbl_eth, ##__VA_ARGS__);	\
+	} while (0)
+
+#define sbl_dev_err(_dev, _fmt, ...) sbl_dev_log(dev_err, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_dbg(_dev, _fmt, ...) sbl_dev_log(dev_dbg, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_warn(_dev, _fmt, ...) sbl_dev_log(dev_warn, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_info(_dev, _fmt, ...) sbl_dev_log(dev_info, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_err_ratelimited(_dev, _fmt, ...) \
+	sbl_dev_log(dev_err_ratelimited, _dev, _fmt, ##__VA_ARGS__)
+#define sbl_dev_dbg_ratelimited(_dev, _fmt, ...) \
+	sbl_dev_log(dev_dbg_ratelimited, _dev, _fmt, ##__VA_ARGS__)
+/* Configuration passing into SBL init */
+struct sbl_init_attr {
+	u32 magic;
+	u32 uc_nic;
+	u32 uc_platform;
+	bool is_hw;
+};
+
+#endif /* _SBL_PLATFORM_H_ */
diff --git a/include/linux/hpe/sbl/sbl_pml.h b/include/linux/hpe/sbl/sbl_pml.h
new file mode 100644
index 000000000000..92b32f1dcf22
--- /dev/null
+++ b/include/linux/hpe/sbl/sbl_pml.h
@@ -0,0 +1,1081 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Platform-specific definitions of SBL_* macros.
+ * Copyright 2020-2023 Cray Inc. All rights reserved
+ */
+#ifndef _SBL_PML_H_
+#define _SBL_PML_H_
+
+#include <uapi/ethernet/cassini_user_defs.h>
+#include <linux/hpe/cxi/cassini_csr_defaults.h>
+#include "sbl_csr_common.h"
+#include <linux/hpe/cxi/cassini_cntr_defs.h>
+
+/* BASE defines */
+#define SBL_PML_BASE(a) C_HNI_PML_BASE
+
+#define SBL_PCS_FECL_ERRORS_00_ADDR(a)                       \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_FECL_ERRORS_0 - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_PCS_FECL_ERRORS_01_ADDR(a)                       \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_FECL_ERRORS_1 - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_PCS_FECL_ERRORS_02_ADDR(a)                       \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_FECL_ERRORS_2 - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_PCS_FECL_ERRORS_03_ADDR(a)                       \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_FECL_ERRORS_3 - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_PCS_FECL_ERRORS_04_ADDR(a)                       \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_FECL_ERRORS_4 - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_PCS_FECL_ERRORS_05_ADDR(a)                       \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_FECL_ERRORS_5 - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_PCS_FECL_ERRORS_06_ADDR(a)                       \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_FECL_ERRORS_6 - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_PCS_FECL_ERRORS_07_ADDR(a)                       \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_FECL_ERRORS_7 - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_PCS_CORRECTED_CW_ADDR(a)                        \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_CORRECTED_CW - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_PCS_UNCORRECTED_CW_ADDR(a)                        \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_PCS_UNCORRECTED_CW - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+#define SBL_LLR_TX_REPLAY_EVENT_ADDR(a)                        \
+	C_HNI_STS_EVENT_CNTS(C1_CNTR_HNI_LLR_TX_REPLAY_EVENT - \
+			     C_CNTR_HNI_COR_ECC_ERR_CNTR)
+
+/* OFFSET defines */
+#define SBL_PML_CFG_LLR_CAPACITY_OFFSET C1_HNI_PML_CFG_LLR_CAPACITY_OFFSET
+#define SBL_PML_CFG_LLR_CF_ETYPE_OFFSET C1_HNI_PML_CFG_LLR_CF_ETYPE_OFFSET
+#define SBL_PML_CFG_LLR_CF_SMAC_OFFSET C1_HNI_PML_CFG_LLR_CF_SMAC_OFFSET
+#define SBL_PML_CFG_LLR_CF_RATES_OFFSET C1_HNI_PML_CFG_LLR_CF_RATES_OFFSET
+#define SBL_PML_CFG_LLR_OFFSET C1_HNI_PML_CFG_LLR_OFFSET
+#define SBL_PML_CFG_LLR_SM_OFFSET C1_HNI_PML_CFG_LLR_SM_OFFSET
+#define SBL_PML_CFG_LLR_TIMEOUTS_OFFSET C1_HNI_PML_CFG_LLR_TIMEOUTS_OFFSET
+#define SBL_PML_CFG_PCS_AMS_OFFSET C1_HNI_PML_CFG_PCS_AMS_OFFSET
+#define SBL_PML_CFG_PCS_AUTONEG_BASE_PAGE_OFFSET \
+	C1_HNI_PML_CFG_PCS_AUTONEG_BASE_PAGE_OFFSET
+#define SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_OFFSET \
+	C1_HNI_PML_CFG_PCS_AUTONEG_NEXT_PAGE_OFFSET
+#define SBL_PML_CFG_PCS_AUTONEG_OFFSET C1_HNI_PML_CFG_PCS_AUTONEG_OFFSET
+#define SBL_PML_CFG_PCS_AUTONEG_TIMERS_OFFSET \
+	C1_HNI_PML_CFG_PCS_AUTONEG_TIMERS_OFFSET
+#define SBL_PML_CFG_PCS_CM_OFFSET C1_HNI_PML_CFG_PCS_CM_OFFSET
+#define SBL_PML_CFG_PCS_OFFSET C1_HNI_PML_CFG_PCS_OFFSET
+#define SBL_PML_CFG_PCS_UM_OFFSET C1_HNI_PML_CFG_PCS_UM_OFFSET
+#define SBL_PML_CFG_RX_MAC_OFFSET C1_HNI_PML_CFG_RX_MAC_OFFSET
+#define SBL_PML_CFG_RX_PCS_AMS_OFFSET C1_HNI_PML_CFG_RX_PCS_AMS_OFFSET
+#define SBL_PML_CFG_RX_PCS_OFFSET C1_HNI_PML_CFG_RX_PCS_OFFSET
+#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_OFFSET \
+	C1_HNI_PML_CFG_SERDES_CORE_INTERRUPT_OFFSET
+#define SBL_PML_CFG_TX_MAC_OFFSET C1_HNI_PML_CFG_TX_MAC_OFFSET
+#define SBL_PML_CFG_TX_PCS_OFFSET C1_HNI_PML_CFG_TX_PCS_OFFSET
+#define SBL_PML_DBG_PCS_OFFSET C1_HNI_PML_DBG_PCS_OFFSET
+#define SBL_PML_ERR_CLR_OFFSET C1_HNI_PML_ERR_CLR_OFFSET
+#define SBL_PML_ERR_FLG_OFFSET C1_HNI_PML_ERR_FLG_OFFSET
+#define SBL_PML_SERDES_CORE_INTERRUPT_OFFSET \
+	C1_HNI_PML_SERDES_CORE_INTERRUPT_OFFSET
+#define SBL_PML_SERDES_CORE_STATUS_OFFSET C1_HNI_PML_SERDES_CORE_STATUS_OFFSET
+#define SBL_PML_STS_LLR_LOOP_TIME_OFFSET C1_HNI_PML_STS_LLR_LOOP_TIME_OFFSET
+#define SBL_PML_STS_LLR_OFFSET C1_HNI_PML_STS_LLR_OFFSET
+#define SBL_PML_STS_LLR_USAGE_OFFSET C1_HNI_PML_STS_LLR_USAGE_OFFSET
+#define SBL_PML_STS_LLR_MAX_USAGE_OFFSET C1_HNI_PML_STS_LLR_MAX_USAGE_OFFSET
+#define SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_OFFSET \
+	C1_HNI_PML_STS_PCS_AUTONEG_BASE_PAGE_OFFSET
+#define SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_OFFSET \
+	C1_HNI_PML_STS_PCS_AUTONEG_NEXT_PAGE_OFFSET
+#define SBL_PML_STS_RX_PCS_OFFSET C1_HNI_PML_STS_RX_PCS_OFFSET
+#define SBL_PML_STS_PCS_LANE_DEGRADE_OFFSET \
+	C1_HNI_PML_STS_PCS_LANE_DEGRADE_OFFSET
+#define SBL_PML_STS_RX_PCS_DESKEW_DEPTHS_OFFSET \
+	C1_HNI_PML_STS_RX_PCS_DESKEW_DEPTHS_OFFSET
+#define SBL_PML_STS_RX_PCS_AM_MATCH_OFFSET C1_HNI_PML_STS_RX_PCS_AM_MATCH_OFFSET
+#define SBL_PML_STS_RX_PCS_FECL_SOURCES_OFFSET \
+	C1_HNI_PML_STS_RX_PCS_FECL_SOURCES_OFFSET
+
+/* UPDATE defines */
+#define SBL_PML_CFG_LLR_ACK_NACK_ERR_CHECK_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_llr, ack_nack_err_check)
+#define SBL_PML_CFG_LLR_ENABLE_LOOP_TIMING_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_llr, enable_loop_timing)
+#define SBL_PML_CFG_LLR_FILTER_CTL_FRAMES_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_llr, filter_ctl_frames)
+#define SBL_PML_CFG_LLR_FILTER_LOSSLESS_WHEN_OFF_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_llr, filter_lossless_when_off)
+#define SBL_PML_CFG_LLR_LINK_DOWN_BEHAVIOR_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_llr, link_down_behavior)
+#define SBL_PML_CFG_LLR_MAC_IF_CREDITS_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_llr, mac_if_credits)
+#define SBL_PML_CFG_LLR_LLR_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_llr, llr_mode)
+#define SBL_PML_CFG_LLR_CF_RATES_LOOP_TIMING_PERIOD_UPDATE(a, b) \
+	C_UPDATE(a, b, c_hni_pml_cfg_llr_cf_rates, loop_timing_period)
+#define SBL_PML_CFG_LLR_PREAMBLE_SEQ_CHECK_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_llr, preamble_seq_check)
+#define SBL_PML_CFG_LLR_SIZE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_llr, size)
+#define SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_UPDATE(a, b) \
+	C_UPDATE(a, b, c_hni_pml_cfg_llr_sm, replay_ct_max)
+#define SBL_PML_CFG_LLR_SM_REPLAY_TIMER_MAX_UPDATE(a, b) \
+	C_UPDATE(a, b, c_hni_pml_cfg_llr_sm, replay_timer_max)
+#define SBL_PML_CFG_LLR_TIMEOUTS_DATA_AGE_TIMER_MAX_UPDATE(a, b) \
+	C_UPDATE(a, b, c_hni_pml_cfg_llr_timeouts, data_age_timer_max)
+#define SBL_PML_CFG_LLR_TIMEOUTS_PCS_LINK_DN_TIMER_MAX_UPDATE(a, b) \
+	C_UPDATE(a, b, c_hni_pml_cfg_llr_timeouts, pcs_link_dn_timer_max)
+#define SBL_PML_CFG_PCS_AMS_USE_PROGRAMMABLE_AMS_UPDATE(a, b) \
+	C_UPDATE(a, b, c_hni_pml_cfg_pcs_ams, use_programmable_ams)
+#define SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_UPDATE(a, b) \
+	C_UPDATE(a, b, c_hni_pml_cfg_pcs_autoneg, next_page_loaded)
+#define SBL_PML_CFG_RX_PCS_ALLOW_AUTO_DEGRADE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_pcs, allow_auto_degrade)
+#define SBL_PML_CFG_PCS_AUTONEG_RESET_UPDATE(a, b) \
+	C_UPDATE(a, b, c_hni_pml_cfg_pcs_autoneg, reset)
+#define SBL_PML_CFG_PCS_AUTONEG_TIMERS_BREAK_LINK_TIMER_MAX_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_pcs_autoneg_timers, break_link_timer_max)
+#define SBL_PML_CFG_PCS_AUTONEG_TIMERS_LINK_FAIL_INHIBIT_TIMER_MAX_UPDATE(a, \
+									  b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_pcs_autoneg_timers,                    \
+		 link_fail_inhibit_timer_max)
+#define SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_pcs, enable_auto_lane_degrade)
+#define SBL_PML_CFG_PCS_ENABLE_AUTO_NEG_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_pcs, enable_auto_neg)
+#define SBL_PML_CFG_PCS_PCS_ENABLE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_pcs, pcs_enable)
+#define SBL_PML_CFG_PCS_PCS_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_pcs, pcs_mode)
+#define SBL_PML_CFG_PCS_BY_25G_FEC_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_pcs, by_25g_fec_mode)
+#define SBL_PML_CFG_PCS_TIMESTAMP_SHIFT_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_pcs, timestamp_shift)
+#define SBL_PML_CFG_RX_MAC_FILTER_ILLEGAL_SIZE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_mac, filter_illegal_size)
+#define SBL_PML_CFG_RX_MAC_MAC_OPERATIONAL_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_mac, mac_operational)
+#define SBL_PML_CFG_RX_MAC_SHORT_PREAMBLE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_mac, short_preamble)
+#define SBL_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_pcs, active_lanes)
+#define SBL_PML_CFG_RX_PCS_ENABLE_CTL_OS_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_pcs, enable_ctl_os)
+#define SBL_PML_CFG_RX_PCS_ENABLE_LOCK_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_pcs, enable_lock)
+#define SBL_PML_CFG_RX_PCS_ENABLE_RX_SM_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_pcs, enable_rx_sm)
+#define SBL_PML_CFG_RX_PCS_HEALTH_BAD_SENSITIVITY_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_pcs, health_bad_sensitivity)
+#define SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_pcs, restart_lock_on_bad_ams)
+#define SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_pcs, restart_lock_on_bad_cws)
+#define SBL_PML_CFG_RX_PCS_RS_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_rx_pcs, rs_mode)
+#define SBL_PML_CFG_TX_MAC_IEEE_IFG_ADJUSTMENT_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_mac, ieee_ifg_adjustment)
+#define SBL_PML_CFG_TX_MAC_IFG_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_mac, ifg_mode)
+#define SBL_PML_CFG_TX_MAC_MAC_OPERATIONAL_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_mac, mac_operational)
+#define SBL_PML_CFG_TX_MAC_PCS_CREDITS_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_mac, pcs_credits)
+#define SBL_PML_CFG_TX_MAC_SHORT_PREAMBLE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_mac, short_preamble)
+#define SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_pcs, cdc_ready_level)
+#define SBL_PML_CFG_TX_PCS_ENABLE_CTL_OS_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_pcs, enable_ctl_os)
+#define SBL_PML_CFG_TX_PCS_GEARBOX_CREDITS_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_pcs, gearbox_credits)
+#define SBL_PML_CFG_TX_PCS_LANE_0_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_pcs, lane_0_source)
+#define SBL_PML_CFG_TX_PCS_LANE_1_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_pcs, lane_1_source)
+#define SBL_PML_CFG_TX_PCS_LANE_2_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_pcs, lane_2_source)
+#define SBL_PML_CFG_TX_PCS_LANE_3_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_pcs, lane_3_source)
+#define SBL_PML_CFG_TX_PCS_ALLOW_AUTO_DEGRADE_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_cfg_tx_pcs, allow_auto_degrade)
+#define SBL_PML_DBG_PCS_ENABLE_RAPID_ALIGNMENT_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_dbg_pcs, enable_rapid_alignment)
+#define SBL_PML_DBG_PCS_FORCE_TX_DATA_RF_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_dbg_pcs, force_tx_data_rf)
+#define SBL_PML_DBG_PCS_FORCE_TX_DATA_UPDATE(a, b) \
+	C_UPDATE(a, b, c1_hni_pml_dbg_pcs, force_tx_data)
+
+/* DFLT defines */
+#define SBL_PML_CFG_LLR_MAC_IF_CREDITS C1_HNI_CFG_LLR_MAC__IF_CREDITS
+#define SBL_PML_CFG_TX_MAC_PCS_CREDITS C1_HNI_CFG_TX_MAC__PCS_CREDITS
+#define SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL C1_HNI_CFG_TX_PCS__CDC_READY_LEVEL
+#define SBL_PML_CFG_TX_PCS_GEARBOX_CREDITS C1_HNI_CFG_TX_PCS__GEARBOX_CREDITS
+#define SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL_DFLT \
+	C1_HNI_PML_CFG_TX_PCS__CDC_READY_LEVEL
+#define SBL_PML_CFG_TX_PCS_GEARBOX_CREDITS_DFLT \
+	C1_HNI_PML_CFG_TX_PCS__GEARBOX_CREDITS
+#define SBL_PML_CFG_TX_MAC_PCS_CREDITS_DFLT C1_HNI_PML_CFG_TX_MAC__PCS_CREDITS
+#define SBL_PML_CFG_LLR_MAC_IF_CREDITS_DFLT C1_HNI_PML_CFG_LLR__MAC_IF_CREDITS
+#define SBL_PML_CFG_LLR_CAPACITY_MAX_SEQ_DFLT \
+	C1_HNI_PML_CFG_LLR_CAPACITY__MAX_SEQ
+
+/* TODO - cassini_csr_defaults.h skips defaults when they are 0? */
+#define C1_HNI_PML_CFG_LLR__PREAMBLE_SEQ_CHECK 0x0
+#define C1_HNI_PML_CFG_LLR__ACK_NACK_ERR_CHECK 0x0
+#define C1_HNI_PML_CFG_LLR__LLR_MODE 0x0
+#define C1_HNI_PML_CFG_LLR__ENABLE_LOOP_TIMING 0x0
+#define C1_HNI_PML_CFG_LLR_SM__ALLOW_RE_INIT 0x0
+#define C_HNI_PML_CFG_LLR_CF_SMAC__CTL_FRAME_SMAC 0x0
+#define C1_HNI_PML_CFG_TX_MAC__IEEE_IFG_ADJUSTMENT 0ull
+#define C1_HNI_PML_CFG_TX_MAC__SHORT_PREAMBLE 0ull
+#define C1_HNI_PML_CFG_TX_MAC__MAC_OPERATIONAL 0ull
+#define C1_HNI_PML_CFG_RX_MAC__SHORT_PREAMBLE 0x0
+#define C1_HNI_PML_CFG_RX_MAC__MAC_OPERATIONAL 0x0
+#define C1_HNI_PML_CFG_RX_MAC__FILTER_ILLEGAL_SIZE 0x0
+#define C1_HNI_PML_DBG_PCS__ENABLE_RAPID_ALIGNMENT 0x0
+#define C1_HNI_PML_DBG_PCS__ENABLE_IDLE_CHECK 0x0
+#define C1_HNI_PML_DBG_PCS__FORCE_TX_DATA 0x0
+#define C1_HNI_PML_DBG_PCS__FORCE_TX_DATA_RF 0x0
+#define C1_HNI_PML_DBG_PCS__PPM_TEST_MODE 0x0
+#define C1_HNI_PML_CFG_RX_PCS__ACTIVE_LANES 0x0
+#define C1_HNI_PML_CFG_RX_PCS__ENABLE_LOCK 0x0
+#define C1_HNI_PML_CFG_RX_PCS__RESTART_LOCK_ON_BAD_AMS 0x0
+#define C1_HNI_PML_CFG_RX_PCS__RESTART_LOCK_ON_BAD_CWS 0x0
+#define C1_HNI_PML_CFG_RX_PCS__ENABLE_CTL_OS 0x0
+#define C1_HNI_PML_CFG_RX_PCS__LP_HEALTH_BAD_SENSITIVITY 0x0
+#define C1_HNI_PML_CFG_RX_PCS__ALLOW_AUTO_DEGRADE 0x0
+#define C1_HNI_PML_CFG_RX_PCS__ENABLE_RX_SM 0x0
+#define C1_HNI_PML_CFG_TX_PCS__LANE_0_SOURCE 0x0
+#define C1_HNI_PML_CFG_TX_PCS__ENABLE_CTL_OS 0x0
+#define C1_HNI_PML_CFG_TX_PCS__ALLOW_AUTO_DEGRADE 0x0
+#define C1_HNI_PML_CFG_PCS_AMS__USE_PROGRAMMABLE_AM_SPACING 0x0
+#define C1_HNI_PML_CFG_PCS_AMS__USE_PROGRAMMABLE_AMS 0x0
+#define C1_HNI_PML_CFG_PCS_AUTONEG_NEXT_PAGE__NEXT_PAGE 0x0
+#define C1_HNI_PML_CFG_PCS_AUTONEG_BASE_PAGE__BASE_PAGE 0x0
+#define C1_HNI_PML_CFG_PCS_AUTONEG__NEXT_PAGE_LOADED 0x0
+#define C1_HNI_PML_CFG_PCS_AUTONEG__RESTART 0x0
+#define C1_HNI_PML_CFG_PCS_AUTONEG__TX_LANE 0x0
+#define C1_HNI_PML_CFG_PCS_AUTONEG__RX_LANE 0x0
+#define C1_HNI_PML_CFG_PCS__PCS_ENABLE 0x0
+#define C1_HNI_PML_CFG_PCS__ENABLE_AUTO_NEG 0x0
+#define C1_HNI_PML_CFG_PCS__PCS_MODE 0x0
+#define C1_HNI_PML_CFG_PCS__ENABLE_AUTO_LANE_DEGRADE 0x0
+#define C1_HNI_PML_CFG_PCS__LL_FEC 0x0
+#define C1_HNI_PML_CFG_PCS__TIMESTAMP_SHIFT 0x0
+#define SBL_PML_CFG_LLR_CAPACITY_DFLT                     \
+	(SBL_PML_CFG_LLR_CAPACITY_MAX_DATA_SET(           \
+		 C1_HNI_PML_CFG_LLR_CAPACITY__MAX_DATA) | \
+	 SBL_PML_CFG_LLR_CAPACITY_MAX_SEQ_SET(            \
+		 C1_HNI_PML_CFG_LLR_CAPACITY__MAX_SEQ))
+#define SBL_PML_CFG_LLR_CF_ETYPE_DFLT                      \
+	(SBL_PML_CFG_LLR_CF_ETYPE_CTL_FRAME_ETHERTYPE_SET( \
+		C1_HNI_PML_CFG_LLR_CF_ETYPE__CTL_FRAME_ETHERTYPE))
+#define SBL_PML_CFG_LLR_CF_SMAC_DFLT                 \
+	(SBL_PML_CFG_LLR_CF_SMAC_CTL_FRAME_SMAC_SET( \
+		C_HNI_PML_CFG_LLR_CF_SMAC__CTL_FRAME_SMAC))
+#define SBL_PML_CFG_LLR_DFLT                                     \
+	(SBL_PML_CFG_LLR_PREAMBLE_SEQ_CHECK_SET(                 \
+		 C1_HNI_PML_CFG_LLR__PREAMBLE_SEQ_CHECK) |       \
+	 SBL_PML_CFG_LLR_ACK_NACK_ERR_CHECK_SET(                 \
+		 C1_HNI_PML_CFG_LLR__ACK_NACK_ERR_CHECK) |       \
+	 SBL_PML_CFG_LLR_FILTER_LOSSLESS_WHEN_OFF_SET(           \
+		 C1_HNI_PML_CFG_LLR__FILTER_LOSSLESS_WHEN_OFF) | \
+	 SBL_PML_CFG_LLR_FILTER_CTL_FRAMES_SET(                  \
+		 C1_HNI_PML_CFG_LLR__FILTER_CTL_FRAMES) |        \
+	 SBL_PML_CFG_LLR_SIZE_SET(C1_HNI_PML_CFG_LLR__SIZE) |    \
+	 SBL_PML_CFG_LLR_ENABLE_LOOP_TIMING_SET(                 \
+		 C1_HNI_PML_CFG_LLR__ENABLE_LOOP_TIMING) |       \
+	 SBL_PML_CFG_LLR_LINK_DOWN_BEHAVIOR_SET(                 \
+		 C1_HNI_PML_CFG_LLR__LINK_DOWN_BEHAVIOR) |       \
+	 SBL_PML_CFG_LLR_MAC_IF_CREDITS_SET(                     \
+		 C1_HNI_PML_CFG_LLR__MAC_IF_CREDITS) |           \
+	 SBL_PML_CFG_LLR_LLR_MODE_SET(C1_HNI_PML_CFG_LLR__LLR_MODE))
+#define SBL_PML_CFG_LLR_SM_DFLT                            \
+	(SBL_PML_CFG_LLR_SM_RETRY_THRESHOLD_SET(           \
+		 C1_HNI_PML_CFG_LLR_SM__RETRY_THRESHOLD) | \
+	 SBL_PML_CFG_LLR_SM_ALLOW_RE_INIT_SET(             \
+		 C1_HNI_PML_CFG_LLR_SM__ALLOW_RE_INIT) |   \
+	 SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_SET(             \
+		 C1_HNI_PML_CFG_LLR_SM__REPLAY_CT_MAX) |   \
+	 SBL_PML_CFG_LLR_SM_REPLAY_TIMER_MAX_SET(          \
+		 C1_HNI_PML_CFG_LLR_SM__REPLAY_TIMER_MAX))
+#define SBL_PML_CFG_LLR_TIMEOUTS_DFLT                               \
+	(SBL_PML_CFG_LLR_TIMEOUTS_DATA_AGE_TIMER_MAX_SET(           \
+		 C1_HNI_PML_CFG_LLR_TIMEOUTS__DATA_AGE_TIMER_MAX) | \
+	 SBL_PML_CFG_LLR_TIMEOUTS_PCS_LINK_DN_TIMER_MAX_SET(        \
+		 C1_HNI_PML_CFG_LLR_TIMEOUTS__PCS_LINK_DN_TIMER_MAX))
+#define SBL_PML_CFG_PCS_AMS_DFLT                                        \
+	(SBL_PML_CFG_PCS_AMS_USE_PROGRAMMABLE_AMS_SET(                  \
+		 C1_HNI_PML_CFG_PCS_AMS__USE_PROGRAMMABLE_AMS) |        \
+	 SBL_PML_CFG_PCS_AMS_USE_PROGRAMMABLE_AM_SPACING_SET(           \
+		 C1_HNI_PML_CFG_PCS_AMS__USE_PROGRAMMABLE_AM_SPACING) | \
+	 SBL_PML_CFG_PCS_AMS_RAM_SPACING_SET(                           \
+		 C1_HNI_PML_CFG_PCS_AMS__RAM_SPACING) |                 \
+	 SBL_PML_CFG_PCS_AMS_AM_SPACING_SET(                            \
+		 C1_HNI_PML_CFG_PCS_AMS__AM_SPACING))
+#define SBL_PML_CFG_PCS_AUTONEG_BASE_PAGE_DFLT            \
+	(SBL_PML_CFG_PCS_AUTONEG_BASE_PAGE_BASE_PAGE_SET( \
+		C1_HNI_PML_CFG_PCS_AUTONEG_BASE_PAGE__BASE_PAGE))
+#define SBL_PML_CFG_PCS_AUTONEG_DFLT                    \
+	(SBL_PML_CFG_PCS_AUTONEG_RX_LANE_SET(           \
+		 C1_HNI_PML_CFG_PCS_AUTONEG__RX_LANE) | \
+	 SBL_PML_CFG_PCS_AUTONEG_TX_LANE_SET(           \
+		 C1_HNI_PML_CFG_PCS_AUTONEG__TX_LANE) | \
+	 SBL_PML_CFG_PCS_AUTONEG_RESET_SET(             \
+		 C1_HNI_PML_CFG_PCS_AUTONEG__RESET) |   \
+	 SBL_PML_CFG_PCS_AUTONEG_RESTART_SET(           \
+		 C1_HNI_PML_CFG_PCS_AUTONEG__RESTART) | \
+	 SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_SET(  \
+		 C1_HNI_PML_CFG_PCS_AUTONEG__NEXT_PAGE_LOADED))
+#define SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_DFLT            \
+	(SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_NEXT_PAGE_SET( \
+		C1_HNI_PML_CFG_PCS_AUTONEG_NEXT_PAGE__NEXT_PAGE))
+#define SBL_PML_CFG_PCS_AUTONEG_TIMERS_DFLT                                        \
+	(SBL_PML_CFG_PCS_AUTONEG_TIMERS_LINK_FAIL_INHIBIT_TIMER_MAX_SET(           \
+		 C1_HNI_PML_CFG_PCS_AUTONEG_TIMERS__LINK_FAIL_INHIBIT_TIMER_MAX) | \
+	 SBL_PML_CFG_PCS_AUTONEG_TIMERS_BREAK_LINK_TIMER_MAX_SET(                  \
+		 C1_HNI_PML_CFG_PCS_AUTONEG_TIMERS__BREAK_LINK_TIMER_MAX))
+#define SBL_PML_CFG_PCS_DFLT                                          \
+	(SBL_PML_CFG_PCS_TIMESTAMP_SHIFT_SET(                         \
+		 C1_HNI_PML_CFG_PCS__TIMESTAMP_SHIFT) |               \
+	 SBL_PML_CFG_PCS_LL_FEC_SET(C1_HNI_PML_CFG_PCS__LL_FEC) |     \
+	 SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_SET(                \
+		 C1_HNI_PML_CFG_PCS__ENABLE_AUTO_LANE_DEGRADE) |      \
+	 SBL_PML_CFG_PCS_PCS_MODE_SET(C1_HNI_PML_CFG_PCS__PCS_MODE) | \
+	 SBL_PML_CFG_PCS_ENABLE_AUTO_NEG_SET(                         \
+		 C1_HNI_PML_CFG_PCS__ENABLE_AUTO_NEG) |               \
+	 SBL_PML_CFG_PCS_PCS_ENABLE_SET(C1_HNI_PML_CFG_PCS__PCS_ENABLE))
+#define SBL_PML_CFG_RX_MAC_DFLT                                \
+	(SBL_PML_CFG_RX_MAC_FILTER_ILLEGAL_SIZE_SET(           \
+		 C1_HNI_PML_CFG_RX_MAC__FILTER_ILLEGAL_SIZE) | \
+	 SBL_PML_CFG_RX_MAC_SHORT_PREAMBLE_SET(                \
+		 C1_HNI_PML_CFG_RX_MAC__SHORT_PREAMBLE) |      \
+	 SBL_PML_CFG_RX_MAC_MAC_OPERATIONAL_SET(               \
+		 C1_HNI_PML_CFG_RX_MAC__MAC_OPERATIONAL))
+#define SBL_PML_CFG_RX_PCS_DFLT                                           \
+	(SBL_PML_CFG_RX_PCS_ENABLE_RX_SM_SET(                             \
+		 C1_HNI_PML_CFG_RX_PCS__ENABLE_RX_SM) |                   \
+	 SBL_PML_CFG_RX_PCS_ALLOW_AUTO_DEGRADE_SET(                       \
+		 C1_HNI_PML_CFG_RX_PCS__ALLOW_AUTO_DEGRADE) |             \
+	 SBL_PML_CFG_RX_PCS_LP_HEALTH_BAD_SENSITIVITY_SET(                \
+		 C1_HNI_PML_CFG_RX_PCS__LP_HEALTH_BAD_SENSITIVITY) |      \
+	 SBL_PML_CFG_RX_PCS_HEALTH_BAD_SENSITIVITY_SET(                   \
+		 C1_HNI_PML_CFG_RX_PCS__HEALTH_BAD_SENSITIVITY) |         \
+	 SBL_PML_CFG_RX_PCS_ENABLE_CTL_OS_SET(                            \
+		 C1_HNI_PML_CFG_RX_PCS__ENABLE_CTL_OS) |                  \
+	 SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_SET(                  \
+		 C1_HNI_PML_CFG_RX_PCS__RESTART_LOCK_ON_BAD_CWS) |        \
+	 SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_SET(                  \
+		 C1_HNI_PML_CFG_RX_PCS__RESTART_LOCK_ON_BAD_AMS) |        \
+	 SBL_PML_CFG_RX_PCS_ENABLE_LOCK_SET(                              \
+		 C1_HNI_PML_CFG_RX_PCS__ENABLE_LOCK) |                    \
+	 SBL_PML_CFG_RX_PCS_RS_MODE_SET(C1_HNI_PML_CFG_RX_PCS__RS_MODE) | \
+	 SBL_PML_CFG_RX_PCS_ACTIVE_LANES_SET(                             \
+		 C1_HNI_PML_CFG_RX_PCS__ACTIVE_LANES))
+#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_DFLT                                         \
+	(SBL_PML_CFG_SERDES_CORE_INTERRUPT_CAPTURE_INTERRUPT_DATA_DELAY_SET(           \
+		 C1_HNI_PML_CFG_SERDES_CORE_INTERRUPT__CAPTURE_INTERRUPT_DATA_DELAY) | \
+	 SBL_PML_CFG_SERDES_CORE_INTERRUPT_CLEAR_INTERRUPT_DELAY_SET(                  \
+		 C1_HNI_PML_CFG_SERDES_CORE_INTERRUPT__CLEAR_INTERRUPT_DELAY) |        \
+	 SBL_PML_CFG_SERDES_CORE_INTERRUPT_SET_INTERRUPT_DELAY_SET(                    \
+		 C1_HNI_PML_CFG_SERDES_CORE_INTERRUPT__SET_INTERRUPT_DELAY))
+#define SBL_PML_CFG_TX_MAC_DFLT                                             \
+	(SBL_PML_CFG_TX_MAC_PORTALS_PROTOCOL_SET(                           \
+		 C1_HNI_PML_CFG_TX_MAC__PORTALS_PROTOCOL) |                 \
+	 SBL_PML_CFG_TX_MAC_ANY_FRAME_MAX_SOF_1_SET(                        \
+		 C1_HNI_PML_CFG_TX_MAC__ANY_FRAME_MAX_SOF_1) |              \
+	 SBL_PML_CFG_TX_MAC_ANY_FRAME_SOF_WINDOW_1_SET(                     \
+		 C1_HNI_PML_CFG_TX_MAC__ANY_FRAME_SOF_WINDOW_1) |           \
+	 SBL_PML_CFG_TX_MAC_ANY_FRAME_MAX_SOF_0_SET(                        \
+		 C1_HNI_PML_CFG_TX_MAC__ANY_FRAME_MAX_SOF_0) |              \
+	 SBL_PML_CFG_TX_MAC_ANY_FRAME_SOF_WINDOW_0_SET(                     \
+		 C1_HNI_PML_CFG_TX_MAC__ANY_FRAME_SOF_WINDOW_0) |           \
+	 SBL_PML_CFG_TX_MAC_NON_PORTALS_MAX_SOF_SET(                        \
+		 C1_HNI_PML_CFG_TX_MAC__NON_PORTALS_MAX_SOF) |              \
+	 SBL_PML_CFG_TX_MAC_NON_PORTALS_SOF_WINDOW_SET(                     \
+		 C1_HNI_PML_CFG_TX_MAC__NON_PORTALS_SOF_WINDOW) |           \
+	 SBL_PML_CFG_TX_MAC_IEEE_IFG_ADJUSTMENT_SET(                        \
+		 C1_HNI_PML_CFG_TX_MAC__IEEE_IFG_ADJUSTMENT) |              \
+	 SBL_PML_CFG_TX_MAC_VS_VERSION_SET(                                 \
+		 C1_HNI_PML_CFG_TX_MAC__VS_VERSION) |                       \
+	 SBL_PML_CFG_TX_MAC_IFG_MODE_SET(C1_HNI_PML_CFG_TX_MAC__IFG_MODE) | \
+	 SBL_PML_CFG_TX_MAC_PCS_CREDITS_SET(                                \
+		 C1_HNI_PML_CFG_TX_MAC__PCS_CREDITS) |                      \
+	 SBL_PML_CFG_TX_MAC_SHORT_PREAMBLE_SET(                             \
+		 C1_HNI_PML_CFG_TX_MAC__SHORT_PREAMBLE) |                   \
+	 SBL_PML_CFG_TX_MAC_MAC_OPERATIONAL_SET(                            \
+		 C1_HNI_PML_CFG_TX_MAC__MAC_OPERATIONAL))
+#define SBL_PML_CFG_TX_PCS_DFLT                               \
+	(SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL_SET(              \
+		 C1_HNI_PML_CFG_TX_PCS__CDC_READY_LEVEL) |    \
+	 SBL_PML_CFG_TX_PCS_GEARBOX_CREDITS_SET(              \
+		 C1_HNI_PML_CFG_TX_PCS__GEARBOX_CREDITS) |    \
+	 SBL_PML_CFG_TX_PCS_ALLOW_AUTO_DEGRADE_SET(           \
+		 C1_HNI_PML_CFG_TX_PCS__ALLOW_AUTO_DEGRADE) | \
+	 SBL_PML_CFG_TX_PCS_ENABLE_CTL_OS_SET(                \
+		 C1_HNI_PML_CFG_TX_PCS__ENABLE_CTL_OS) |      \
+	 SBL_PML_CFG_TX_PCS_LANE_3_SOURCE_SET(                \
+		 C1_HNI_PML_CFG_TX_PCS__LANE_3_SOURCE) |      \
+	 SBL_PML_CFG_TX_PCS_LANE_2_SOURCE_SET(                \
+		 C1_HNI_PML_CFG_TX_PCS__LANE_2_SOURCE) |      \
+	 SBL_PML_CFG_TX_PCS_LANE_1_SOURCE_SET(                \
+		 C1_HNI_PML_CFG_TX_PCS__LANE_1_SOURCE) |      \
+	 SBL_PML_CFG_TX_PCS_LANE_0_SOURCE_SET(                \
+		 C1_HNI_PML_CFG_TX_PCS__LANE_0_SOURCE))
+#define SBL_PML_DBG_PCS_DFLT                                   \
+	(SBL_PML_DBG_PCS_PPM_TEST_MODE_SET(                    \
+		 C1_HNI_PML_DBG_PCS__PPM_TEST_MODE) |          \
+	 SBL_PML_DBG_PCS_FORCE_TX_DATA_RF_SET(                 \
+		 C1_HNI_PML_DBG_PCS__FORCE_TX_DATA_RF) |       \
+	 SBL_PML_DBG_PCS_FORCE_TX_DATA_SET(                    \
+		 C1_HNI_PML_DBG_PCS__FORCE_TX_DATA) |          \
+	 SBL_PML_DBG_PCS_ENABLE_IDLE_CHECK_SET(                \
+		 C1_HNI_PML_DBG_PCS__ENABLE_IDLE_CHECK) |      \
+	 SBL_PML_DBG_PCS_FORCE_BAD_BIP_SET(                    \
+		 C1_HNI_PML_DBG_PCS__FORCE_BAD_BIP) |          \
+	 SBL_PML_DBG_PCS_ENABLE_RAPID_ALIGNMENT_SET(           \
+		 C1_HNI_PML_DBG_PCS__ENABLE_RAPID_ALIGNMENT) | \
+	 SBL_PML_DBG_PCS_RX_DESCRAMBLER_EN_SET(                \
+		 C1_HNI_PML_DBG_PCS__RX_DESCRAMBLER_EN) |      \
+	 SBL_PML_DBG_PCS_TX_SCRAMBLER_EN_SET(                  \
+		 C1_HNI_PML_DBG_PCS__TX_SCRAMBLER_EN))
+
+/* SET defines */
+#define SBL_PML_CFG_LLR_CAPACITY_MAX_DATA_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_llr_capacity, max_data)
+#define SBL_PML_CFG_LLR_CAPACITY_MAX_SEQ_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_llr_capacity, max_seq)
+#define SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_autoneg, next_page_loaded)
+#define SBL_PML_CFG_PCS_AUTONEG_RESET_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_autoneg, reset)
+#define SBL_PML_CFG_PCS_AUTONEG_RESTART_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_autoneg, restart)
+#define SBL_PML_CFG_PCS_AUTONEG_RX_LANE_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_autoneg, rx_lane)
+#define SBL_PML_CFG_PCS_AUTONEG_TX_LANE_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_autoneg, tx_lane)
+#define SBL_PML_CFG_RX_PCS_AMS_UM_MATCH_MASK_SET(a) \
+	C_SET(a, c_hni_pml_cfg_rx_pcs_ams, um_match_mask)
+#define SBL_PML_CFG_RX_PCS_AMS_CM_MATCH_MASK_SET(a) \
+	C_SET(a, c_hni_pml_cfg_rx_pcs_ams, cm_match_mask)
+#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_CAPTURE_INTERRUPT_DATA_DELAY_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt,                        \
+	      capture_interrupt_data_delay)
+#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_CLEAR_INTERRUPT_DELAY_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt, clear_interrupt_delay)
+#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_SET_INTERRUPT_DELAY_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt, set_interrupt_delay)
+#define SBL_PML_ERR_FLG_AUTONEG_COMPLETE_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, autoneg_complete)
+#define SBL_PML_ERR_FLG_AUTONEG_PAGE_RECEIVED_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, autoneg_page_received)
+#define SBL_PML_ERR_FLG_LLR_REPLAY_AT_MAX_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, llr_replay_at_max)
+#define SBL_PML_ERR_FLG_MAC_RX_DP_ERR_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, mac_rx_dp_err)
+#define SBL_PML_ERR_FLG_MAC_TX_DP_ERR_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, mac_tx_dp_err)
+#define SBL_PML_ERR_FLG_PCS_HI_SER_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, pcs_hi_ser)
+#define SBL_PML_ERR_FLG_PCS_LINK_DOWN_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, pcs_link_down)
+#define SBL_PML_ERR_FLG_PCS_TX_DEGRADE_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, pcs_tx_degrade)
+#define SBL_PML_ERR_FLG_PCS_RX_DEGRADE_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, pcs_rx_degrade)
+#define SBL_PML_ERR_FLG_PCS_TX_DEGRADE_FAILURE_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, pcs_tx_degrade_failure)
+#define SBL_PML_ERR_FLG_PCS_RX_DEGRADE_FAILURE_SET(a) \
+	C_SET(a, c1_hni_pml_err_flg, pcs_rx_degrade_failure)
+#define SBL_PML_SERDES_CORE_INTERRUPT_SERDES_SEL_SET(a) \
+	C_SET(a, c1_hni_pml_serdes_core_interrupt, serdes_sel)
+#define SBL_PML_SERDES_CORE_INTERRUPT_DO_CORE_INTERRUPT_SET(a) \
+	C_SET(a, c1_hni_pml_serdes_core_interrupt, do_core_interrupt)
+#define SBL_PML_SERDES_CORE_INTERRUPT_CORE_INTERRUPT_CODE_SET(a) \
+	C_SET(a, c1_hni_pml_serdes_core_interrupt, core_interrupt_code)
+#define SBL_PML_SERDES_CORE_INTERRUPT_CORE_INTERRUPT_DATA_SET(a) \
+	C_SET(a, c1_hni_pml_serdes_core_interrupt, core_interrupt_data)
+
+#define SBL_PML_CFG_LLR_CAPACITY_SET(MAX_DATA, MAX_SEQ)    \
+	(SBL_PML_CFG_LLR_CAPACITY_MAX_DATA_SET(MAX_DATA) | \
+	 SBL_PML_CFG_LLR_CAPACITY_MAX_SEQ_SET(MAX_SEQ))
+#define SBL_PML_CFG_RX_PCS_AMS_SET(UM_MATCH_MASK, CM_MATCH_MASK)   \
+	(SBL_PML_CFG_RX_PCS_AMS_UM_MATCH_MASK_SET(UM_MATCH_MASK) | \
+	 SBL_PML_CFG_RX_PCS_AMS_CM_MATCH_MASK_SET(CM_MATCH_MASK))
+#define SBL_PML_SERDES_CORE_INTERRUPT_SET(SERDES_SEL, DO_CORE_INTERRUPT, \
+					  CORE_INTERRUPT_CODE,           \
+					  CORE_INTERRUPT_DATA)           \
+	(SBL_PML_SERDES_CORE_INTERRUPT_SERDES_SEL_SET(SERDES_SEL) |      \
+	 SBL_PML_SERDES_CORE_INTERRUPT_DO_CORE_INTERRUPT_SET(            \
+		 DO_CORE_INTERRUPT) |                                    \
+	 SBL_PML_SERDES_CORE_INTERRUPT_CORE_INTERRUPT_CODE_SET(          \
+		 CORE_INTERRUPT_CODE) |                                  \
+	 SBL_PML_SERDES_CORE_INTERRUPT_CORE_INTERRUPT_DATA_SET(          \
+		 CORE_INTERRUPT_DATA))
+
+#define SBL_PML_CFG_LLR_CF_ETYPE_CTL_FRAME_ETHERTYPE_SET(a) \
+	C_SET(a, c_hni_pml_cfg_llr_cf_etype, ctl_frame_ethertype)
+#define SBL_PML_CFG_LLR_CF_SMAC_CTL_FRAME_SMAC_SET(a) \
+	C_SET(a, c_hni_pml_cfg_llr_cf_smac, ctl_frame_smac)
+#define SBL_PML_CFG_LLR_PREAMBLE_SEQ_CHECK_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_llr, preamble_seq_check)
+#define SBL_PML_CFG_LLR_ACK_NACK_ERR_CHECK_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_llr, ack_nack_err_check)
+#define SBL_PML_CFG_LLR_FILTER_LOSSLESS_WHEN_OFF_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_llr, filter_lossless_when_off)
+#define SBL_PML_CFG_LLR_FILTER_CTL_FRAMES_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_llr, filter_ctl_frames)
+#define SBL_PML_CFG_LLR_SIZE_SET(a) C_SET(a, c1_hni_pml_cfg_llr, size)
+#define SBL_PML_CFG_LLR_ENABLE_LOOP_TIMING_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_llr, enable_loop_timing)
+#define SBL_PML_CFG_LLR_LINK_DOWN_BEHAVIOR_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_llr, link_down_behavior)
+#define SBL_PML_CFG_LLR_MAC_IF_CREDITS_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_llr, mac_if_credits)
+#define SBL_PML_CFG_LLR_LLR_MODE_SET(a) C_SET(a, c1_hni_pml_cfg_llr, llr_mode)
+#define SBL_PML_CFG_LLR_SM_RETRY_THRESHOLD_SET(a) \
+	C_SET(a, c_hni_pml_cfg_llr_sm, retry_threshold)
+#define SBL_PML_CFG_LLR_SM_ALLOW_RE_INIT_SET(a) \
+	C_SET(a, c_hni_pml_cfg_llr_sm, allow_re_init)
+#define SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_SET(a) \
+	C_SET(a, c_hni_pml_cfg_llr_sm, replay_ct_max)
+#define SBL_PML_CFG_LLR_SM_REPLAY_TIMER_MAX_SET(a) \
+	C_SET(a, c_hni_pml_cfg_llr_sm, replay_timer_max)
+#define SBL_PML_CFG_LLR_TIMEOUTS_DATA_AGE_TIMER_MAX_SET(a) \
+	C_SET(a, c_hni_pml_cfg_llr_timeouts, data_age_timer_max)
+#define SBL_PML_CFG_LLR_TIMEOUTS_PCS_LINK_DN_TIMER_MAX_SET(a) \
+	C_SET(a, c_hni_pml_cfg_llr_timeouts, pcs_link_dn_timer_max)
+#define SBL_PML_CFG_PCS_AMS_USE_PROGRAMMABLE_AMS_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_ams, use_programmable_ams)
+#define SBL_PML_CFG_PCS_AMS_USE_PROGRAMMABLE_AM_SPACING_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_ams, use_programmable_am_spacing)
+#define SBL_PML_CFG_PCS_AMS_RAM_SPACING_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_ams, ram_spacing)
+#define SBL_PML_CFG_PCS_AMS_AM_SPACING_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_ams, am_spacing)
+#define SBL_PML_CFG_PCS_AUTONEG_BASE_PAGE_BASE_PAGE_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_autoneg_base_page, base_page)
+#define SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_NEXT_PAGE_SET(a) \
+	C_SET(a, c_hni_pml_cfg_pcs_autoneg_next_page, next_page)
+#define SBL_PML_CFG_PCS_AUTONEG_TIMERS_LINK_FAIL_INHIBIT_TIMER_MAX_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_pcs_autoneg_timers, link_fail_inhibit_timer_max)
+#define SBL_PML_CFG_PCS_AUTONEG_TIMERS_BREAK_LINK_TIMER_MAX_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_pcs_autoneg_timers, break_link_timer_max)
+#define SBL_PML_CFG_PCS_TIMESTAMP_SHIFT_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_pcs, timestamp_shift)
+#define SBL_PML_CFG_PCS_LL_FEC_SET(a) C_SET(a, c1_hni_pml_cfg_pcs, ll_fec)
+#define SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_pcs, enable_auto_lane_degrade)
+#define SBL_PML_CFG_PCS_PCS_MODE_SET(a) C_SET(a, c1_hni_pml_cfg_pcs, pcs_mode)
+#define SBL_PML_CFG_PCS_ENABLE_AUTO_NEG_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_pcs, enable_auto_neg)
+#define SBL_PML_CFG_PCS_PCS_ENABLE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_pcs, pcs_enable)
+#define SBL_PML_CFG_RX_MAC_FILTER_ILLEGAL_SIZE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_mac, filter_illegal_size)
+#define SBL_PML_CFG_RX_MAC_SHORT_PREAMBLE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_mac, short_preamble)
+#define SBL_PML_CFG_RX_MAC_MAC_OPERATIONAL_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_mac, mac_operational)
+#define SBL_PML_CFG_RX_PCS_ENABLE_RX_SM_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, enable_rx_sm)
+#define SBL_PML_CFG_RX_PCS_ALLOW_AUTO_DEGRADE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, allow_auto_degrade)
+#define SBL_PML_CFG_RX_PCS_LP_HEALTH_BAD_SENSITIVITY_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, lp_health_bad_sensitivity)
+#define SBL_PML_CFG_RX_PCS_HEALTH_BAD_SENSITIVITY_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, health_bad_sensitivity)
+#define SBL_PML_CFG_RX_PCS_ENABLE_CTL_OS_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, enable_ctl_os)
+#define SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, restart_lock_on_bad_cws)
+#define SBL_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, restart_lock_on_bad_ams)
+#define SBL_PML_CFG_RX_PCS_ENABLE_LOCK_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, enable_lock)
+#define SBL_PML_CFG_RX_PCS_RS_MODE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, rs_mode)
+#define SBL_PML_CFG_RX_PCS_ACTIVE_LANES_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_rx_pcs, active_lanes)
+#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_CAPTURE_INTERRUPT_DATA_DELAY_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt,                        \
+	      capture_interrupt_data_delay)
+#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_CLEAR_INTERRUPT_DELAY_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt, clear_interrupt_delay)
+#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_SET_INTERRUPT_DELAY_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt, set_interrupt_delay)
+#define SBL_PML_CFG_TX_MAC_PORTALS_PROTOCOL_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, portals_protocol)
+#define SBL_PML_CFG_TX_MAC_ANY_FRAME_MAX_SOF_1_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, any_frame_max_sof_1)
+#define SBL_PML_CFG_TX_MAC_ANY_FRAME_SOF_WINDOW_1_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, any_frame_sof_window_1)
+#define SBL_PML_CFG_TX_MAC_ANY_FRAME_MAX_SOF_0_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, any_frame_max_sof_0)
+#define SBL_PML_CFG_TX_MAC_ANY_FRAME_SOF_WINDOW_0_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, any_frame_sof_window_0)
+#define SBL_PML_CFG_TX_MAC_NON_PORTALS_MAX_SOF_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, non_portals_max_sof)
+#define SBL_PML_CFG_TX_MAC_NON_PORTALS_SOF_WINDOW_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, non_portals_sof_window)
+#define SBL_PML_CFG_TX_MAC_VS_VERSION_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, vs_version)
+#define SBL_PML_CFG_TX_MAC_IEEE_IFG_ADJUSTMENT_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, ieee_ifg_adjustment)
+#define SBL_PML_CFG_TX_MAC_IFG_MODE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, ifg_mode)
+#define SBL_PML_CFG_TX_MAC_PCS_CREDITS_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, pcs_credits)
+#define SBL_PML_CFG_TX_MAC_SHORT_PREAMBLE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, short_preamble)
+#define SBL_PML_CFG_TX_MAC_MAC_OPERATIONAL_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_mac, mac_operational)
+#define SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_pcs, cdc_ready_level)
+#define SBL_PML_CFG_TX_PCS_GEARBOX_CREDITS_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_pcs, gearbox_credits)
+#define SBL_PML_CFG_TX_PCS_ALLOW_AUTO_DEGRADE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_pcs, allow_auto_degrade)
+#define SBL_PML_CFG_TX_PCS_ENABLE_CTL_OS_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_pcs, enable_ctl_os)
+#define SBL_PML_CFG_TX_PCS_LANE_3_SOURCE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_pcs, lane_3_source)
+#define SBL_PML_CFG_TX_PCS_LANE_2_SOURCE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_pcs, lane_2_source)
+#define SBL_PML_CFG_TX_PCS_LANE_1_SOURCE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_pcs, lane_1_source)
+#define SBL_PML_CFG_TX_PCS_LANE_0_SOURCE_SET(a) \
+	C_SET(a, c1_hni_pml_cfg_tx_pcs, lane_0_source)
+#define SBL_PML_DBG_PCS_PPM_TEST_MODE_SET(a) \
+	C_SET(a, c1_hni_pml_dbg_pcs, ppm_test_mode)
+#define SBL_PML_DBG_PCS_FORCE_TX_DATA_RF_SET(a) \
+	C_SET(a, c1_hni_pml_dbg_pcs, force_tx_data_rf)
+#define SBL_PML_DBG_PCS_FORCE_TX_DATA_SET(a) \
+	C_SET(a, c1_hni_pml_dbg_pcs, force_tx_data)
+#define SBL_PML_DBG_PCS_ENABLE_IDLE_CHECK_SET(a) \
+	C_SET(a, c1_hni_pml_dbg_pcs, enable_idle_check)
+#define SBL_PML_DBG_PCS_FORCE_BAD_BIP_SET(a) \
+	C_SET(a, c1_hni_pml_dbg_pcs, force_bad_bip)
+#define SBL_PML_DBG_PCS_ENABLE_RAPID_ALIGNMENT_SET(a) \
+	C_SET(a, c1_hni_pml_dbg_pcs, enable_rapid_alignment)
+#define SBL_PML_DBG_PCS_RX_DESCRAMBLER_EN_SET(a) \
+	C_SET(a, c1_hni_pml_dbg_pcs, rx_descrambler_en)
+#define SBL_PML_DBG_PCS_TX_SCRAMBLER_EN_SET(a) \
+	C_SET(a, c1_hni_pml_dbg_pcs, tx_scrambler_en)
+
+/* GET defines */
+#define SBL_PML_CFG_LLR_LINK_DOWN_BEHAVIOR_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_llr, link_down_behavior)
+#define SBL_PML_CFG_LLR_LLR_MODE_GET(a) C_GET(a, c1_hni_pml_cfg_llr, llr_mode)
+#define SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(a) \
+	C_GET(a, c_hni_pml_cfg_llr_sm, replay_ct_max)
+#define SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_pcs_autoneg, next_page_loaded)
+#define SBL_PML_CFG_PCS_ENABLE_AUTO_NEG_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_pcs, enable_auto_neg)
+#define SBL_PML_CFG_PCS_PCS_ENABLE_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_pcs, pcs_enable)
+#define SBL_PML_CFG_RX_PCS_ENABLE_LOCK_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_rx_pcs, enable_lock)
+#define SBL_PML_ERR_FLG_AUTONEG_COMPLETE_GET(a) \
+	C_GET(a, c1_hni_pml_err_flg, autoneg_complete)
+#define SBL_PML_ERR_FLG_AUTONEG_PAGE_RECEIVED_GET(a) \
+	C_GET(a, c1_hni_pml_err_flg, autoneg_page_received)
+#define SBL_PML_ERR_FLG_LLR_REPLAY_AT_MAX_GET(a) \
+	C_GET(a, c1_hni_pml_err_flg, llr_replay_at_max)
+#define SBL_PML_ERR_FLG_PCS_HI_SER_GET(a) \
+	C_GET(a, c1_hni_pml_err_flg, pcs_hi_ser)
+#define SBL_PML_ERR_FLG_PCS_LINK_DOWN_GET(a) \
+	C_GET(a, c1_hni_pml_err_flg, pcs_link_down)
+#define SBL_PML_ERR_FLG_PCS_TX_DEGRADE_GET(a) \
+	C_GET(a, c1_hni_pml_err_flg, pcs_tx_degrade)
+#define SBL_PML_ERR_FLG_PCS_RX_DEGRADE_GET(a) \
+	C_GET(a, c1_hni_pml_err_flg, pcs_rx_degrade)
+#define SBL_PML_ERR_FLG_PCS_TX_DEGRADE_FAILURE_GET(a) \
+	C_GET(a, c1_hni_pml_err_flg, pcs_tx_degrade_failure)
+#define SBL_PML_ERR_FLG_PCS_RX_DEGRADE_FAILURE_GET(a) \
+	C_GET(a, c1_hni_pml_err_flg, pcs_rx_degrade_failure)
+#define SBL_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_pcs, enable_auto_lane_degrade)
+#define SBL_PML_SERDES_CORE_INTERRUPT_CORE_INTERRUPT_DATA_GET(a) \
+	C_GET(a, c1_hni_pml_serdes_core_interrupt, core_interrupt_data)
+#define SBL_PML_SERDES_CORE_INTERRUPT_DO_CORE_INTERRUPT_GET(a) \
+	C_GET(a, c1_hni_pml_serdes_core_interrupt, do_core_interrupt)
+#define SBL_PML_STS_LLR_LLR_STATE_GET(a) C_GET(a, c_hni_pml_sts_llr, llr_state)
+#define SBL_PML_STS_LLR_LOOP_TIME_LOOP_TIME_GET(a) \
+	C_GET(a, c_hni_pml_sts_llr_loop_time, loop_time)
+#define SBL_PML_STS_LLR_MAX_USAGE_BUFF_SPC_STARVED_GET(a) \
+	C_GET(a, c_hni_pml_sts_llr_max_usage, buffer_space_starved)
+#define SBL_PML_STS_LLR_MAX_USAGE_SEQ_STARVED_GET(a) \
+	C_GET(a, c_hni_pml_sts_llr_max_usage, seq_starved)
+#define SBL_PML_CFG_RX_MAC_MAC_OPERATIONAL_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_rx_mac, mac_operational)
+#define SBL_PML_CFG_TX_MAC_IEEE_IFG_ADJUSTMENT_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_tx_mac, ieee_ifg_adjustment)
+#define SBL_PML_CFG_TX_MAC_IFG_MODE_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_tx_mac, ifg_mode)
+#define SBL_PML_CFG_TX_MAC_MAC_OPERATIONAL_GET(a) \
+	C_GET(a, c1_hni_pml_cfg_tx_mac, mac_operational)
+#define SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_BASE_PAGE_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_base_page, base_page)
+#define SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_BASE_PAGE_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_base_page, lp_base_page)
+#define SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_ABILITY_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_base_page, lp_ability)
+#define SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_STATE_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_base_page, state)
+#define SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_COMPLETE_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_base_page, complete)
+#define SBL_PML_STS_PCS_AUTONEG_BASE_PAGE_PAGE_RECEIVED_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_base_page, page_received)
+#define SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_BASE_PAGE_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_next_page, base_page)
+#define SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_NEXT_PAGE_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_next_page, lp_next_page)
+#define SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_ABILITY_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_next_page, lp_ability)
+#define SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_STATE_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_next_page, state)
+#define SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_COMPLETE_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_next_page, complete)
+#define SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_PAGE_RECEIVED_GET(a) \
+	C_GET(a, c_hni_pml_sts_pcs_autoneg_next_page, page_received)
+#define SBL_PML_STS_RX_PCS_ALIGN_STATUS_GET(a) \
+	C_GET(a, c1_hni_pml_sts_rx_pcs, align_status)
+#define SBL_PML_STS_RX_PCS_AM_LOCK_GET(a) \
+	C_GET(a, c1_hni_pml_sts_rx_pcs, am_lock)
+#define SBL_PML_STS_RX_PCS_FAULT_GET(a) C_GET(a, c1_hni_pml_sts_rx_pcs, fault)
+#define SBL_PML_STS_RX_PCS_HI_SER_GET(a) C_GET(a, c1_hni_pml_sts_rx_pcs, hi_ser)
+#define SBL_PML_STS_RX_PCS_LOCAL_FAULT_GET(a) \
+	C_GET(a, c1_hni_pml_sts_rx_pcs, local_fault)
+#define SBL_PML_STS_PCS_LANE_DEGRADE_RX_PLS_AVAILABLE_GET(a) \
+	C_GET(a, c1_hni_pml_sts_pcs_lane_degrade, rx_pls_available)
+#define SBL_PML_STS_PCS_LANE_DEGRADE_LP_PLS_AVAILABLE_GET(a) \
+	C_GET(a, c1_hni_pml_sts_pcs_lane_degrade, lp_pls_available)
+
+/* Other defines */
+#define SBL_PML_AUTONEG_STATE_AUTONEG_OFF 0x0
+#define SBL_PML_AUTONEG_STATE_AUTONEG_ENABLE 0x1
+#define SBL_PML_AUTONEG_STATE_TX_DISABLE 0x2
+#define SBL_PML_AUTONEG_STATE_ABILITY_DETECT 0x3
+#define SBL_PML_AUTONEG_STATE_ACK_DETECT 0x4
+#define SBL_PML_AUTONEG_STATE_COMPLETE_ACK 0x5
+#define SBL_PML_AUTONEG_STATE_NEXT_PAGE_WAIT 0x6
+#define SBL_PML_AUTONEG_STATE_AN_GOOD_CHECK 0x9
+#define SBL_PML_AUTONEG_STATE_AN_GOOD 0xa
+
+/* Cassini 2 macros */
+
+#define SS2_PORT_PML_CFG_SUBPORT_RESET_WARM_RST_FROM_CSR_SET(a) \
+	C_SET(a, ss2_port_pml_cfg_subport_reset, warm_rst_from_csr)
+
+#define SS2_PORT_PML_CFG_GENERAL_CLOCK_PERIOD_PS_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_general, clock_period_ps)
+
+#define SS2_PORT_PML_CFG_LLR_CAPACITY_MAX_DATA_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_capacity, max_data)
+#define SS2_PORT_PML_CFG_LLR_CAPACITY_MAX_SEQ_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_capacity, max_seq)
+#define SS2_PORT_PML_CFG_LLR_SIZE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr, size)
+#define SS2_PORT_PML_CFG_LLR_ACK_NACK_ERR_CHECK_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr, ack_nack_err_check)
+#define SS2_PORT_PML_CFG_LLR_PREAMBLE_SEQ_CHECK_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr, preamble_seq_check)
+#define SS2_PORT_PML_CFG_LLR_CF_RATES_LOOP_TIMING_PERIOD_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_cf_rates, loop_timing_period)
+#define SS2_PORT_PML_CFG_LLR_CF_SMAC_CTL_FRAME_SMAC_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_cf_smac, ctl_frame_smac)
+#define SS2_PORT_PML_CFG_LLR_CF_ETYPE_CTL_FRAME_ETHERTYPE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_cf_etype, ctl_frame_ethertype)
+#define SS2_PORT_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(a) \
+	C_GET(a, ss2_port_pml_cfg_llr_sm, replay_ct_max)
+#define SS2_PORT_PML_CFG_LLR_SM_REPLAY_CT_MAX_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_sm, replay_ct_max)
+#define SS2_PORT_PML_CFG_LLR_SM_REPLAY_TIMER_MAX_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_sm, replay_timer_max)
+#define SS2_PORT_PML_CFG_LLR_SM_RETRY_THRESHOLD_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_sm, retry_threshold)
+#define SS2_PORT_PML_CFG_LLR_SM_ALLOW_RE_INIT_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_sm, allow_re_init)
+#define SS2_PORT_PML_CFG_LLR_SUBPORT_FILTER_LOSSLESS_WHEN_OFF_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_subport, filter_lossless_when_off)
+#define SS2_PORT_PML_CFG_LLR_SUBPORT_MAX_STARVATION_LIMIT_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_subport, max_starvation_limit)
+#define SS2_PORT_PML_CFG_LLR_SUBPORT_LINK_DOWN_BEHAVIOR_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_subport, link_down_behavior)
+#define SS2_PORT_PML_CFG_LLR_SUBPORT_MAC_IF_CREDITS_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_subport, mac_if_credits)
+#define SS2_PORT_PML_CFG_LLR_SUBPORT_FILTER_CTL_FRAMES_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_subport, filter_ctl_frames)
+#define SS2_PORT_PML_CFG_LLR_SUBPORT_ENABLE_LOOP_TIMING_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_subport, enable_loop_timing)
+#define SS2_PORT_PML_CFG_LLR_SUBPORT_LLR_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_subport, llr_mode)
+#define SS2_PORT_PML_CFG_LLR_TIMEOUTS_DATA_AGE_TIMER_MAX_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_timeouts, data_age_timer_max)
+#define SS2_PORT_PML_CFG_LLR_TIMEOUTS_PCS_LINK_DN_TIMER_MAX_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_llr_timeouts, pcs_link_dn_timer_max)
+
+#define SS2_PORT_PML_CFG_PCS_AUTONEG_RESET_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_pcs_autoneg, reset)
+#define SS2_PORT_PML_CFG_PCS_AUTONEG_RESTART_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_pcs_autoneg, restart)
+#define SS2_PORT_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_pcs_autoneg, next_page_loaded)
+
+#define SS2_PORT_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_pcs, enable_auto_lane_degrade)
+#define SS2_PORT_PML_CFG_PCS_ENABLE_AUTO_LANE_DEGRADE_GET(a) \
+	C_GET(a, ss2_port_pml_cfg_pcs, enable_auto_lane_degrade)
+#define SS2_PORT_PML_CFG_PCS_PCS_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_pcs, pcs_mode)
+#define SS2_PORT_PML_CFG_PCS_TIMESTAMP_SHIFT_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_pcs, timestamp_shift)
+#define SS2_PORT_PML_CFG_PCS_SUBPORT_PCS_ENABLE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_pcs_subport, pcs_enable)
+#define SS2_PORT_PML_CFG_PCS_SUBPORT_ENABLE_AUTO_NEG_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_pcs_subport, enable_auto_neg)
+
+#define SS2_PORT_PML_CFG_RX_MAC_FLIT_PACKING_CNT_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_mac, flit_packing_cnt)
+#define SS2_PORT_PML_CFG_RX_MAC_SUBPORT_MAC_OPERATIONAL_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_mac_subport, mac_operational)
+#define SS2_PORT_PML_CFG_RX_MAC_SUBPORT_MAC_OPERATIONAL_GET(a) \
+	C_GET(a, ss2_port_pml_cfg_rx_mac_subport, mac_operational)
+#define SS2_PORT_PML_CFG_RX_MAC_SUBPORT_SHORT_PREAMBLE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_mac_subport, short_preamble)
+
+#define SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_CTL_OS_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs_subport, enable_ctl_os)
+#define SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_LOCK_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs_subport, enable_lock)
+#define SS2_PORT_PML_CFG_RX_PCS_SUBPORT_ENABLE_RX_SM_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs_subport, enable_rx_sm)
+#define SS2_PORT_PML_CFG_RX_PCS_SUBPORT_RS_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs_subport, rs_mode)
+#define SS2_PORT_PML_CFG_RX_PCS_ACTIVE_LANES_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs, active_lanes)
+#define SS2_PORT_PML_CFG_RX_PCS_CW_GAP_544_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs, cw_gap_544)
+#define SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_AMS_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs, restart_lock_on_bad_ams)
+#define SS2_PORT_PML_CFG_RX_PCS_RESTART_LOCK_ON_BAD_CWS_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs, restart_lock_on_bad_cws)
+#define SS2_PORT_PML_CFG_RX_PCS_ALLOW_AUTO_DEGRADE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs, allow_auto_degrade)
+#define SS2_PORT_PML_CFG_RX_PCS_LANE_0_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs, lane_0_source)
+#define SS2_PORT_PML_CFG_RX_PCS_LANE_1_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs, lane_1_source)
+#define SS2_PORT_PML_CFG_RX_PCS_LANE_2_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs, lane_2_source)
+#define SS2_PORT_PML_CFG_RX_PCS_LANE_3_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_rx_pcs, lane_3_source)
+
+#define SS2_PORT_PML_CFG_TX_MAC_IEEE_IFG_ADJUSTMENT_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_mac, ieee_ifg_adjustment)
+#define SS2_PORT_PML_CFG_TX_MAC_MAC_PAD_IDLE_THRESH_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_mac, mac_pad_idle_thresh)
+#define SS2_PORT_PML_CFG_TX_MAC_IFG_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_mac, ifg_mode)
+#define SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_OPERATIONAL_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_mac_subport, mac_operational)
+#define SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_OPERATIONAL_GET(a) \
+	C_GET(a, ss2_port_pml_cfg_tx_mac_subport, mac_operational)
+#define SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_CDT_THRESH_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_mac_subport, mac_cdt_thresh)
+#define SS2_PORT_PML_CFG_TX_MAC_SUBPORT_MAC_CDT_INIT_VAL_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_mac_subport, mac_cdt_init_val)
+#define SS2_PORT_PML_CFG_TX_MAC_SUBPORT_PCS_CREDITS_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_mac_subport, pcs_credits)
+#define SS2_PORT_PML_CFG_TX_MAC_SUBPORT_SHORT_PREAMBLE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_mac_subport, short_preamble)
+
+#define SS2_PORT_PML_CFG_TX_PCS_SUBPORT_ENABLE_CTL_OS_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs_subport, enable_ctl_os)
+#define SS2_PORT_PML_CFG_TX_PCS_CDC_READY_LEVEL_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs, cdc_ready_level)
+#define SS2_PORT_PML_CFG_TX_PCS_EN_PK_BW_LIMITER_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs, en_pk_bw_limiter)
+#define SS2_PORT_PML_CFG_TX_PCS_LANE_0_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs, lane_0_source)
+#define SS2_PORT_PML_CFG_TX_PCS_LANE_1_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs, lane_1_source)
+#define SS2_PORT_PML_CFG_TX_PCS_LANE_2_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs, lane_2_source)
+#define SS2_PORT_PML_CFG_TX_PCS_LANE_3_SOURCE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs, lane_3_source)
+#define SS2_PORT_PML_CFG_TX_PCS_ALLOW_AUTO_DEGRADE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs, allow_auto_degrade)
+#define SS2_PORT_PML_CFG_TX_PCS_SUBPORT_GEARBOX_CREDITS_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs_subport, gearbox_credits)
+#define SS2_PORT_PML_CFG_TX_PCS_KEEP_ALL_LANES_ACTIVE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs, keep_all_lanes_active)
+
+#define SS2_PORT_PML_ERR_INFO_PCS_TX_DP_TX_CDC_UNDERRUN_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_err_info_pcs_tx_dp, tx_cdc_underrun)
+
+#define SS2_PORT_PML_STS_LLR_LOOP_TIME_LOOP_TIME_GET(a) \
+	C_GET(a, ss2_port_pml_sts_llr_loop_time, loop_time)
+#define SS2_PORT_PML_STS_LLR_LLR_STATE_GET(a) \
+	C_GET(a, ss2_port_pml_sts_llr, llr_state)
+
+#define SS2_PORT_PML_STS_RX_PCS_SUBPORT_ALIGN_STATUS_GET(a) \
+	C_GET(a, ss2_port_pml_sts_rx_pcs_subport, align_status)
+#define SS2_PORT_PML_STS_RX_PCS_SUBPORT_FAULT_GET(a) \
+	C_GET(a, ss2_port_pml_sts_rx_pcs_subport, fault)
+#define SS2_PORT_PML_STS_RX_PCS_SUBPORT_LOCAL_FAULT_GET(a) \
+	C_GET(a, ss2_port_pml_sts_rx_pcs_subport, local_fault)
+#define SS2_PORT_PML_STS_RX_PCS_SUBPORT_HI_SER_GET(a) \
+	C_GET(a, ss2_port_pml_sts_rx_pcs_subport, hi_ser)
+
+#define SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_BASE_PAGE_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_base_page, lp_base_page)
+#define SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_LP_ABILITY_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_base_page, lp_ability)
+#define SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_BASE_PAGE_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_base_page, base_page)
+#define SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_COMPLETE_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_base_page, complete)
+#define SS2_PORT_PML_STS_PCS_AUTONEG_BASE_PAGE_STATE_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_base_page, state)
+#define SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_NEXT_PAGE_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_next_page, lp_next_page)
+#define SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_ABILITY_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_next_page, lp_ability)
+#define SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_BASE_PAGE_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_next_page, base_page)
+#define SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_COMPLETE_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_next_page, complete)
+#define SS2_PORT_PML_STS_PCS_AUTONEG_NEXT_PAGE_STATE_GET(a) \
+	C_GET(a, ss2_port_pml_sts_pcs_autoneg_next_page, state)
+
+#define SS2_PORT_PML_CFG_RX_PCS_ACTIVE_LANES_GET(a) \
+	C_GET(a, ss2_port_pml_cfg_rx_pcs, active_lanes)
+
+#define SS2_PORT_PML_LINK_DN_BEHAVIOR_T_LD_DISCARD C2_HNI_PML_LD_DISCARD
+#define SS2_PORT_PML_LINK_DN_BEHAVIOR_T_LD_BLOCK C2_HNI_PML_LD_BLOCK
+#define SS2_PORT_PML_LINK_DN_BEHAVIOR_T_LD_BEST_EFFORT C2_HNI_PML_LD_BEST_EFFORT
+
+#define SS2_PORT_SERDES_PMI_CTL C2_HNI_SERDES_PMI_CTL
+#define SS2_PORT_SERDES_PMI_CTL_LP_ADDR_SET(a) \
+	C_SET(a, c2_hni_serdes_pmi_ctl, pmi_lp_addr)
+#define SS2_PORT_SERDES_PMI_CTL_LP_WRITE_SET(a) \
+	C_SET(a, c2_hni_serdes_pmi_ctl, pmi_lp_write)
+#define SS2_PORT_SERDES_PMI_CTL_LP_READ_VLD_GET(a) \
+	C_GET(a, c2_hni_serdes_pmi_ctl, pmi_lp_read_vld)
+#define SS2_PORT_SERDES_PMI_CTL_LP_ACK_GET(a) \
+	C_GET(a, c2_hni_serdes_pmi_ctl, pmi_lp_ack)
+#define SS2_PORT_SERDES_PMI_CTL_LP_ERROR_GET(a) \
+	C_GET(a, c2_hni_serdes_pmi_ctl, pmi_lp_error)
+#define SS2_PORT_SERDES_PMI_CTL_LP_EN_SET(a) \
+	C_SET(a, c2_hni_serdes_pmi_ctl, pmi_lp_en)
+#define SS2_PORT_SERDES_PMI_DATA C2_HNI_SERDES_PMI_DATA
+#define SS2_PORT_SERDES_PMI_DATA_LP_RDDATA_GET(a) \
+	C_GET(a, c2_hni_serdes_pmi_data, pmi_lp_rddata)
+#define SS2_PORT_SERDES_PMI_DATA_LP_WRDATA_SET(a) \
+	C_SET(a, c2_hni_serdes_pmi_data, pmi_lp_wrdata)
+#define SS2_PORT_SERDES_PMI_DATA_LP_MASKDATA_SET(a) \
+	C_SET(a, c2_hni_serdes_pmi_data, pmi_lp_maskdata)
+
+#define SS2_PORT_PML_CFG_SERDES_RX_PMD_RX_LANE_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_rx, pmd_rx_lane_mode)
+#define SS2_PORT_PML_CFG_SERDES_RX_PMD_RX_OSR_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_rx, pmd_rx_osr_mode)
+#define SS2_PORT_PML_CFG_SERDES_RX_PMD_EXT_LOS_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_rx, pmd_ext_los)
+#define SS2_PORT_PML_CFG_SERDES_RX_PMD_LN_RX_H_PWRDN_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_rx, pmd_ln_rx_h_pwrdn)
+#define SS2_PORT_PML_CFG_SERDES_RX_PMD_LN_RX_DP_H_RSTB_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_rx, pmd_ln_rx_dp_h_rstb)
+#define SS2_PORT_PML_CFG_SERDES_RX_PMD_LN_RX_H_RSTB_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_rx, pmd_ln_rx_h_rstb)
+
+#define SS2_PORT_PML_CFG_SERDES_RX_PMD_RX_OSR_MODE_GET(a) \
+	C_GET(a, ss2_port_pml_cfg_serdes_rx, pmd_rx_osr_mode)
+
+#define SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_LANE_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_tx, pmd_tx_lane_mode)
+#define SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_OSR_MODE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_tx, pmd_tx_osr_mode)
+#define SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_DISABLE_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_tx, pmd_tx_disable)
+#define SS2_PORT_PML_CFG_SERDES_TX_PMD_LN_TX_H_PWRDN_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_tx, pmd_ln_tx_h_pwrdn)
+#define SS2_PORT_PML_CFG_SERDES_TX_PMD_LN_TX_DP_H_RSTB_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_tx, pmd_ln_tx_dp_h_rstb)
+#define SS2_PORT_PML_CFG_SERDES_TX_PMD_LN_TX_H_RSTB_UPDATE(a, b) \
+	C_UPDATE(a, b, ss2_port_pml_cfg_serdes_tx, pmd_ln_tx_h_rstb)
+
+#define SS2_PORT_PML_CFG_SERDES_TX_PMD_TX_OSR_MODE_GET(a) \
+	C_GET(a, ss2_port_pml_cfg_serdes_tx, pmd_tx_osr_mode)
+
+#define SS2_PORT_PML_STS_SERDES_PMD_TX_DATA_VLD_GET(a) \
+	C_GET(a, ss2_port_pml_sts_serdes, pmd_tx_data_vld)
+#define SS2_PORT_PML_STS_SERDES_PMD_TX_CLK_VLD_GET(a) \
+	C_GET(a, ss2_port_pml_sts_serdes, pmd_tx_clk_vld)
+#define SS2_PORT_PML_STS_SERDES_PMD_RX_DATA_VLD_GET(a) \
+	C_GET(a, ss2_port_pml_sts_serdes, pmd_rx_data_vld)
+#define SS2_PORT_PML_STS_SERDES_PMD_RX_CLK_VLD_GET(a) \
+	C_GET(a, ss2_port_pml_sts_serdes, pmd_rx_clk_vld)
+#define SS2_PORT_PML_STS_SERDES_PMD_RX_LOCK_GET(a) \
+	C_GET(a, ss2_port_pml_sts_serdes, pmd_rx_lock)
+#define SS2_PORT_PML_STS_SERDES_PMD_SIGNAL_DETECTGET(a) \
+	C_GET(a, ss2_port_pml_sts_serdes, pmd_signal_detect)
+
+#define SS2_PORT_PML_ERR_FLG_WORD1_LLR_REPLAY_AT_MAX_0_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, llr_replay_at_max_0, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_LLR_REPLAY_AT_MAX_1_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, llr_replay_at_max_1, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_LLR_REPLAY_AT_MAX_2_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, llr_replay_at_max_2, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_LLR_REPLAY_AT_MAX_3_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, llr_replay_at_max_3, 1)
+
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_0_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_0, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_1_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_1, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_2_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_2, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_3_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_3, 1)
+
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_LF_0_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_lf_0, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_LF_1_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_lf_1, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_LF_2_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_lf_2, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_LF_3_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_lf_3, 1)
+
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_RF_0_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_rf_0, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_RF_1_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_rf_1, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_RF_2_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_rf_2, 1)
+#define SS2_PORT_PML_ERR_FLG_WORD1_PCS_LINK_DOWN_RF_3_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_err_flg, pcs_link_down_rf_3, 1)
+
+#define SS2_PORT_PML_STS_PCS_LANE_DEGRADE_WORD0_LP_PLS_AVAILABLE_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_sts_pcs_lane_degrade, lp_pls_available, 0)
+#define SS2_PORT_PML_STS_PCS_LANE_DEGRADE_WORD0_RX_PLS_AVAILABLE_GET(a) \
+	C_WORD_GET(a, ss2_port_pml_sts_pcs_lane_degrade, rx_pls_available, 0)
+
+#define SS2_PORT_PML_LLR_STATE_T_OFF_LLR C2_HNI_PML_OFF_LLR
+#define SS2_PORT_PML_LLR_STATE_T_INIT C2_HNI_PML_INIT
+#define SS2_PORT_PML_LLR_STATE_T_ADVANCE C2_HNI_PML_ADVANCE
+#define SS2_PORT_PML_LLR_STATE_T_HALT C2_HNI_PML_HALT
+#define SS2_PORT_PML_LLR_STATE_T_REPLAY C2_HNI_PML_REPLAY
+#define SS2_PORT_PML_LLR_STATE_T_DISCARD C2_HNI_PML_DISCARD
+#define SS2_PORT_PML_LLR_STATE_T_MONITOR C2_HNI_PML_MONITOR
+
+#define SS2_MB_STS_REV_PLATFORM_GET(a) C_GET(a, c_mb_sts_rev, platform)
+
+#endif /* _SBL_PML_H_ */
diff --git a/include/linux/hpe/sbl/sbl_test.h b/include/linux/hpe/sbl/sbl_test.h
new file mode 100644
index 000000000000..0f94bb16e1ef
--- /dev/null
+++ b/include/linux/hpe/sbl/sbl_test.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Copyright 2019-2021 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_TEST_H_
+#define _SBL_TEST_H_
+
+int sbl_test_core_intr(struct sbl_inst *sbl, int port_num);
+
+int sbl_test_link_up(struct sbl_inst *sbl, int port_num, int loopback_mode);
+int sbl_test_link_reup(struct sbl_inst *sbl, int port_num, int loopback_mode);
+int sbl_test_link_down(struct sbl_inst *sbl, int port_num);
+int sbl_test_link_reset(struct sbl_inst *sbl, int port_num);
+int sbl_test_scratch(struct sbl_inst *sbl, int port_num);
+int sbl_test_serdes_stop(struct sbl_inst *sbl, int port_num);
+int sbl_test_pcs_tx_rf(struct sbl_inst *sbl, int port_num);
+void sbl_test_manipulate_serdes_fw_crc_result(u16 *crc_result);
+void sbl_test_inject_serdes_fw_crc_failure(bool set);
+
+#endif /* _SBL_SERDES_H_ */
diff --git a/include/uapi/ethernet/sbl-abi.h b/include/uapi/ethernet/sbl-abi.h
new file mode 100644
index 000000000000..d5426c4bf973
--- /dev/null
+++ b/include/uapi/ethernet/sbl-abi.h
@@ -0,0 +1,648 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+/* Copyright 2019-2024 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_UAPI_BASE_LINK_H_
+#define _SBL_UAPI_BASE_LINK_H_
+
+#include <linux/types.h>
+
+
+#define SBL_INSTANCE_ATTR_MAGIC           0x69736d61  /* siam */
+#define SBL_MEDIA_ATTR_MAGIC              0x6d736d61  /* smam */
+#define SBL_LINK_ATTR_MAGIC               0x6c736d61  /* slam */
+
+
+#define SBL_KNOWN_FW0_REV                           0x109E
+#define SBL_KNOWN_FW0_BUILD                         0x208D
+#define SBL_FW_DEFAULT_SBM_FNAME                    "sbus_master.0x1021_2001.rom.bin"
+#define SBL_FW_DEFAULT_SERDES_FNAME                 "serdes.0x109E_208D.rom.bin"
+#define SBL_FW_NAME_LEN                           64
+
+
+/**
+ * @brief Various defaults for link startup
+ *
+ */
+#define SBL_LINK_START_TIMEOUT_PEC                48
+	/* Time out for Electrical links using AN = (1.2 * SBL_DFLT_DFE_TIMEOUT_PEC) as they are synchronized by AN */
+#define SBL_LINK_START_TIMEOUT_AOC                88
+	/* Time out for Electrical without AN/optical links = (2.2 * SBL_DFLT_DFE_TIMEOUT_AOC) to ensure a full overlap */
+#define SBL_LINK_DFLT_AN_RETRY_TIMEOUT             5
+#define SBL_LINK_DFLT_AN_MAX_RETRY                 5
+#define SBL_LINK_ALL_LANES                       0xf
+
+
+/**
+ * @brief Autoneg timeouts in ms
+ *
+ *   The link options SBL_OPT_AN_TIMEOUT_SSHOT
+ *   and  SBL_OPT_AN_TIMEOUT_IEEE are used to
+ *   select which set are used
+ *
+ *   TODO Check IEEE values
+ */
+#define SBL_LINK_AUTONEG_TIMEOUT_SSHOT_200         22000
+#define SBL_LINK_AUTONEG_TIMEOUT_SSHOT_100         10000
+#define SBL_LINK_AUTONEG_TIMEOUT_SSHOT_50           8000
+
+#define SBL_LINK_AUTONEG_TIMEOUT_IEEE_200           4000
+#define SBL_LINK_AUTONEG_TIMEOUT_IEEE_100           2250
+#define SBL_LINK_AUTONEG_TIMEOUT_IEEE_50            1125
+
+#define SBL_DFLT_PML_REC_TIMEOUT                       60  /* 60ms */
+#define SBL_DFLT_PML_REC_RL_MAX_DURATION               60  /* 60ms */
+#define SBL_DFLT_PML_REC_RL_WINDOW_SIZE              1000  /* 1000ms */
+
+/**
+ * @brief timing flags for s-bus operations
+ *
+ *   Delays are the time to pause before issuing first operation
+ *   and intervals are the time to wait between operations
+ *
+ *   Values less than 1ms will use a busy wait, values 1ms and greater
+ *   will sleep
+ */
+enum sbl_serdes_sbus_op_flag {
+	SBL_FLAG_DELAY_3US       =  1<<0,  /**< 3us delay */
+	SBL_FLAG_DELAY_4US       =  1<<1,  /**< 4us delay */
+	SBL_FLAG_DELAY_5US       =  1<<2,  /**< 5us delay */
+	SBL_FLAG_DELAY_10US      =  1<<3,  /**< 10U delay */
+	SBL_FLAG_DELAY_20US      =  1<<4,  /**< 20us delay */
+	SBL_FLAG_DELAY_50US      =  1<<5,  /**< 50 us delay */
+	SBL_FLAG_DELAY_100US     =  1<<6,  /**< 100us delay */
+	SBL_FLAG_INTERVAL_1MS    =  1<<7,  /**< 1ms interval */
+	SBL_FLAG_INTERVAL_10MS   =  1<<8,  /**< 10ms interval */
+	SBL_FLAG_INTERVAL_100MS  =  1<<9,  /**< 100ms interval */
+	SBL_FLAG_INTERVAL_1S     =  1<<10, /**< 1s interval */
+};
+
+#include "sbl_serdes_defaults.h"
+
+
+/**
+ * @brief instance attributes
+ */
+struct sbl_instance_attr {
+	__u32 magic;                           /**< = SBL_INSTANCE_ATTR_MAGIC */
+
+	char  inst_name[10];                   /**< instance name  */
+	char  eth_if_name[10];                 /**< interface name */
+
+	const char *sbm_fw_fname;              /**< sbus master fw file name */
+	const char *serdes_fw_fname;           /**< serdes fw file name */
+
+	__u32 rx_phase_slip_cnt;               /**< phase slip */
+
+	__u32 sbus_op_flags_slow;              /**< flags for sbus operations */
+	__u32 sbus_op_flags_fast;              /**< flags for sbus operations after sbus speed-up*/
+	__u32 sbus_op_timeout_ms;
+	__u32 sbus_int_timeout;                /**< Sbus interrupt timeout (s) */
+	__u32 sbus_int_poll_interval;          /**< Sbus interrupt polling interval (ms) */
+	__u32 serdes_op_flags;                 /**< flags for serdes operations */
+	__u32 serdes_op_timeout_ms;
+	__u32 serdes_en_timeout;               /* SerDes enable timeout (s) */
+	__u32 serdes_en_poll_interval;         /* SerDes enable done polling interval (ms) */
+	__u32 core_status_rd_timeout;          /* o_core_status read timeout (s) */
+	__u32 core_status_rd_poll_interval;    /* o_core_status read polling interval (ms) */
+};
+
+
+/**
+ * @brief Default static instance attributes initialiser
+ */
+#define SBL_INSTANCE_ATTR_INITIALIZER \
+	{ \
+		.magic = SBL_INSTANCE_ATTR_MAGIC, \
+		.sbm_fw_fname = SBL_FW_DEFAULT_SBM_FNAME, \
+		.serdes_fw_fname = SBL_FW_DEFAULT_SERDES_FNAME, \
+		.inst_name = {0}, \
+		.eth_if_name = {0}, \
+		.rx_phase_slip_cnt = SBL_DFLT_RX_PHASE_SLIP_CNT, \
+		.sbus_op_flags_slow = SBL_DFLT_SBUS_OP_FLAGS_SLOW, \
+		.sbus_op_flags_fast = SBL_DFLT_SBUS_OP_FLAGS_FAST, \
+		.sbus_op_timeout_ms = SBL_DFLT_SBUS_OP_TIMEOUT_MS, \
+		.sbus_int_timeout = SBL_DFLT_SBUS_INT_TIMEOUT, \
+		.sbus_int_poll_interval = SBL_DFLT_SBUS_INT_POLL_INTERVAL, \
+		.serdes_op_flags = SBL_DFLT_SERDES_OP_FLAGS, \
+		.serdes_op_timeout_ms = SBL_DFLT_SERDES_OP_TIMEOUT_MS, \
+		.serdes_en_timeout = SBL_DFLT_SERDES_EN_TIMEOUT, \
+		.serdes_en_poll_interval = SBL_DFLT_SERDES_EN_POLL_INTERVAL, \
+		.core_status_rd_timeout = SBL_DFLT_CORE_STATUS_RD_TIMEOUT, \
+		.core_status_rd_poll_interval = SBL_DFLT_CORE_STATUS_RD_POLL_INTERVAL, \
+	}
+
+/**
+ * @brief Default static instance attributes initialiser
+ */
+static inline void sbl_instance_attr_initializer(struct sbl_instance_attr *attr)
+{
+	attr->magic = SBL_INSTANCE_ATTR_MAGIC;
+	attr->sbm_fw_fname = SBL_FW_DEFAULT_SBM_FNAME;
+	attr->serdes_fw_fname = SBL_FW_DEFAULT_SERDES_FNAME;
+	attr->rx_phase_slip_cnt = SBL_DFLT_RX_PHASE_SLIP_CNT;
+	attr->sbus_op_flags_slow = SBL_DFLT_SBUS_OP_FLAGS_SLOW;
+	attr->sbus_op_flags_fast = SBL_DFLT_SBUS_OP_FLAGS_FAST;
+	attr->sbus_op_timeout_ms = SBL_DFLT_SBUS_OP_TIMEOUT_MS;
+	attr->sbus_int_timeout = SBL_DFLT_SBUS_INT_TIMEOUT;
+	attr->sbus_int_poll_interval = SBL_DFLT_SBUS_INT_POLL_INTERVAL;
+	attr->serdes_op_flags = SBL_DFLT_SERDES_OP_FLAGS;
+	attr->serdes_op_timeout_ms = SBL_DFLT_SERDES_OP_TIMEOUT_MS;
+	attr->serdes_en_timeout = SBL_DFLT_SERDES_EN_TIMEOUT;
+	attr->serdes_en_poll_interval = SBL_DFLT_SERDES_EN_POLL_INTERVAL;
+	attr->core_status_rd_timeout = SBL_DFLT_CORE_STATUS_RD_TIMEOUT;
+	attr->core_status_rd_poll_interval = SBL_DFLT_CORE_STATUS_RD_POLL_INTERVAL;
+}
+
+
+/**
+ * @brief The physical type of the link media
+ */
+enum sbl_link_media {
+	SBL_LINK_MEDIA_INVALID = 0,
+	SBL_LINK_MEDIA_UNKNOWN,
+	SBL_LINK_MEDIA_ELECTRICAL,  /**< physical wires */
+	SBL_LINK_MEDIA_OPTICAL,     /**< optical fiber  */
+};
+
+
+/**
+ * @brief The physical type of the link media with digital/analog
+ */
+enum sbl_link_media_extended {
+	SBL_EXT_LINK_MEDIA_ELECTRICAL      = 1<<0, /**< physical wires        */
+	SBL_EXT_LINK_MEDIA_OPTICAL_ANALOG  = 1<<1, /**< analog optical fiber  */
+	SBL_EXT_LINK_MEDIA_OPTICAL_DIGITAL = 1<<2, /**< digital optical fiber */
+	SBL_EXT_LINK_MEDIA_ELECTRICAL_ACT  = 1<<3, /**< active electrical     */
+};
+
+
+/**
+ * @brief The cable vendor
+ */
+enum sbl_link_vendor {
+	SBL_LINK_VENDOR_INVALID        = 0,
+	SBL_LINK_VENDOR_TE             = 1<<0,
+	SBL_LINK_VENDOR_LEONI          = 1<<1,
+	SBL_LINK_VENDOR_MOLEX          = 1<<2,
+	SBL_LINK_VENDOR_HISENSE        = 1<<3,
+	SBL_LINK_VENDOR_DUST_PHOTONICS = 1<<4,
+	SBL_LINK_VENDOR_FINISAR        = 1<<5,
+	SBL_LINK_VENDOR_LUXSHARE       = 1<<6,
+	SBL_LINK_VENDOR_FIT            = 1<<7,
+	SBL_LINK_VENDOR_FT             = 1<<8,
+	SBL_LINK_VENDOR_MELLANOX       = 1<<9,
+	SBL_LINK_VENDOR_HITACHI        = 1<<10,
+	SBL_LINK_VENDOR_HPE            = 1<<11,
+	SBL_LINK_VENDOR_CLOUD_LIGHT    = 1<<12,
+	SBL_LINK_VENDOR_AMPHENOL       = 1<<13,
+};
+
+
+/**
+ * @brief Cable length indicator
+ */
+/* Remember to update validation function */
+enum sbl_link_len {
+	SBL_LINK_LEN_INVALID   = 0,
+	SBL_LINK_LEN_BACKPLANE = 1ULL << 0,
+	SBL_LINK_LEN_000_300   = 1ULL << 1,
+	SBL_LINK_LEN_000_400   = 1ULL << 2,
+	SBL_LINK_LEN_000_750   = 1ULL << 3,
+	SBL_LINK_LEN_000_800   = 1ULL << 4,
+	SBL_LINK_LEN_001_000   = 1ULL << 5,
+	SBL_LINK_LEN_001_100   = 1ULL << 6,
+	SBL_LINK_LEN_001_150   = 1ULL << 7,
+	SBL_LINK_LEN_001_200   = 1ULL << 8,
+	SBL_LINK_LEN_001_400   = 1ULL << 9,
+	SBL_LINK_LEN_001_420   = 1ULL << 10,
+	SBL_LINK_LEN_001_500   = 1ULL << 11,
+	SBL_LINK_LEN_001_600   = 1ULL << 12,
+	SBL_LINK_LEN_001_640   = 1ULL << 13,
+	SBL_LINK_LEN_001_700   = 1ULL << 14,
+	SBL_LINK_LEN_001_800   = 1ULL << 15,
+	SBL_LINK_LEN_001_900   = 1ULL << 16,
+	SBL_LINK_LEN_001_910   = 1ULL << 17,
+	SBL_LINK_LEN_002_000   = 1ULL << 18,
+	SBL_LINK_LEN_002_100   = 1ULL << 19,
+	SBL_LINK_LEN_002_130   = 1ULL << 20,
+	SBL_LINK_LEN_002_200   = 1ULL << 21,
+	SBL_LINK_LEN_002_300   = 1ULL << 22,
+	SBL_LINK_LEN_002_390   = 1ULL << 23,
+	SBL_LINK_LEN_002_400   = 1ULL << 24,
+	SBL_LINK_LEN_002_500   = 1ULL << 25,
+	SBL_LINK_LEN_002_600   = 1ULL << 26,
+	SBL_LINK_LEN_002_620   = 1ULL << 27,
+	SBL_LINK_LEN_002_700   = 1ULL << 28,
+	SBL_LINK_LEN_002_800   = 1ULL << 29,
+	SBL_LINK_LEN_002_900   = 1ULL << 30,
+	SBL_LINK_LEN_002_990   = 1ULL << 31,
+	SBL_LINK_LEN_003_000   = 1ULL << 32,
+	SBL_LINK_LEN_004_000   = 1ULL << 33,
+	SBL_LINK_LEN_005_000   = 1ULL << 34,
+	SBL_LINK_LEN_006_000   = 1ULL << 35,
+	SBL_LINK_LEN_007_000   = 1ULL << 36,
+	SBL_LINK_LEN_008_000   = 1ULL << 37,
+	SBL_LINK_LEN_010_000   = 1ULL << 38,
+	SBL_LINK_LEN_014_000   = 1ULL << 39,
+	SBL_LINK_LEN_015_000   = 1ULL << 40,
+	SBL_LINK_LEN_019_000   = 1ULL << 41,
+	SBL_LINK_LEN_025_000   = 1ULL << 42,
+	SBL_LINK_LEN_030_000   = 1ULL << 43,
+	SBL_LINK_LEN_035_000   = 1ULL << 44,
+	SBL_LINK_LEN_050_000   = 1ULL << 45,
+	SBL_LINK_LEN_075_000   = 1ULL << 46,
+	SBL_LINK_LEN_100_000   = 1ULL << 47,
+};
+
+
+/**
+ * @brief Attributes describing the media configuration
+ *
+ */
+struct sbl_media_attr {
+	__u32 magic;
+	__u32 media;   /**< The link media type */
+	__u64 len;     /**< Cable length */
+	__u32 info;    /**< Additional information flags */
+	__u32 vendor;  /**< Cable vendor info */
+};
+
+
+/**
+ * @brief static media attributes initialiser
+ *
+ */
+#define SBL_MEDIA_ATTR_INITIALIZER   \
+	{ \
+		.magic  = SBL_MEDIA_ATTR_MAGIC, \
+		.media  = SBL_LINK_MEDIA_INVALID, \
+		.len    = SBL_LINK_LEN_INVALID, \
+		.info   = 0, \
+		.vendor = SBL_LINK_VENDOR_INVALID, \
+	}
+
+
+/**
+ * @brief dynamic media attributes initialiser
+ *
+ */
+static inline void sbl_media_attr_initializer(struct sbl_media_attr *attr)
+{
+	attr->magic  = SBL_MEDIA_ATTR_MAGIC;
+	attr->media  = SBL_LINK_MEDIA_INVALID;
+	attr->len    = SBL_LINK_LEN_INVALID;
+	attr->info   = 0;
+	attr->vendor = SBL_LINK_VENDOR_INVALID;
+}
+
+
+/**
+ * @brief media attributes flags
+ *
+ */
+enum sbl_media_attr_info_flags {
+	SBL_MEDIA_INFO_SUPPORTS_BS_200G         = 1<<0,  /**< Media supports SBL_LINK_MODE_BS_200G */
+	SBL_MEDIA_INFO_SUPPORTS_BJ_100G         = 1<<1,  /**< Media supports SBL_LINK_MODE_BJ_100G */
+	SBL_MEDIA_INFO_SUPPORTS_CD_100G         = 1<<2,  /**< Media supports SBL_LINK_MODE_CD_100G */
+	SBL_MEDIA_INFO_SUPPORTS_CD_50G          = 1<<3,  /**< Media supports SBL_LINK_MODE_CD_50G  */
+	SBL_MEDIA_INFO_ANALOG                   = 1<<4,  /**< Media is analog                      */
+	SBL_MEDIA_INFO_DIGITAL                  = 1<<5,  /**< Media is digital                     */
+	SBL_MEDIA_INFO_SUPPORTS_HEADSHELL_RESET = 1<<6,  /**< Media supports headshell reset       */
+	SBL_MEDIA_INFO_SUPPORTS_BS_400G         = 1<<7,  /**< Media supports SBL_LINK_MODE_BS_400G */
+};
+
+
+/**
+ * @brief IEEE modes for a link
+ */
+enum sbl_link_mode {
+	SBL_LINK_MODE_INVALID = 0,
+	SBL_LINK_MODE_BS_200G = 1<<0, /**< 4 lanes of 50Gbps PAM-4 */
+	SBL_LINK_MODE_BJ_100G = 1<<1, /**< 4 lanes of 25Gbps NRZ   */
+	SBL_LINK_MODE_CD_100G = 1<<2, /**< 2 lanes of 50Gbps PAM-4 */
+	SBL_LINK_MODE_CD_50G  = 1<<3, /**< 1 lane of 50Gbps PAM-4  */
+};
+
+
+/**
+ * @brief AN modes for a link
+ */
+enum sbl_an_mode {
+	SBL_AN_MODE_INVALID = 0,
+	SBL_AN_MODE_UNKNOWN,
+	SBL_AN_MODE_OFF,         /**< AN off, use link_mode */
+	SBL_AN_MODE_ON,          /**< AN to highest common speed */
+	SBL_AN_MODE_FIXED,       /**< AN to fixed speed set in link_mode */
+};
+
+
+/**
+ * @brief option flags
+ */
+enum sbl_options_flags {
+	SBL_OPT_FABRIC_LINK                = 1<<1,  /**< assert link is a fabric link */
+	SBL_OPT_SERDES_LPD                 = 1<<2,  /**< use the serdes to detect the link partner */
+	SBL_OPT_DFE_SAVE_PARAMS            = 1<<3,  /**< Save current tuning params after tuning */
+	SBL_OPT_USE_SAVED_PARAMS           = 1<<4,  /**< Load saved tuning params before tuning */
+	SBL_OPT_RESET_CLEAR_PARAMS         = 1<<5,  /**< Clear any saved tuning params during reset */
+	SBL_OPT_ENABLE_PCAL                = 1<<6,  /**< Enable periodic retuning */
+	SBL_OPT_DFE_ALWAYS_MAX_EFFORT      = 1<<7,  /**< Always tune with full effort */
+	SBL_OPT_DFE_ALWAYS_MED_EFFORT      = 1<<8,  /**< Always tune with medium effort */
+	SBL_OPT_DFE_ALWAYS_MIN_EFFORT      = 1<<9,  /**< Always tune with low effort */
+	SBL_OPT_AUTONEG_TIMEOUT_IEEE       = 1<<10, /**< Use IEEE timeout for autoneg link up */
+	SBL_OPT_AUTONEG_TIMEOUT_SSHOT      = 1<<11, /**< Use Slingshot timeout for autoneg link up */
+	SBL_OPT_AUTONEG_100CR4_FIXUP       = 1<<12, /**< Add cr4 capability to lp's an tec abilities */
+	SBL_OPT_RELOAD_FW_ON_TIMEOUT       = 1<<13, /**< Reload serdes fw on tune/minitune timeouts */
+	SBL_OPT_ALLOW_MEDIA_BAD_MODE       = 1<<14, /**< Mode not supported by media is non-fatal */
+	SBL_OPT_ALLOW_MEDIA_BAD_LEN        = 1<<15, /**< Unrecognised media len is non-fatal */
+	SBL_OPT_ENABLE_ETHER_LLR           = 1<<16, /**< enable LLR if detected */
+	SBL_OPT_ENABLE_IFG_HPC_WITH_LLR    = 1<<17, /**< enable HPC with LLR when detected*/
+	SBL_OPT_ENABLE_IFG_CONFIG          = 1<<18, /**< enable use of ifg config */
+	SBL_OPT_DISABLE_AN_LLR             = 1<<19, /**< disable AN LLR detect */
+	SBL_OPT_LANE_DEGRADE               = 1<<20, /**< enable auto lane degrade */
+	SBL_DISABLE_PML_RECOVERY           = 1<<21, /**< disable pml recovery */
+};
+
+
+/**
+ * @brief The loopback mode
+ *
+ */
+enum sbl_loopback_mode {
+	SBL_LOOPBACK_MODE_INVALID = 0,
+	SBL_LOOPBACK_MODE_LOCAL   = 1<<0, /**< Loopback in local serdes                           */
+	SBL_LOOPBACK_MODE_REMOTE  = 1<<1, /**< Loopback in remote serdes (not currently possible) */
+	SBL_LOOPBACK_MODE_OFF     = 1<<2, /**< No loopback                                        */
+};
+
+
+/**
+ * @brief Link partner
+ */
+enum sbl_link_partner {
+	SBL_LINK_PARTNER_INVALID = 0,
+	SBL_LINK_PARTNER_SWITCH  = 1<<0, /**< Switch port */
+	SBL_LINK_PARTNER_NIC     = 1<<1, /**< Edge port   */
+	SBL_LINK_PARTNER_NIC_C2  = 1<<2, /**< Cassini2 Edge port   */
+};
+
+
+/**
+ * @brief Tuning pattern
+ */
+enum sbl_tuning_pattern {
+	SBL_TUNING_PATTERN_INVALID = 0,
+	SBL_TUNING_PATTERN_CORE    = 1<<0, /**< Tune off core data        */
+	SBL_TUNING_PATTERN_PRBS    = 1<<1, /**< Tune off a PRBS13 pattern */
+};
+
+
+/**
+ * @brief Precoding config
+ */
+enum sbl_precoding_config {
+	SBL_PRECODING_INVALID = 0,
+	SBL_PRECODING_UNKNOWN,
+	SBL_PRECODING_DEFAULT,    /**< On for fabric links, Off for Ethernet links */
+	SBL_PRECODING_ON,         /**< Always on */
+	SBL_PRECODING_OFF,        /**< Always off */
+};
+
+
+/**
+ * @brief The status of a link SerDes
+ *
+ */
+enum sbl_serdes_status {
+	SBL_SERDES_STATUS_UNKNOWN    = 0,
+	SBL_SERDES_STATUS_AUTONEG    = 1<<0,  /**< SerDes in autoneg mode */
+	SBL_SERDES_STATUS_LPD_MT     = 1<<1,  /**< SerDes detecting the link partner by minitune */
+	SBL_SERDES_STATUS_DOWN       = 1<<2,  /**< SerDes down  */
+	SBL_SERDES_STATUS_TUNING     = 1<<3,  /**< SerDes is tuning  */
+	SBL_SERDES_STATUS_RUNNING    = 1<<4,  /**< SerDes running */
+	SBL_SERDES_STATUS_ERROR      = 1<<5,  /**< SerDes has an error */
+	SBL_SERDES_STATUS_RESETTING  = 1<<6,  /**< SerDes is resetting */
+};
+
+
+/**
+ * @brief The status of a link SerDes
+ *
+ */
+enum sbl_fw_status {
+	SBL_FW_STATUS_UNKNOWN            = 0,
+	SBL_FW_STATUS_NOT_FLASHED        = 1<<0,  /**< Not flashed  */
+	SBL_FW_STATUS_FLASHED            = 1<<1,  /**< SBM and SerDes flashed */
+	SBL_FW_STATUS_ERROR              = 1<<2,  /**< Flash error */
+};
+
+
+/**
+ * @brief FEC (Reed-Solomon) mode
+ */
+enum sbl_rs_mode {
+	SBL_RS_MODE_INVALID = 0,
+	SBL_RS_MODE_UNKNOWN,
+	SBL_RS_MODE_OFF,            /**< error correction OFF error checking OFF syndrome checking OFF marking OFF */
+	SBL_RS_MODE_OFF_SYN,        /**< error correction OFF error checking OFF syndrome checking  ON marking OFF */
+	SBL_RS_MODE_OFF_CHK,        /**< error correction OFF error checking  ON syndrome checking OFF marking OFF */
+	SBL_RS_MODE_ON,             /**< error correction  ON error checking  ON syndrome checking OFF marking OFF */
+	SBL_RS_MODE_ON_SYN_MRK,     /**< error correction  ON error checking OFF syndrome checking  ON marking  ON */
+	SBL_RS_MODE_ON_CHK_SYN_MRK, /**< error correction  ON error checking  ON syndrome checking  ON marking  ON */
+};
+
+
+/**
+ * @brief IFG config
+ */
+enum sbl_ifg_config {
+	SBL_IFG_CONFIG_INVALID = 0,
+	SBL_IFG_CONFIG_UNKNOWN,
+	SBL_IFG_CONFIG_HPC,          /**< mode hpc,  adj ignored */
+	SBL_IFG_CONFIG_IEEE_200G,    /**< mode ieee, adj 200     */
+	SBL_IFG_CONFIG_IEEE_100G,    /**< mode ieee, adj 100     */
+	SBL_IFG_CONFIG_IEEE_50G,     /**< mode ieee, adj 50      */
+};
+
+
+/**
+ * @brief link-level retry (LLR) mode
+ */
+enum sbl_llr_mode {
+	SBL_LLR_MODE_INVALID = 0,
+	SBL_LLR_MODE_UNKNOWN,
+	SBL_LLR_MODE_OFF,          /**< No Retry */
+	SBL_LLR_MODE_MONITOR,      /**< Monitor but don't retry */
+	SBL_LLR_MODE_ON,           /**< Retry  */
+	SBL_LLR_MODE_AUTO,         /**< try LLR */
+};
+
+
+/**
+ * @brief LLR link down behaviour
+ *
+ *  @note Fabric link must be set to SBL_LLR_LINK_DOWN_BLOCK
+ *
+ */
+enum sbl_llr_down_behaviour {
+	SBL_LLR_LINK_DOWN_INVALID = 0,
+	SBL_LLR_LINK_DOWN_UNKNOWN,
+	SBL_LLR_LINK_DOWN_DISCARD,      /**< Discard frame */
+	SBL_LLR_LINK_DOWN_BLOCK,        /**< Block waiting for link up */
+	SBL_LLR_LINK_DOWN_BEST_EFFORT,  /**< <b>Do not use</b> For Debug  */
+};
+
+
+/**
+ * @brief Other LLR settings
+ */
+#define SBL_LLR_REPLAY_CT_MAX_UNLIMITED                                0xFFULL
+#define SBL_DFLT_REPLAY_CT_MAX                                         0xFEULL  /* max - 1 */
+
+/**
+ * @brief Attributes for link configuration
+ *
+ *   These attributes must be configured for a link.
+ *   Different setting will be required for fabric or Ethernet links
+ *
+ */
+struct sbl_base_link_attr {
+	__u32 magic;
+
+	/* option flags */
+	__u32 options;                   /**< misc config options */
+
+	/* bringup */
+	__u32 start_timeout;             /**< timeout for base_link_start (s) */
+
+	/* electrical or optical exclusive configuration */
+	__u32 config_target;             /**< PEC or AOC valid */
+	union {
+		struct {
+			/* auto negotiation */
+			__u32 an_mode;                 /**< Requested autonegotiate mode */
+			__u32 an_retry_timeout;        /**< Timeout for an AN attempt to complete before retrying (s) */
+			__u32 an_max_retry;            /**< Max number of retries before failing */
+		} pec;
+		struct {
+			/* optical transceiver locking delay */
+			__u32 optical_lock_delay;      /**< time to wait for lock (ms) */
+			__u32 optical_lock_interval;   /**< wakeup interval (ms) */
+			__u32 reserved;                /**< unused */
+		} aoc;
+	};
+
+	/* link partner detection */
+	__u32 lpd_timeout;               /**< timeout for a lp detection attempt to complete before retrying (s) */
+	__u32 lpd_poll_interval;         /**< lp detection polling interval (ms) */
+
+	/* requested config */
+	__u32 link_mode;                 /**< Requested link speed mode */
+	__u32 loopback_mode;             /**< Requested Loopback mode */
+	__u32 link_partner;              /**< NIC or SWITCH link partner */
+	__u32 tuning_pattern;            /**< PRBS or CORE tuning pattern */
+	__u32 precoding;                 /**< Precoding configuration */
+
+	/* serdes attributes */
+	__u32 dfe_pre_delay;             /**< Delay before starting DFE tune (s) */
+	__u32 dfe_timeout;               /**< DFE tune wait time (ms) */
+	__u32 dfe_poll_interval;         /**< DFE tune done polling interval (ms) */
+	__u32 pcal_eyecheck_holdoff;     /**< period to ignore eye heights after pcal starts (ms) */
+	__u32 nrz_min_eye_height;        /**< Min eye height criteria for electrical cables with nrz */
+	__u32 nrz_max_eye_height;        /**< Max eye height criteria for electrical cables with nrz */
+	__u32 pam4_min_eye_height;       /**< Min eye height criteria for optical cables with pam4  */
+	__u32 pam4_max_eye_height;       /**< Max eye height criteria for optical cables with pam4 */
+
+	/* pml block attributes */
+	__u32 fec_mode;                  /**< FEC (RS) mode */
+	__u32 enable_autodegrade;        /**< Enable automatic link degrade handling */
+	__u32 llr_mode;                  /**< Link-level retry (LLR) mode */
+	__u32 ifg_config;                /**< Inter-frame gap (IFG) config */
+
+	struct {
+		__u32 timeout;           /**< PML recovery timeout */
+		__u32 rl_max_duration;   /**< Rate limiter recovery time per window */
+		__u32 rl_window_size;    /**< Rate limiter window size */
+	} pml_recovery;
+};
+
+
+/**
+ * @brief PEC or AOC configured
+ */
+enum sbl_base_link_config_target {
+	SBL_BASE_LINK_CONFIG_INVALID   = 0,
+	SBL_BASE_LINK_CONFIG_UNKNOWN,
+	SBL_BASE_LINK_CONFIG_PEC,
+	SBL_BASE_LINK_CONFIG_AOC,
+	SBL_BASE_LINK_CONFIG_AEC,
+};
+
+
+/**
+ * @brief The status of a base link
+ *
+ */
+enum sbl_base_link_status {
+	SBL_BASE_LINK_STATUS_UNKNOWN          = 0,
+	SBL_BASE_LINK_STATUS_UNCONFIGURED     = 1<<0,  /**< Base link is not configured */
+	SBL_BASE_LINK_STATUS_STARTING         = 1<<1,  /**< Base link bring-up in progress */
+	SBL_BASE_LINK_STATUS_UP               = 1<<2,  /**< Base link Up */
+	SBL_BASE_LINK_STATUS_STOPPING         = 1<<3,  /**< Base link bring-down in progress */
+	SBL_BASE_LINK_STATUS_DOWN             = 1<<4,  /**< Base link Down */
+	SBL_BASE_LINK_STATUS_RESETTING        = 1<<5,  /**< Base link reset in progress */
+	SBL_BASE_LINK_STATUS_ERROR            = 1<<6,  /**< Base link has an error */
+};
+
+
+/**
+ * @brief Debug options
+ *
+ */
+enum sbl_debug_options {
+	SBL_DEBUG_ALL_OPTS                = 0xffffffff,  /**< all flags  */
+
+	SBL_DEBUG_TRACE_LINK_DOWN         = (1<<0),      /**< report link down - generally too verbose*/
+	SBL_DEBUG_IGNORE_HISER            = (1<<1),      /**< make hiser errors a warning */
+	SBL_DEBUG_INHIBIT_CLEANUP         = (1<<2),      /**< do not cleanup after start fail */
+	SBL_DEBUG_INHIBIT_SPLL_RESET      = (1<<3),      /**< do not reset serdes PLLs after tuning failure */
+
+	SBL_DEBUG_BAD_PARAM_1             = (1<<4),      /**< allow one bad tuning param */
+	SBL_DEBUG_BAD_PARAM_2             = (1<<5),      /**< allow two bad tuning params */
+	SBL_DEBUG_INHIBIT_RELOAD_FW       = (1<<6),      /**< stop serdes fw reload on startup failure */
+	SBL_DEBUG_FORCE_RELOAD_FW         = (1<<7),      /**< force serdes fw to reload on startup failure */
+
+	SBL_DEBUG_FORCE_MAX_EFFORT        = (1<<8),      /**< force maximum effort tuning */
+	SBL_DEBUG_FORCE_MED_EFFORT        = (1<<9),      /**< force_medium effort tuning */
+	SBL_DEBUG_FORCE_MIN_EFFORT        = (1<<10),     /**< force_minium effort tuning */
+	SBL_DEBUG_INHIBIT_USE_SAVED_TP    = (1<<11),     /**< do not use saved tuning params */
+
+	SBL_DEBUG_FORCE_PRECODING_ON      = (1<<12),     /**< Force serdes precoding on */
+	SBL_DEBUG_FORCE_PRECODING_OFF     = (1<<13),     /**< Force serdes precoding off */
+	SBL_DEBUG_ALLOW_MEDIA_BAD_MODE    = (1<<14),     /**< Mode not supported by media not error */
+	SBL_DEBUG_ALLOW_MEDIA_BAD_LEN     = (1<<15),     /**< Unrecognised media length not error */
+
+	SBL_DEBUG_INHIBIT_PCAL            = (1<<16),     /**< do not start PCAL */
+	SBL_DEBUG_INHIBIT_RELOAD_SBM_FW   = (1<<17),     /**< stop sbus master fw reload on serdes fw reload failure */
+	SBL_DEBUG_FORCE_RELOAD_SBM_FW     = (1<<18),     /**< force sbus master fw reload on serdes fw reload failure */
+	SBL_DEBUG_DISABLE_AN_NEXT_PAGES   = (1<<19),     /**< disable next pages during auto negotiation */
+
+	SBL_DEBUG_KEEP_SERDES_UP          = (1<<20),     /**< keep serdes up when link is going down */
+	SBL_DEBUG_SERDES_MAP_DELAY        = (1<<21),     /**< add delay before checking serdes eye heights */
+	SBL_DEBUG_FORCE_RELOAD_SERDES_FW  = (1<<22),     /**< force serdes fw reload during link reset */
+	SBL_DEBUG_ALLOW_LOOP_TIME_FAIL    = (1<<23),     /**< fail loop time measurement */
+
+	SBL_DEBUG_IGNORE_ALIGN            = (1<<24),     /**< ignore alignment interrupt */
+	SBL_DEBUG_TRACE_PML_INT           = (1<<25),     /**< enable pml interrupt output */
+	SBL_DEBUG_REMOTE_FAULT_RECOVERY   = (1<<26),     /**< enable pml recovery for remote faults */
+	SBL_DEBUG_IGNORE_HIGH_FEC_UCW     = (1<<27),     /**< enable FEC UCW debug */
+
+	SBL_DEBUG_DEV0                    = (1<<28),     /**< for development - no fixed use */
+	SBL_DEBUG_IGNORE_HIGH_FEC_TXR     = (1<<29),     /**< enable FEC TXR debug */
+	SBL_DEBUG_IGNORE_HIGH_FEC_CCW     = (1<<30),     /**< enable FEC CCW debug */
+	SBL_DEBUG_TEST                    = (1<<31),     /**< for testing the debug system  */
+};
+
+
+#endif  /* _SBL_UAPI_BASE_LINK_H_ */
diff --git a/include/uapi/ethernet/sbl_cassini.h b/include/uapi/ethernet/sbl_cassini.h
new file mode 100644
index 000000000000..e8b0bf6811dc
--- /dev/null
+++ b/include/uapi/ethernet/sbl_cassini.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+/* Copyright 2020 Hewlett Packard Enterprise Development LP */
+#ifndef _CASSINI_SBL_UAPI_H_
+#define _CASSINI_SBL_UAPI_H_
+
+/**
+ * @brief Cassini platform options provided by the microcontroller
+ *
+ */
+enum cass_uc_platform {
+	SBL_UC_PLATFORM_UNDEFINED = 0,
+	SBL_UC_PLATFORM_UNKNOWN,
+	SBL_UC_PLATFORM_SAWTOOTH,
+	SBL_UC_PLATFORM_BRAZOS,
+	SBL_UC_PLATFORM_WASHINGTON,
+	SBL_UC_PLATFORM_KENNEBEC,
+	SBL_UC_PLATFORM_PANGANI,
+};
+
+#endif  /* _CASSINI_SBL_UAPI_H_ */
diff --git a/include/uapi/ethernet/sbl_counters.h b/include/uapi/ethernet/sbl_counters.h
new file mode 100644
index 000000000000..4a8d9d178ffc
--- /dev/null
+++ b/include/uapi/ethernet/sbl_counters.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+/* Copyright 2019, 2022 Hewlett Packard Enterprise Development LP */
+
+#ifndef _SBL_UAPI_COUNTERS_H_
+#define _SBL_UAPI_COUNTERS_H_
+
+#define SBL_NUM_COUNTERS SBL_LINK_NUM_COUNTERS
+#define SBL_COUNTERS SBL_LINK_COUNTERS
+#define SBL_COUNTERS_NAME SBL_LINK_COUNTERS_NAME
+#define SBL_COUNTERS_FIRST sbl_serdes0_fw_reload
+#define SBL_PML_REC_HISTOGRAM_MAX 120
+
+/* Used in enum as well*/
+#define SBL_LINK_COUNTERS sbl_serdes0_fw_reload,   \
+	sbl_serdes1_fw_reload,   \
+	sbl_serdes2_fw_reload,   \
+	sbl_serdes3_fw_reload,   \
+	sbl_serdes0_spico_reset, \
+	sbl_serdes1_spico_reset, \
+	sbl_serdes2_spico_reset, \
+	sbl_serdes3_spico_reset, \
+	sbl_serdes0_pll_reset,   \
+	sbl_serdes1_pll_reset,   \
+	sbl_serdes2_pll_reset,   \
+	sbl_serdes3_pll_reset,   \
+	sbl_serdes_fw_reload_skip,  \
+	sbl_pml_recovery_attempts,  \
+	sbl_pml_recovery_successes, \
+	sbl_pml_recovery_origin_bl_ldown,  \
+	sbl_pml_recovery_origin_bl_lfault, \
+	sbl_pml_recovery_origin_bl_rfault, \
+	sbl_pml_recovery_origin_bl_align,  \
+	sbl_pml_recovery_origin_bl_hiser,  \
+	sbl_pml_recovery_origin_bl_llr,    \
+	sbl_pml_recovery_histogram_0_9ms,   \
+	sbl_pml_recovery_histogram_10_19ms, \
+	sbl_pml_recovery_histogram_20_29ms, \
+	sbl_pml_recovery_histogram_30_39ms, \
+	sbl_pml_recovery_histogram_40_49ms, \
+	sbl_pml_recovery_histogram_50_59ms, \
+	sbl_pml_recovery_histogram_60_69ms, \
+	sbl_pml_recovery_histogram_70_79ms, \
+	sbl_pml_recovery_histogram_80_89ms, \
+	sbl_pml_recovery_histogram_90_99ms, \
+	sbl_pml_recovery_histogram_100_109ms, \
+	sbl_pml_recovery_histogram_110_119ms, \
+	sbl_pml_recovery_histogram_high,	\
+	sbl_pml_recovery_rate_exceeded,	\
+	sbl_fec_ucw_err,	\
+	sbl_fec_ccw_err,	\
+	sbl_fec_txr_err,	\
+	sbl_fec_warn,		\
+	sbl_fec_up_fail
+
+#define SBL_LINK_COUNTERS_NAME "sbl_serdes0_fw_reload",   \
+	"sbl_serdes1_fw_reload",   \
+	"sbl_serdes2_fw_reload",   \
+	"sbl_serdes3_fw_reload",   \
+	"sbl_serdes0_spico_reset", \
+	"sbl_serdes1_spico_reset", \
+	"sbl_serdes2_spico_reset", \
+	"sbl_serdes3_spico_reset", \
+	"sbl_serdes0_pll_reset",   \
+	"sbl_serdes1_pll_reset",   \
+	"sbl_serdes2_pll_reset",   \
+	"sbl_serdes3_pll_reset",   \
+	"sbl_serdes_fw_reload_skip",  \
+	"sbl_pml_recovery_attempts",  \
+	"sbl_pml_recovery_successes", \
+	"sbl_pml_recovery_origin_bl_ldown",  \
+	"sbl_pml_recovery_origin_bl_lfault", \
+	"sbl_pml_recovery_origin_bl_rfault", \
+	"sbl_pml_recovery_origin_bl_align",  \
+	"sbl_pml_recovery_origin_bl_hiser",  \
+	"sbl_pml_recovery_origin_bl_llr",	 \
+	"sbl_pml_recovery_histogram_0_9ms",	 \
+	"sbl_pml_recovery_histogram_10_19ms", \
+	"sbl_pml_recovery_histogram_20_29ms", \
+	"sbl_pml_recovery_histogram_30_39ms", \
+	"sbl_pml_recovery_histogram_40_49ms", \
+	"sbl_pml_recovery_histogram_50_59ms", \
+	"sbl_pml_recovery_histogram_60_69ms", \
+	"sbl_pml_recovery_histogram_70_79ms", \
+	"sbl_pml_recovery_histogram_80_89ms", \
+	"sbl_pml_recovery_histogram_90_99ms", \
+	"sbl_pml_recovery_histogram_100_109ms", \
+	"sbl_pml_recovery_histogram_110_119ms", \
+	"sbl_pml_recovery_histogram_high",	   \
+	"sbl_pml_recovery_rate_exceeded",	   \
+	"sbl_fec_ucw_err",		\
+	"sbl_fec_ccw_err",		\
+	"sbl_fec_txr_err",		\
+	"sbl_fec_warn",			\
+	"sbl_fec_up_fail"
+
+/**
+ * @brief SBL link level counter indexes
+ *
+ */
+
+enum sbl_link_counters_idx {
+
+	serdes0_fw_reload = 0,		/**< serdes 0 firmware reload count */
+	serdes1_fw_reload,		/**< serdes 1 firmware reload count */
+	serdes2_fw_reload,		/**< serdes 2 firmware reload count */
+	serdes3_fw_reload,		/**< serdes 3 firmware reload count */
+
+	serdes0_spico_reset,		/**< serdes 0 spico reset count */
+	serdes1_spico_reset,		/**< serdes 1 spico reset count */
+	serdes2_spico_reset,		/**< serdes 2 spico reset count */
+	serdes3_spico_reset,		/**< serdes 3 spico reset count */
+
+	serdes0_pll_reset,		/**< serdes 0 pll reset count */
+	serdes1_pll_reset,		/**< serdes 1 pll reset count */
+	serdes2_pll_reset,		/**< serdes 2 pll reset count */
+	serdes3_pll_reset,		/**< serdes 3 pll reset count */
+
+	serdes_fw_reload_skip,		/**< serdes fw reloads skipped count */
+
+	pml_recovery_attempts,			/**< pml recovery attempts */
+	pml_recovery_successes,			/**< pml recovery successes */
+	pml_recovery_origin_bl_ldown,		/**< pml recovery count for link down */
+	pml_recovery_origin_bl_lfault,		/**< pml recovery count for local fault */
+	pml_recovery_origin_bl_rfault,		/**< pml recovery count for remote fault */
+	pml_recovery_origin_bl_align,		/**< pml recovery count for align fault */
+	pml_recovery_origin_bl_hiser,		/**< pml recovery count for hiser */
+	pml_recovery_origin_bl_llr,		/**< pml recovery count for max llr replay */
+	pml_recovery_histogram_0_9ms,		/**< pml recovery time 0-9 ms */
+	pml_recovery_histogram_10_19ms,		/**< pml recovery time 10-19 ms */
+	pml_recovery_histogram_20_29ms,		/**< pml recovery time 20-29 ms */
+	pml_recovery_histogram_30_39ms,		/**< pml recovery time 30-39 ms */
+	pml_recovery_histogram_40_49ms,		/**< pml recovery time 40-49 ms */
+	pml_recovery_histogram_50_59ms,		/**< pml recovery time 50-59 ms */
+	pml_recovery_histogram_60_69ms,		/**< pml recovery time 60-69 ms */
+	pml_recovery_histogram_70_79ms,		/**< pml recovery time 70-79 ms */
+	pml_recovery_histogram_80_89ms,		/**< pml recovery time 80-89 ms */
+	pml_recovery_histogram_90_99ms,		/**< pml recovery time 90-99 ms */
+	pml_recovery_histogram_100_109ms,	/**< pml recovery time 100-109 ms */
+	pml_recovery_histogram_110_119ms,	/**< pml recovery time 110-119 ms */
+	pml_recovery_histogram_high,		/**< pml recovery time 120+ ms (SBL_PML_REC_HISTOGRAM_MAX) */
+	pml_recovery_rate_exceeded,		/**< pml recovery rate limit exceeded */
+	fec_ucw_err,		/** fec ucw bad */
+	fec_ccw_err,		/** fec ccw bad */
+	fec_txr_err,		/** fec txr bad */
+	fec_warn,		/** fec ccw warning */
+	fec_up_fail,		/** fec start check fail */
+
+	SBL_LINK_NUM_COUNTERS,		/* the number of SBL counters */
+};
+
+#endif /* _SBL_UAPI_COUNTERS_H_ */
diff --git a/include/uapi/ethernet/sbl_platform_config.h b/include/uapi/ethernet/sbl_platform_config.h
new file mode 100644
index 000000000000..09ea57072a55
--- /dev/null
+++ b/include/uapi/ethernet/sbl_platform_config.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright 2026 Hewlett Packard Enterprise Development LP. All rights reserved. */
+
+#ifndef _UAPI_ETHERNET_SBL_PLATFORM_CONFIG_H_
+#define _UAPI_ETHERNET_SBL_PLATFORM_CONFIG_H_
+
+#define SBL_PLATFORM_CAS_HW		1
+#define SBL_PLATFORM_CAS		1
+#define SBL_BUILD_NAME			"cassini"
+#define SBL_NUM_PORTS			1
+#define SBL_NUM_SBUS_RINGS		1  /* 2 rings, but only one per NIC */
+
+#endif /* _UAPI_ETHERNET_SBL_PLATFORM_CONFIG_H_ */
diff --git a/include/uapi/ethernet/sbl_sbm_constants.h b/include/uapi/ethernet/sbl_sbm_constants.h
new file mode 100644
index 000000000000..7aaad92ed939
--- /dev/null
+++ b/include/uapi/ethernet/sbl_sbm_constants.h
@@ -0,0 +1,330 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP. All rights reserved. */
+
+#ifndef _SBL_SBM_CONSTANTS_H_
+#define _SBL_SBM_CONSTANTS_H_
+
+/* Port Macro constants */
+#define SBL_SERDES_LANES_PER_PORT            4
+
+/* General constants */
+#define SBL_MAX_STR_LEN                      256
+#define SBL_HALF_MAX_STR_LEN                 128
+#define LEVEL_ERR                            4
+#define LEVEL_WARN                           3
+#define LEVEL_INFO                           2
+#define LEVEL_DBG                            1
+
+/* SBus address conversion macros */
+#define SBUS_ADDR(ring, rx_addr)        ((ring << 8) | rx_addr)
+#define SBUS_RING(sbus_addr)            ((sbus_addr & 0x300) >> 8)
+#define SBUS_RX_ADDR(sbus_addr)         (sbus_addr & 0xff)
+
+/* SBus operation defines */
+#define SBUS_CMD_MODE_OFFSET             7
+#define SBUS_CMD_MODE_MASK               (0x1 << SBUS_CMD_MODE_OFFSET)
+#define SBUS_IFACE_DST_OFFSET            5
+#define SBUS_IFACE_DST_MASK              (0x3 << SBUS_IFACE_DST_OFFSET)
+#define SBUS_CMD_OFFSET                  0
+#define SBUS_CMD_MASK                    (0xf << SBUS_CMD_OFFSET)
+
+#define SBUS_CMD_MODE_CTLR               (1 << SBUS_CMD_MODE_OFFSET)
+#define SBUS_CMD_MODE_RCVR               (0 << SBUS_CMD_MODE_OFFSET)
+#define SBUS_IFACE_DST_TAP               (0 << SBUS_IFACE_DST_OFFSET)
+#define SBUS_IFACE_DST_CORE              (1 << SBUS_IFACE_DST_OFFSET)
+#define SBUS_IFACE_DST_SPICO             (2 << SBUS_IFACE_DST_OFFSET)
+#define SBUS_IFACE_DST_SPARE             (3 << SBUS_IFACE_DST_OFFSET)
+#define SBUS_CMD_RESET                   (0 << SBUS_CMD_OFFSET)
+#define SBUS_CMD_WRITE                   (1 << SBUS_CMD_OFFSET)
+#define SBUS_CMD_READ                    (2 << SBUS_CMD_OFFSET)
+#define SBUS_CMD_READ_RESULT             (3 << SBUS_CMD_OFFSET)
+
+#define SBUS_RC_RESET                    0
+#define SBUS_RC_WRITE_COMPLETE           1
+#define SBUS_RC_WRITE_FAILED             2
+#define SBUS_RC_READ_ALL_COMPLETE        3
+#define SBUS_RC_READ_COMPLETE            4
+#define SBUS_RC_READ_FAILED              5
+#define SBUS_RC_CMD_ISSUE_DONE           6
+#define SBUS_RC_MODE_CHANGE_COMPLETE     7
+
+/* Rosetta */
+#define SBUS_RING0_CORE_PLL              0x1
+#define SBUS_RING0_PCIE_PLL              0x2
+#define SBUS_RING0_PCIE_SERDES_SPICO     0x3
+#define SBUS_RING0_PCIE_PCS              0x4
+#define SBUS_RING0_CM4_SERDES_FIRST      0x5
+#define SBUS_RING0_PMRO0                 0x15
+#define SBUS_RING0_THERMVOLT             0x16
+#define SBUS_RING0_PMRO1                 0x57
+#define SBUS_RING0_CM4_SERDES_LAST       0x87
+#define SBUS_RING0_SBM0                  0x88
+#define SBUS_RING0_SBM0_SPICO            0x89
+
+#define SBUS_RING1_CM4_SERDES_FIRST      0x1
+#define SBUS_RING1_PMRO2                 0x11
+#define SBUS_RING1_PMRO3                 0x52
+#define SBUS_RING1_CM4_SERDES_LAST       0x82
+#define SBUS_RING1_SBM1                  0x83
+#define SBUS_RING1_SBM1_SPICO            0x84
+
+/* Cassini */
+#define SBUS_RINGX_PCIE_PLL0                0x1
+#define SBUS_RINGX_PCIE_PLL1                0x2
+#define SBUS_RINGX_PCIE_PLL2                0x3
+#define SBUS_RINGX_CORE_PLL                 0x4
+#define SBUS_RINGX_THERMVOLT                0x5
+#define SBUS_RINGX_PMRO0                    0x6
+#define SBUS_RINGX_PMRO1                    0x7
+#define SBUS_RINGX_PCIE_SERDES_SPICO_FIRST  0x8
+#define SBUS_RINGX_PCIE_SERDES_SPICO_LAST   0x26
+#define SBUS_RINGX_PCIE_SERDES_PCS_FIRST    0x9
+#define SBUS_RINGX_PCIE_SERDES_PCS_LAST     0x27
+#define SBUS_RINGX_CM4_SERDES_FIRST         0x28
+#define SBUS_RINGX_CM4_SERDES_LAST          0x2B
+#define SBUS_RINGX_SBM                      0x2C
+#define SBUS_RINGX_SBM_SPICO                0x2D
+#define SBUS_RINGX_PCIE_SERDES_SPICO_LSB    0x0
+#define SBUS_RINGX_PCIE_SERDES_PCS_LSB      0x1
+
+/* Broadcast */
+#define SBUS_BCAST_PCIE_SERDES_SPICO     0xff
+#define SBUS_BCAST_PCIE_SERDES_PCS       0xf7
+#define SBUS_BCAST_CM4_SERDES_SPICO      0xee
+#define SBUS_BCAST_SBM_SPICO             0xfd
+#define SBUS_BCAST_SBM                   0xfe
+#define SBUS_BCAST_PLL                   0xf6
+#define SBUS_BCAST_PMRO                  0xf5
+#define SBUS_BCAST_THERMVOLT             0xef
+
+/* SBus receiver interface */
+#define SPICO_SBR_ADDR_SRAM_BIST           0x0
+#define SPICO_SBR_ADDR_CTL                 0x1
+#define SPICO_SBR_ADDR_DMEM_IN             0x2
+#define SPICO_SBR_ADDR_IMEM                0x3
+#define SPICO_SBR_ADDR_DMEM                0x4
+#define SPICO_SBR_ADDR_STEP_BP             0x5
+#define SPICO_SBR_ADDR_BP_ADDR             0x6
+#define SPICO_SBR_ADDR_INTR                0x7
+#define SPICO_SBR_ADDR_DMEM_OUT            0x8
+#define SPICO_SBR_ADDR_RDATA               0x9
+#define SPICO_SBR_ADDR_PC                  0xa
+#define SPICO_SBR_ADDR_PC_OVERRIDE         0xb
+#define SPICO_SBR_ADDR_FLAG                0xc
+#define SPICO_SBR_ADDR_OP                  0xd
+#define SPICO_SBR_ADDR_SP_EC               0xe
+#define SPICO_SBR_ADDR_STATE               0xf
+#define SPICO_SBR_ADDR_RESULT              0x10
+#define SPICO_SBR_ADDR_A_B_REG             0x11
+#define SPICO_SBR_ADDR_IMEM_BURST_DATA     0x14
+#define SPICO_SBR_ADDR_IMEM_BURST_ADDR     0x15
+#define SPICO_SBR_ADDR_ECC                 0x16
+#define SPICO_SBR_ADDR_UNNAMED_0           0x17
+#define SPICO_SBR_ADDR_UNNAMED_1           0x18
+#define SPICO_SBR_ADDR_UNNAMED_2           0x19
+#define SPICO_SBR_ADDR_UNNAMED_3           0x1a
+#define SPICO_SBR_ADDR_UNNAMED_4           0x1b
+#define SPICO_SBR_ADDR_IP_IDCODE           0xff
+
+/* SBus Controller receiver memory */
+#define SBM_CRM_ADDR_CISM0             0x0
+#define SBM_CRM_ADDR_CISM1             0x1
+#define SBM_CRM_ADDR_LAST_ADDR         0x2
+#define SBM_CRM_ADDR_CLK_DIV           0xa
+#define SBM_CRM_ADDR_CLK_DIV_RST       0xb
+#define SBM_CRM_ADDR_CLK_DIV_RST_P0    0xc
+#define SBM_CRM_ADDR_CLK_DIV_RST_P1    0xd
+#define SBM_CRM_ADDR_CISM_RX_ADDR      0x10
+#define SBM_CRM_ADDR_CISM_CMD1         0x11
+#define SBM_CRM_ADDR_CISM_DATA_ADDR1   0x12
+#define SBM_CRM_ADDR_CISM_DATA_WORD1   0x13
+#define SBM_CRM_ADDR_CISM_CMD2         0x14
+#define SBM_CRM_ADDR_CISM_DATA_ADDR2   0x15
+#define SBM_CRM_ADDR_CISM_DATA_WORD2   0x16
+#define SBM_CRM_ADDR_DATA_OUT_SEL      0x20
+#define SBM_CRM_ADDR_BIST              0x21
+#define SBM_CRM_ADDR_PROC_STS          0x2a
+#define SBM_CRM_ADDR_ROM_EN            0x30
+#define SBM_CRM_ADDR_ROM_FAILED_ADDR   0x31
+#define SBM_CRM_ADDR_ROM_DATA_VAL_CNT  0x32
+#define SBM_CRM_ADDR_ROM_ACK           0x33
+#define SBM_CRM_ADDR_ROM_STOP_ADDR     0x34
+#define SBM_CRM_ADDR_ROM_OUTPUT        0x35
+#define SBM_CRM_ADDR_ROM_DATA0         0x36
+#define SBM_CRM_ADDR_ROM_DATA1         0x37
+#define SBM_CRM_ADDR_CLK_HALT          0x40
+#define SBM_CRM_ADDR_GEN_WRITE         0x80
+#define SBM_CRM_ADDR_GEN_READ          0x81
+#define SBM_CRM_ADDR_GEN_WRITE_P0      0x82
+#define SBM_CRM_ADDR_GEN_WRITE_P1      0x83
+#define SBM_CRM_ADDR_GEN_WRITE_P2      0x84
+#define SBM_CRM_ADDR_GEN_WRITE_P3      0x85
+#define SBM_CRM_ADDR_GEN_READ_P0       0x86
+#define SBM_CRM_ADDR_GEN_READ_P1       0x87
+#define SBM_CRM_ADDR_GEN_READ_P2       0x88
+#define SBM_CRM_ADDR_GEN_READ_P3       0x89
+#define SBM_CRM_ADDR_SBUS_ID           0xfe
+#define SBM_CRM_ADDR_IP_IDCODE         0xff
+
+#define SPICO_SBR_DATA_W0_OFFSET           0
+#define SPICO_SBR_DATA_W1_OFFSET           10
+#define SPICO_SBR_DATA_W2_OFFSET           20
+
+#define SPICO_SERDES_ADDR_IMEM               0x0
+#define SPICO_SERDES_ADDR_INTR0              0x3
+#define SPICO_SERDES_ADDR_INTR1              0x4
+#define SPICO_SERDES_ADDR_RESET_EN           0x7
+#define SPICO_SERDES_ADDR_INTR_DIS           0x8
+#define SPICO_SERDES_ADDR_BIST               0x9
+#define SPICO_SERDES_ADDR_IMEM_BURST         0xa
+#define SPICO_SERDES_ADDR_ECC                0xb
+#define SPICO_SERDES_ADDR_ECCLOG             0xc
+#define SPICO_SERDES_ADDR_BCAST              0xfd
+#define SPICO_SERDES_ADDR_IP_IDCODE          0xff
+
+/* See Spico_Firmware_2002.pdf */
+/* #define SPICO_INT_SBMC_REV_ID            0x00 */
+/* #define SPICO_INT_SBMC_BUILD_ID          0x01 */
+/* #define SPICO_INT_SBMC_GET_PMRO_DATA     0x02 */
+/* #define SPICO_INT_SBMC_GET_TEMP_DATA     0x03 */
+/* #define SPICO_INT_SBMC_GET_VOLT_DATA     0x04 */
+
+#define SPICO_INT_SBMS_REV_ID            0x00
+#define SPICO_INT_SBMS_BUILD_ID          0x01
+#define SPICO_INT_SBMS_DO_CRC            0x02
+#define SPICO_INT_SBMS_READ_DMEM_VAL     0x03
+#define SPICO_INT_SBMS_DO_XDMEM_CRC      0x04
+#define SPICO_INT_SBMS_GET_PMRO_DATA     0x16
+#define SPICO_INT_SBMS_GET_TEMP_DATA     0x17
+#define SPICO_INT_SBMS_GET_VOLT_DATA     0x18
+#define SPICO_INT_SBMS_IMEM_CRC_CHECK    0x1a
+#define SPICO_INT_SBMS_IMEM_SWP_SA       0x1c
+#define SPICO_INT_SBMS_FW_STS            0x20
+#define SPICO_INT_SBMS_PCIE3_SWP         0x28
+#define SPICO_INT_SBMS_DRMON_SETUP       0x29
+#define SPICO_INT_SBMS_TEMP_SETUP        0x2a
+#define SPICO_INT_SBMS_RR_PCAL           0x2b
+#define SPICO_INT_SBMS_DDR_HMB_FIRST     0x30
+#define SPICO_INT_SBMS_DDR_HMB_LAST      0x3f
+
+#define SBMS_INTERRUPT_DATA_OUT_MASK     0xffff0000
+#define SBMS_INTERRUPT_IN_PROGRESSS_MASK 0x00008000
+#define SBMS_INTERRUPT_STATUS_MASK       0x00007fff
+#define SBMS_INTERRUPT_DATA_MASK         0xffff0000
+#define SBMS_INTERRUPT_DATA_OFFSET       16
+#define SBMS_INTERRUPT_CODE_MASK         0x0000ffff
+#define SBMS_INTERRUPT_CODE_OFFSET       0
+
+#define SBMS_INTERRUPT_STATUS_OK         0x1
+
+#define SPICO_INT_CM4_REV_ID             0x00
+#define SPICO_INT_CM4_SERDES_EN          0x01
+#define SPICO_INT_CM4_PRBS_CTRL          0x02
+#define SPICO_INT_CM4_COMPARE_CTRL       0x03
+#define SPICO_INT_CM4_PMD_CTRL           0x04
+#define SPICO_INT_CM4_TX_BAUD            0x05
+#define SPICO_INT_CM4_RX_BAUD            0x06
+#define SPICO_INT_CM4_AN_CONFIG          0x07
+#define SPICO_INT_CM4_LOOPBACK           0x08
+#define SPICO_INT_CM4_DFE_CTRL           0x0a
+#define SPICO_INT_CM4_TX_PHASE_CAL       0x0b
+#define SPICO_INT_CM4_BIT_SLIP           0x0c
+#define SPICO_INT_CM4_TX_PHASE_SLIP      0x0d
+#define SPICO_INT_CM4_RX_PHASE_SLIP      0x0e
+#define SPICO_INT_CM4_PCIE_PD            0x10
+#define SPICO_INT_CM4_PLL_RECAL          0x11
+#define SPICO_INT_CM4_SAS_APTA_CTRL      0x12
+#define SPICO_INT_CM4_POLARITY_CTRL      0x13
+#define SPICO_INT_CM4_WIDTH_MODE         0x14
+#define SPICO_INT_CM4_TXEQ_LOAD          0x15
+#define SPICO_INT_CM4_ERROR_RST          0x16
+#define SPICO_INT_CM4_BIG_REG_SEL        0x18
+#define SPICO_INT_CM4_BIG_REG_WR         0x19
+#define SPICO_INT_CM4_BIG_REG_RD         0x1a
+#define SPICO_INT_CM4_ERR_INJECT         0x1b
+#define SPICO_INT_CM4_DO_DATA_CAP        0x1c
+#define SPICO_INT_CM4_WAIT_TTD           0x1d
+#define SPICO_INT_CM4_ERR_STS            0x1e
+#define SPICO_INT_CM4_ERR_TIMER_STS      0x1f
+#define SPICO_INT_CM4_PCIE_SLICES        0x20
+#define SPICO_INT_CM4_PCIE3_RX_EQ        0x24
+#define SPICO_INT_CM4_SET_RX_EQ          0x26
+#define SPICO_INT_CM4_GET_RX_EQ          0x126
+#define SPICO_INT_CM4_CORE_TO_CNTL_EN    0x27
+#define SPICO_INT_CM4_AN_DME_PAGE        0x29
+#define SPICO_INT_CM4_INT_RX_TERM        0x2b
+#define SPICO_INT_CM4_HAL_READ           0x2c
+#define SPICO_INT_CM4_HAL_WRITE          0x6c
+#define SPICO_INT_CM4_HAL_CALL           0xec
+#define SPICO_INT_CM4_SPICO_CLK_SWP      0x30
+#define SPICO_INT_CM4_PCIE3_TX_MRG1      0x31
+#define SPICO_INT_CM4_PCIE3_TX_MRG2      0x32
+#define SPICO_INT_CM4_PCIE3_TX_MRG3      0x33
+#define SPICO_INT_CM4_PCIE3_TX_MRG4      0x34
+#define SPICO_INT_CM4_PCIE3_TX_MRG5      0x35
+#define SPICO_INT_CM4_PROC_RESET         0x39
+#define SPICO_INT_CM4_PCIE_SWP_SETUP     0x3a
+#define SPICO_INT_CM4_IP_STAT_INFO       0x3b
+#define SPICO_INT_CM4_CRC                0x3c
+#define SPICO_INT_CM4_PMD_CONFIG         0x3d
+#define SPICO_INT_CM4_BUILD_ID           0x3f
+#define SPICO_INT_CM4_O_CORE_STS_15_0    0x4027
+#define SPICO_INT_CM4_O_CORE_STS_31_16   0x4069
+#define SPICO_INT_CM4_MEM_READ           0x4000
+#define SPICO_INT_CM4_MEM_WRITE          0x8000
+
+#define SPICO_INT_RESULT_CODE_MASK      0xff
+#define SPICO_INT_RETURN_RESULT         2
+#define SPICO_INT_VALIDATE_RESULT       1
+#define SPICO_INT_IGNORE_RESULT         0
+#define SPICO_INT_DIVIDER_MASK          0xff
+#define SPICO_INT_MEM_READ_ADDR_MASK    0xfff
+
+#define SPICO_INT_DATA_NONE             0x0000
+
+#define SPICO_SBR_DATA_BE_012              0xc0000000
+#define SPICO_SBR_DATA_BE_01               0x80000000
+#define SPICO_SBR_DATA_BE_0                0x40000000
+
+/* From apd16_IO_databook.pdf */
+#define SBUS_SENSOR_ADDR_RESET_START                     0
+#define SBUS_SENSOR_ADDR_SENSOR_CLK_DIVIDE               1
+#define SBUS_SENSOR_ADDR_REMOTE_SENSOR_MODE              3
+#define SBUS_SENSOR_ADDR_SPARE_REG                       4
+#define SBUS_SENSOR_ADDR_THERM_STATE                     5
+#define SBUS_SENSOR_ADDR_TEMP_GAIN_OVRD_VAL              6
+#define SBUS_SENSOR_ADDR_TEMP_OFFSET_OVRD_VAL            7
+#define SBUS_SENSOR_ADDR_TEMP_C_RES_OVRD_VAL             8
+#define SBUS_SENSOR_ADDR_TEMP_GAIN_TRIM_OVRD_VAL         9
+#define SBUS_SENSOR_ADDR_TEMP_OFFSET_TRIM_OVRD_VAL       10
+#define SBUS_SENSOR_ADDR_TEMP_OVRD_SEL                   11
+#define SBUS_SENSOR_ADDR_VOLTAGE_GAIN_OVRD_VAL           12
+#define SBUS_SENSOR_ADDR_VOLTAGE_OFFSET_OVRD_VAL         13
+#define SBUS_SENSOR_ADDR_VOLTAGE_C_RES_OVRD_VAL          14
+#define SBUS_SENSOR_ADDR_VOLTAGE_GAIN_TRIM_OVRD_VAL      15
+#define SBUS_SENSOR_ADDR_VOLTAGE_OVRD_SEL                16
+#define SBUS_SENSOR_ADDR_REMOTE_GAIN_OVRD_VAL            17
+#define SBUS_SENSOR_ADDR_REMOTE_OFFSET_OVRD_VAL          18
+#define SBUS_SENSOR_ADDR_REMOTE_C_RES_OVRD_VAL           19
+#define SBUS_SENSOR_ADDR_REMOTE_OVRD_SEL                 20
+#define SBUS_SENSOR_ADDR_ACCUMULATOR                     64
+#define SBUS_SENSOR_ADDR_TEMPERATURE_SENSOR              65
+#define SBUS_SENSOR_ADDR_REMOTE_TEMPERATURE_SENSOR_0     66
+#define SBUS_SENSOR_ADDR_REMOTE_TEMPERATURE_SENSOR_1     67
+#define SBUS_SENSOR_ADDR_REMOTE_TEMPERATURE_SENSOR_2     68
+#define SBUS_SENSOR_ADDR_REMOTE_TEMPERATURE_SENSOR_3     69
+#define SBUS_SENSOR_ADDR_REMOTE_TEMPERATURE_SENSOR_4     70
+#define SBUS_SENSOR_ADDR_REMOTE_TEMPERATURE_SENSOR_5     71
+#define SBUS_SENSOR_ADDR_REMOTE_TEMPERATURE_SENSOR_6     72
+#define SBUS_SENSOR_ADDR_REMOTE_TEMPERATURE_SENSOR_7     73
+#define SBUS_SENSOR_ADDR_VDD_VOLTAGE_SENSOR              74
+#define SBUS_SENSOR_ADDR_CORE_VDD_VIN_VOLTAGE_SENSOR     75
+#define SBUS_SENSOR_ADDR_SENSOR_A2D_VIN_0_VOLTAGE_SENSOR 76
+#define SBUS_SENSOR_ADDR_SENSOR_A2D_VIN_1_VOLTAGE_SENSOR 77
+#define SBUS_SENSOR_ADDR_SENSOR_A2D_VIN_2_VOLTAGE_SENSOR 78
+#define SBUS_SENSOR_ADDR_SENSOR_A2D_VIN_3_VOLTAGE_SENSOR 79
+#define SBUS_SENSOR_ADDR_SENSOR_A2D_VIN_4_VOLTAGE_SENSOR 80
+#define SBUS_SENSOR_ADDR_SENSOR_A2D_VIN_5_VOLTAGE_SENSOR 81
+#define SBUS_SENSOR_ADDR_IP_IDENTIFICATION_REGISTER      255
+
+#endif /* _SBL_SBM_CONSTANTS_H_ */
diff --git a/include/uapi/ethernet/sbl_serdes.h b/include/uapi/ethernet/sbl_serdes.h
new file mode 100644
index 000000000000..853b88b9df60
--- /dev/null
+++ b/include/uapi/ethernet/sbl_serdes.h
@@ -0,0 +1,390 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP */
+
+#include <linux/types.h>
+
+#ifndef _SBL_UAPI_BASE_LINK_SERDES_H_
+#define _SBL_UAPI_BASE_LINK_SERDES_H_
+
+
+#define SBL_TUNING_PARAM_MAGIC           0x74736d70  /* stpm */
+#define SBL_TUNING_PARAM_VERSION                  2
+
+#define SBL_SERDES_CONFIG_MAGIC          0x63736d76  /* scvm */
+#define SBL_MAX_OOB_SERDES_PARAMS        0 /* Allow no more than this number of params to be out of bounds */
+#define SBL_CTLE_HF_MIN          0
+#define SBL_CTLE_HF_MAX          15
+#define SBL_CTLE_LF_MIN          0
+#define SBL_CTLE_LF_MAX          15
+#define SBL_CTLE_DC_MIN          0
+#define SBL_CTLE_DC_MAX          0
+#define SBL_CTLE_BW_MIN          0
+#define SBL_CTLE_BW_MAX          15
+#define SBL_CTLE_GS1_MIN         0
+#define SBL_CTLE_GS1_MAX         3
+#define SBL_CTLE_GS2_MIN         0
+#define SBL_CTLE_GS2_MAX         3
+#define SBL_CTLE_SCE_MIN         0
+#define SBL_CTLE_SCE_MAX         0
+#define SBL_CTLE_HF_MIN_MIN      0
+#define SBL_CTLE_HF_MIN_MAX      0
+#define SBL_CTLE_HF_MAX_MIN      15
+#define SBL_CTLE_HF_MAX_MAX      15
+#define SBL_CTLE_LF_MIN_MIN      0
+#define SBL_CTLE_LF_MIN_MAX      3  /* relaxed */
+#define SBL_CTLE_LF_MAX_MIN      10 /* relaxed */
+#define SBL_CTLE_LF_MAX_MAX      15
+
+#define SBL_FFE_PRE2_MIN	 -10 /* relaxed */
+#define SBL_FFE_PRE2_MAX	 3  /* relaxed to 3 for BJ_100G */
+#define SBL_FFE_PRE1_MIN	 0
+#define SBL_FFE_PRE1_MAX	 11  /* relaxed */
+#define SBL_FFE_POST1_MIN	 -3
+#define SBL_FFE_POST1_MAX	 8
+#define SBL_FFE_BFLF_MIN	 0
+#define SBL_FFE_BFLF_MAX	 0
+#define SBL_FFE_BFHF_MIN	 0
+#define SBL_FFE_BFHF_MAX	 0
+#define SBL_FFE_DATARATE_MIN	 0
+#define SBL_FFE_DATARATE_MAX	 0
+#define SBL_FFE_SCE_MIN		 0
+#define SBL_FFE_SCE_MAX		 0
+#define SBL_FFE_PRE1_MIN_MIN	 0
+#define SBL_FFE_PRE1_MIN_MAX	 0
+#define SBL_FFE_PRE1_MAX_MIN	 15
+#define SBL_FFE_PRE1_MAX_MAX	 15
+#define SBL_FFE_PRE2_MIN_MIN	 -10
+#define SBL_FFE_PRE2_MIN_MAX	 -10
+#define SBL_FFE_PRE2_MAX_MIN	 10
+#define SBL_FFE_PRE2_MAX_MAX	 10
+#define SBL_FFE_BFLF_ICAL_MIN	 0
+#define SBL_FFE_BFLF_ICAL_MAX	 0
+#define SBL_FFE_POST1_MIN_MIN	 -3
+#define SBL_FFE_POST1_MIN_MAX	 -3
+#define SBL_FFE_POST1_MAX_MIN	 8
+#define SBL_FFE_POST1_MAX_MAX	 8
+
+#define SBL_DFE_GT1_MIN		 255
+#define SBL_DFE_GT1_MAX		 255
+#define SBL_DFE_GT2_MIN		 255
+#define SBL_DFE_GT2_MAX		 255
+#define SBL_DFE_G2_MIN		 -31 /* relaxed */
+#define SBL_DFE_G2_MAX		 15  /* relaxed */
+#define SBL_DFE_G3_MIN		 -9  /* relaxed */
+#define SBL_DFE_G3_MAX		 14
+#define SBL_DFE_G4_MIN		 -6  /* relaxed */
+#define SBL_DFE_G4_MAX		 8   /* relaxed */
+#define SBL_DFE_G5_MIN		 -4  /* relaxed */
+#define SBL_DFE_G5_MAX		 12  /* relaxed */
+#define SBL_DFE_G6_MIN		 -4  /* relaxed */
+#define SBL_DFE_G6_MAX		 6   /* relaxed */
+#define SBL_DFE_G7_MIN		 -4  /* relaxed */
+#define SBL_DFE_G7_MAX		 6   /* relaxed */
+#define SBL_DFE_G8_MIN		 -5
+#define SBL_DFE_G8_MAX		 7   /* relaxed */
+#define SBL_DFE_G9_MIN		 -4  /* constrained */
+#define SBL_DFE_G9_MAX		 6
+#define SBL_DFE_G10_MIN		 -7
+#define SBL_DFE_G10_MAX		 5
+#define SBL_DFE_G11_MIN		 -4  /* relaxed */
+#define SBL_DFE_G11_MAX		 4   /* relaxed */
+#define SBL_DFE_G12_MIN		 -3  /* relaxed */
+#define SBL_DFE_G12_MAX		 4   /* relaxed */
+#define SBL_DFE_G13_MIN		 0
+#define SBL_DFE_G13_MAX		 0
+
+/*
+ * @brief SerDes tuning parameters
+ *
+ */
+enum sbl_ctle_params {
+	CTLE_HF_OFFSET = 0,
+	CTLE_LF_OFFSET,
+	CTLE_DC_OFFSET,
+	CTLE_BW_OFFSET,
+	CTLE_GS1_OFFSET,
+	CTLE_GS2_OFFSET,
+	CTLE_SCE_OFFSET,
+	CTLE_HF_MIN_OFFSET,
+	CTLE_HF_MAX_OFFSET,
+	CTLE_LF_MIN_OFFSET,
+	CTLE_LF_MAX_OFFSET,
+	NUM_CTLE_PARAMS
+};
+
+enum sbl_ffe_params {
+	FFE_PRE2_OFFSET = 0,
+	FFE_PRE1_OFFSET,
+	FFE_POST1_OFFSET,
+	FFE_BFLF_OFFSET,
+	FFE_BFHF_OFFSET,
+	FFE_DATARATE_OFFSET,
+	FFE_SCE_OFFSET,
+	FFE_PRE1_MIN_OFFSET,
+	FFE_PRE1_MAX_OFFSET,
+	FFE_PRE2_MIN_OFFSET,
+	FFE_PRE2_MAX_OFFSET,
+	FFE_BFLF_ICAL_OFFSET,
+	FFE_POST1_MIN_OFFSET,
+	FFE_POST1_MAX_OFFSET,
+	NUM_FFE_PARAMS
+};
+
+enum sbl_dfe_params {
+	DFE_GT1_OFFSET = 0,
+	DFE_GT2_OFFSET,
+	DFE_G2_OFFSET,
+	DFE_G3_OFFSET,
+	DFE_G4_OFFSET,
+	DFE_G5_OFFSET,
+	DFE_G6_OFFSET,
+	DFE_G7_OFFSET,
+	DFE_G8_OFFSET,
+	DFE_G9_OFFSET,
+	DFE_G10_OFFSET,
+	DFE_G11_OFFSET,
+	DFE_G12_OFFSET,
+	DFE_G13_OFFSET,
+	NUM_DFE_PARAMS
+};
+
+enum sbl_rxvc_params {
+	RXVC_UOC_OFFSET = 0,
+	RXVC_UEC_OFFSET,
+	RXVC_MOC_OFFSET,
+	RXVC_MEC_OFFSET,
+	RXVC_LOC_OFFSET,
+	RXVC_LEC_OFFSET,
+	NUM_RXVC_PARAMS
+};
+
+enum sbl_rxvs_params {
+	RXVS_UOD_OFFSET = 0,
+	RXVS_UED_OFFSET,
+	RXVS_MOD_OFFSET,
+	RXVS_MED_OFFSET,
+	RXVS_LOD_OFFSET,
+	RXVS_LED_OFFSET,
+	RXVS_TOD_OFFSET,
+	RXVS_TED_OFFSET,
+	RXVS_EOD_OFFSET,
+	RXVS_EED_OFFSET,
+	RXVS_TD_OFFSET,
+	NUM_RXVS_PARAMS
+};
+
+enum sbl_rsdo_params {
+	RSDO_LE_OFFSET = 0,
+	RSDO_LO_OFFSET,
+	RSDO_ME_OFFSET,
+	RSDO_MO_OFFSET,
+	RSDO_UE_OFFSET,
+	RSDO_UO_OFFSET,
+	NUM_RSDO_PARAMS
+};
+
+enum sbl_rsdc_params {
+	RSDC_LE_OFFSET = 0,
+	RSDC_LO_OFFSET,
+	RSDC_ME_OFFSET,
+	RSDC_MO_OFFSET,
+	RSDC_UE_OFFSET,
+	RSDC_UO_OFFSET,
+	NUM_RSDC_PARAMS
+};
+
+enum sbl_rsto_params {
+	RSTO_TE_OFFSET = 0,
+	RSTO_TO_OFFSET,
+	RSTO_CE_OFFSET,
+	RSTO_CO_OFFSET,
+	NUM_RSTO_PARAMS
+};
+
+enum sbl_rstc_params {
+	RSTC_TE_OFFSET = 0,
+	RSTC_TO_OFFSET,
+	RSTC_CE_OFFSET,
+	RSTC_CO_OFFSET,
+	NUM_RSTC_PARAMS
+};
+
+enum sbl_eh_params {
+	EH_HLE_OFFSET = 0,
+	EH_HME_OFFSET,
+	EH_HUE_OFFSET,
+	EH_HLO_OFFSET,
+	EH_HMO_OFFSET,
+	EH_HUO_OFFSET,
+	EH_SEL_OFFSET,
+	EH_SEM_OFFSET,
+	EH_SEU_OFFSET,
+	EH_SOL_OFFSET,
+	EH_SOM_OFFSET,
+	EH_SOU_OFFSET,
+	NUM_EH_PARAMS
+};
+
+enum sbl_gtp_params {
+	GTP_ERTH_OFFSET = 0,
+	GTP_NCDW_OFFSET,
+	GTP_NCLD_OFFSET,
+	GTP_EOVS_OFFSET,
+	GTP_PCDW_OFFSET,
+	GTP_PDDW_OFFSET,
+	GTP_PDPD_OFFSET,
+	GTP_LMDW_OFFSET,
+	GTP_CTLF_OFFSET,
+	GTP_RXFF_OFFSET,
+	GTP_DFEF_OFFSET,
+	GTP_GTMM_OFFSET,
+	GTP_G2MM_OFFSET,
+	GTP_PCLL_OFFSET,
+	GTP_DOSP_OFFSET,
+	GTP_LPDW_OFFSET,
+	GTP_DPDW_OFFSET,
+	GTP_PCLD_OFFSET,
+	GTP_ICID_OFFSET,
+	GTP_CLMM_OFFSET,
+	GTP_CDMM_OFFSET,
+	GTP_VRFX_OFFSET,
+	GTP_PRTM_OFFSET,
+	GTP_GROP_OFFSET,
+	GTP_ICLE_OFFSET,
+	GTP_URCC_OFFSET,
+	GTP_LTFL_OFFSET,
+	GTP_DTCF_OFFSET,
+	NUM_GTP_PARAMS
+};
+
+enum sbl_dccd_params {
+	DCCD_UE_OFFSET = 0,
+	DCCD_UO_OFFSET,
+	DCCD_ME_OFFSET,
+	DCCD_MO_OFFSET,
+	DCCD_LE_OFFSET,
+	DCCD_LO_OFFSET,
+	NUM_DCCD_PARAMS
+};
+
+enum sbl_p4lv_params {
+	P4LV_X3XE_OFFSET = 0,
+	P4LV_X3XO_OFFSET,
+	P4LV_X2XE_OFFSET,
+	P4LV_X2XO_OFFSET,
+	P4LV_X1XE_OFFSET,
+	P4LV_X1XO_OFFSET,
+	P4LV_X0XE_OFFSET,
+	P4LV_X0XO_OFFSET,
+	NUM_P4LV_PARAMS
+};
+
+enum sbl_afec_params {
+	AFEC_HFPM_OFFSET = 0,
+	AFEC_HFMN_OFFSET,
+	AFEC_HFMX_OFFSET,
+	AFEC_TEMP_OFFSET,
+	AFEC_NWHF_OFFSET,
+	AFEC_NWP1_OFFSET,
+	NUM_AFEC_PARAMS
+};
+
+/*
+ * @brief Arrays of SerDes tuning parameters.
+ */
+struct sbl_serdes_params {
+	__s16 ctle[NUM_CTLE_PARAMS];  /**< CTLE tuning params */
+	__s16 ffe[NUM_FFE_PARAMS];    /**< FFE tuning params */
+	__s16 dfe[NUM_DFE_PARAMS];    /**< DFE tuning params */
+	__s16 rxvs[NUM_RXVS_PARAMS];  /**< Rx CLK Vernier Settings */
+	__s16 rxvc[NUM_RXVC_PARAMS];  /**< Rx CLK Vernier Cals */
+	__s16 rsdo[NUM_RSDO_PARAMS];  /**< Rx Sampler Data Offset */
+	__s16 rsdc[NUM_RSDC_PARAMS];  /**< Rx Sampler Data Cal */
+	__s16 rsto[NUM_RSTO_PARAMS];  /**< Rx Sampler Test/CDR Offset */
+	__s16 rstc[NUM_RSTC_PARAMS];  /**< Rx Sampler Test/CDR Cal */
+	__s16 eh[NUM_EH_PARAMS];      /**< Eye Heights */
+	__s16 gtp[NUM_GTP_PARAMS];    /**< Global Tuning Params */
+	__s16 dccd[NUM_DCCD_PARAMS];  /**< Data Channel Cal Deltas */
+	__s16 p4lv[NUM_P4LV_PARAMS];  /**< PAM4 Levels */
+	__s16 afec[NUM_AFEC_PARAMS];  /**< AFE Control */
+};
+
+/**
+ * @brief Set of tuning parameters used to configure a link, allowing the SerDes
+ *         to come up without needing to DFE tune.
+ *
+ *        tp_state_hash maps the params with the SerDes state for which they
+ *         were derived. This allows us to prevent applying saved parameters
+ *         to configurations different from which they were intended for.
+ */
+struct sbl_tuning_params {
+	__u32 magic;          /**< = SBL_TUNING_PARAM_MAGIC */
+	__u32 version;        /**< version number */
+	__u64 tp_state_hash0;  /**< Info for lp, lb, tp, lb, mt, mv */
+	__u64 tp_state_hash1;  /**< Info for ml */
+	struct sbl_serdes_params params[4];
+};
+
+
+/**
+ * @brief SerDes configuration values
+ *
+ */
+#define SBL_SC_MAX_INTR          16
+
+struct sbl_sc_values {
+	__u32 magic;                        /**< = SBL_SERDES_CONFIG_MAGIC */
+	__u32 atten;                        /**< attenuation */
+	__u32 pre;                          /**<  */
+	__u32 post;                         /**<  */
+	__u32 pre2;                         /**<  */
+	__u32 pre3;                         /**<  */
+	__u32 gs1;                          /**< gainshape 1 */
+	__u32 gs2;                          /**< gainshape 2 */
+	__u32 num_intr;                     /**< number of serdes core interrupts (serdes ops)*/
+	__u16 intr_val[SBL_SC_MAX_INTR];    /**< interrupts to perform */
+	__u16 data_val[SBL_SC_MAX_INTR];    /**< data for interrupts */
+};
+
+
+/*
+ * serdes configuration hash.
+ *
+ *   used for serdes configurations and saving tuning parameters.
+ */
+#define SBL_TPH_LP_OFFSET	0x0
+#define SBL_TPH_LB_OFFSET	0x8
+#define SBL_TPH_TP_OFFSET	0x10
+#define SBL_TPH_LM_OFFSET	0x18
+#define SBL_TPH_MT_OFFSET	0x20
+#define SBL_TPH_MV_OFFSET	0x28
+
+#define SBL_TPH_ML_OFFSET	0x0
+
+#define SBL_TPH_LP_MASK		0xffULL
+#define SBL_TPH_LB_MASK		0xffULL
+#define SBL_TPH_TP_MASK		0xffULL
+#define SBL_TPH_LM_MASK		0xffULL
+#define SBL_TPH_MT_MASK		0xffULL
+#define SBL_TPH_MV_MASK		0xffffULL
+
+#define SBL_TPH_ML_MASK		0xffffffffffffffffULL
+
+#define SBL_TPH_LP_SET(hash, val) (hash |= (((__u64)val & SBL_TPH_LP_MASK) << \
+					    SBL_TPH_LP_OFFSET))
+#define SBL_TPH_LB_SET(hash, val) (hash |= (((__u64)val & SBL_TPH_LB_MASK) << \
+					    SBL_TPH_LB_OFFSET))
+#define SBL_TPH_TP_SET(hash, val) (hash |= (((__u64)val & SBL_TPH_TP_MASK) << \
+					    SBL_TPH_TP_OFFSET))
+#define SBL_TPH_LM_SET(hash, val) (hash |= (((__u64)val & SBL_TPH_LM_MASK) << \
+					    SBL_TPH_LM_OFFSET))
+#define SBL_TPH_MT_SET(hash, val) (hash |= (((__u64)val & SBL_TPH_MT_MASK) << \
+					    SBL_TPH_MT_OFFSET))
+#define SBL_TPH_MV_SET(hash, val) (hash |= (((__u64)val & SBL_TPH_MV_MASK) << \
+					    SBL_TPH_MV_OFFSET))
+
+#define SBL_TPH_ML_SET(hash, val) (hash |= (((__u64)val & SBL_TPH_ML_MASK) << \
+					    SBL_TPH_ML_OFFSET))
+
+#endif  /* _SBL_UAPI_BASE_LINK_SERDES_H_ */
diff --git a/include/uapi/ethernet/sbl_serdes_defaults.h b/include/uapi/ethernet/sbl_serdes_defaults.h
new file mode 100644
index 000000000000..440ee8631ce7
--- /dev/null
+++ b/include/uapi/ethernet/sbl_serdes_defaults.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright 2019-2020,2022-2024 Hewlett Packard Enterprise Development LP. All rights reserved. */
+
+#ifndef _SBL_UAPI_SBL_SERDES_DEFAULTS_H_
+#define _SBL_UAPI_SBL_SERDES_DEFAULTS_H_
+
+/**
+ * @brief Defaults for per-port SerDes attributes
+ *
+ */
+#define SBL_DFLT_OPTICAL_LOCK_DELAY                      2000
+#define SBL_DFLT_OPTICAL_LOCK_INTERVAL                    500
+#define SBL_DFLT_DFE_PRE_DELAY_PEC                          0
+#define SBL_DFLT_DFE_PRE_DELAY_AOC                          0
+#define SBL_DFLT_DFE_TIMEOUT_PEC                           40
+#define SBL_DFLT_DFE_TIMEOUT_AOC                           40
+#define SBL_DFLT_DFE_POLL_INTERVAL                        250
+#define SBL_DFLT_NRZ_PEC_MIN_EYE_HEIGHT                  0xc0
+#define SBL_DFLT_NRZ_PEC_MAX_EYE_HEIGHT                 0x200
+#define SBL_DFLT_NRZ_AOC_MIN_EYE_HEIGHT                  0xc0
+#define SBL_DFLT_NRZ_AOC_MAX_EYE_HEIGHT                 0x200
+#define SBL_DFLT_PAM4_PEC_MIN_EYE_HEIGHT                 0x10
+#define SBL_DFLT_PAM4_PEC_MAX_EYE_HEIGHT                 0x50
+#define SBL_DFLT_PAM4_AOC_MIN_EYE_HEIGHT                 0x25
+#define SBL_DFLT_PAM4_AOC_MAX_EYE_HEIGHT                 0x70
+#define SBL_DFLT_LPD_TIMEOUT                               12
+#define SBL_DFLT_LPD_POLL_INTERVAL                        333
+#define SBL_DFLT_PCAL_EYECHECK_HOLDOFF_PEC                  0
+#define SBL_DFLT_PCAL_EYECHECK_HOLDOFF_AOC                  0
+
+/**
+ * @brief Defaults SerDes attributes common for the instance
+ *
+ */
+#define SBL_DFLT_SBUS_OP_FLAGS_SLOW        (SBL_FLAG_INTERVAL_10MS | SBL_FLAG_DELAY_50US)
+#define SBL_DFLT_SBUS_OP_FLAGS_FAST        (SBL_FLAG_INTERVAL_1MS  | SBL_FLAG_DELAY_5US)
+#define SBL_DFLT_SERDES_OP_FLAGS           (SBL_FLAG_INTERVAL_1MS  | SBL_FLAG_DELAY_5US)
+#define SBL_DFLT_RX_PHASE_SLIP_CNT                        0xc
+#define SBL_DFLT_SBUS_INT_TIMEOUT                           2
+#define SBL_DFLT_SBUS_INT_POLL_INTERVAL                     1
+#define SBL_DFLT_SBUS_OP_TIMEOUT_MS                      1000
+#define SBL_DFLT_SERDES_EN_TIMEOUT                         20
+#define SBL_DFLT_SERDES_EN_POLL_INTERVAL                    1
+#define SBL_DFLT_SERDES_OP_TIMEOUT_MS                    1000
+#define SBL_DFLT_CORE_STATUS_RD_TIMEOUT                     1
+#define SBL_DFLT_CORE_STATUS_RD_POLL_INTERVAL              50
+#define SBL_DFLT_PLATFORM                   SBL_PLAT_HARDWARE
+/**
+ * @brief SerDes config table field defaults
+ *
+ */
+#define SBL_DFLT_PORT_CONFIG_ATTEN                           2
+#define SBL_DFLT_PORT_CONFIG_PRE                             0
+#define SBL_DFLT_PORT_CONFIG_POST                            0
+#define SBL_DFLT_PORT_CONFIG_PRE2                            0
+#define SBL_DFLT_PORT_CONFIG_PRE3                            0
+#define SBL_DFLT_PORT_CONFIG_GS1                             0
+#define SBL_DFLT_PORT_CONFIG_GS2                             0
+#define SBL_DFLT_PORT_CONFIG_NUM_INTR                        0
+#define SBL_DFLT_PORT_CONFIG_INTR_VAL                     { 0 }
+#define SBL_DFLT_PORT_CONFIG_DATA_VAL                     { 0 }
+
+#define SBL_DFLT_PORT_CONFIG_GS1_OPTICAL                     2
+#define SBL_DFLT_PORT_CONFIG_GS2_OPTICAL                     0
+
+#endif  /* _SBL_UAPI_SBL_SERDES_DEFAULTS_H_ */
diff --git a/include/uapi/ethernet/sbl_serdes_map.h b/include/uapi/ethernet/sbl_serdes_map.h
new file mode 100644
index 000000000000..3028d1bafa0f
--- /dev/null
+++ b/include/uapi/ethernet/sbl_serdes_map.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP. All rights reserved. */
+
+#ifndef UAPI_SBL_SERDES_MAP_H
+#define UAPI_SBL_SERDES_MAP_H
+
+#include <linux/types.h>
+
+#include <ethernet/sbl_platform_config.h>
+#include <ethernet/sbl_sbm_constants.h>
+
+#define SBL_SERDES_MAP_NUM_PORTS SBL_NUM_PORTS
+#define SBL_SERDES_MAP_PORTS SBL_SERDES_MAP_NUM_PORTS
+#define SBL_SERDES_MAP_NUM_SBUS_RINGS SBL_NUM_SBUS_RINGS
+
+struct serdes_info {
+	/* Autogenerated values */
+	__s32 device;
+	__s32 sbus_ring;
+	__s32 rx_addr;
+	__s32 tx_lane_source;
+	__s32 rx_lane_source;
+	__u8 txinv;
+	__u8 rxinv;
+};
+
+struct port_info {
+	/* Autogenerated values */
+	__s32 rx_an_swizzle;
+	__s32 tx_an_swizzle;
+	struct serdes_info serdes[SBL_SERDES_LANES_PER_PORT];
+};
+
+struct sbl_switch_info {
+	__s32 num_ports;
+	__s32 num_serdes; /* per port */
+	__s32 num_sbus_rings;
+	struct port_info ports[SBL_SERDES_MAP_NUM_PORTS];
+};
+
+#endif /* UAPI_SBL_SERDES_MAP_H */
diff --git a/include/uapi/ethernet/sbl_serdes_map_init.h b/include/uapi/ethernet/sbl_serdes_map_init.h
new file mode 100644
index 000000000000..b108a6547c42
--- /dev/null
+++ b/include/uapi/ethernet/sbl_serdes_map_init.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP */
+
+#ifndef SBL_SERDES_MAP_INIT_H
+#define SBL_SERDES_MAP_INIT_H
+
+#include <ethernet/sbl_serdes_map.h>
+
+#define SBL_CASSINI_BRAZOS_SW_INFO_INITIALIZER \
+{ \
+	.num_ports = SBL_SERDES_MAP_PORTS, \
+	.num_serdes = SBL_SERDES_LANES_PER_PORT, \
+	.num_sbus_rings = SBL_SERDES_MAP_NUM_SBUS_RINGS, \
+	.ports = { \
+	{ /* 0x00 */ \
+		.rx_an_swizzle = 3, \
+		.tx_an_swizzle = 1, \
+		.serdes = { \
+			{ .device = 0, .sbus_ring = 0, .rx_addr = 0x28, .tx_lane_source = 1, .txinv = 1, .rx_lane_source = 2, .rxinv = 0 }, \
+			{ .device = 0, .sbus_ring = 0, .rx_addr = 0x29, .tx_lane_source = 0, .txinv = 1, .rx_lane_source = 3, .rxinv = 0 }, \
+			{ .device = 0, .sbus_ring = 0, .rx_addr = 0x2A, .tx_lane_source = 2, .txinv = 1, .rx_lane_source = 1, .rxinv = 0 }, \
+			{ .device = 0, .sbus_ring = 0, .rx_addr = 0x2B, .tx_lane_source = 3, .txinv = 1, .rx_lane_source = 0, .rxinv = 0 }, \
+			} \
+		} \
+	} \
+}
+
+#define SBL_CASSINI_NIC0_SW_INFO_INITIALIZER \
+{ \
+	.num_ports = SBL_SERDES_MAP_PORTS, \
+	.num_serdes = SBL_SERDES_LANES_PER_PORT, \
+	.num_sbus_rings = SBL_SERDES_MAP_NUM_SBUS_RINGS, \
+	.ports = { \
+	{ /* 0x00 */ \
+		.rx_an_swizzle = 3, \
+		.tx_an_swizzle = 3, \
+		.serdes = { \
+			{ .device = 0, .sbus_ring = 0, .rx_addr = 0x28, .tx_lane_source = 3, .txinv = 1, .rx_lane_source = 3, .rxinv = 1 }, \
+			{ .device = 0, .sbus_ring = 0, .rx_addr = 0x29, .tx_lane_source = 2, .txinv = 1, .rx_lane_source = 2, .rxinv = 1 }, \
+			{ .device = 0, .sbus_ring = 0, .rx_addr = 0x2A, .tx_lane_source = 1, .txinv = 1, .rx_lane_source = 1, .rxinv = 1 }, \
+			{ .device = 0, .sbus_ring = 0, .rx_addr = 0x2B, .tx_lane_source = 0, .txinv = 1, .rx_lane_source = 0, .rxinv = 1 }, \
+			} \
+		} \
+	} \
+}
+
+#define SBL_CASSINI_NIC1_SW_INFO_INITIALIZER \
+{ \
+	.num_ports = SBL_SERDES_MAP_PORTS, \
+	.num_serdes = SBL_SERDES_LANES_PER_PORT, \
+	.num_sbus_rings = SBL_SERDES_MAP_NUM_SBUS_RINGS, \
+	.ports = { \
+	{ /* 0x00 */ \
+		.rx_an_swizzle = 0, \
+		.tx_an_swizzle = 0, \
+		.serdes = { \
+			{ .device = 0, .sbus_ring = 1, .rx_addr = 0x28, .tx_lane_source = 0, .txinv = 1, .rx_lane_source = 0, .rxinv = 1 }, \
+			{ .device = 0, .sbus_ring = 1, .rx_addr = 0x29, .tx_lane_source = 1, .txinv = 1, .rx_lane_source = 1, .rxinv = 1 }, \
+			{ .device = 0, .sbus_ring = 1, .rx_addr = 0x2A, .tx_lane_source = 2, .txinv = 1, .rx_lane_source = 2, .rxinv = 1 }, \
+			{ .device = 0, .sbus_ring = 1, .rx_addr = 0x2B, .tx_lane_source = 3, .txinv = 1, .rx_lane_source = 3, .rxinv = 1 }, \
+			} \
+		} \
+	} \
+}
+#endif /* SBL_SERDES_MAP_INIT_H */

-- 
2.56.0

