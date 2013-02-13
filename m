Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hqemgate03.nvidia.com ([216.228.121.140]:15333 "EHLO
	hqemgate03.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756892Ab3BMNWS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Feb 2013 08:22:18 -0500
Message-ID: <511B9335.1020107@nvidia.com>
Date: Wed, 13 Feb 2013 07:20:53 -0600
From: Daniel Dadap <ddadap@nvidia.com>
MIME-Version: 1.0
Subject: Re: what is $(Q) ?
References: <20130212211449.GA2533@debian.localdomain>
In-Reply-To: <20130212211449.GA2533@debian.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: horseriver <horserivers@gmail.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On 02/12/2013 03:14 PM, horseriver wrote:
> hi;)
>
>    In kernel makefile,there is a $(Q) ,what does it mean?

It expands out to nothing if KBUILD_VERBOSE is set to 1, or @ otherwise; 
i.e., it suppresses command output from being printed unless building 
verbose.

>
> thanks!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

