Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59648 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750995AbeBVFEa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Feb 2018 00:04:30 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1M53qsg155828
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2018 00:04:29 -0500
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2g9jmt91s3-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2018 00:04:29 -0500
Received: from localhost
        by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Thu, 22 Feb 2018 05:04:27 -0000
Subject: Re: [PATCH 21/23] gcc-plugins: move GCC version check for PowerPC to
 Kconfig
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
 <1518806331-7101-22-git-send-email-yamada.masahiro@socionext.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Thu, 22 Feb 2018 16:04:21 +1100
MIME-Version: 1.0
In-Reply-To: <1518806331-7101-22-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Message-Id: <6805fb77-23b9-7880-13f1-5d082d5c1599@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, kernel-hardening@lists.openwall.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Sam Ravnborg <sam@ravnborg.org>

On 17/02/18 05:38, Masahiro Yamada wrote:
> For PowerPC, GCC 5.2 is the requirement for GCC plugins.  Move the
> version check to Kconfig, and remove the ugly checker.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

The old checker was as non-ugly as I could make it. :)

Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

