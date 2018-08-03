Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43484 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbeHCRiW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Aug 2018 13:38:22 -0400
Subject: Re: kbuild: ARCH=um archheaders failed
From: Randy Dunlap <rdunlap@infradead.org>
References: <be4f41de-c27a-abac-4b23-369c400e016e@infradead.org>
Message-ID: <861c26a6-294c-755d-2396-e5d18b9bbcbf@infradead.org>
Date: Fri, 3 Aug 2018 08:41:22 -0700
MIME-Version: 1.0
In-Reply-To: <be4f41de-c27a-abac-4b23-369c400e016e@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org

On 08/02/2018 05:13 PM, Randy Dunlap wrote:
> Hi Yamada-san,
> 
> I see this every few weeks.  It's not reproducible (it depends
> on the moon, Mars, etc.).
> 
> I'm using O=builddir.  The build log is short (below).
> 
> Do you see a makefile problem here?  (nothing to do with mmotm;
> I see it more frequently with linux-next since I do many daily
> builds with it)

BTW, this is just um defconfig with -j4.

-- 
~Randy
