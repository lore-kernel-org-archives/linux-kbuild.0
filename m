Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:52095 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783Ab3DSIFf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Apr 2013 04:05:35 -0400
Received: by mail-wi0-f169.google.com with SMTP id h11so513525wiv.4
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Apr 2013 01:05:33 -0700 (PDT)
Date: Fri, 19 Apr 2013 10:05:19 +0200
From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH 1/2] deb-pkg: split debug symbols in their own package
Message-ID: <20130419100519.485cb557@serenity>
In-Reply-To: <20130409120547.64ad0d50@serenity>
References: <1363946761-7449-1-git-send-email-anisse@astier.eu>
	<51629BFF.1080204@suse.cz>
	<20130408190645.29570fe5@serenity>
	<20130409120547.64ad0d50@serenity>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, maximilian attems <max@stro.at>

On Tue, 9 Apr 2013 12:05:47 +0200, Anisse Astier <anisse@astier.eu> wrote :

> 
> 
> From: Anisse Astier <anisse@astier.eu>
> Subject: [PATCH v3] deb-pkg: split debug symbols in their own package
> 
> This can reduce almost 3 times the size of the linux-image package,
> while keeping the debug symbols available for this particular build, in
> their own package.
> 
> This mimics the way kernels are built in debian, ubuntu, or with
> make-kpkg, and comes at the price of a small slowdown in the building of
> packages.
> 
> v2:
>  - only build when CONFIG_DEBUG_INFO=y
>  - build debug package last.
>  - more verbose package description
>  - put package in section debug
> v3:
>  - remove duplicate code from v2
> 

What do you think ?
