Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:50665 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753680Ab3L3D7e (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Dec 2013 22:59:34 -0500
Message-ID: <52C0EF7D.9040002@zytor.com>
Date: Sun, 29 Dec 2013 19:58:53 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: KCONFIG_ALLCONFIG + allmodconfig = brokenness
References: <52C0CD3F.7080808@zytor.com> <52C0D8E2.7050101@infradead.org> <52C0DAB2.7090001@infradead.org>
In-Reply-To: <52C0DAB2.7090001@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 12/29/2013 06:30 PM, Randy Dunlap wrote:
>>
>> Yes, I discovered this a few weeks ago.
>> I just ended up adding
>> CONFIG_MODULES=y
>> to my KCONFIG_ALLCONFIG file.
>>

Yes, I'm using the same workaround now.  It works for me, since I keep
an override file anyway.

	-hpa


