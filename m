Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:34646 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbfKDXpv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 18:45:51 -0500
Subject: Re: [PATCHv2] kconfig: Add option to get the full help text with
 listnewconfig
References: <20191104221008.30078-1-labbott@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <68557a16-f69e-fa36-4b7a-729fa80f60ca@infradead.org>
Date: Mon, 4 Nov 2019 15:45:49 -0800
MIME-Version: 1.0
In-Reply-To: <20191104221008.30078-1-labbott@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, jcline@redhat.com, dzickus@redhat.com

On 11/4/19 2:10 PM, Laura Abbott wrote:
> make listnewconfig will list the individual options that need to be set.
> This is useful but there's no easy way to get the help text associated
> with the options at the same time. Introduce a new targe
> 'make helpnewconfig' which lists the full help text of all the
> new options as well. This makes it easier to automatically generate
> changes that are easy for humans to review. This command also adds
> markers between each option for easier parsing.
> 
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> v2: Dropped rfc tag, renamed extendedlistnewconfig -> helpnewconfig.
> Added another missing help text.
> ---
>  scripts/kconfig/Makefile |  5 ++++-
>  scripts/kconfig/conf.c   | 13 ++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)

LGTM.  Thanks for the updates.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
