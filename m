Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:43437 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758667Ab3DCLud convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Apr 2013 07:50:33 -0400
Received: by mail-oa0-f54.google.com with SMTP id n12so1394868oag.13
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Apr 2013 04:50:32 -0700 (PDT)
Date: Wed, 03 Apr 2013 06:50:28 -0500
From: Rob Landley <rob@landley.net>
Subject: Re: [RFC] kbuild: fix ld-option function
References: <1364922822-7510-1-git-send-email-antonynpavlov@gmail.com>
In-Reply-To: <1364922822-7510-1-git-send-email-antonynpavlov@gmail.com>
	(from antonynpavlov@gmail.com on Tue Apr  2 12:13:42 2013)
Message-Id: <1364989828.18069.14@driftwood>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Antony Pavlov <antonynpavlov@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/02/2013 12:13:42 PM, Antony Pavlov wrote:
> The kbuild's ld-option function is broken because
> the command
>   $(CC) /dev/null -c -o "$$TMPO"
> does not create object file!

Could you glue the doc fix to this one and submit then as one patch to  
the kbuild guys, please?

Thanks,

Rob