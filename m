Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f197.google.com ([209.85.223.197]:50915 "EHLO
	mail-iw0-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753086Ab0DTJNP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Apr 2010 05:13:15 -0400
Received: by iwn35 with SMTP id 35so2933579iwn.21
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Apr 2010 02:13:15 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 20 Apr 2010 17:13:15 +0800
Message-ID: <n2l2986b3941004200213r51f98608n59ab68d3bbf3a814@mail.gmail.com>
Subject: a question about building driver
From: Zhi Li <lizhi1215@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi list,

I'm maintaining a little linux distribution. Sometimes users need to
build specific drivers for their machine. But they do not want the
whole linux kernel source which I used to make my linux distribution,
for they think it eats up too much disk and network bandwith. So, my
question is whether there's a way to give them partial kernel source
to build the needed driver module.

Thanks
Zhi
