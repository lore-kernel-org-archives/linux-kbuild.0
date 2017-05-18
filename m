Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:37693 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753970AbdERHPA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 May 2017 03:15:00 -0400
Date: Thu, 18 May 2017 10:14:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: sparse on scripts/kconfig/*.c
Message-ID: <20170518071414.bs3ohkc7h53nrgew@mwanda>
References: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
 <20170510101838.c5nwzaraeybyypwj@mwanda>
 <20170510205357.xshdaack6mwku5np@mwanda>
 <605fc799-70c1-14af-904d-723b43ab9025@infradead.org>
 <20170516094308.c62gxxaopegqfxym@mwanda>
 <931af9fe-3e42-9cc6-9bd5-74c1ef0e3114@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <931af9fe-3e42-9cc6-9bd5-74c1ef0e3114@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, smatch@vger.kernel.org

On Wed, May 17, 2017 at 07:53:35PM -0700, Randy Dunlap wrote:
> 
> I did a 'git pull' for updates. On the rebuild, I get this error:
> 
> macro_table.c:30:31: fatal error: cwchash/hashtable.h: No such file or directory
>  #include "cwchash/hashtable.h"
> 
> My problem?
> 
> thanks for your help.

That's weird.  I haven't touched that code in years so I can't imagine
what's going on.  :/  My fresh clone works.

regards,
dan carpenter

