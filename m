Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:44934 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932231AbeCLRot (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Mar 2018 13:44:49 -0400
Subject: Re: [PATCH] kbuild: check for pkg-config on make menu/n/g/xconfig
References: <09cf5537-b2d7-5bf5-0c0b-d0b765e1e75b@infradead.org>
 <CAEYzJUEr0Wvv9UOV4wBYC6E3bh_0ih5A=ebPaKs06egZAZfPUw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a06826d9-1607-72c6-2e30-ab56b2306bd8@infradead.org>
Date: Mon, 12 Mar 2018 10:44:44 -0700
MIME-Version: 1.0
In-Reply-To: <CAEYzJUEr0Wvv9UOV4wBYC6E3bh_0ih5A=ebPaKs06egZAZfPUw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Bj=c3=b8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, LKML <linux-kernel@vger.kernel.org>

On 03/11/2018 02:00 PM, Bjørn Forsman wrote:
> On 11 March 2018 at 21:12, Randy Dunlap <rdunlap@infradead.org> wrote:
>> +pkgcfg=`which pkg-config >/dev/null 2>&1`
> 
> Please use "command -v" instead of "which". command -v is in POSIX, so
> the shell will have it for sure (builtin). which is not a builtin, it
> is an external command that may or may not be installed on the system.

Will do. Thanks.

Just waiting to see if there are any other comments...

-- 
~Randy
