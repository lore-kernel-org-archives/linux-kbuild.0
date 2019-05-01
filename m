Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f172.google.com ([209.85.208.172]:32794 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfEANBk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 May 2019 09:01:40 -0400
Reply-To: alex.popov@linux.com
Subject: Re: [v2 1/1] kconfig: Terminate menu blocks with a comment in the
 generated config
References: <1556107369-7655-1-git-send-email-alex.popov@linux.com>
From: Alexander Popov <alex.popov@linux.com>
Message-ID: <ce9c3689-86f3-eda7-8c3d-4af834ee750d@linux.com>
Date: Wed, 1 May 2019 16:01:34 +0300
MIME-Version: 1.0
In-Reply-To: <1556107369-7655-1-git-send-email-alex.popov@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 24.04.2019 15:02, Alexander Popov wrote:
> Currently menu blocks start with a pretty header but end with nothing in
> the generated config. So next config options stick together with the
> options from the menu block.
> 
> Let's terminate menu blocks in the generated config with a comment and
> a newline if needed. Example:
> 
> ...
> CONFIG_BPF_STREAM_PARSER=y
> CONFIG_NET_FLOW_LIMIT=y
> 
> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=y
> CONFIG_NET_DROP_MONITOR=y
> # end of Network testing
> # end of Networking options
> 
> CONFIG_HAMRADIO=y
> ...
> 
> Signed-off-by: Alexander Popov <alex.popov@linux.com>

Hello!

Just a friendly ping.

Would you like to take this patch?
Can I improve anything?

Best regards,
Alexander
