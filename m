Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:34478 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932882AbcDYQVA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 12:21:00 -0400
Received: by mail-qg0-f47.google.com with SMTP id c6so88517635qga.1
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2016 09:20:59 -0700 (PDT)
Date: Mon, 25 Apr 2016 12:20:56 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: kbuild fix branch for linux-next
Message-ID: <alpine.LFD.2.20.1604251203100.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Stephen,

Could you please add the following branch to the linux-next tree:

	git://git.linaro.org/people/nicolas.pitre/linux kbuild

It includes 3 patches on top of Michal's kbuild branch already in your 
tree. Those patches fix issues that have been reported by 3 people 
already, and I'd like those fixes to appear in linux-next until Michal 
picks them up, which should happen in, well, some "undefined" amount of 
time.  ;-)


Nicolas
