Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37095 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726317AbgF1M0C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 08:26:02 -0400
Message-ID: <256d2ebde769673d53441d777531964ad9468835.camel@redhat.com>
Subject: Re: [PATCH] kconfig: qconf: make debug links work again
From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Sun, 28 Jun 2020 15:25:54 +0300
In-Reply-To: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
References: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2020-06-28 at 14:21 +0200, Mauro Carvalho Chehab wrote:
> The Qt5 conversion broke support for debug info links.
> 
> Restore the behaviour added by changeset
> ab45d190fd4a ("kconfig: create links in info window").
> 
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kconfig/qconf.cc | 35 ++++++++++++++++++++++++++++++++++-
>  scripts/kconfig/qconf.h  |  1 +
>  2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 631e19659504..03cadf27a376 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1012,7 +1012,7 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
>  	: Parent(parent), sym(0), _menu(0)
>  {
>  	setObjectName(name);
> -
> +	setOpenLinks(false);
>  
>  	if (!objectName().isEmpty()) {
>  		configSettings->beginGroup(objectName());
> @@ -1224,6 +1224,36 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
>  		*text += str2;
>  }
>  
> +void ConfigInfoView::clicked(const QUrl &url)
> +{
> +	QByteArray str = url.toEncoded();
> +	const std::size_t count = str.size();
> +	char *hex = new char[count];
> +	unsigned long p;
> +
> +	if (count < 1)
> +		return;
> +
> +	memcpy(hex, str.constData(), count);
> +	p = (int)strtol(hex + 1, NULL, 16);
> +
> +	if (!p)
> +		return;
> +
> +	if (hex[0] == 's') {
> +		struct symbol *s = (struct symbol *)p;
> +
> +		sym = s;
> +		symbolInfo();
> +	} else {
> +		struct menu *m = (struct menu *)p;
> +
> +		_menu = m;
> +		menuInfo();
> +	}
> +	emit showDebugChanged(true);
> +}
> +
>  QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
>  {
>  	QMenu* popup = Parent::createStandardContextMenu(pos);
> @@ -1497,6 +1527,9 @@ ConfigMainWindow::ConfigMainWindow(void)
>  	helpMenu->addAction(showIntroAction);
>  	helpMenu->addAction(showAboutAction);
>  
> +	connect (helpText, SIGNAL (anchorClicked (const QUrl &)),
> +		 helpText, SLOT (clicked (const QUrl &)) );
> +
>  	connect(configList, SIGNAL(menuChanged(struct menu *)),
>  		helpText, SLOT(setInfo(struct menu *)));
>  	connect(configList, SIGNAL(menuSelected(struct menu *)),
> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> index d913a02967ae..a193137f2314 100644
> --- a/scripts/kconfig/qconf.h
> +++ b/scripts/kconfig/qconf.h
> @@ -250,6 +250,7 @@ public slots:
>  	void setInfo(struct menu *menu);
>  	void saveSettings(void);
>  	void setShowDebug(bool);
> +	void clicked (const QUrl &url);
>  
>  signals:
>  	void showDebugChanged(bool);

Just tested it and it works well. Thank you very much!

Best regards,
	Maxim Levitsky
