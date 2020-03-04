Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:44226 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgCDFz0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 00:55:26 -0500
Date: Wed, 4 Mar 2020 06:55:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/3] kbuild: allow to run dt_binding_check and dtbs_check
 in a single command
Message-ID: <20200304055520.GA28911@ravnborg.org>
References: <20200304032038.14424-1-masahiroy@kernel.org>
 <20200304032038.14424-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304032038.14424-3-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Michal Marek <michal.lkml@markovi.net>

Hi Masahiro

Thanks for the nice improvements to the dt infrastructure.

Stealing a thread here..

>  It is also possible to run checks with a single schema file by setting the
>  ``DT_SCHEMA_FILES`` variable to a specific schema file.
Would it be simple to enable the use of dirs for DT_SCHEMA_FILES?

So I for example could do:

make dt_bindings_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/

I did a very quick look add it but failed to dechiper all the
makefile logic.

It is a corner case when one wants to check a full dir,
so unless it is very simple the current logic should not
be complicated by this (if you take the bait and look at it).

	Sam
