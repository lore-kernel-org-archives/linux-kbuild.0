Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:33565 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932151AbdD0W0e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Apr 2017 18:26:34 -0400
Date: Thu, 27 Apr 2017 17:26:32 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] of: Add unit tests for applying overlays
Message-ID: <20170427222632.6hgrto6zr4zhcyya@rob-hp-laptop>
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com>
 <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com
Cc: stephen.boyd@linaro.org, mmarek@suse.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, Apr 25, 2017 at 05:09:54PM -0700, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Existing overlay unit tests examine individual pieces of the overlay
> code.  The new tests target the entire process of applying an overlay.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
> 
> There are checkpatch warnings.  I have reviewed them and feel they
> can be ignored.
> 
>  drivers/of/fdt.c                                 |  14 +-
>  drivers/of/of_private.h                          |  12 +
>  drivers/of/unittest-data/Makefile                |  17 +-
>  drivers/of/unittest-data/overlay.dts             |  53 ++++
>  drivers/of/unittest-data/overlay_bad_phandle.dts |  20 ++
>  drivers/of/unittest-data/overlay_base.dts        |  80 ++++++
>  drivers/of/unittest.c                            | 317 +++++++++++++++++++++++
>  7 files changed, 505 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/of/unittest-data/overlay.dts
>  create mode 100644 drivers/of/unittest-data/overlay_bad_phandle.dts
>  create mode 100644 drivers/of/unittest-data/overlay_base.dts

Applied.

Rob
