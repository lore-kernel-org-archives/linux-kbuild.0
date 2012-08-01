Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hapkido.dreamhost.com ([66.33.216.122]:54487 "EHLO
	hapkido.dreamhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753745Ab2HADAz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Jul 2012 23:00:55 -0400
Received: from homiemail-a83.g.dreamhost.com (caibbdcaaaaf.dreamhost.com [208.113.200.5])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 813CBDD879
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Jul 2012 20:00:55 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 31 Jul 2012 23:00:14 -0400
From: shea@shealevy.com
Subject: Re: [PATCH] Fix firmware installation for images w/o subdirs
In-Reply-To: <663f65e29cc718b63ef0e2a769d03606@shealevy.com>
References: <663f65e29cc718b63ef0e2a769d03606@shealevy.com>
Message-ID: <da6d59384139a520b703d84d1be2ac92@shealevy.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, linux-kernel@vger.kernel.org

On 31.07.2012 22:59, shea@shealevy.com wrote:
> On some setups (probably due to too new a GNU Make), firmware
> installation fails with
> *** No rule to make target `lib/firmware/./', needed by
> `lib/firmware/<file>.fw'.  Stop.
> when a file in the top-level firmware/ directory is needed.
>
> Original patch idea by Denys Dmytriyenko, see
> http://permalink.gmane.org/gmane.linux.embedded.yocto.meta-ti/27
>
> Signed-off-by: Shea Levy <shea@shealevy.com>
> ---
>  scripts/Makefile.fwinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Whoops, sorry for the double post.
