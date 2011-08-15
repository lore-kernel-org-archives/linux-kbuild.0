Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:55516 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751302Ab1HOSLZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Aug 2011 14:11:25 -0400
Received: by pzk37 with SMTP id 37so3286193pzk.1
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Aug 2011 11:11:25 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 15 Aug 2011 14:11:25 -0400
Message-ID: <CACqU3MWSh0sXSs-s_DGyYzLHT_Fbv_Wu-twV-+Ws0p_48FiE9w@mail.gmail.com>
Subject: Mixed target breakage ?
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

Kbuild does not seem to support building a PHONY target, mixed by a
direct object target; ie.:

% make defconfig
% make init/main.o

works, as does:

% make defconfig
% make init/main.o init/calibrate.o

but,

% make defconfig init/main.o

do not.

Am I missing something ?

 - Arnaud
