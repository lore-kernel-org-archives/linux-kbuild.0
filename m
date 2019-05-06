Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35693 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfEFTK0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 15:10:26 -0400
Subject: Re: [PATCH] kconfig: fix 'Save As' menu of xconfig
References: <1552234395-7699-1-git-send-email-yamada.masahiro@socionext.com>
From: Robert Gadsdon <rhgadsdon@gmail.com>
Message-ID: <84db9131-5498-d2d5-a984-11079e3c2a6e@gmail.com>
Date: Mon, 6 May 2019 12:10:21 -0700
MIME-Version: 1.0
In-Reply-To: <1552234395-7699-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org

On 03/10/2019 09:13 AM, Masahiro Yamada wrote:
> The 'Save As' menu of xconfig is not working; it always saves the
> kernel configuration into the default file irrespective of the file
> chosen in the dialog box.
> 
> The 'Save' menu always writes into the default file, but it would
> make more sense to write into the file previously chosen by 'Load'
> or 'Save As'.
> 
> Signed-off-by: Masahiro Yamada<yamada.masahiro@socionext.com>
> ---

The 'save as' may be used for out-of-tree kernel config saves, but the 
default 'save' should always save to the in-tree .config file, as before 
(and for the past 10+ years..)  If the kernel config was loaded from an 
out-of-tree location, it now saves back to that out-of-tree location, 
which is useless for the kernel compile..

I have always kept my hardware/system-specific kernel configs 
out-of-tree, and then applied them in-tree before compiling.

Now, I have to use 'save as' and type in the entire in-tree path 
(/usr/src/linux-5.1/.config) each time, in order to apply the specific 
config to the kernel, ready for compilation.

Robert Gadsdon.
rglinuxtech.com
