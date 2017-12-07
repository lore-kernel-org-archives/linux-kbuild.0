Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58364 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750744AbdLGGZ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Dec 2017 01:25:56 -0500
Date: Thu, 7 Dec 2017 07:26:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: unused-variable warning is getting disabled with clang
Message-ID: <20171207062602.GA12561@kroah.com>
References: <56cef2a644acc458b9457e3147abc4c0@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56cef2a644acc458b9457e3147abc4c0@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sodagudi Prasad <psodagud@codeaurora.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Greg Hackmann <ghackmann@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 06, 2017 at 01:24:51PM -0800, Sodagudi Prasad wrote:
> 
> Hi All,
> 
> When kernel compiled with clang, following line is disabling the
> unused-variable warning. This is not the case with gcc.
> KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
> 
> Are there any specific reasons for disabling unused-variable with clang?

Try it and see why it is disabled :)
