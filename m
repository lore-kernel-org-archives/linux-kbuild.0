Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:49278 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751742AbdEOWQu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 May 2017 18:16:50 -0400
Subject: Re: [GIT] [PATCH 1/1] kbuild: Add wrapping of long expressions at ORs
References: <2b001634fc74aaabc1ab988ffb1d388b@amelkin.online>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8d594e38-cad1-d977-718b-22f998a58129@infradead.org>
Date: Mon, 15 May 2017 15:16:46 -0700
MIME-Version: 1.0
In-Reply-To: <2b001634fc74aaabc1ab988ffb1d388b@amelkin.online>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Amelkin <alexander@amelkin.msk.ru>, linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Andrew Morton <akpm@linux-foundation.org>

On 05/10/17 06:06, Alexander Amelkin wrote:
> The following changes since commit a351e9b9fc24e982ec2f0e76379a49826036da12:
> 
>   Linux 4.11 (2017-04-30 19:47:48 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/AlexanderAmelkin/linux-wandboard.git tags/kconfig_wrapping
> 
> for you to fetch changes up to f4c95059bd2410ac96d6ef9f8848a0f0b757a17a:
> 
>   kconfig: Add wrapping of long expressions at ORs (2017-05-10 12:51:31 +0300)

Once again I don't know who is going to merge this patch.  Andrew?


> ----------------------------------------------------------------
> Some symbols in configuration may be selected by very-very long boolean
> expressions. Reading through such long expressions, it is extremely hard
> to identify what exactly selects the given option.
> 
> This commit adds a new line every time a boolean OR is encountered in
> the "outer" expression. That is, it won't break apart separate
> sub-expressions like OPTION_A && (OPTION_B || OPTION_C), but will add a
> new line before OPTION_C in an expression like:
> 
> OPTION_A && OPTION_B || OPTION_C && OPTION_D
> 
> This commit also adds indentation of the wrapped lines to the label
> position. That is, the expression on the new line will continue starting
> at the same character position as it started in the first line, right
> after the label such as "  Selected by:  ".
> 
> This commit also renames some variables to better reflect their purpose.
> 
> Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: linux-kbuild@vger.kernel.org

Tested-by: Randy Dunlap <rdunlap@infradead.org>

I guess that your webmail client modified all of the tabs in the source
code into spaces... which wouldn't happen if I did a git clone, but
I'm not doing that.  Perhaps you could attach a copy of the patch that
contains tabs instead of spaces.  I had to edit the patch quite a bit
and then tell 'patch' to ignore whitespace issues.

Thanks.

> ----------------------------------------------------------------
> Alexander Amelkin (1):
>       kconfig: Add wrapping of long expressions at ORs
> 
>  scripts/kconfig/expr.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
>  scripts/kconfig/lkc.h  | 15 ++++++++++++---
>  scripts/kconfig/menu.c | 16 +++++++++++++---
>  scripts/kconfig/util.c |  1 +
>  4 files changed, 66 insertions(+), 14 deletions(-)


-- 
~Randy
