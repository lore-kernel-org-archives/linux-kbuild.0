Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:36398 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161862AbdD0WZJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Apr 2017 18:25:09 -0400
Date: Thu, 27 Apr 2017 17:25:06 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] of: per-file dtc compiler flags
Message-ID: <20170427222506.3sdsrime2fqeodgw@rob-hp-laptop>
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com>
 <1493165394-29367-2-git-send-email-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493165394-29367-2-git-send-email-frowand.list@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com
Cc: stephen.boyd@linaro.org, mmarek@suse.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, Apr 25, 2017 at 05:09:53PM -0700, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> The dtc compiler version that adds initial support was available
> in 4.11-rc1.  Add the ability to set an additional dtc compiler
> flag is needed by overlays.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
>  scripts/Makefile.lib | 2 ++
>  1 file changed, 2 insertions(+)

Applied.
