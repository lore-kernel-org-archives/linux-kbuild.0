Return-Path: <SRS0=67Wb=DC=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F42C4727C
	for <linux-kbuild@archiver.kernel.org>; Fri, 25 Sep 2020 22:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82E3921D7F
	for <linux-kbuild@archiver.kernel.org>; Fri, 25 Sep 2020 22:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgIYWjT (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 25 Sep 2020 18:39:19 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:58610 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbgIYWjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Sep 2020 18:39:19 -0400
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id B0A6E3A5741
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2020 22:30:02 +0000 (UTC)
X-Originating-IP: 50.39.163.217
Received: from localhost (50-39-163-217.bvtn.or.frontiernet.net [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9543F240003;
        Fri, 25 Sep 2020 22:29:37 +0000 (UTC)
Date:   Fri, 25 Sep 2020 15:29:34 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: "make bindeb-pkg" fails with CONFIG_MODULES disabled
Message-ID: <20200925222934.GA126388@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_MODULES disabled, "make bindeb-pkg" fails in
scripts/package/builddeb with:

find: ‘Module.symvers’: No such file or directory

The deploy_kernel_headers function in scripts/package/builddeb calls:

find arch/$SRCARCH/include Module.symvers include scripts -type f

But find errors out if any of its command-line arguments doesn't exist.

This could be fixed by checking whether that file exists first, but if
CONFIG_MODULES is disabled, it doesn't really make sense to build the
linux-headers package at all. Perhaps that whole package could be
disabled when modules are disabled?

- Josh Triplett
