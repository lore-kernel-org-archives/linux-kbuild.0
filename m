Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37668 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751411AbcD0JAT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Apr 2016 05:00:19 -0400
Subject: Re: [PATCH] kbuild: adjust ksym_dep_filter for some cmd_* renames
References: <alpine.LFD.2.20.1604261118060.5091@knanqh.ubzr>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57207F9F.2040206@suse.com>
Date: Wed, 27 Apr 2016 11:00:15 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1604261118060.5091@knanqh.ubzr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-04-26 17:21, Nicolas Pitre wrote:
> 
> The following renames occurred recently:
> 
>   cmd_cc_i_c --> cmd_cpp_i_c
>   cmd_as_s_S --> cmd_cpp_s_S
> 
> The respective cc_*_c and as_*_S patterns no longer match the above
> therefore additional patterns are needed.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Thanks, applied to kbuild.git#kbuild.

Michal

