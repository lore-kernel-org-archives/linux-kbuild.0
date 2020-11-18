Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F6AC63798
	for <linux-kbuild@archiver.kernel.org>; Wed, 18 Nov 2020 13:04:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70F9F24695
	for <linux-kbuild@archiver.kernel.org>; Wed, 18 Nov 2020 13:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="MuH2MxtW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgKRNEE (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 18 Nov 2020 08:04:04 -0500
Received: from alln-iport-5.cisco.com ([173.37.142.92]:28633 "EHLO
        alln-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgKRNEE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Nov 2020 08:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=82; q=dns/txt; s=iport;
  t=1605704643; x=1606914243;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Pokb30QME/DR4pSJY2FHisPZhDALkkBGM6TUcjHTLeM=;
  b=MuH2MxtWXAxMVlvsd1ZJhXFHS9O3/bpCnVhsCkqSLcS1T+oRq8ZUE317
   PW8TxA28D8dnJqDv5285ZkpQFceBB00OXyEDIIOnA/IOWZcvEwwbTspKQ
   ZHWVFcNw+IeyrslTa/La8H3qCM7jYBXzUkxjN02V8iy9t5ByIsNqmEA9C
   w=;
X-IPAS-Result: =?us-ascii?q?A0DTBQDrGrVffYYNJK1iHgEBCxIMggQLg3cvOJVakESJb?=
 =?us-ascii?q?oF8CwEBAQ0BAS0CBAEBhEoCgiUCJTQJDgIDAQEBAwIDAQEBAQUBAQECAQYEF?=
 =?us-ascii?q?AEBhj0LhXMBAgIBeQULAgEIISUPIyUCBA6GEiCuIXSBNIpNgTiIQIUAG4FBP?=
 =?us-ascii?q?4QjPoQ+hXYEnEabbwoggk2bGSKDBwGecpNToFcCERWBMyE4gVlwFYMlTxcCD?=
 =?us-ascii?q?ZxogUIJfIw7AYEQAQE?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.77,486,1596499200"; 
   d="scan'208";a="608378531"
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 18 Nov 2020 13:04:03 +0000
Received: from XCH-RCD-004.cisco.com (xch-rcd-004.cisco.com [173.37.102.14])
        by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 0AID427N021075
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Wed, 18 Nov 2020 13:04:03 GMT
Received: from xch-aln-004.cisco.com (173.36.7.14) by XCH-RCD-004.cisco.com
 (173.37.102.14) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Nov
 2020 07:04:02 -0600
Received: from xch-aln-004.cisco.com ([173.36.7.14]) by XCH-ALN-004.cisco.com
 ([173.36.7.14]) with mapi id 15.00.1497.000; Wed, 18 Nov 2020 07:04:02 -0600
From:   "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco)" 
        <dzagorui@cisco.com>
To:     "masahiroy@kernel.org" <masahiroy@kernel.org>
CC:     "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] kbuild: use -fmacro-prefix-map for .S sources
Thread-Topic: [PATCH v3] kbuild: use -fmacro-prefix-map for .S sources
Thread-Index: AQHWsRJPpKcKNHVlGkuCBAHPiPYhnqm/255bgA4Yo8Y=
Date:   Wed, 18 Nov 2020 13:04:02 +0000
Message-ID: <1605704642269.72893@cisco.com>
References: <20201102120853.96855-1-dzagorui@cisco.com>,<1604929732138.17256@cisco.com>
In-Reply-To: <1604929732138.17256@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [173.38.209.7]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.37.102.14, xch-rcd-004.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> ping=0A=
=0A=
Any comments on this ?=0A=
=0A=
Thanks,=0A=
Denys=0A=
=0A=
