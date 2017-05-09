Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:47770 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751956AbdEIQro (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 May 2017 12:47:44 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: sparse on scripts/kconfig/*.c
Message-ID: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
Date: Tue, 9 May 2017 09:47:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>

Hi,

I've been attempting to run sparse on the kconfig/ C files -- without success.

The kbuild files don't try to support CHECK in scripts/kconfig/ AFAICT,
and just running sparse on the C files has issues with not being able to
find header files.

Has anyone done this?  Any clues about how to do it?

thanks,
-- 
~Randy
