Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43014 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752112AbeC0JMQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 05:12:16 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2R9BEa3012105
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 05:12:16 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gygj0pkyw-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 05:12:15 -0400
Received: from localhost
        by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <oberpar@linux.vnet.ibm.com>;
        Tue, 27 Mar 2018 10:12:10 +0100
Subject: Re: [PATCH v2 15/21] gcov: remove CONFIG_GCOV_FORMAT_AUTODETECT
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
 <1522128575-5326-16-git-send-email-yamada.masahiro@socionext.com>
From: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Date: Tue, 27 Mar 2018 11:12:06 +0200
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-16-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Message-Id: <4b423f15-fa71-d51c-9362-942ba26c0fe6@linux.vnet.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org

On 27.03.2018 07:29, Masahiro Yamada wrote:
> CONFIG_GCOV_FORMAT_AUTODETECT compiles either gcc_3_4.c or gcc_4_7.c
> according to your GCC version.
> 
> We can achieve the equivalent behavior by setting reasonable dependency
> with the knowledge of the compiler version.
> 
> If GCC older than 4.7 is used, GCOV_FORMAT_3_4 is the default, but users
> are still allowed to select GCOV_FORMAT_4_7 in case the newer format is
> back-ported.
> 
> On the other hand, If GCC 4.7 or newer is used, there is no reason to
> use GCOV_FORMAT_3_4, so it should be hidden.
> 
> If you down-grade your compiler GCC 4.7 or older, oldconfig/syncconfig
> will display a prompt for the choice because GCOV_FORMAT_3_4 becomes
> visible as a new symbol.

Looks sane to me.

Acked-by: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>

-- 
Peter Oberparleiter
Linux on Z Development - IBM Germany

